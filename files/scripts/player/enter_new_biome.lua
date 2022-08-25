dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
local function enter_to_starting_point(akanechan_voice)
  print("start")
  SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/sheep_voice.xml")
end

local function enter_to_coalmine(akanechan_voice)
  print("coalmine")
  SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/sheep_voice.xml")
end

local function biome_event_emitter(bione_name)
  local biome_voice_actions = {}
  biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.START_POINT] = enter_to_starting_point
  biome_voice_actions[AKANECHAN.BIOME_LOCATIONS.COALMINE] = enter_to_coalmine
  -- TODO: 各バイオームに訪れた際のEventを定義する
  local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
  biome_voice_actions[bione_name](akanechan_voice)
end


--------------
-- main
--------------
local current_location = getInternalVariableValue(GetPlayerEntity(), AKANECHAN.CURRENT_LOCATION, "value_string")

-- TODO:行ったことのあるlocationかをチェック
-- if not biome_visit_record[current_location] then
--   WaitFrame:tryCall(player_entity_id, 'aaaa', function()
--     biome_event_emitter(current_location)
--   end, 60 * 1)
-- end

if true then
  WaitFrame:tryCall(GetPlayerEntity(), 'aaaa', function()
    biome_event_emitter(current_location)
  end, 60 * 1)
end
