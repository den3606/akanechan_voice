dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

--------------
-- main
--------------
local twitchy_entity_id = GetUpdatedEntityID()
if EntityGetParent(twitchy_entity_id) ~= GetPlayerEntity() then
  return
end

for _, component_id in pairs(EntityGetAllComponents(twitchy_entity_id)) do
  if ComponentHasTag(component_id, AKANECHAN.EFFECT_TAGS.TWITCHY) then
    local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/twitchy_voice.xml")
    EntityRemoveComponent(twitchy_entity_id, component_id)
  end
end
