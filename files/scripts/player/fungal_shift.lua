dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

--------------
-- main
--------------
local function fungal_shift_voice()
  local akanechan_voice = SoundPlayer:seachSoundPlayer(getPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
  SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/fungal_shift_voice.xml")
end

local _fungal_shift = fungal_shift
function fungal_shift(entity, x, y, debug_no_limits)
  local parent = EntityGetParent(entity)
  if parent ~= 0 then
    entity = parent
  end

  local frame = GameGetFrameNum()
  local last_frame = tonumber(GlobalsGetValue("fungal_shift_last_frame", "-1000000"))
  if frame < last_frame + 60 * 60 * 5 and not debug_no_limits then
    return -- long cooldown
  end

  local comp_worldstate = EntityGetFirstComponent(GameGetWorldStateEntity(), "WorldStateComponent")
  if (comp_worldstate ~= nil and ComponentGetValue2(comp_worldstate, "EVERYTHING_TO_GOLD")) then
    return -- do nothing in case everything is gold
  end

  local iter = tonumber(GlobalsGetValue("fungal_shift_iteration", "0"))
  GlobalsSetValue("fungal_shift_iteration", tostring(iter + 1))
  if iter > 20 and not debug_no_limits then
    return
  end

  _fungal_shift(entity, x, y, debug_no_limits)
  fungal_shift_voice()
end
