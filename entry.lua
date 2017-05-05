declare_plugin("ME-163B",
{
installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
displayName  = _("ME-163B"),
version		 = "0.1.0",		 
state		 = "installed",
info		 = _("The ME-163B- was a rocket propelled German jet fighter."),

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
		["ME-163B"]     = current_mod_path .. '/Input',
	},
})
---------------------------------------------------------------------------------------
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures")
mount_vfs_texture_path  (current_mod_path.."/Cockpit/Textures")
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shapes")
mount_vfs_sound_path    (current_mod_path.."/Sounds")

make_flyable('ME-163B'	, current_mod_path..'/Cockpit/Scripts/',nil, current_mod_path..'/comm.lua')

dofile(current_mod_path..'/Weapons/SNO_Weapons.lua')
dofile(current_mod_path..'/ME-163B-1a.lua')

plugin_done()-- finish declaration , clear temporal data
