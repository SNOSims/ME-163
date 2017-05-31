local dev = GetSelf()

local update_time_step = 0.02
make_default_activity(update_time_step) -- enables call to update

local sensor_data = get_base_data()



function post_initialize()
	print("ext. anim. post_initialize called")

	for key,value in pairs(sensor_data) do
	    print("found member " .. key);
	end
end



function update()
	local wow = sensor_data.getWOW_LeftMainLandingGear()
	--Test set anim argument

	local ROLL_STATE = sensor_data:getStickPitchPosition() / 100
	set_aircraft_draw_argument_value(11, ROLL_STATE) -- right aileron
	set_aircraft_draw_argument_value(12, -ROLL_STATE) -- left aileron
	

	local PITCH_STATE = sensor_data:getStickRollPosition() / 100
	set_aircraft_draw_argument_value(15, PITCH_STATE) -- right elevator
	set_aircraft_draw_argument_value(16, PITCH_STATE) -- left elevator

	local RUDDER_STATE = sensor_data:getRudderPosition() / 100
	set_aircraft_draw_argument_value(17, -RUDDER_STATE)
	
	if wow > 0 then
        set_aircraft_draw_argument_value(2, -RUDDER_STATE*0.333) -- limit visual nosewheel deflection to 30 degrees
    else
        set_aircraft_draw_argument_value(2, 0)  -- otherwise center it
    end
    
	--print(ROLL_STATE)
	--print(PITCH_STATE)
end

need_to_be_closed = false -- close lua state after initialization
