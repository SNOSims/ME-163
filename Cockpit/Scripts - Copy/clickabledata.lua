dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."config.lua")
dofile(LockOn_Options.script_path.."sounds.lua")

local gettext = require("i_18n")
_ = gettext.translate

cursor_mode = 
{ 
    CUMODE_CLICKABLE = 0,
    CUMODE_CLICKABLE_AND_CAMERA  = 1,
    CUMODE_CAMERA = 2,
};

clickable_mode_initial_status  = cursor_mode.CUMODE_CLICKABLE

function default_button(hint_,device_,command_,arg_,arg_val_,arg_lim_)

	local   arg_val_ = arg_val_ or 1
	local   arg_lim_ = arg_lim_ or {0,1}
	
	return  {	
				class 				= {class_type.BTN},
				hint  				= hint_,
				device 				= device_,
				action 				= {command_},
				stop_action 		= {command_},
				arg 				= {arg_},
				arg_value			= {arg_val_}, 
				arg_lim 			= {arg_lim_},
				use_release_message = {true}
			}
end

function default_2_position_tumb(hint_, device_, command_, arg_)
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {1,-1}, 
				arg_lim   	= {{0,1},{0,1}},
				updatable 	= true, 
				use_OBB 	= true
			}
end

function default_3_position_tumb(hint_,device_,command_,arg_,cycled_,inversed_)
	local cycled = true
	
	
	local val =  1
	if inversed_ then
	      val = -1
	end
	if cycled_ ~= nil then
	   cycled = cycled_
	end
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-val,val}, 
				arg_lim   	= {{-1,1},{-1,1}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle       = cycled
			}
end

function default_springloaded_3pos_switch(hint_, device_, command1_, command2_, value1_, value2_, value3_, arg_)
--[[ command1_ - tumbler's command,
	 command2_ - button's command
	 value1_ - tumbler's position
	 value2_ - center position
	 value3_ - button's position
]]
	return	{
				class 		= {class_type.TUMB, class_type.TUMB},
				hint 		= hint_, 
				device 		= device_,
				action  	= {command1_ ,	command2_}, 
				stop_action = {command2_, 	command2_}, 
				arg 		= {arg_,		arg_},
				stop_value 	= {value2_,			value2_},
				arg_value 	= {value2_, 	value3_},
				arg_lim 	= {{value1_, value2_}, {value2_, value3_}}, 
				use_release_message = {true, true}
			}
end

function default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_, cycled_)
	
	local default = default_ or 1
	local gain = gain_ or 0.1
	local updatable = updatable_ or false
	local relative  = relative_ or false
	local cycled = cycled_ or false
	
	return  {	
				class 		= {class_type.LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {default}, 
				arg_lim   	= {{0,1}},
				updatable 	= updatable, 
				use_OBB 	= true,
				gain		= {gain},
				relative    = {relative}, 
				cycle       = cycled				
			}
end

function default_movable_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_, arg_lim_)
	
	local default = default_ or 1
	local gain = gain_ or 0.1
	local updatable = updatable_ or false
	local relative  = relative_ or false
	local arg_lim  = arg_lim_ or {0,1}
	
	return  {	
				class 		= {class_type.MOVABLE_LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {default}, 
				arg_lim   	= {arg_lim},
				updatable 	= updatable, 
				use_OBB 	= true,
				gain		= {gain},
				relative    = {relative}, 
				cycle		= false
			}
end

function default_axis_limited(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_, arg_lim_)
	
	local relative = false
	local default = default_ or 0
	local updatable = updatable_ or false
	if relative_ ~= nil then
		relative = relative_
	end

	local gain = gain_ or 0.1
	return  {	
				class 		= {class_type.LEV},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_},
				arg 	  	= {arg_},
				arg_value 	= {default}, 
				arg_lim   	= {arg_lim_},
				updatable 	= updatable, 
				use_OBB 	= false,
				gain		= {gain},
				relative    = {relative}, 
				cycle     	= false, 				
			}
end


function multiposition_switch(hint_,device_,command_,arg_,count_,delta_,inversed_, min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	
	local inversed = 1
	if	inversed_ then
		inversed = -1
	end
	
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-delta_ * inversed,delta_ * inversed}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle 		= false
			}
end

