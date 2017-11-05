local dev = GetSelf()
dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."Systems/stores_config.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."Systems/electric_system_api.lua")

local update_time_step = 0.05
make_default_activity(update_time_step)--update will be called 10 times per second

local sensor_data = get_base_data()

-- Const

--local degrees_per_radian = 57.2957795
--local feet_per_meter_per_minute = 196.8
local meters_to_feet = 3.2808399
local GALLON_TO_KG = 3.785 * 0.8
local KG_TO_POUNDS = 2.20462
local MPS_TO_KNOTS = 1.94384
local RADIANS_TO_DEGREES = 57.2958


local refueling_rate = (200/KG_TO_POUNDS) * update_time_step -- nominal = 200lbs/sec * tick size
local refueling_rate_upper_limit = refueling_rate * 1.2
local refueling_rate_lower_limit = refueling_rate * 0.8
local refueling_rate_tank_change = refueling_rate_upper_limit * 2

-- Variables
--local ias = get_param_handle("D_IAS")

-----------------------------------------------------------------------------
-- AN/AJB-3A All-Attitude Indicator (gauge #19)

local adi_pitch = get_param_handle("ADI_PITCH")
local adi_roll = get_param_handle("ADI_ROLL")
local adi_hdg = get_param_handle("ADI_HDG")


-----------------------------------------------------------------------------
-- altimeter (gauge #41)

local ALT_PRESSURE_MAX = 30.99 -- in Hg
local ALT_PRESSURE_MIN = 29.10 -- in Hg
local ALT_PRESSURE_STD = 29.92 -- in Hg

local alt_needle = get_param_handle("D_ALT_NEEDLE") -- 0 to 1000
local alt_10k = get_param_handle("D_ALT_10K") -- 0 to 100,000
local alt_1k = get_param_handle("D_ALT_1K") -- 0 to 10,000
local alt_100s = get_param_handle("D_ALT_100S") -- 0 to 1000
local alt_adj_NNxx = get_param_handle("ALT_ADJ_NNxx") -- first digits, 29-30 is input
local alt_adj_xxNx = get_param_handle("ALT_ADJ_xxNx") -- 3rd digit, 0-10 input
local alt_adj_xxxN = get_param_handle("ALT_ADJ_xxxN") -- 4th digit, 0-10 input

local alt_setting = ALT_PRESSURE_STD

-----------------------------------------------------------------------------
-- fuel gauge (gauge #29)

local fuelgauge = get_param_handle("D_FUEL") -- 0 to 6800 lbs
local fuelflowgauge = get_param_handle("D_FUEL_FLOW")

local fuelQtyInternal = 0 -- internal fuel in pounds
local fuelQtyExternal = 0 -- external fuel in pounds
local fuelQtyTotal = 0    -- total fuel in pounds
local fuelQty = 0         -- fuel to display in pounds
local fuelLastQtyExternal = 0 -- used to pin the external fuel amount when engine shuts off for accurate display while rearming


local totalFuel = 0
local lastFuel = 0

local initINT = 0
local initEXT = 0

local showingInternal = true        -- default to showing internal fuel
local refuelingOccurred = false 

-----------------------------------------------------------------------------
-- airspeed indicator (gauge #44)

local ias_needle = get_param_handle("D_IAS_DEG")    -- 0 to 360 degrees of rotation
local ias_mach = get_param_handle("D_IAS_MACH_DEG") -- 0 to 360 degrees of rotation

-----------------------------------------------------------------------------
-- flaps indicator (gauge #23)
local flaps_ind = get_param_handle("D_FLAPS_IND")   -- 0 to 1, 1 = fully down

-----------------------------------------------------------------------------
-- standby attitude gyro (gauge #33)
local attgyro_stby_pitch = get_param_handle("ATTGYRO_STBY_PITCH")
local attgyro_stby_roll = get_param_handle("ATTGYRO_STBY_ROLL")

-----------------------------------------------------------------------------
-- oil pressure (gauge #25)
local oil_pressure = get_param_handle("D_OIL_PRESSURE")

-----------------------------------------------------------------------------

-- Gauge Initialisation

alt_10k:set(0.0)
alt_1k:set(0.0)
alt_100s:set(0.0)
alt_needle:set(0.0)

dev:listen_command(Keys.FuelGaugeExt)
dev:listen_command(Keys.FuelGaugeInt)
dev:listen_command(device_commands.FuelGaugeExtButton)
dev:listen_command(device_commands.AltPressureKnob)
dev:listen_command(Keys.AltPressureInc)
dev:listen_command(Keys.AltPressureDec)


function dump_table(t)
    for key,value in pairs(t) do
        print(key,value)
    end
end

function enumerate_fueltanks()
    local fuel = 0
    local weap = GetDevice(devices.WEAPON_SYSTEM)
    local total = sensor_data.getTotalFuelWeight()*KG_TO_POUNDS

    for i=2, 4, 1 do -- iterate on stations 2,3,4
        local station = weap:get_station_info(i-1)
        if station.CLSID == "{DFT-150gal}" then
            fuel = fuel + ((150*GALLON_TO_KG)*KG_TO_POUNDS)
        elseif station.CLSID == "{DFT-300gal_LR}" or station.CLSID == "{DFT-300gal}" then
            fuel = fuel + ((300*GALLON_TO_KG)*KG_TO_POUNDS)
        elseif station.CLSID == "{DFT-400gal}" then
            fuel = fuel + ((400*GALLON_TO_KG)*KG_TO_POUNDS)
        elseif station.CLSID == "{D-704_BUDDY_POD}" then
            fuel = fuel + ((300*GALLON_TO_KG)*KG_TO_POUNDS)
        end
    end

    -- set initial values, both in pounds
    initEXT = fuel
    initINT = total - initEXT
    fuelLastQtyExternal = initEXT
    lastFuel = total -- initializes detection of refueling in update()
    gauge_fuel_flow = sensor_data.getEngineLeftFuelConsumption()
end

function post_initialize()
    enumerate_fueltanks()
    rearmingInProgress = false
    --print("post_initialize called for avionics.lua")
end


function SetCommand(command,value)
    -- "primary" control is the clickable device, key commands trigger the clickable actions...
    if command == Keys.FuelGaugeInt and not showingInternal then
        dev:performClickableAction(device_commands.FuelGaugeExtButton, 0, false)

    elseif command == Keys.FuelGaugeExt and showingInternal then
        dev:performClickableAction(device_commands.FuelGaugeExtButton, 1, false)

    elseif command == device_commands.FuelGaugeExtButton and value == 1 and showingInternal then
        showingInternal = false

    elseif command == device_commands.FuelGaugeExtButton and value == 0 and not showingInternal then
        showingInternal = true

    elseif command == Keys.AltPressureInc then
        alt_setting = alt_setting + 0.01
        if alt_setting >= ALT_PRESSURE_MAX then
            alt_setting = ALT_PRESSURE_MAX
        end

    elseif command == Keys.AltPressureDec then
        alt_setting = alt_setting - 0.01
        if alt_setting <= ALT_PRESSURE_MIN then
            alt_setting = ALT_PRESSURE_MIN
        end
        
    elseif command == device_commands.AltPressureKnob then
        alt_setting = alt_setting + ((value / 0.05)*0.02)
        if alt_setting >= ALT_PRESSURE_MAX then
            alt_setting = ALT_PRESSURE_MAX
        elseif alt_setting <= ALT_PRESSURE_MIN then
            alt_setting = ALT_PRESSURE_MIN
        end
    end
end

local currentDisplayedFuel=initINT
function update_fuel_gauge()
    totalFuel = sensor_data.getTotalFuelWeight()*KG_TO_POUNDS -- get new total fuel
    local flow = sensor_data.getEngineLeftFuelConsumption()
    if not get_elec_primary_ac_ok() then
        flow=0.0001 --avoid using 0 to avoid the "flow==0" logic below
    end
    local tas = sensor_data.getTrueAirSpeed()

    if flow == 0 and tas == 0 and lastFuel ~= totalFuel then
        -- limited to changes in fuel levels when motionless with no fuel flow
        local delta = lastFuel - totalFuel  -- negative delta means fuel was removed during refueling
        if math.abs(delta) >= refueling_rate_lower_limit and math.abs(delta) <= refueling_rate_upper_limit then
            -- internal refueling in progress, update as normally
            refuelingOccurred = 1 -- trigger full recalc on engine restart
        elseif math.abs(delta) >= refueling_rate_tank_change then
            -- external refueling change, update external amount for proper display
            fuelLastQtyExternal = fuelLastQtyExternal - delta
            refuelingOccurred = 1 -- trigger full recalc on engine restart
        end
    end

    lastFuel = totalFuel

    if flow == 0 then
        -- engine is off, any change in fuel is a function of refueling so pin the external amount
        -- shown, unless the delta is big enough to trigger detection of a tank swap.
        -- rearming will trigger a re-enumeration of tanks AFTER refueling is done.
        -- TODO: this may not handle fuel dumping with engine off in mid-air  (is that a thing?)
        fuelQtyExternal = fuelLastQtyExternal
        fuelQtyInternal = totalFuel - fuelQtyExternal
    elseif totalFuel < initINT or initEXT == 0 then
        -- externals empty/gone when current fuel drops below the initial internal amount
        fuelQtyInternal = totalFuel
        fuelQtyExternal = 0
        fuelLastQtyExternal = 0
    else
        -- externals still have fuel in them
        fuelQtyInternal = initINT
        fuelQtyExternal = totalFuel - initINT
        fuelLastQtyExternal = fuelQtyExternal
    end

    if not get_elec_mon_primary_ac_ok() then
        fuelQtyInternal = 0
    end
    if not get_elec_primary_dc_ok() then
        fuelQtyExternal = 0
        if fuelQtyInternal>1400 then -- internal wing tanks are on primary DC, internal fuselage tank is on monitored primary AC, if only DC is off then wing tanks aren't shown (NATOPS 1-22)
            fuelQtyInternal=1400
        end
    end
    -- establish the fuel amount we want to display
    fuelQty = showingInternal and fuelQtyInternal or fuelQtyExternal

    -- move needle towards value we're trying to show
    if math.floor(currentDisplayedFuel) ~= math.floor(fuelQty) then
        currentDisplayedFuel=0.85*currentDisplayedFuel+0.15*((currentDisplayedFuel + fuelQty)/2)
    else
        currentDisplayedFuel=fuelQty
    end
    fuelgauge:set(currentDisplayedFuel)

    gauge_fuel_flow = 0.7*gauge_fuel_flow+0.3*((flow+gauge_fuel_flow)/2.0)

    fuelflowgauge:set(gauge_fuel_flow)
end

function update_ias_mach()
    local ias = sensor_data.getIndicatedAirSpeed()*MPS_TO_KNOTS
    local needle = 0

    -- KNOT needle marking positions are now:
    -- 0-50 knots: 0
    -- 50- 80 knots: 0-20.8791 deg
    -- 80-700 knots: x = 153.05ln(knots) - 649.79

    if ias < 50 then
        needle = 0
    elseif ias <= 80 then
        needle = (ias-50) * 20.8791/30    -- linear for initial region, 30 knot spread = 20.8791 degrees of dial
    elseif ias <= 733 then
        needle = math.fmod( ((153.05 * math.log(ias)) - 649.79), 360 )
    else
        needle = 360                -- just max it out
    end

    ias_needle:set(needle)

    -- MACH dial marking positions:
    -- .5 - 1.5: degrees = 165.47ln(mach) + 349.68
    -- 1.5 - 2.9: degrees = 95.148ln(mach) + 378.22
    -- (see google drive for this inner gauge under assets / 2d / cockpit instruments / 44_airspeed_mach.png )

    -- so mach 0.5 is positioned on the dial at 165.47*ln(0.5) + 349.68 degrees
    -- our algorithm will be:
    -- 1) figure out where the IAS needle is pointing (degrees)
    -- 2) figure out where on the mach disc is pointed at by our current mach
    -- 3) rotate the mach disc by the right amount, to match

    local mach = sensor_data.getMachNumber()
    local disc = 0
    
    if mach <= 0.5 then
        disc = 165.47 * math.log(mach) + 349.68 - needle
        if disc < 0 then
            disc = 0  -- don't let disc roll negative
        end
    elseif mach > 0.5 and mach <= 1.5 then
        disc = math.fmod( 165.47 * math.log(mach) + 349.68 - needle, 360)
    else
        disc = math.fmod( 95.148 * math.log(mach) + 378.22 - needle, 360)
    end

    ias_mach:set(disc)
end

function update_flaps_indicator()
    if get_elec_primary_dc_ok() then
        flaps_ind:set(get_aircraft_draw_argument_value(9))  -- use right flaps (9) as the input to gauge
    end
end


function update_attitude_gyros()
    if not get_elec_primary_ac_ok() then
        return
    end
    local pitch = sensor_data.getPitch()*RADIANS_TO_DEGREES
    local roll = sensor_data.getRoll()*RADIANS_TO_DEGREES
    local heading = sensor_data.getMagneticHeading()*RADIANS_TO_DEGREES

    heading = ((heading+270) % 360)   -- ADI texture has W at "0" rotation, so add 270 degrees to actual

    adi_pitch:set(-pitch*2)
    adi_roll:set(roll)
    adi_hdg:set(heading)

    --TODO need to add offsets/calibration to the gyro at some point

    attgyro_stby_pitch:set(-pitch)    -- -90 to 90 degrees, rolling "up" indicates climb
    attgyro_stby_roll:set(roll)      -- -180 to 180 degrees
end

function update_altimeter()
    -- altimeter
    local alt = sensor_data.getBarometricAltitude()*meters_to_feet

    local altNNxx = math.floor(alt_setting)         -- for now just make it discrete
    local altxxNx = math.floor(alt_setting*10) % 10
    local altxxxN = math.floor(alt_setting*100) % 10

    -- first update the selected setting value displayed
    alt_adj_NNxx:set(altNNxx)
    alt_adj_xxNx:set(altxxNx)
    alt_adj_xxxN:set(altxxxN)

    -- based on setting, adjust displayed altitude
    local alt_adj = (alt_setting - ALT_PRESSURE_STD)*1000   -- 1000 feet per inHg / 10 feet per .01 inHg -- if we set higher pressure than actual => altimeter reads higher

    alt_10k:set((alt+alt_adj) % 100000)
    alt_1k:set((alt+alt_adj) % 10000)
    alt_100s:set((alt+alt_adj) % 1000)
    alt_needle:set((alt+alt_adj) % 1000)
end

local oil_pressure_psi=0
--[[
NATOPS:
Engine oil pressure is shown on the oil pressure indicator
(figures FO-1 and FO- 2) on the instrument panel.
Normal oil pressure is 40 to 50 psi. Minimum oil
pressure for ground IDLE is 35psi.
NOTE:
- Maneuvers producing acceleration near zero
"g" may cause a temporary loss of oil pressure.
Absence of oil pressure for a maximum
of 10 seconds is permissible.
- Oil pressure indications are available on
emergency generator.

OIL PRESSURE VARIATION
The oil pressure indication at IDLE RPM should be
normal (40 to 50 psi); however, a minimum of 35 psi
for ground operation is acceptable. If the indication
is less than 35 psi at 60 percent rpm, shut down the
engine to determine the reason for the lack of, or
low, oil pressure.
- Even though certain maneuvers normally
cause a momentary loss of oil pressure,
maximum operating time with an oil pressure
indicating less than 40 psi in flight is
1 minute. If oil pressure is not recovered
in 1 minute, the flight should be terminated
as soon as practicable.
- Maneuvers producing acceleration near zero
g may cause complete loss of oil pressure
temporarily. Absence of oil pressure for
a maximum of 10 seconds is permissible.
- If the oil pressure indicator reads high (over
50 psi), the throttle setting should be made as
soon as possible, and the cause investigated.
NOTE:
During starting and initial runup, the maximum
allowable oil pressure is 50 psi.
--]]
function update_oil_pressure()
    local oil_pressure_target
    if get_elec_26V_ac_ok() then -- will have power on main and emergency generator
        oil_pressure_target=45 -- TODO: simulate proper oil pressure correctly, currently just hardcode to 45
    else
        oil_pressure_target=0
    end
    oil_pressure_psi = 0.7*oil_pressure_psi+0.3*((oil_pressure_target+oil_pressure_psi)/2.0)

    oil_pressure:set(oil_pressure_psi)
end

--
-- master update function for all avionics
---
function update()
    update_altimeter()
    update_fuel_gauge()
    update_ias_mach()
    update_flaps_indicator()
    update_attitude_gyros()
    update_oil_pressure()

    if refuelingOccurred then
        local flow = sensor_data.getEngineLeftFuelConsumption()
        --print("RPM: "..rpm)
        if flow > 0 then
            -- we've started engine again and fuel flow is non-zero, thus refueling/rearming must be complete.  This means
            -- it's safe to do a full re-calculate fuel state because we know they can't change anymore.  In theory this
            -- catches any glitches in the incremental fuel update code
            enumerate_fueltanks()
            refuelingOccurred = false
        end
    end
end

need_to_be_closed = false -- close lua state after initialization

-- getAngleOfAttack
-- getAngleOfSlide
-- getBarometricAltitude
-- getCanopyPos
-- getCanopyState
-- getEngineLeftFuelConsumption --
-- getEngineLeftRPM
-- getEngineLeftTemperatureBeforeTurbine
-- getEngineRightFuelConsumption
-- getEngineRightRPM
-- getEngineRightTemperatureBeforeTurbine
-- getFlapsPos
-- getFlapsRetracted
-- getHeading
-- getHelicopterCollective
-- getHelicopterCorrection
-- getHorizontalAcceleration
-- getIndicatedAirSpeed
-- getLandingGearHandlePos
-- getLateralAcceleration
-- getLeftMainLandingGearDown
-- getLeftMainLandingGearUp
-- getMachNumber
-- getMagneticHeading
-- getNoseLandingGearDown
-- getNoseLandingGearUp
-- getPitch
-- getRadarAltitude
-- getRateOfPitch
-- getRateOfRoll
-- getRateOfYaw
-- getRightMainLandingGearDown
-- getRightMainLandingGearUp
-- getRoll
-- getRudderPosition --
-- getSpeedBrakePos
-- getStickPitchPosition
-- getStickRollPosition
-- getThrottleLeftPosition
-- getThrottleRightPosition
-- getTotalFuelWeight  
-- getTrueAirSpeed
-- getVerticalAcceleration
-- getVerticalVelocity
-- getWOW_LeftMainLandingGear
-- getWOW_NoseLandingGear
-- getWOW_RightMainLandingGear



