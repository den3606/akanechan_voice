dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
local function playPlayerPickupSound(player_entity_id)
  GameEntityPlaySound(player_entity_id, "player/pickup/wand")
end

local function playEnemyPickupSound(player_entity_id)
  GameEntityPlaySound(player_entity_id, "enemy/pickup/wand")
end

local function playBuyProductSound(player_entity_id)
  GameEntityPlaySound(player_entity_id, "player/buy/temple_products")
end


--------------
-- main
--------------
function item_pickup(item_entity_id, pickupper_entity_id, item_name)
  print("pickup wand")
  local player_entity_id = getPlayerEntity()

  if getInternalVariableValue(player_entity_id, AKANECHAN:IS_PICKED_WAND(), "value_bool") == nil then
    addNewInternalVariable(player_entity_id, AKANECHAN:IS_PICKED_WAND(), "value_bool", true)
  else
    setInternalVariableValue(player_entity_id, AKANECHAN:IS_PICKED_WAND(), "value_bool", true)
  end

  if player_entity_id == pickupper_entity_id then
    local is_shop_item = (EntityGetComponent(item_entity_id, "ItemCostComponent", "shop_cost") ~= nil)

    if is_shop_item then
      WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_WAND(), function()
        playBuyProductSound(player_entity_id)
      end, 60 * 1)
    else
      WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_WAND(), function()
        playPlayerPickupSound(player_entity_id)
      end, 60 * 10)
    end
  else
    local x, y = EntityGetTransform(player_entity_id)
    local enemies = EntityGetInRadiusWithTag(x, y, 120, "enemy")
    for _, enemy_entity_id in ipairs(enemies) do
      if (enemy_entity_id == pickupper_entity_id) then
        WaitFrame:tryCall(player_entity_id, AKANECHAN:PICKED_WAND(), function()
          playEnemyPickupSound(player_entity_id)
        end, 600)
      end
    end
  end
end
