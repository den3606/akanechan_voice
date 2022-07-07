dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

local BIG_DAMAGE = 0.8 -- 20

local function playDamageSound(player_entity_id, damage)
  local is_low_helth = math.floor(getPlayerHealth() / getPlayerMaxHealth() * 100) <= 20
  p(math.floor(getPlayerHealth() / getPlayerMaxHealth() * 100))
  if is_low_helth then
    p("low_helth")
    WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), function()
      GameEntityPlaySound(player_entity_id, "player/take_damage/low_helth")
    end)
  elseif damage < BIG_DAMAGE then
    p("mild")
    WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), function()
      GameEntityPlaySound(player_entity_id, "player/take_damage/mild")
    end)
  else
    p("heavy")
    WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), function()
      GameEntityPlaySound(player_entity_id, "player/take_damage/heavy")
    end)
  end
end



local function playFireDamageSound(player_entity_id)
  WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_FIRE_DAMAGE(), function()
    GameEntityPlaySound(player_entity_id, "player/take_damage/on_fire")
  end, 60 * 3)
  WaitFrame:updateWaitFrame(player_entity_id, AKANECHAN:RECEIVED_FIRE_DAMAGE(), 60 * 3)
  WaitFrame:updateWaitFrame(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), 60 * 2)
end

--------------
-- main
--------------
function damage_received(damage, desc, entity_who_caused, is_fatal)
  local player_entity_id = GetUpdatedEntityID()
  if is_fatal then
    GameEntityPlaySound(player_entity_id, "player/dead")
  else
    for _, damage_model in ipairs(EntityGetComponent(player_entity_id, "DamageModelComponent") or {}) do
      if ComponentGetValue2(damage_model, "is_on_fire") then
        if damage < BIG_DAMAGE then
          playFireDamageSound(player_entity_id)
        else
          playDamageSound(player_entity_id, damage)
        end
      else
        playDamageSound(player_entity_id, damage)
      end
    end
  end
end

