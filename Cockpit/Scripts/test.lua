local dev = GetSelf() 

make_default_activity(update_time_step)
local sensor_data = get_base_data() --- Lets get some data!
local Salute = 1234 --- The number above

update_time_step = 0.01666        --0.0166 --once every 1/60 sec
make_default_activity(update_time_step) 
function SetCommand(command,value)    
    if command == Salute then
        print_message_to_user(string.format(" SetCom: C %i   V%.2f",command,value))    
    end
end


