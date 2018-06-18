-- [[ Sounds IDs 0 ... n ]]
local count = -1
local function counter()
    count = count + 1
    return count
end



SOUND_NOSOUND = -2
SOUND_DEFAULT = -1
SOUND_ROTARY = counter()
SOUND_CB_ON = counter()
SOUND_CB_RESET = counter()
SOUND_CHOPPER_SWITCH = counter()
SOUND_METALLIC_BUTTON_ON = counter()
SOUND_METALLIC_BUTTON_OFF = counter()
SOUND_BUZZER_HORN = counter()
SOUND_HANDLE_PULL = counter()
SOUND_HANDLE_RELEASE = counter()
SOUND_MINOR_HANDLE_PULL = counter()
SOUND_MINOR_HANDLE_RELEASE = SOUND_MINOR_HANDLE_PULL
SOUND_COCKPIT_HANDLE_SPECIAL = counter()
SOUND_COCKPIT_CANOPY_OPEN = counter()
SOUND_COCKPIT_CANOPY_CLOSE = counter()
SOUND_PINION = counter()
SOUND_METALLIC_TAB = counter()
SOUND_PUMP_UP = counter()
SOUND_PUMP_DOWN = counter()
SOUND_REVI_FOLD = counter()
SOUND_REVI_UNFOLD = counter()
SOUND_REVI_SCREEN_UP = counter()
SOUND_REVI_SCREEN_DOWN = counter()
SOUND_QUAD_LEVER_RIGHT = counter()
SOUND_QUAD_LEVER_LEFT = counter()
SOUND_FLARE_GUN = counter()
