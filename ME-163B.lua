
ME_163B =  {

    Name                 =   'ME-163B',
    DisplayName            = _('ME-163B'),
    ViewSettings        = ViewSettings,

    -- enables ME-163 for countries that had them - Including countries that researched them.
	Countries = {"Germany","UK","USAF Aggressors"},

    HumanCockpit         = false,
    HumanCockpitPath    = current_mod_path..'/Cockpit/',

    Picture             = "ME-163B.png",
    Rate                 = 40, -- RewardPoint in Multiplayer
    Shape                 = "me-163animated",

    shape_table_data     =
    {
        {
            file       = 'me-163animated';
            life       = 18; -- lifebar
            vis        = 3;  -- visibility gain.
            desrt    = 'ME-163B_destr'; -- Name of destroyed object file name Alphajet-destr. This is a placeholder.
            fire       = {300, 3}; -- Fire on the ground after destoyed: 300sec 2m
            username = 'ME-163B';
            index    =  WSTYPE_PLACEHOLDER;
        },
        {
            name  = "ME-163B_destr";
            file  = "ME-163B_destr";
            fire  = {240, 2};  -- 240  2
        },

    },
    -------------------------
    -- add model draw args for network transmitting to this draw_args table (32 limit)
    net_animation ={38, -- canopy
                    0, -- gear
					400, --front gear door
					402, --Tractor
                    3,
                    5,
                    9,
                    10,
                    11, -- aileron
                    15, -- stabilizer
                    20,  -- flaps
                    21, -- air brake
                    7, -- rat
                    13, -- prop slow
                    14, -- prop fast
                    120, -- spoiler
                    123, -- spoiler
                    130, -- Nose Light
                    190, -- left nav light
                    191, -- tail nav light
                    192, -- right nav light
                    198, -- top anti collision light
                    199, -- bottom anti collision light
                    208, -- landing light
                    209, -- taxi light
                    210, -- nacelle spotlight
                    211, -- left nose light
                    212, -- right nose light
                    },
	-------------------------
    mapclasskey         = "P0091000024", --Fighter
    attribute              = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Multirole fighters" }, --Needs to be updated
    Categories = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
    -------------------------
    M_empty                     	= 1905,		 	-- kg	(VERIFY)
    M_nominal                    	= 3950,		 	-- kg	(VERIFY)
    M_max                         	= 4310,		 	-- kg (Maximum Take Off Weight) [Needs Checking]
    M_fuel_max                     	= 1527,	 		-- kg (Internal Fuel Only) [Needs Checking]
    H_max                          	= 16459,		-- m  (Maximum Operational Ceiling) [Needs Checking]
	-------------------------
    length             				= 5.98, 		-- full lenght in m
    height             				= 2.75, 		-- height in m
    wing_area         				= 18.5, 		-- wing area in m2     -- Got a source with 18.5, 19.6 was original    **
    wing_span         				= 9.33, 		-- wing span in m
    wing_tip_pos     				= {-2.5, -0.38,    4.2}, -- wingtip coords for visual effects
    wing_type         				= 0,    		-- FIXED_WING = 0 /VARIABLE_GEOMETRY = 1 /FOLDED_WING = 2 /ARIABLE_GEOMETRY_FOLDED = 3
    flaps_maneuver     				= 0.5, 			-- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
    has_speedbrake    				= false,

    RCS                     		= 1, 			-- Radar Cross Section m2
    IR_emission_coeff         		= 0.5, 			-- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
    IR_emission_coeff_ab    		= 0.5, 			-- With afterburner

    stores_number    				= 0, 			-- Amount of pylons. [CHECKED]

    CAS_min            				= 25.7, 		-- minimal indicated airspeed  m/s?  (50 knots per NATOPS)
    V_opt            				= 200, 			-- Cruise speed (for AI)
    V_take_off        				= 77, 			-- Take off speed in m/s (for AI - 150kts)
    V_land            				= 58, 			-- Land speed in m/s (for AI) (110 kn)
    V_max_sea_level 				= 300.83, 		-- Max speed at sea level in m/s (for AI)
    V_max_h         				= 300.8, 		-- Max speed at max altitude in m/s (for AI)
    Vy_max             				= 93, 			-- Max climb speed in m/s (for AI - 180kts)
    Mach_max         				= 0.88, 		-- Max speed in Mach (for AI)
    Ny_min             				= -2.0, 		-- Min G (for AI)
    Ny_max             				= 7.5, 			-- Max G (for AI)
    Ny_max_e         				= 7.5, 			-- Max G (for AI)
    --AOA_take_off     = 0.27, -- AoA in take off radians (for AI)   16 degrees
    bank_angle_max     				= 60, -- Max bank angle (for AI)
    range             				= 150, -- Max range in km (for AI)

    thrust_sum_max     				= 16903, -- thrust in kg (J52 P8A: 9300 lb)    **
    has_afteburner  				= false,
	has_differential_stabilizer		= false,
    thrust_sum_ab   				= 16903, -- thrust in kg (kN)    **
    average_fuel_consumption 		= 1,   -- 0.89 lb/lbf*hr = 1.246 kg/s for 100% thrust -- Needs updating once translated and value type needs to be determined, what units
    is_tanker       				= false,
    tanker_type     				= 2, -- Tanker type if the plane is tanker
    air_refuel_receptacle_pos = {0, 0, 0},

	-----------------------------------------------------------------------
	----------------- SUSPENSION CODE BEGINS
	-----------------------------------------------------------------------
    nose_gear_pos = {2.72, -2.38, 0}, --{2.72, -2.37, 0},    --      2.72,       -2.28,    0
    main_gear_pos = {-0.79, -2.46, 1.18}, --{-0.79, -2.42, 1.18},    --  0.79,   -2.35,    1.18
    tand_gear_max = 0.554, -- // tangent on maximum yaw angle of front wheel

    nose_gear_amortizer_direct_stroke    = 0.1, --1.878 - 1.878,  -- down from nose_gear_pos !!!
    nose_gear_amortizer_reversal_stroke  = -0.32, --1.348 - 1.878,  -- up
    main_gear_amortizer_direct_stroke     = 0.1, --1.592 - 1.592, --  down from main_gear_pos !!!
    main_gear_amortizer_reversal_stroke  = -0.43, --1.192 - 1.592, --  up

    nose_gear_amortizer_normal_weight_stroke = -0.18, -- 0.144
    main_gear_amortizer_normal_weight_stroke = -0.38, --

    nose_gear_wheel_diameter    =   0.441, --0.441, --*
    main_gear_wheel_diameter    =   0.609, --0.609, --*
    brakeshute_name    = 0, -- Landing - brake chute visual shape after separation

	-----------------------------------------------------------------------
	----------------- SUSPENSION CODE ENDS
	-----------------------------------------------------------------------

    engines_count    = 1,
    engines_nozzles =
    {
        [1] =
        {
            pos =     {-3.383,	.031, -.002}, -- nozzle coords
            elevation    =    0.0, -- AFB cone elevation
            diameter    =    0.6, -- AFB cone diameter
            exhaust_length_ab    =    4, -- lenght in m
            exhaust_length_ab_K    =    0.707, -- AB animation
            smokiness_level     =     0.15,
        }, -- end of [1]
    }, -- end of engines_nozzles

    crew_size    = 1,
    crew_members =
    {
        [1] =
        {
            ejection_seat_name = "pilot+ejectionseat",
            drop_canopy_name    =    "pilot+ejectionseat", --Check the Canopy name with other files,
            pos =  {4,	1,	0}, --changes the position of the cockpit view {3.077,    0.574,    0}
            canopy_pos = {4,	1,	0},
			--ejection_play_arg = 149,
			--can_be_playable 	= true,
			--ejection_through_canopy = true,
			--ejection_added_speed = {-5,15,0},
			--ejection_order 		 = 2,
			--role 				 = "pilot",
			--role_display_name    = _("Pilot"),
			g_suit 			   =  1 -- I'm assuming there are different levels of suits which black you out at different G's. We should try and experiment with different ones.
        }, -- end of [1]
    }, -- end of crew_members
---------------------------------------------------------------------------------------------------------------------------------------------
    fires_pos =
    {
        [1] =     {-0.232,    0.262,    0}, 	-- Fuselage
        [2] =     {-2,    -0.5,    1.3}, 		-- wing (inner?) right
        [3] =     {-2,    -0.5,    -1.3}, 		-- wing (inner?) left
        [4] =     {-0.82,    0.265,    2.774},  -- Wing center Right? {-0.82,    0.265,    2.774},
        [5] =     {-0.82,    0.265,    -2.774}, -- Wing center Left?  {-0.82,    0.265,    -2.774},
        [6] =     {-0.82,    0.255,    4.274},  -- Wing outer Right? {-0.82,    0.255,    4.274},
        [7] =     {-0.82,    0.255,    -4.274}, -- Wing outer Left?  {-0.82,    0.255,    -4.274},
        [8] =     {-5.6,    0.185,    0},       -- High Altitude Contrails
        [9] =     {-5.5,    0.2,    0},    		-- left engine
        [10] =     {-7.728,    0.039,    0.5},  -- Right Engine? {0.304,    -0.748,    0.442},
        [11] =     {-7.728,    0.039,    -0.5}, -- ?
    }, -- end of fires_pos
---------------------------------------------------------------------------------------------------------------------------------------------

    --- Countermeasures---
    SingleChargeTotal         = 0,
    CMDS_Incrementation     = 0,
    ChaffDefault             = 0,
    ChaffChargeSize         = 0,
    FlareDefault             = 0,
    FlareChargeSize         = 0,
    CMDS_Edit                 = false,
    chaff_flare_dispenser     = {
    }, -- end of chaff_flare_dispenser

--sensors

    HumanRadio = {
        frequency = 254.0, -- Maykop (Caucasus) or Nellis (NTTR)
        editable = true,
        minFrequency = 225.000,
        maxFrequency = 399.900,
        modulation = MODULATION_AM
    },

    panelRadio = { -- Research to be done on radio, I'm betting it is similar to the 109 or 190 radio
        [1] = {
            name = _("AN/ARC-27A"),
            range = {
                {min = 225.0, max = 399.9}
            },
            channels = {  -- matches L-39C except for channel 8, which was changed to a Georgian airport and #20 which is NTTR only (for now).  This radio goes 1-20 not 0-19.
                [1] = { name = _("Channel 1"),		default = 264.0, modulation = _("AM"), connect = true}, -- mineralnye-vody (URMM) : 264.0
                [2] = { name = _("Channel 2"),		default = 265.0, modulation = _("AM")},	-- nalchik (URMN) : 265.0
                [3] = { name = _("Channel 3"),		default = 256.0, modulation = _("AM")},	-- sochi-adler (URSS) : 256.0
                [4] = { name = _("Channel 4"),		default = 254.0, modulation = _("AM")},	-- maykop-khanskaya (URKH), nellis (KLSV) : 254.0
                [5] = { name = _("Channel 5"),		default = 250.0, modulation = _("AM")},	-- anapa (URKA) : 250.0
                [6] = { name = _("Channel 6"),		default = 270.0, modulation = _("AM")},	-- beslan (URMO) : 270.0
                [7] = { name = _("Channel 7"),		default = 257.0, modulation = _("AM")},	-- krasnodar-pashkovsky (URKK) : 257.0
                [8] = { name = _("Channel 8"),		default = 258.0, modulation = _("AM")},	-- sukhumi-babushara (UGSS) : 255.0
                [9] = { name = _("Channel 9"),		default = 262.0, modulation = _("AM")},	-- kobuleti (UG5X) : 262.0
                [10] = { name = _("Channel 10"),	default = 259.0, modulation = _("AM")},	-- gudauta (UG23) : 259.0
                [11] = { name = _("Channel 11"),	default = 268.0, modulation = _("AM")},	-- tbilisi-soganlug (UG24) : 268.0
                [12] = { name = _("Channel 12"),	default = 269.0, modulation = _("AM")},	-- tbilisi-vaziani (UG27) : 269.0
                [13] = { name = _("Channel 13"),	default = 260.0, modulation = _("AM")},	-- batumi (UGSB) : 260.0
                [14] = { name = _("Channel 14"),	default = 263.0, modulation = _("AM")},	-- kutaisi-kopitnari (UGKO) : 263.0
                [15] = { name = _("Channel 15"),	default = 261.0, modulation = _("AM")},	-- senaki-kolkhi (UGKS) :  261.0
                [16] = { name = _("Channel 16"),	default = 267.0, modulation = _("AM")},	-- tbilisi-lochini (UGTB) : 267.0
                [17] = { name = _("Channel 17"),	default = 251.0, modulation = _("AM")},	-- krasnodar-center (URKI), creech (KINS) : 251.0
                [18] = { name = _("Channel 18"),	default = 253.0, modulation = _("AM")},	-- krymsk (URKW), mccarran (KLAS) : 253.0
                [19] = { name = _("Channel 19"),	default = 266.0, modulation = _("AM")},	-- mozdok (XRMF) : 266.0
                [20] = { name = _("Channel 20"),	default = 252.0, modulation = _("AM")}, -- N/A, groom lake/homey (KXTA) : 252.0
            }
        },
    },

    LandRWCategories =
    {
        [1] =
        {
            Name = "AircraftCarrier",
        }, -- end of [1]
    }, -- end of LandRWCategories

    -- WingSpan = "8.38",--*
    -- MaxFuelWeight = "2498.4",
    -- MaxHeight = "12880",
    -- MaxSpeed = "300",
    -- MaxTakeOffWeight = "11136",
    -- Picture = "A-4E.png",
    -- Rate = "40",
    -- Shape = "A-4E",

    TakeOffRWCategories =
    {
        [1] =
        {
            Name = "AircraftCarrier With Catapult",
        }, -- end of [1]
        [2] =
        {
            Name = "AircraftCarrier With Tramplin",
        }, -- end of [2]
    }, -- end of TakeOffRWCategories
    WorldID = ME_163B,

    Failures = {
        { id = 'asc',         label = _('ASC'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'autopilot', label = _('AUTOPILOT'), enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'hydro',      label = _('HYDRO'),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'l_engine',  label = _('L-ENGINE'),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'r_engine',  label = _('R-ENGINE'),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'radar',      label = _('RADAR'),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'eos',          label = _('EOS'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'helmet',      label = _('HELMET'),     enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        --{ id = 'mlws',      label = _('MLWS'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'rws',          label = _('RWS'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'ecm',       label = _('ECM'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'hud',          label = _('HUD'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
        { id = 'mfd',          label = _('MFD'),         enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
    },
---------------------------------------------------------------------------------------------------------------------------------------------
   -- Guns = {
         --   coltMK12({muzzle_pos_connector = "GUN_POINT_1",
         --       rates = {1020},
                --mixes = {{2,1,1,1,1,1}},
        --        effect_arg_number = 434,
        --        supply_position = {2, -0.3, -0.4},
       --         ejector_pos_connector = "GUN_EJECT_1",
      --          }),
      --      coltMK12({muzzle_pos_connector = "GUN_POINT_2",
     --           rates = {1020},
                --mixes = {{2,1,1,1,1,1}},
      --          effect_arg_number = 434,
      --          supply_position = {2, -0.3, -0.4},
      --          ejector_pos_connector = "GUN_EJECT_2",
      --          }),
   -- },

    -- ammo_type = {
        -- _("CM Combat Mix"),
        -- _("HEI High Explosive Incendiary"),
        -- _("TP Target Practice"),
    -- },

---------------------------------------------------------------------------------------------------------------------------------------------
Pylons =     {    },
---------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------------------------
    Tasks = {
        aircraft_task(RunwayAttack),
        aircraft_task(Intercept),
    },
    DefaultTask = aircraft_task(Intercept),
---------------------------------------------------------------------------------------------------------------------------------------------
    SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0	        =	-0.1,        -- zero AoA lift coefficient - Compared against real data for the airfoil.
			Mzalfa	    =	4.355,       -- coefficients for pitch agility - Accurate for what the SFM
			Mzalfadt	=	0.8,         -- coefficients for pitch agility - SFM Table accurate
			kjx	        =	1.5,
			kjz 		=   0.00125,     -- Do not change, it's true of all aircraft
			Czbe		=	-0.014,      -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear		=	0.0,--0.12,  -- coefficient, drag, gear
			cx_flap		=	0.0,--0.095, -- coefficient, drag, full flaps
			cy_flap		=	0.0,--0.24,  -- coefficient, normal force, lift, flaps
			cx_brk		=	0.0,--0.08,  -- coefficient, drag, breaks
			table_data  =
			{
            --       M       Cx0       Cya      B        B4          Omxmax   Aldop      Cymax

                    {0.0,    0.013,    0.033,    0.074,    0.01,       0.5,     90,       1.2,    },
                    {0.1,    0.013,    0.067,    0.074,    0.01,       0.81,    90,       1.2,    },
                    {0.2,    0.013,    0.085,	 0.074,	   0.01,       1.62,    45,       1.2,	  },
					{0.4,    0.0135,   0.120,    0.074,    0.01,       2.43,    30,       1.4,    },
                    {0.5,    0.0138,   0.120,    0.074,    0.11,       2.63,    30,       1.5,    },
                    {0.6,    0.0141,   0.120,    0.080,    0.11,       2.82,    30,       1.6,    },
                    {0.7,    0.0147,   0.131,    0.080,    0.11,       2.98,    30,       1.5,    },
                    {0.78,   0.0147,   0.131,    0.080,    0.11,       2.98,    30,       1.5,    },
                    {0.80,   0.0232,   0.131,    0.080,    0.36,       2.98,    30,       1.5,    },
                    {0.82,   0.0232,   0.131,    0.082,    0.36,       1.48,    25,       1.4,    }, -- Cx0
                    {0.85,   0.0232,   0.131,    0.082,    0.36,       0.60,    20,       1.4,    }, -- 0.030
                    {0.9,    0.0402,   0.076,    0.088,    0.36,       0.10,    15,       1.4,    }, -- 0.060
					{0.94,   0.0402,   0.0737,	 0.125,    0.43,       0.006,	9.8,	  0.625,  },
					{1.0,    0.0598,   0.0735,	 0.15,     0.56,       0.004,	8,        0.511,  },
					{1.04,   0.063,    0.0744,	 0.23,     0.84,       0.002,	7.4,	  0.469,  },
					{1.2,    0.0642,   0.0760,	 0.26,     0.999,      0.001,   6.7,      0.425,  },
            } -- end of table_data
			-- M - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
			-- B - Polar quad coeff
			-- B4 - Polar 4th power coeff
			-- Omxmax - roll rate, rad/s
			-- Aldop - Alfadop Max AOA at current M - departure threshold
			-- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)
		}, -- end of aerodynamics
		engine =
		{
            Nmg     =    11.83,    -- RPM at idle - Lowest throttle setting was only at 2000N
            MinRUD  =   .12,    -- Min state of the throttle
            MaxRUD  =    .99,    -- Max state of the throttle
            MaksRUD =    .75,    -- Military power state of the throttle
            --ForsRUD =   .16,    -- Afterburner state of the throttle
            typeng  =    0,
			--[[
				E_TURBOJET = 0
				E_TURBOJET_AB = 1
				E_PISTON = 2
				E_TURBOPROP = 3
				E_TURBOFAN	= 4
				E_TURBOSHAFT = 5
			--]]

			hMaxEng	=	15, -- Max altitude for safe engine operation in km
            dcx_eng    =    0.0,    -- Engine drag coeficient
            cemax    =    0.037,    -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
            cefor    =    0.037,    -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
            dpdh_m    =    2250,    --  altitude coefficient for max thrust
            dpdh_f    =    2250,    --  altitude coefficient for AB thrust

			table_data =
            {
            --   M            Pmax
                {0.0,        16903.0}, -- 36,877 kN
                {0.1,        16903.0}, --
                {0.2,        16903.0}, -- 130 KTS = 3650 FT VS. 3800 FT MANUAL
                {0.3,        16903.0}, -- 12800 = 2 mins 40 sec vs. 4 mins
                {0.4,        16903.0}, --24800.0 22800.0 23800.0 21200.0 19500.0 14800.0 11700.0
                {0.5,        16903.0}, --26000.0 23000.0 24000.0 21800.0 19000.0 14700.0 14000.0
                {0.6,        16903.0}, --28200.0 23200.0 24200.0 22400.0 18000.0 14600.0 14500.0 30% (30 mins vs. 40 mins tables)
                {0.7,        16903.0},  --30400.0 23400.0 24400.0 23000.0 17500.0 14500.0 14500.0
                {0.8,        16903.0},   --32600.0 23600.0 24600.0 23600.0 17000.0 14400.0 14500.0
                {0.9,        16903.0},     --34800.0 23800.0 24800.0 24200.0 16000.0 14300.0 14500.0
                {1.0,        16903.0},     --36000.0 24000.0 25000.0 22000.0 15000.0 14200.0 14500.0
            }, -- end of table_data


			extended = -- added new abilities for engine performance setup. thrust data now can be specified as 2d table by Mach number and altitude. thrust specific fuel consumption tuning added as well
			{
				thrust_max = -- thrust interpolation table by altitude and mach number, 2d table
				 { -- Minimum thrust 2000 kN, maximum thrust 16700 kN
					 M 		 = {0,.1,0.3,0.5,0.7,0.8,0.9,1.1},
					 H		 = {0,250,4572,7620,10668,13716,16764,19812},
					 thrust	 = {-- M   0         0.1       0.3       0.5       0.7      0.8     0.9       1.1
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 0 (sea level)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 250 (sea level)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 4572 (15kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 7620 (25kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 10668 (35kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 13716 (45kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 16764 (55kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 19812 (65kft)


					 },
				 },


				 thrust_afterburner = -- afterburning thrust interpolation table by altitude and mach number, 2d table
				 { --
					 M 		 = {0,.1,0.3,0.5,0.7,0.8,0.9,1.1},
					 H		 = {0,250,4572,7620,10668,13716,16764,19812},
					 thrust	 = {-- M   0         0.1       0.3       0.5       0.7      0.8     0.9       1.1
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 0 (sea level)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 250 (sea level)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 4572 (15kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 7620 (25kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 10668 (35kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 13716 (45kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 16764 (55kft)
								{   16903,      16903,    16903,    16903,    16903,   16903,  16903,    16903 },--H = 19812 (65kft)

					 },
				 },
				rpm_acceleration_time_factor = -- time factor for engine governor  ie RPM += (desired_RPM - RPM ) * t(RPM) * dt
				{
					RPM  = {0, 50, 100},
					t    = {1,1,1}
				},
				rpm_deceleration_time_factor = -- time factor for engine governor
				{
					RPM  = {0, 50, 100},
					t    = {1, 1, 1}
				},
				rpm_throttle_responce = -- required RPM according to throttle position
				{
					throttle = {0  ,0.8 , 1.0},
					RPM      = {50 ,80  ,100},
				},
				thrust_rpm_responce = -- thrust = K(RPM) * thrust_max(M,H)
				{
					RPM = {0  ,50  , 100},
					K   = {0  ,0.5, 1},
				},
			},
        }, -- end of engine
	},
---------------------------------------------------------------------------------------------------------------------------------------------
    --damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
    Damage = {
                [0] = {critical_damage = 5, args = {82}},  							-- 0 - nose center
                [3] = {critical_damage = 10, args = {65}}, 							-- 3 - cockpit
                [8] = {critical_damage = 10}, 			  							-- 8 - front gear
                [11] = {critical_damage = 3}, 			  							-- 11 - engine in left
                [12] = {critical_damage = 3}, 			  							-- 12 - engine in right
                [15] = {critical_damage = 10},			   							-- 15 - gear left
                [16] = {critical_damage = 10}, 										-- 16 - gear right
                [17] = {critical_damage = 3}, 										-- 17 - motogondola left (left engine out, left ewu)
                [18] = {critical_damage = 3}, 										-- 18 - motogondola right (right engine out, right ewu)
                [25] = {critical_damage = 5, args = {53}}, 							-- 25 - eleron left
                [26] = {critical_damage = 5, args = {54}}, 							-- 26 - eleron right
                [35] = {critical_damage = 10, args = {67}, deps_cells = {25, 37}},  -- 35 - wing in left
                [36] = {critical_damage = 10, args = {68}, deps_cells = {26, 38}},  -- 36 - wing in right
                [37] = {critical_damage = 4, args = {55}}, 						    -- 37 - flap in left
                [38] = {critical_damage = 4, args = {56}}, 						    -- 38 - flap in right
                [43] = {critical_damage = 4, args = {61}, deps_cells = {53}}, 		-- 43 - fin bottom left
                [44] = {critical_damage = 4, args = {62}, deps_cells = {54}}, 		-- 44 - fin bottom right
                [47] = {critical_damage = 5, args = {63}, deps_cells = {51}}, 		-- 47 - stabilizer in left
                [48] = {critical_damage = 5, args = {64}, deps_cells = {52}}, 		-- 48 - stabilizer in right
                [51] = {critical_damage = 2, args = {59}}, 							-- 51 - elevator in left
                [52] = {critical_damage = 2, args = {60}}, 							-- 52 - elevator in right
                [53] = {critical_damage = 2, args = {57}}, 							-- 53 - rudder left
                [54] = {critical_damage = 2, args = {58}}, 							-- 54 - rudder right
                [55] = {critical_damage = 5, args = {81}}, 							-- 55 - tail
                [83]    = {critical_damage = 3, args = {134}}, 						-- nose wheel
                [84]    = {critical_damage = 3, args = {136}}, 						-- left wheel
                [85]    = {critical_damage = 3, args = {135}}, 						-- right wheel
    },

	DamageParts =
	{
--DAMAGEOFF		[1] = "ME-163B-1a-part-wing-R", -- wing R
--DAMAGEOFF		[2] = "ME-163B-1a-part-wing-L", -- wing L
--DAMAGEOFF		[3] = "ME-163B-1a-part-nose", -- nose
--DAMAGEOFF		[4] = "ME-163B-1a-part-tail", -- tail
	},
---------------------------------------------------------------------------------------------------------------------------------------------
    lights_data = {
    typename = "collection",
    lights = {
    [1] = { typename = "collection",
                        lights = {-- Top Anticollision Light (red)
                                  {typename = "natostrobelight",
                                   connector = "RED_BEACON_T",
                                   argument_1 = 198,
                                   period = 1.2,
                                   phase_shift = 0
                                  },
                                  -- Bottom Anticollision Light (red)
                                  {typename = "natostrobelight",
                                   connector = "RED_BEACON_B",
                                   argument_1 = 199,
                                   period = 1.2,
                                   phase_shift = 0
                                  }
                                 }
          },
    [2] = { typename = "collection",
                            lights = {-- Landing light
                                      {typename = "spotlight",
                                       connector = "MAIN_SPOT_PTR_02",
                                       argument = 209,
                                       dir_correction = {elevation = math.rad(-1)}
                                      },
                                      {-- Landing/Taxi light
                                       typename = "spotlight",
                                       connector = "MAIN_SPOT_PTR_01",
                                       argument = 208,
                                       dir_correction = {elevation = math.rad(3)}
                                      }
                                     }
                        },
    [3]    = {    typename = "collection",
                                lights = {-- Left Position Light (red)
                                {typename = "omnilight",
                                 connector = "RED_NAV_L",
                                 color = {0.99, 0.11, 0.3},
                                 pos_correction  = {0.0, 0, -0.2},
                                 argument  = 190
                                },
                                 -- Right Position Light (green)
                                {typename = "omnilight",
                                connector = "GREEN_NAV_R",
                                color = {0, 0.894, 0.6},
                                pos_correction = {0.0, 0, 0.2},
                                argument  = 191
                                },
                                -- Tail Position Light (white)
                                {typename = "omnilight",
                                connector = "WHITE_NAV_T",
                                color = {1, 1, 1},
                                pos_correction  = {0, 0, 0},
                                argument  = 192
                                }}
                            },
--[4] = { typename = "collection", -- white strobe upper
--            lights = {
--                     {typename = "natostrobelight",connector = "WHITE_TOP",argument_1 = 999,period = 1.0,color = {0.8, 0.8, 1.0},phase_shift = 0.0},
--                     {typename = "natostrobelight",connector = "WHITE_TOP",argument_1 = 998,period = 1.0,color = {0.8, 0.8, 1.0},phase_shift = 0.5},
--             }
--        },
    [4]    = {typename = "collection", -- should be [4]? if not rename back to [5]
            lights = {
                        {typename = "collection",
                        lights = {{
                                -- Right Nacelle Floodlight
                                typename = "spotlight",
                                position  = {0.5, 1.2, 0},
                                color = {1.0, 1.0, 1.0},
                                intensity_max = 0.0,
                                angle_max = 0.45,
                                direction = {azimuth = math.rad(150), elevation = math.rad(5)},
                                dont_change_color = false,
                                angle_change_rate = 0
                               },
                               {
                                -- Left Nacelle Floodlight
                                typename = "spotlight",
                                position  = {0.5, 1.2, 0},
                                color = {1.0, 1.0, 1.0},
                                intensity_max = 0.0,
                                angle_max = 0.45,
                                direction = {azimuth = math.rad(-150), elevation = math.rad(5)},
                                dont_change_color = false,
                                angle_change_rate = 0
                               },
                               {typename  = "argumentlight", argument = 212},
                        },
                    },
                    {typename = "collection",
                        lights = {{
                                -- Left Nose Floodlight
                                typename  = "spotlight",
                                position  = {0, -0.3, -5.80},
                                color = {1.0, 1.0, 1.0},
                                intensity_max = 0.0, angle_max = 0.45,
                                direction = {azimuth = math.rad(45)},
                                argument = 211,
                                dont_change_color = false,
                                angle_change_rate = 0
                               },
                               {
                                -- Right Nose Floodlight
                                typename = "spotlight",
                                position  = {0, -0.3, 5.80},
                                color = {1.0, 1.0, 1.0},
                                intensity_max = 0.0,
                                angle_max = 0.45,
                                direction = {azimuth = math.rad(-45)},
                                argument = 210,
                                dont_change_color = false,
                                angle_change_rate = 0
                               }
                        }
                    },
                    -- UARRSI light
                    {
                        typename = "omnilight", position  = {6.5, 0.4, 0}, color = {6, 6, 2}
                    }
                },
            }
        }
    },
}

add_aircraft(ME_163B)
