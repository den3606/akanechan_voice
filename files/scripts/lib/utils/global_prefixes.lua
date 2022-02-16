GLOBAL_PREFIXES = {
  prefix = "akanechan_voice.",
  item_pickup = function(self)
    return self.prefix .. "item_pickuped"
  end,
  damage_received = function(self)
    return self.prefix .. "damage_received"
  end,
  fire_damage_received = function(self)
    return self.prefix .. "fire_damage_received"
  end
}
