--mounting 3d model paths and texture paths 

mount_vfs_model_path	(current_mod_path.."/Shapes")
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures")

---Guns------
local function SNO_MK_108 ( tbl )
        tbl.category = CAT_GUN_MOUNT
        tbl.name = "SNO_MK_108"
        tbl.supply = {
            shells = {"SNO_MK_108_MGsch", "SNO_MK_108_MGsch_T", "SNO_MK_108_HEI"},
            mixes = {{2, 2}},
            count = 60,
        }
        if tbl.mixes then
            tbl.supply.mixes = tbl.mixes
            tbl.mixes        = nil
        end
        if tbl.count then
            tbl.supply.count = tbl.count
            tbl.count = nil
        end
        tbl.gun = {
            max_burst_length = 65535,
            rates = {660}, -- unsynchronized mount
            recoil_coeff = 1.0,
            barrels_count = 1,
        }
        if tbl.rates then
            tbl.gun.rates = tbl.rates
            tbl.rates = nil
        end
        tbl.ejector_pos = tbl.ejector_pos or {0.0, 0.05, 0.0}
        tbl.ejector_dir = {0, -1, 0}
        --tbl.effect_arg_number = tbl.effect_arg_number or 436
        tbl.supply_position = tbl.supply_position or {0, -0.3, -1.5}
        tbl.aft_gun_mount = false
        tbl.effective_fire_distance = 1000
        --tbl.drop_cartridge = 0 -- 204
        tbl.muzzle_pos = {0, 0, 0} -- all position from connector
        tbl.azimuth_initial = tbl.azimuth_initial or 0
        tbl.elevation_initial = tbl.elevation_initial or 0

        return declare_weapon(tbl)
    end
--------------------------------------------------------------------------------	


