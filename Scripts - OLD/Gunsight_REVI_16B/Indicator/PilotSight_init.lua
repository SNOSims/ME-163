dofile(LockOn_Options.common_script_path.."devices_defs.lua")

indicator_type = indicator_types.COLLIMATOR
purposes 	 = {render_purpose.GENERAL,render_purpose.HUD_ONLY_VIEW}

dynamically_update_geometry = true

collimator_default_distance_factor =
{
	0.6,0,0
}
	

-------PAGE IDs-------
id_Page =
{
	PAGE_OFF	= 0,
	PAGE_ON		= 1,
}

id_pagesubset =
{
	PILOT_SIGHT_BASE	= 0,
	PILOT_SIGHT_COMMON	= 1,
}

page_subsets = {}
page_subsets[id_pagesubset.PILOT_SIGHT_BASE] = LockOn_Options.script_path.."Gunsight_REVI_16B/Indicator/PilotSight_base_page.lua"
page_subsets[id_pagesubset.PILOT_SIGHT_COMMON] = LockOn_Options.script_path.."Gunsight_REVI_16B/Indicator/PilotSight_page.lua"

pages = {}

pages[id_Page.PAGE_OFF]	=	{}
pages[id_Page.PAGE_ON]	=	{id_pagesubset.PILOT_SIGHT_BASE, id_pagesubset.PILOT_SIGHT_COMMON}

init_pageID		= id_Page.PAGE_OFF

-- master modes
PILOT_SIGHT_OFF				= 0
PILOT_SIGHT_ON				= 1 

------------------------------------
pages_by_mode                 = {}

clear_mode_table(pages_by_mode,2,0,0)

function get_page_by_mode(master,L2,L3,L4)
	return get_page_by_mode_global(pages_by_mode,init_pageID,master,L2,L3,L4)
end

pages_by_mode[PILOT_SIGHT_OFF][0][0][0]		  = id_Page.PAGE_OFF
pages_by_mode[PILOT_SIGHT_ON][0][0][0]		  = id_Page.PAGE_ON

opacity_sensitive_materials = 
{
"INDICATION_K14",
}