function multiposition_switch_limited(hint_,device_,command_,arg_,count_,delta_,inversed_,min_)
    local min_   = min_ or 0
	local delta_ = delta_ or 0.5
	
	local inversed = 1
	if	inversed_ then
		inversed = -1
	end
	
	return  {	
				class 		= {class_type.TUMB,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-delta_ * inversed,delta_ * inversed}, 
				arg_lim   	= {{min_, min_ + delta_ * (count_ -1)},
							   {min_, min_ + delta_ * (count_ -1)}},
				updatable 	= true, 
				use_OBB 	= true,
				cycle     	= false, 
			}
end

function default_button_axis(hint_, device_,command_1, command_2, arg_1, arg_2, limit_1, limit_2)
	local limit_1_   = limit_1 or 1.0
	local limit_2_   = limit_2 or 1.0
return {
			class		=	{class_type.BTN, class_type.LEV},
			hint		=	hint_,
			device		=	device_,
			action		=	{command_1, command_2},
			stop_action =   {command_1, 0},
			arg			=	{arg_1, arg_2},
			arg_value	= 	{1, 0.5},
			arg_lim		= 	{{0, limit_1_}, {0,limit_2_}},
			gain = {0, 0.1},
			relative	= 	{false, false},
			updatable 	= 	true, 
			use_OBB 	= 	true,
			use_release_message = {true, false}
	}
end

function default_animated_lever(hint_, device_, command_, arg_, animation_speed_,arg_lim_,arg_value_)

local arg_lim = arg_lim_ or {0.0,1.0}
local arg_value = arg_value_ or 1.0
return  {	
	class  = {class_type.TUMB, class_type.TUMB},
	hint   	= hint_, 
	device 	= device_,
	action 	= {command_, command_},
	arg 		= {arg_, arg_},
	arg_value 	= {arg_value, -arg_value},
	arg_lim 	= {arg_lim, arg_lim},
	updatable  = true, 
	gain 		= {0.1, 0.1},
	animated 	= {true, true},
	animation_speed = {animation_speed_, animation_speed_}
}
end

function default_button_tumb(hint_, device_, command1_, command2_, arg_)
	return  {	
				class 		= {class_type.BTN,class_type.TUMB},
				hint  		= hint_,
				device 		= device_,
				action 		= {command1_,command2_},
				stop_action = {command1_,0},
				arg 	  	= {arg_,arg_},
				arg_value 	= {-1,1}, 
				arg_lim   	= {{-1,0},{0,1}},
				updatable 	= true, 
				use_OBB 	= true,
				use_release_message = {true,false}
			}
end

local cb_start_id = device_commands.Button_5;
local cb_end_id = device_commands.Button_18;

function add_circuit_breaker_gr(hint_on_,hint_off_,device_,arg_on_, arg_off_)

elements["pntr_"..arg_on_] = {	
				class 				= {class_type.BTN},
				hint  				= hint_on_,
				device 				= device_,
				action 				= {cb_start_id},
				stop_action 		= {cb_start_id},
				arg 				= {arg_on_},
				arg_value			= {1.0},
				arg_lim 			= {0,1},
				sound 				= {{SOUND_C_BREAKER_ON,SOUND_C_BREAKER_OFF}},
				use_release_message = {false}
			}
			
elements["pntr_"..arg_off_] = {	
				class 				= {class_type.BTN},
				hint  				= hint_off_,
				device 				= device_,
				action 				= {cb_end_id},
				stop_action 		= {cb_end_id},
				arg 				= {arg_off_},
				arg_value			= {1.0},
				arg_lim 			= {0,1},
				sound 				= {{SOUND_NOSOUND,SOUND_NOSOUND}},
				use_release_message = {false}
			}
			
cb_start_id = cb_start_id + 1
cb_end_id = cb_end_id + 1

end

elements = {}

elements["PNT_059"] = default_2_position_tumb(_("Button 1"),devices.ENGINE_SYSTEM, device_commands.Button_59,757)

------------------------------------------------------------------					 
for i,o in pairs(elements) do
	if  o.class[1] == class_type.TUMB or 
	   (o.class[2]  and o.class[2] == class_type.TUMB) or
	   (o.class[3]  and o.class[3] == class_type.TUMB)  then
	   o.updatable = true
	   o.use_OBB   = true
	end
end