dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

WaitFrame:tryCall(GetPlayerEntity(), AKANECHAN:ENTER_NEW_BIOME(), function()
  dofile_once("mods/akanechan_voice/files/scripts/biome_visit_record.lua")

  local function enter_to_starting_point(akanechan_voice)
    -- ignore
  end

  -- 1層
  local function enter_to_coalmine(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/coalmine_voice.xml")
  end

  -- 2層
  local function enter_to_excavationsite(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/excavationsite_voice.xml")
  end

  -- 3層
  local function enter_to_snowcave(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/snowcave_voice.xml")
  end

  -- 4層
  local function enter_to_snowcastle(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/snowcastle_voice.xml")
  end

  -- 5層
  local function enter_to_rainforest(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/rainforest_voice.xml")
  end

  -- 6層
  local function enter_to_vault(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/vault_voice.xml")
  end

  -- 7層
  local function enter_to_crypt(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/crypt_voice.xml")
  end

  -- ゴールド
  local function enter_to_gold(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/gold_voice.xml")
  end

    -- ゴールド
    local function enter_to_fun(akanechan_voice)
      SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/enter_new_biome/fun_voice.xml")
    end

  local function biome_event_emitter(bione_name)
    local biome_voice_actions = {}
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.START_POINT] = enter_to_starting_point
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.COALMINE] = enter_to_coalmine
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.EXCAVATIONSITE] = enter_to_excavationsite
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.COALMINE_ALT] = enter_to_coalmine_alt
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.FUNGICAVE] = enter_to_fungicave
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.RAINFOREST] = enter_to_rainforest
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.SNOWCAVE] = enter_to_snowcave
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.SNOWCASTLE] = enter_to_snowcastle
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.VAULT] = enter_to_vault
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.CRYPT] = enter_to_crypt
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.HOLYMOUNTAIN] = enter_to_holymountain
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.BOSS_VICTORYROOM] = enter_to_boss_victoryroom
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.BOSS_ARENA] = enter_to_boss_arena
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.DESERT] = enter_to_desert
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.DRAGONCAVE] = enter_to_dragoncave
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.GOLD] = enter_to_gold
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.LAKE] = enter_to_lake
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.SANDCAVE] = enter_to_sandcave
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.TOWER] = enter_to_tower
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.VAULT_FROZEN] = enter_to_vault_frozen
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.CLOUDS] = enter_to_clouds
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.LIQUIDCAVE] = enter_to_liquidcave
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.SECRET_LAB] = enter_to_secret_lab
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.ORBROOM] = enter_to_orbroom
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.WIZARDCAVE] = enter_to_wizardcave
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.RAINFOREST_DARK] = enter_to_rainforest_dark
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.MESTARI_SECRET] = enter_to_mestari_secret
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.GHOST_SECRET] = enter_to_ghost_secret
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.WINTER_CAVES] = enter_to_winter_caves
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.WANDCAVE] = enter_to_wandcave
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.WINTER] = enter_to_winter
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.FUN] = enter_to_fun
    -- biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.ROBOBASE] = enter_to_robobase

    local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
    biome_voice_actions[bione_name](akanechan_voice)
  end

  --------------
  -- main
  --------------
  local current_location = getInternalVariableValue(GetPlayerEntity(), AKANECHAN.CURRENT_LOCATION, "value_string")
  local visited_biomes = GetVisitedBiomes()

  for _, v in pairs(visited_biomes) do
    if v.location == current_location then
      if not v.visited then

        biome_event_emitter(current_location)

        v.visited = true
      end
      SetVisitedBiomes(visited_biomes)
      return
    end
  end
end, 60 * 1)
