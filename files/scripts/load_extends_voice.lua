-- 音声ファイルロード
ModRegisterAudioEventMappings("mods/akanechan_voice/files/audio/GUIDs.txt")
local nxml = dofile_once("mods/akanechan_voice/files/scripts/lib/luanxml/nxml.lua")
local content_filenames = {
  {
    base="data/entities/base_wand_pickup.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_wand_voices.xml"
  },
  {
    base="data/entities/base_item.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_item_voices.xml"
  },
  {
    base="data/entities/items/pickup/potion.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_item_voices.xml"
  },
  {
    base="data/entities/items/books/base_book.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_emerald_tablet_voices.xml"
  },
  {
    base="data/entities/items/pickup/heart_fullhp_temple.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_heart_fullhp_temple_voices.xml"
  },
  {
    base="data/entities/items/pickup/spell_refresh.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_spell_refresh_voices.xml"
  },
  {
    base="data/entities/particles/vomit.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_vomit_voices.xml"
  },
  {
    base="data/entities/misc/effect_trip_03.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_tripping_voices.xml"
  },
  {
    base="data/entities/misc/effect_blindness.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_effect_blindness_voices.xml"
  },
  {
    base="data/entities/misc/effect_twitchy.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_effect_twitchy_voices.xml"
  },
  {
    base="data/entities/misc/effect_weaken.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_effect_weaken_voices.xml"
  },
  {
    base="data/entities/misc/neutralized.xml",
    extend="mods/akanechan_voice/files/entities/extends/extend_effect_neutralized_voices.xml"
  },
}

for _, content_filename in ipairs(content_filenames) do
  local content = ModTextFileGetContent(content_filename["base"])
  local xml = nxml.parse(content)
  xml:add_child(nxml.parse([[<Base file="]] .. content_filename["extend"] .. [[" />]]))
  ModTextFileSetContent(content_filename["base"], tostring(xml))
end

-- スクリプト依存(xml経由のEvent依存ではないもの)の拡張
ModLuaFileAppend("data/scripts/magic/fungal_shift.lua", "mods/akanechan_voice/files/scripts/player/fungal_shift.lua")
