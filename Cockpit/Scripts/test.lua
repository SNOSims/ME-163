local dev = GetSelf() 

local update_time_step = 0.1 --- How often the device updates
make_default_activity(update_time_step)
local sensor_data = get_base_data() --- Lets get some data!
local Salute = 1234 --- The number above

if command == Salute then
--- Your code goes here
--- for example: 
	set_aircraft_draw_argument_value(757,0) --- Sets draw argument 500 to value 1
--- local YourVar = get_aircraft_draw_argument_value(501) --- Gets value of draw argument 501

end
end
function update() 
-- Code that does something every update goes here,
end



