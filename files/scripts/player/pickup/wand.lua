dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

local function playEnemyPickupSound(player_entity_id)
  GameEntityPlaySound(player_entity_id, "enemy/pickup/wand")
end

--------------
-- main
--------------
function item_pickup(item_entity_id, pickupper_entity_id, item_name)
  local player_entity_id = GetPlayerEntity()
  local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)

  if player_entity_id == pickupper_entity_id then
    local is_shop_item = (EntityGetComponent(item_entity_id, "ItemCostComponent", "shop_cost") ~= nil)
    if is_shop_item then
      SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/pickup/shop_wand.xml")
    else
      WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_WAND(), function()
        SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/pickup/wand.xml")
      end, 60 * 2)
    end
  else
    local x, y = EntityGetTransform(player_entity_id)
    local enemies = EntityGetInRadiusWithTag(x, y, 120, "enemy")
    for _, enemy_entity_id in ipairs(enemies) do
      if enemy_entity_id == pickupper_entity_id then
        WaitFrame:tryCall(player_entity_id, AKANECHAN:ENEMY_PICKED_WAND(), function()
          SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enemy/pickup/wand.xml")
        end, 60 * 2)
      end
    end
  end
end
