dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/global_prefixes.lua")
dofile_once("mods/akanechan_voice/files/scripts/lib/wait_frame.lua")

local function playDamageSound(player_entity_id, damage)

  if damage < 20 then
    GameEntityPlaySound( player_entity_id, "player/take_small_damage" )
  else
    GameEntityPlaySound( player_entity_id, "player/take_big_damage" )
  end
end

--------------
-- main
--------------
function damage_received( damage, desc, entity_who_caused, is_fatal )
  local player_entity_id = GetUpdatedEntityID()

  if is_fatal then
    GameEntityPlaySound( player_entity_id, "player/dead" )
  else
    WaitFrame:tryCall(player_entity_id, GLOBAL_PREFIXES:damage_received(), function()
      playDamageSound(player_entity_id, damage)
    end)
  end
end



-- function damage_received( damage, desc, entity_who_caused, is_fatal )
--   local player_entity_id = GetUpdatedEntityID()
--   local current_frame = GameGetFrameNum()
--   local dameged_frame = getInternalVariableValue(player_entity_id, "akanechan_voice.damege_received_frame", "value_int")

--   -- damaged_frame初期動作
--   if dameged_frame == nil then
--     dameged_frame = current_frame
--     addNewInternalVariable(player_entity_id, "akanechan_voice.damege_received_frame", "value_int", dameged_frame)
--     playDamageSound(player_entity_id, damage)
--   end

--   if is_fatal then
--     GameEntityPlaySound( player_entity_id, "dead" )
--   else
--     if current_frame - dameged_frame > 120 then
--       setInternalVariableValue(player_entity_id, "akanechan_voice.damege_received_frame", "value_int", current_frame)
--       playDamageSound(player_entity_id, damage)
--     end
--   end
-- end
