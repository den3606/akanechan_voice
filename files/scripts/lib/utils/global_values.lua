AKANECHAN = {
  SOUND_PLAYER_NAME = "akanechan_voice",
  SOUND_FILE_STORAGE_NAME = function(self) return self.SOUND_PLAYER_NAME .. "." .. "sound_xml_file" end,
  RECEIVED_DAMAGE = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_damage" end,
  RECEIVED_FIRE_DAMAGE = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_fire_damage" end,
  RECEIVED_HEAL = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_heal" end,
  PICKED_WAND = function(self) return self.SOUND_PLAYER_NAME .. "." .. "picked_wand" end,
  ENEMY_PICKED_WAND = function(self) return self.SOUND_PLAYER_NAME .. "." .. "enemy_picked_wand" end,
}
