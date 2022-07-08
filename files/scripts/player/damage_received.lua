dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

local BIG_DAMAGE = 0.8 -- 20

local function playHeavyDamageSound(player_entity_id)
  p("heavy")
  GameEntityPlaySound(player_entity_id, "player/take_damage/heavy")
end

local function playMildDamageSound(player_entity_id)
  p("mild")
  GameEntityPlaySound(player_entity_id, "player/take_damage/mild")
end

local function playLowHealthDamageSound(player_entity_id)
  p("low_helth")
  GameEntityPlaySound(player_entity_id, "player/take_damage/low_helth")
end

local function playFireDamageSound(player_entity_id)
  WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_FIRE_DAMAGE(), function()
    GameEntityPlaySound(player_entity_id, "player/take_damage/on_fire")
  end, 60 * 3)
end

local function playDamageSound(player_entity_id, damage)
  for _, damage_model in ipairs(EntityGetComponent(player_entity_id, "DamageModelComponent") or {}) do

    local is_low_helth = math.floor(getPlayerHealth() / getPlayerMaxHealth() * 100) <= 25
    local is_on_fire = ComponentGetValue2(damage_model, "is_on_fire")
    local take_big_damage = BIG_DAMAGE < damage

    if is_on_fire then
      if take_big_damage then
        playHeavyDamageSound(player_entity_id)
      else
        playFireDamageSound(player_entity_id)
      end
    elseif is_low_helth then
      playLowHealthDamageSound(player_entity_id)
    elseif take_big_damage then
      playHeavyDamageSound(player_entity_id)
    else
      playMildDamageSound(player_entity_id)
    end
  end
end

--------------
-- main
--------------
function damage_received(damage, desc, entity_who_caused, is_fatal)
  local player_entity_id = GetUpdatedEntityID()
  if is_fatal then
    GameEntityPlaySound(player_entity_id, "player/dead")
  else
    WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), function()
      playDamageSound(player_entity_id, damage)
    end)
  end
end