ME_163B =  {
        
	Name 				=   'ME-163B',
	DisplayName			= _('ME-163B'),
	
	HumanCockpit 		= false,
	HumanCockpitPath    = current_mod_path..'/Cockpit/',
	
	Picture 			= "ME-163B-1a.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "ME-163B-1a",
	
	shape_table_data 	= 
	{
		{
			file  	 = 'ME-163B-1a';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'ME-163B-1a_destr'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'ME-163B-1a';
			index    =  WSTYPE_PLACEHOLDER;
		},
		{
			name  = "ME-163B-1a_destr";
			file  = "ME-163B-1a-destr";
			fire  = { 240, 2};
		},

	},
	-------------------------
    -- add model draw args for network transmitting to this draw_args table (32 limit)
    net_animation ={38, -- canopy
                    0, -- gear
					400, --front gear door
					402, --huffer
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
	mapclasskey 		= "P0091000025",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},	
	-------------------------
	M_empty 					= 1905, -- kg
	M_nominal 					= 3950, -- kg
	M_max 						= 4310, -- kg
	M_fuel_max 					= 1527, -- kg --2225
	H_max 					 	= 16459, -- m
	average_fuel_consumption 	= 403, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 50, -- if this is not OVERAL FLIGHT TIM
    V_opt            			= 222.222, -- Cruise speed (for AI) [Checked] NEEDS WORK
    V_take_off       			= 52.7778, -- Take off speed in m/s (for AI) NEEDS WORK
    V_land            			= 58, -- Land speed in m/s (for AI) (110 kn) NEEDS WORK
    V_max_sea_level 			= 300.83, -- Max speed at sea level in m/s (for AI) NEEDS WORK
    V_max_h         			= 300.8, -- Max speed at max altitude in m/s (for AI) NEEDS WORK    
    Vy_max            			= 52, -- Max climb speed in m/s (for AI) NEEDS WORK   
    Mach_max         			= .82, -- Max speed in Mach (for AI) AmeryInitialVal
    Ny_min             			= -0.1, -- Min G (for AI) NEEDS WORK 
    Ny_max             			= 8.0, -- Max G (for AI) NEEDS WORK 
    Ny_max_e         			= 8.0, -- Max G (for AI) NEEDS WORK  
    AOA_take_off     			= 0.27, -- AoA in take off radians (for AI)   16 degrees NEEDS WORK 
    bank_angle_max     			= 60, -- Max bank angle (for AI) NEEDS WORK 


	has_afteburner 				= true, -- AFB yes/no
	has_speedbrake 				= true, -- Speedbrake yes/no
	main_gear_pos 				= { 3.161, -1.023, 0.000},
	nose_gear_pos 				= {-0.839, -0.983, 0.000},  
	nose_gear_wheel_diameter 	= 0.184, -- in m
	main_gear_wheel_diameter 	= 0.552, -- in m
	tand_gear_max 				= 0.4,
	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
    wing_area         			= 19.6, -- wing area in m2 AmeryInitialVal
    wing_span         			= 9.32, -- wing span in m  AmeryInitialVal
    wing_type         			= 0, -- 0 = Fixed wing
									 -- 1 = Variable geometry
									 -- 2 = Fold-able wing
	thrust_sum_max    			= 1702, -- thrust in kg (J52 P8A: 9300 lb)   
	thrust_sum_ab    			= 1702, -- thrust in kg (kN)    **
	length 			  			= 5.98, -- full lenght in m
	height            			= 2.75, -- height in m [Checked]           
    flaps_maneuver    			= 0.5, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
    range             			= 40, -- Max range in km (for AI)
    RCS                     	= 0.5, -- Radar Cross Section m2
    IR_emission_coeff           = 2.0, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
    IR_emission_coeff_ab    	= 2.0, -- With afterburner
    wing_tip_pos     			= {-1.455, 0.03, 4.585}, -- wingtip coords for visual effects 
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation\
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords
	engines_count				= 1, -- Engines count
	engines_nozzles = {
		[1] = 
		{
			pos 		=  {-3.383,	.031, -.002}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 0.17018, -- AFB cone diameter
			exhaust_length_ab   = 9, -- lenght in m
			exhaust_length_ab_K = 0.5, -- AB animation
		}, -- end of [1]
	}, -- end of engines_nozzles
	crew_size	 = 1,
	crew_members = 
	{
		[1] = 
		{
			ejection_seat_name = "pilot+ejectionseat",
			drop_canopy_name = 12,
			pos =  {4,	1,	0},
			canopy_pos = {4,	1,	0},
		}, -- end of [1]
	}, -- end of crew_members

	fires_pos = 
		{
			[1] = 	{-2.117,	-0.9,	0},
			[2] = 	{-1.584,	0.176,	2.693},
			[3] = 	{-1.645,	0.213,	-2.182},
			[4] = 	{-0.82,	0.265,	2.774},
			[5] = 	{-0.82,	0.265,	-2.774},
			[6] = 	{-0.82,	0.255,	4.274},
			[7] = 	{-0.82,	0.255,	-4.274},
			[8] = 	{-6.548,	-0.248,	0},
			[9] = 	{-6.548,	-0.248,	0},
			[10] = 	{0.304,	-0.748,	0.442},
			[11] = 	{0.304,	-0.748,	-0.442},
		}, -- end of fires_pos
	
	
	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0, 
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0, 
	FlareChargeSize 		= 0,
	CMDS_Edit 				= true,
	chaff_flare_dispenser 	= {
		[1] = 
		{
			dir =  {0, -1, -1},
			pos =  {-3, -1, 2},
		}, -- end of [1]
		[2] = 
		{
			dir =  {0, -1, 1},
			pos =  {-3, -1, -2},
		}, -- end of [2]
	}, -- end of chaff_flare_dispenser

	--sensors
	
	detection_range_max		 = 60,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = {
		RWR = "Abstract RWR", -- RWR type
		RADAR = "N-019", -- Radar type
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	
	
	Guns = 
	SNO_MK_108({muzzle_pos_connector = "Gun_point_1",
			muzzle_pos 		  = {-1, -0.5, -1},
            effect_arg_number = 350,
            mixes = {{1, 3}},
            azimuth_initial = -0.034,
            elevation_initial = -0.298,
            supply_position = {0.284, 0.0, 0.0},
            drop_cartridge = 204,
			ejector_pos_connector = "eject 2",
			ejector_dir 		  = {0,5,0},
            effects = {
                {name = "FireEffect", arg = 433 , attenuation = 1.0 , light_pos = {0.5,0.5,0} , light_time = 0.1},
                {name = "SmokeEffect"}
            }
        }),
	
	Pylons =     {    },
	
	Tasks = {
        aircraft_task(PinpointStrike),
        aircraft_task(CAS),
        aircraft_task(AFAC),
		aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
    },	
	DefaultTask = aircraft_task(CAP),
	
	SFM_Data = {
		aerodynamics = -- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
		{
			Cy0			=	0.1,      -- zero AoA lift coefficient
			Mzalfa	    =	4.355,
			Mzalfadt	=	0.8, 
			kjx			=	1.5,    
			kjz 		=   0.001,
			Czbe		=	-0.014, -- coefficient, along Z axis (perpendicular), affects yaw, negative value means force orientation in FC coordinate system
			cx_gear		=	0.0,--0.12,    -- coefficient, drag, gear
			cx_flap		=	0.0,--0.095,   -- coefficient, drag, full flaps
			cy_flap		=	0.0,--0.24,    -- coefficient, normal force, lift, flaps
			cx_brk		=	0.0,--0.08,   -- coefficient, drag, breaks
			table_data  = 
			{
            --       M       Cx0       Cya      B        B4          Omxmax   Aldop      Cymax

                    {0.0,    0.013,    0.033,    0.074,    0.01,       0.5,     90,       1.2,    },
                    {0.1,    0.013,    0.067,    0.074,    0.01,       0.81,    90,       1.2,    },
                    {0.2,	 0.013,	   0.085,	 0.074,	   0.01,	   1.62,    45,	      1.2	  },
					{0.4,    0.0135,   0.120,    0.074,    0.01,       2.43,    30,       1.4,    },
                    {0.5,    0.0138,   0.120,    0.074,    0.11,       2.63,    30,       1.5,    },
                    {0.6,    0.0141,   0.120,    0.080,    0.11,       2.82,    30,       1.6,    },
                    {0.7,    0.0147,   0.131,    0.080,    0.11,       2.98,    30,       1.5,    },
                    {0.78,   0.0147,   0.131,    0.080,    0.11,       2.98,    30,       1.5,    },
                    {0.80,   0.0232,   0.131,    0.080,    0.36,       2.98,    30,       1.5,    },
                    {0.82,   0.0232,   0.131 ,   0.082,    0.36,       1.48,    25,       1.4,    }, -- Cx0
                    {0.85,   0.0232,   0.131,    0.082,    0.36,       0.60,    20,       1.4,    }, -- 0.030
                    {0.9,    0.0402,   0.076,    0.088,    0.36 ,      0.10,    15,       1.4,    }, -- 0.060
					{0.94,	 0.0402,   0.0737,	 0.125,    0.43,       0.006,	9.8,	  0.625   },
					{1.0,	 0.0598,   0.0735,	 0.15,     0.56,       0.004,	8,	      0.511   },
					{1.04,	 0.063,	   0.0744,	 0.23,     0.84,       0.002,	7.4,	  0.469   },
					{1.2,	 0.0642,   0.0760,	 0.26,     0.999,      0.001,   6.7,      0.425   },
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
            Nmg     =    12.0,    -- RPM at idle - Lowest throttle setting was only at 2000N
            MinRUD  =   .12,    -- Min state of the throttle
            MaxRUD  =    1,    -- Max state of the throttle
            MaksRUD =   .12001,    -- Military power state of the throttle
            ForsRUD =   .12002,    -- Afterburner state of the throttle
            typeng  =    1,    
			--[[
				E_TURBOJET = 0
				E_TURBOJET_AB = 1
				E_PISTON = 2
				E_TURBOPROP = 3
				E_TURBOFAN				= 4
				E_TURBOSHAFT = 5
			--]]
			
			hMaxEng	=	22, -- Max altitude for safe engine operation in km
            dcx_eng    =    0.0,    -- Engine drag coeficient
            cemax    =    0.037,    -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
            cefor    =    0.037,    -- not used for fuel calulation , only for AI routines to check flight time ( fuel calculation algorithm is built in )
            dpdh_m    =    2250,    --  altitude coefficient for max thrust
            dpdh_f    =    2250,    --  altitude coefficient for AB thrust
			extended = -- added new abilities for engine performance setup. thrust data now can be specified as 2d table by Mach number and altitude. thrust specific fuel consumption tuning added as well 
			{
				thrust_max = -- thrust interpolation table by altitude and mach number, 2d table
				 {
					 M 		 = {0,.1,0.3,0.5,0.7,0.8,0.9,1.1},
					 H		 = {0,250,4572,7620,10668,13716,16764,19812},
					 thrust	 = {-- M   0         0.1       0.3       0.5       0.7      0.8     0.9       1.1 
								 {   16903,  16903,  169030, 16903,  16903,  16903,  16903,  16903 },--H = 0 (sea level)
								 {   16903,  16903,  169030, 16903,  16903,  16903,  16903,  16903 },--H = 250 (sea level)
								 {   18018,  18018,  18018, 18018,  18018,  18018,  18018,  18018 },--H = 4572 (15kft)
								 {   18500,  18500,  18500, 18500,  18500,  18500,  18500,  18500 },--H = 7620 (25kft)
								 {   18830,  18830,  18830, 18830,  18830,  18830,  18830,  18830 },--H = 10668 (35kft)
								 {   19058,   19058,   19058,  19058,   19058,   19058,   19058,   19058 },--H = 13716 (45kft)
								 {   19207,   19207,   19207,  19207,   19207,   19207,   19207,   19207  },--H = 16764 (55kft)
								 {   19296,   19296,   19296,  19296,   19296,   19296,   19296,   19296  },--H = 19812 (65kft)
								 
					 },
				 },
				 
				 
				 thrust_afterburner = -- afterburning thrust interpolation table by altitude and mach number, 2d table
				 {
					 M 		 = {0,.1,0.3,0.5,0.7,0.8,0.9,1.1},
					 H		 = {0,250,4572,7620,10668,13716,16764,19812},
					 thrust	 = {-- M   0         0.1       0.3       0.5       0.7      0.8     0.9       1.1 
								 {   16903,  16903,  16903, 16903,  16903,  16903,  16903,  16903 },--H = 0 (sea level)
								 {   16903,  16903,  16903, 16903,  16903,  16903,  16903,  16903 },--H = 250 (sea level)
								 {   18018,  18018,  18018, 18018,  18018,  18018,  18018,  18018 },--H = 4572 (15kft)
								 {   18500,  18500,  18500, 18500,  18500,  18500,  18500,  18500 },--H = 7620 (25kft)
								 {   18830,  18830,  18830, 18830,  18830,  18830,  18830,  18830 },--H = 10668 (35kft)
								 {   19058,   19058,   19058,  19058,   19058,   19058,   19058,   19058 },--H = 13716 (45kft)
								 {   19207,   19207,   19207,  19207,   19207,   19207,   19207,   19207  },--H = 16764 (55kft)
								 {   19296,   19296,   19296,  19296,   19296,   19296,   19296,   19296  },--H = 19812 (65kft)
								 
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
	--damage , index meaning see in  Scripts\Aircrafts\_Common\Damage.lua
	Damage = {
				[0]		= {critical_damage = 5, args = {146}},
				[3]		= {critical_damage = 20,args = {65}}  ,
				[4]		= {critical_damage = 20, args = {150}},
				[5]		= {critical_damage = 20, args = {147}},
				[7]		= {critical_damage = 4, args = {249}} ,
				[9]		= {critical_damage = 3, args = {154}},
				[10]	= {critical_damage = 3, args = {153}},
				[11]	= {critical_damage = 3, args = {167}},
				[12]	= {critical_damage = 3, args = {161}},
				[15]	= {critical_damage = 5, args = {267}},
				[16]	= {critical_damage = 5, args = {266}},
				[23]	= {critical_damage = 8, args = {223}, deps_cells = {25}},
				[24]	= {critical_damage = 8, args = {213}, deps_cells = {26, 60}},
				[25]	= {critical_damage = 3, args = {226}},
				[26]	= {critical_damage = 3, args = {216}},
				[29]	= {critical_damage = 9, args = {224}, deps_cells = {31, 25, 23}},
				[30]	= {critical_damage = 9, args = {214}, deps_cells = {32, 26, 24, 60}},
				[31]	= {critical_damage = 4, args = {229}},
				[32]	= {critical_damage = 4, args = {219}},
				[35]	= {critical_damage = 10, args = {225}, deps_cells = {29, 31, 25, 23}},
				[36]	= {critical_damage = 10, args = {215}, deps_cells = {30, 32, 26, 24, 60}} ,
				[37]	= {critical_damage = 4, args = {227}},
				[38]	= {critical_damage = 4, args = {217}},
				[39]	= {critical_damage = 7,	args = {244}, deps_cells = {53}},
				[40]	= {critical_damage = 7, args = {241}, deps_cells = {54}},
				[45]	= {critical_damage = 9, args = {235}, deps_cells = {39, 51, 53}},
				[46]	= {critical_damage = 9, args = {233}, deps_cells = {40, 52, 54}},
				[51]	= {critical_damage = 3, args = {239}},
				[52]	= {critical_damage = 3, args = {237}},
				[53]	= {critical_damage = 3, args = {248}},
				[54]	= {critical_damage = 3, args = {247}},
				[55]	= {critical_damage = 20, args = {81}, deps_cells = {39, 40, 45, 46, 51, 52, 53, 54}},
				[59]	= {critical_damage = 5, args = {148}},
				[60]	= {critical_damage = 1, args = {144}},

				[83]	= {critical_damage = 3, args = {134}} ,-- nose wheel
				[84]	= {critical_damage = 3, args = {136}}, -- left wheel
				[85]	= {critical_damage = 3, args = {135}} ,-- right wheel
	},
	
	DamageParts = 
	{  
--DAMAGEOFF		[1] = "ME-163B-1a-part-wing-R", -- wing R
--DAMAGEOFF		[2] = "ME-163B-1a-part-wing-L", -- wing L
--DAMAGEOFF		[3] = "ME-163B-1a-part-nose", -- nose
--DAMAGEOFF		[4] = "ME-163B-1a-part-tail", -- tail
	},
	
	lights_data = {
	typename = "collection",
	lights = {
    [1] = { typename = "collection",
						lights = {-- Left Anticollision Light
								  {typename = "natostrobelight",
								   connector = "WHITE_BEACON L",
								   argument_1 = 195,
								   period = 1.2,
								   phase_shift = 0
								  },
								  -- Right Anticollision Light
								  {typename = "natostrobelight",
								   connector = "WHITE_BEACON R",
								   argument_1 = 196,
								   period = 1.2,
								   phase_shift = 0
								  },
								  -- Tail Anticollision Light
								  {typename = "natostrobelight",
								   connector = "BANO_0_BACK",
								   argument_1 = 192,
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
    [3]	= {	typename = "collection",
						lights = {-- Left Position Light (red)
								  {typename = "omnilight",
								   connector = "BANO_1",
								   color = {0.99, 0.11, 0.3},
								   pos_correction  = {0, 0, -0.2},
								   argument  = 190
								  },
								  -- Right Position Light (green)
								  {typename = "omnilight",
								   connector = "BANO_2",
								   color = {0, 0.894, 0.6},
								   pos_correction = {0, 0, 0.2},
								   argument  = 191
								  },
								  -- Tail Position Light (white)
								  {typename = "omnilight",
								   connector = "BANO_0_BACK",
								   color = {1, 1, 1},
								   pos_correction  = {0, 0, 0},
								   argument  = 203
								  }}
									},
    [4] = {	typename = "collection",
				lights = {{typename = "collection",
						   lights = {
									 -- Top Formation Light (white)
									 {typename = "omnilight",
									  connector = "BANO_0_TOP",
									  color = {1, 1, 1},
									 },
									 {typename  = "argumentlight", argument = 202},
									 -- Bottom Formation Light (white)
									 {typename = "omnilight",
									  connector = "BANO_0_BOTTOM",
									  color = {1, 1, 1},
									 },
									 {typename  = "argumentlight", argument = 201},
									}
							},
							-- Tail formation lights
							{typename = "collection",
								lights = {{
										-- Right Tail Formation Light
										typename = "spotlight",
										connector = "BANO_W_HR",
										color = {1.0, 1.0, 1.0},
										intensity_max = 6,
										angle_max = 0.65,
										argument = 205,
										dont_change_color = false,
										angle_change_rate = 0,
										pos_correction = {0.0, 0.0, 0.1},
										dir_correction = {azimuth = math.rad(-3), elevation = math.rad(9)},
									   },
									   {
										-- Left Tail Formation Light
										typename = "spotlight",
										connector = "BANO_W_HL",
										color = {1.0, 1.0, 1.0},
										intensity_max = 6,
										angle_max = 0.65,
										argument = 204,
										dont_change_color = false,
										angle_change_rate = 0,
										pos_correction = {0.0, 0.0, -0.1},
										dir_correction = {azimuth = math.rad(-3), elevation = math.rad(-9)},
									   }
									},
							},
							-- Electroluminescent formation lights
							{typename  = "argumentlight", argument = 200},
						 }
									},
	[5]	= {typename = "collection",
			lights = {
						{typename = "collection",
						lights = {{
								-- Right Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 6.0,
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
								intensity_max = 6.0,
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
								intensity_max = 6.0, angle_max = 0.45,
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
								intensity_max = 6.0,
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
						typename = "omnilight", position  = {6.5, 0.4, 0}, color = {1, 1, 1}
					}
				  },
			}
		}
	},
}

add_aircraft(ME_163B)
