dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

local function playDamageSound(player_entity_id, damage)

  if damage < 0.8 then
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

