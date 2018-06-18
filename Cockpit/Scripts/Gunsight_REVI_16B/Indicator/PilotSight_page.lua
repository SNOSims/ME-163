dofile(LockOn_Options.script_path.."Gunsight_REVI_16B/Indicator/PilotSight_definitions.lua")
dbgDraw = true

--local half_width = 86
local half_width = 153

reticle					= CreateElement "ceTexPoly"
reticle.name			= "reticle"
reticle.vertices		= {{-half_width,half_width}, 
						   { half_width,half_width},
						   { half_width,-half_width},
						   {-half_width,-half_width}}
reticle.indices			= {0,1,2,0,2,3}												
reticle.material		 = "INDICATION_K14"
reticle.tex_coords 		= {{0,0}, 
						   {1,0},
						   {1,1},
						   {0,1}}
							

reticle.init_pos		= {0,ZSL,0}
reticle.h_clip_relation	= h_clip_relations.COMPARE
reticle.level			= HUD_DEFAULT_LEVEL
reticle.additive_alpha	= true
reticle.collimated		= true
reticle.use_mipfilter	= use_mipfilter
Add(reticle)


--[[
reticle2 = Copy(reticle)
reticle2.primitivetype = "lines"
reticle2.material = "DBG_RED"
reticle2.h_clip_relation	= 0
reticle2.indices = {0,1,2,0,2,3,0,3,1,2}
reticle2.additive_alpha	= false	
Add(reticle2)
]]--


flag_draw_grid = false

-- reference grid
if flag_draw_grid then

	local circle50 = CreateElement "ceMeshPoly"
        circle50.init_pos		= {0,ZSL,0}
		circle50.primitivetype = "triangles"
		set_circle(circle50, 50, 49)
		circle50.material   = "DBG_GREEN"
		circle50.collimated = true
		circle50.visible = true
		Add(circle50)
		
	local circle20 = CreateElement "ceMeshPoly"
        circle20.init_pos		= {0,ZSL,0}
		circle20.primitivetype = "triangles"
		set_circle(circle20, 20, 19)
		circle20.material   = "DBG_GREEN"
		circle20.collimated = true
		circle20.visible = true
		Add(circle20)
	
	local circle38 = CreateElement "ceMeshPoly"
        circle38.init_pos		= {0,ZSL,0}
		circle38.primitivetype = "triangles"
		set_circle(circle38, 38, 37)
		circle38.material   = "DBG_GREEN"
		circle38.collimated = true
		circle38.visible = true
		Add(circle38)
        
	local circle56 = CreateElement "ceMeshPoly"
        circle56.init_pos		= {0,ZSL,0}
		circle56.primitivetype = "triangles"
		set_circle(circle56, 56, 55)
		circle56.material   = "DBG_GREEN"
		circle56.collimated = true
		circle56.visible = true
		Add(circle56)
        
	local circle74 = CreateElement "ceMeshPoly"
        circle74.init_pos		= {0,ZSL,0}
		circle74.primitivetype = "triangles"
		set_circle(circle74, 74, 73)
		circle74.material   = "DBG_GREEN"
		circle74.collimated = true
		circle74.visible = true
		Add(circle74)
end