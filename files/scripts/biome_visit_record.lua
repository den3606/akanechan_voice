dofile_once("mods/akanechan_voice/files/scripts/global_values.lua")
local Json = dofile("mods/akanechan_voice/files/scripts/lib/jsonlua/json.lua")

local biome = {
  start_point = {
    location = "_EMPTY_",
    visited = false,
  },
  coalmine = {
    location = "$biome_coalmine",
    visited = false,
  },
  coalmine_alt = {
    location = "$biome_coalmine_alt",
    visited = false,
  },
  excavationsite = {
    location = "$biome_excavationsite",
    visited = false,
  },
  fungicave = {
    location = "$biome_fungicave",
    visited = false,
  },
  rainforest = {
    location = "$biome_rainforest",
    visited = false,
  },
  snowcave = {
    location = "$biome_snowcave",
    visited = false,
  },
  snowcastle = {
    location = "$biome_snowcastle",
    visited = false,
  },
  vault = {
    location = "$biome_vault",
    visited = false,
  },
  crypt = {
    location = "$biome_crypt",
    visited = false,
  },
  holymountain = {
    location = "$biome_holymountain",
    visited = false,
  },
  boss_victoryroom = {
    location = "$biome_boss_victoryroom",
    visited = false,
  },
  boss_arena = {
    location = "$biome_boss_arena",
    visited = false,
  },
  desert = {
    location = "$biome_desert",
    visited = false,
  },
  dragoncave = {
    location = "$biome_dragoncave",
    visited = false,
  },
  gold = {
    location = "$biome_gold",
    visited = false,
  },
  lake = {
    location = "$biome_lake",
    visited = false,
  },
  sandcave = {
    location = "$biome_sandcave",
    visited = false,
  },
  tower = {
    location = "$biome_tower",
    visited = false,
  },
  vault_frozen = {
    location = "$biome_vault_frozen",
    visited = false,
  },
  clouds = {
    location = "$biome_clouds",
    visited = false,
  },
  liquidcave = {
    location = "$biome_liquidcave",
    visited = false,
  },
  secret_lab = {
    location = "$biome_secret_lab",
    visited = false,
  },
  orbroom = {
    location = "$biome_orbroom",
    visited = false,
  },
  wizardcave = {
    location = "$biome_wizardcave",
    visited = false,
  },
  rainforest_dark = {
    location = "$biome_rainforest_dark",
    visited = false,
  },
  mestari_secret = {
    location = "$biome_mestari_secret",
    visited = false,
  },
  ghost_secret = {
    location = "$biome_ghost_secret",
    visited = false,
  },
  winter_caves = {
    location = "$biome_winter_caves",
    visited = false,
  },
  wandcave = {
    location = "$biome_wandcave",
    visited = false,
  },
  winter = {
    location = "$biome_winter",
    visited = false,
  },
  fun = {
    location = "$biome_fun",
    visited = false,
  },
  robobase = {
    location = "$biome_robobase",
    visited = false,
  },
}

function InitVisitedBiomes()
  local visited_biome_serialized = Json.encode(biome)
  GlobalsSetValue(AKANECHAN:VISITED_BIOME(), visited_biome_serialized)
end

function GetVisitedBiomes()
  local visited_biome_serialized = GlobalsGetValue(AKANECHAN:VISITED_BIOME(), "")

  local visited_biome_deserialized = nil
  if visited_biome_serialized == "" then
    visited_biome_deserialized = biome
  else
    visited_biome_deserialized = Json.decode(visited_biome_serialized)
  end

  return visited_biome_deserialized
end

function SetVisitedBiomes(visited_biome)
  local visited_biome_serialize = Json.encode(visited_biome)
  GlobalsSetValue(AKANECHAN:VISITED_BIOME(), visited_biome_serialize)
end
