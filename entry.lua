local self_ID = "ME-163B by Komet Simulations"

declare_plugin(self_ID,
{
displayName  = _("ME-163B"),
developerName   =   "Komet Simulations",

installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
fileMenuName = _("ME-163B"),
--update_id    = "KOMET_SIMULATIONS_M-163B", -- request from ED.
version		 = "0.1.1",		 
state		 = "installed",
info		 = _("The Messerschmitt Me 163 Komet, designed by Alexander Lippisch, was a German rocket-powered fighter aircraft. It is the only rocket-powered fighter aircraft ever to have been operational and the first piloted aircraft of any type to exceed 1000 km/h (621 mph) in level flight. Its design was revolutionary and its performance unprecedented."),
encyclopedia_path = current_mod_path..'/Encyclopedia', -- Is redundant?

--binaries   =
--{
--	'F16DemoFM',
--},

Skins	= 
	{
		{
			name	= "ME-163B",
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name		= _("ME-163B"),
			dir			= "Missions",
			CLSID		= "{CLSID5456456346CLSID}",	
		},
	},
LogBook =
	{
		{
			name		= _("ME-163B"),
			type		= "ME-163B",
		},
	},	
InputProfiles =
	{
		["ME-163B"]     = current_mod_path .. '/Input/',
	},
})
---------------------------------------------------------------------------------------
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures") -- Cockpit Textures
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shape") -- Cockpit Model
--mount_vfs_sound_path  (current_mod_path.."/Sounds") --This is obselete now
mount_vfs_model_path    (current_mod_path.."/Shapes")

dofile(current_mod_path..'/Weapons/Komet_Weapons.lua') 
dofile(current_mod_path..'/ME-163B.lua')


--make_flyable('ME-163B', current_mod_path..'/Cockpit/Scripts/', FM, current_mod_path..'Comm/comm.lua')
make_flyable('ME-163B', current_mod_path..'/Cockpit/Scripts/', nil, current_mod_path..'Comm/comm.lua')
dofile(current_mod_path.."/Views.lua")
make_view_settings('ME-163B', ViewSettings, SnapViews)

plugin_done()-- finish declaration , clear temporal data
