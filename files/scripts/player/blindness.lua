dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")
dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")

--------------
-- main
--------------
local blindness_entity_id = GetUpdatedEntityID()
if EntityGetParent(blindness_entity_id) ~= GetPlayerEntity() then
  return
end

for _, component_id in pairs(EntityGetAllComponents(blindness_entity_id)) do
  if ComponentHasTag(component_id, AKANECHAN.EFFECT_TAGS.BLINDNESS) then
    local akanechan_voice = SoundPlayer:seachSoundPlayer(GetPlayerEntity(), AKANECHAN.SOUND_PLAYER_NAME)
    SoundPlayer:registerForceSoundEntity(akanechan_voice, "mods/akanechan_voice/files/entities/sounds/blindness_voice.xml")
    EntityRemoveComponent(blindness_entity_id, component_id)
  end
end
