--[[
sounds ids 0 ... n
]]

local count = -1
local function counter()
	count = count + 1
	return count
end
SOUND_NOSOUND = -2
SOUND_C_BREAKER_ON   = counter()
SOUND_C_BREAKER_OFF  = counter()
SOUND_FUEL_CRANK  	 = counter()
SOUND_LEVER_UP 	 	 = counter()
SOUND_LEVER_DOWN  	 = counter()
SOUND_MAGNETO 	 	 = counter()
SOUND_COVER_OPEN 	 = counter()
SOUND_COVER_CLOSE 	 = counter()
SOUND_BTN			 = counter()
SOUND_RED_BTN_ON	 = counter()
SOUND_RED_BTN_OFF	 = counter()
SOUND_START_COVER	 = counter()
SOUND_BTN_COVER		 = counter()
SOUND_PRIMER_UP	 	 = counter()
SOUND_PRIMER_DOWN	 = counter()
