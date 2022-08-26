dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

local BIG_DAMAGE = 0.8 -- 20

local function playDamageSound(player_entity_id, akanechan_voice, damage)
  for _, damage_model in ipairs(EntityGetComponent(player_entity_id, "DamageModelComponent") or {}) do

    local is_low_helth = math.floor(GetPlayerHealth() / GetPlayerMaxHealth() * 100) <= 25
    local is_on_fire = ComponentGetValue2(damage_model, "is_on_fire")
    local take_big_damage = BIG_DAMAGE < damage
    local is_heal = damage < 0

    if is_heal then
      WaitFrame:tryCall(player_entity_id, AKANECHAN:RECEIVED_HEAL(), function()
        SoundPlayer:registerOnlyEmptySoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/heal_voice.xml")
      end, 60 * 10)
      return
    end

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
        SetRandomSeed(GameGetFrameNum(), GameGetFrameNum())
        local rnd = Random(1, 20)
        if rnd == 4 then
          SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/low_helth_damage_long_voice.xml")
        else
          SoundPlayer:registerCoverSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/damage_received/low_helth_damage_voice.xml")
        end
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
  local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
  if is_fatal then
    -- playerが死ぬとsound_playerも消え、死亡ボイスがながれない
    -- 死亡ボイスは必ず流したいため、直接callする
    GameEntityPlaySound(GetUpdatedEntityID(), "player/dead")
  else
    playDamageSound(player_entity_id, akanechan_voice, damage)
  end
end
