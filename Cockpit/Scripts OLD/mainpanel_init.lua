shape               = "Cockpit_ME-163B" 

draw_pilot                   = false

external_model_canopy_arg	 = 38

mirrors_present = false;


mirrors_draw                    = CreateGauge()
mirrors_draw.arg_number         = 183
mirrors_draw.input              = {0,1}
mirrors_draw.output             = {1,0}
mirrors_draw.controller         = controllers.mirrors_draw

args_initial_state = {}

if not LockOn_Options.cockpit.mirrors then
   args_initial_state[183] = 1.0
end

pilot_draw                      = CreateGauge()
pilot_draw.arg_number           = 540
pilot_draw.input                = {0.0, 1.0}
pilot_draw.output               = {0.0, 1.0}
pilot_draw.controller           = controllers.pilot_draw

need_to_be_closed = true -- close lua state after initialization 

dofile(LockOn_Options.common_script_path.."tools.lua")