dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

--------------
-- main
--------------
function item_pickup(item_entity_id, pickupper_entity_id, item_name)
  local player_entity_id = getPlayerEntity()
  WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_TEMPLE_ITEMS(), function()
    GameEntityPlaySound(player_entity_id, "player/pickup/refresher")
  end)
end
