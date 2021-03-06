dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

local BIG_DAMAGE = 0.8 -- 20

local function playDamageSound(player_entity_id, akanechan_voice, damage)
  for _, damage_model in ipairs(EntityGetComponent(player_entity_id, "DamageModelComponent") or {}) do

    local is_low_helth = math.floor(getPlayerHealth() / getPlayerMaxHealth() * 100) <= 25
    local is_on_fire = ComponentGetValue2(damage_model, "is_on_fire")
    local take_big_damage = BIG_DAMAGE < damage

    if is_on_fire then
      if take_big_damage then
        SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/heavy_damage_voice.xml")
      else
        WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_FIRE_DAMAGE(), function()
          SoundPlayer:registerOnlyEmptySoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/on_fire_damage_voice.xml")
        end, 60 * 4)
      end
    elseif is_low_helth then
      WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), function()
        SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/low_helth_damage_voice.xml")
      end, 60 * 1)
    elseif take_big_damage then
      SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/heavy_damage_voice.xml")
    else
      WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_DAMAGE(), function()
        SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/mild_damage_voice.xml")
      end, 60 * 1)
    end

  end
end

--------------
-- main
--------------
function damage_received(damage, desc, entity_who_caused, is_fatal)
  local player_entity_id = GetUpdatedEntityID()
  local akanechan_voice = SoundPlayer:seachSoundPlayer(getPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
  if is_fatal then
    -- playerが死ぬとsound_playerも消え、死亡ボイスがながれない
    -- 死亡ボイスは必ず流したいため、直接callする
    GameEntityPlaySound(GetUpdatedEntityID(), "player/dead")
  else
    playDamageSound(player_entity_id, akanechan_voice, damage)
  end
end
