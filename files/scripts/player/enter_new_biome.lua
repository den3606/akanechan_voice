dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

WaitFrame:tryCall(GetPlayerEntity(), AKANECHAN:ENTER_NEW_BIOME(), function()
  dofile_once("mods/akanechan_voice/files/scripts/biome_visit_record.lua")

  local function enter_to_starting_point(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/sheep_voice.xml")
  end

  local function enter_to_coalmine(akanechan_voice)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/sheep_voice.xml")
  end

  local function biome_event_emitter(bione_name)
    local biome_voice_actions = {}
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.START_POINT] = enter_to_starting_point
    biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.COALMINE] = enter_to_coalmine

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
