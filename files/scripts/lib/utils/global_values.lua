AKANECHAN = {
  prefix = "akanechan_voice.",
  RECEIVED_DAMAGE = function(self) return self.prefix .. "received_damage" end,
  RECEIVED_FIRE_DAMAGE = function(self) return self.prefix .. "received_fire_damage" end,
  PICKED_TEMPLE_ITEMS =function(self) return self.prefix .. "picked_temple_items" end,
  PICKED_WAND = function(self) return self.prefix .. "picked_wand" end,
  IS_THROWED_WAND = function(self) return self.prefix .. "is_throwed_wand" end,
}
