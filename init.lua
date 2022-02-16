dofile_once("mods/akanechan_voice/files/scripts/lib/utilities.lua")

print("akanechan_voice load")

function OnPlayerSpawned(player_entity_id)
  local loaded = getInternalVariableValue(player_entity_id, "akanechan_voice.loaded?", "value_bool") or false
  if not loaded then
    EntityLoadToEntity("mods/akanechan_voice/files/entities/extend_player_voices.xml", player_entity_id)
    addNewInternalVariable(player_entity_id, "akanechan_voice.loaded?", "value_bool", true)
  end
end


-- 音声ファイルロード
ModRegisterAudioEventMappings("mods/akanechan_voice/files/audio/GUIDs.txt")
local nxml = dofile_once("mods/akanechan_voice/files/scripts/lib/luanxml/nxml.lua")
local content_filenames = {
  {
    base="data/entities/base_wand_pickup.xml",
    extend="mods/akanechan_voice/files/entities/extend_wand_voices.xml"
  },
  {
    base="data/entities/base_item.xml",
    extend="mods/akanechan_voice/files/entities/extend_item_voices.xml"
  },
  {
    base="data/entities/items/pickup/potion.xml",
    extend="mods/akanechan_voice/files/entities/extend_item_voices.xml"
  },
  {
    base="data/entities/items/books/base_book.xml",
    extend="mods/akanechan_voice/files/entities/extend_emerald_tablet_voices.xml"
  },
}

for _, content_filename in ipairs(content_filenames) do
  local content = ModTextFileGetContent(content_filename["base"])
  local xml = nxml.parse(content)
  xml:add_child(nxml.parse([[<Base file="]] .. content_filename["extend"] .. [[" />]]))
  ModTextFileSetContent(content_filename["base"], tostring(xml))
end

print("akanechan_voice loaded")
