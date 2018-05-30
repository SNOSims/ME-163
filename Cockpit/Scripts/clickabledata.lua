dofile(LockOn_Options.script_path.."clickable_defs.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")

local gettext = require("i_18n")
_ = gettext.translate


elements = {}


--Joystick
elements["PNT_053"] = default_animated_lever(_("Gun Safety"), devices.TEST, device_commands.Button_53, 751, 3.0)
elements["PNT_054"] = default_button(_("Trigger"), devices.TEST, device_commands.Button_54, 752)

--Radio
elements["PNT_077"] = multiposition_switch(_("Frequency"), devices.VHF_RADIO, device_commands.Button_77, 775, 4, 0.1, false)

--Right Panel

---Buttons
elements["PNT_060"] 	= default_button("Button 1", devices.TEST, device_commands.Button_60,757)

--Climate controls
elements["PNT_029"] 	= default_axis(_("Oxygen Valve"),devices.TEST, device_commands.Button_29, 728, 1, -0.1, false, false)

--Flight Control


--Engine control
 --elements["THTL"] = default_movable_axis(_("Cockpit.Bf109K4.throttle"), devices.ENGINE_CONTROLS, device_commands.Button_3, 84, 0.0, 0.1, true, false)


------------------------------------------------------------------
for i,o in pairs(elements) do
	if  o.class[1] == class_type.TUMB or 
	   (o.class[2]  and o.class[2] == class_type.TUMB) or
	   (o.class[3]  and o.class[3] == class_type.TUMB)  then
	   o.updatable = true
	   o.use_OBB   = true
	end
end