AKANECHAN = {
  prefix = "akanechan_voice.",
  RECEIVED_DAMAGE = function(self) return self.prefix .. "received_damage" end,
  RECEIVED_FIRE_DAMAGE = function(self) return self.prefix .. "received_fire_damage" end,
  PICKED_WAND = function(self) return self.prefix .. "picked_wand" end,
  THROWED_WAND = function(self) return self.prefix .. "throwed_wand" end,
  IS_THROWED_WAND = function(self) return self.prefix .. "is_throwed_wand" end,
}
