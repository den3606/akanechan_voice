AKANECHAN = {
  SOUND_PLAYER_NAME = "akanechan_voice",
  CURRENT_LOCATION = "current_location",
  VISITED_BIOME = function(self) return self.SOUND_PLAYER_NAME .. "." .. "visited_biome" end,
  ENTER_NEW_BIOME = function(self) return self.SOUND_PLAYER_NAME .. "." .. "enter_new_biome" end,
  SOUND_FILE_STORAGE_NAME = function(self) return self.SOUND_PLAYER_NAME .. "." .. "sound_xml_file" end,
  RECEIVED_DAMAGE = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_damage" end,
  RECEIVED_FIRE_DAMAGE = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_fire_damage" end,
  RECEIVED_RADIOACTIVE_DAMAGE = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_radioactive_damage" end,
  RECEIVED_POISON_DAMAGE = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_poison_damage" end,
  RECEIVED_NEUTRALIZED = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_neutralized" end,
  RECEIVED_HEAL = function(self) return self.SOUND_PLAYER_NAME .. "." .. "received_heal" end,
  PICKED_WAND = function(self) return self.SOUND_PLAYER_NAME .. "." .. "picked_wand" end,
  ENEMY_PICKED_WAND = function(self) return self.SOUND_PLAYER_NAME .. "." .. "enemy_picked_wand" end,
  BIOME_LOCATIONS = {
    START_POINT = "_EMPTY_", -- 初期スポーン
    COALMINE = "$biome_coalmine", -- 1層 鉱山
    COALMINE_ALT = "$biome_coalmine_alt", -- 崩壊した鉱山
    EXCAVATIONSITE = "$biome_excavationsite", -- 2層 炭鉱
    FUNGICAVE = "$biome_fungicave", -- 真菌洞窟
    RAINFOREST = "$biome_rainforest", -- 5層 ジャングル
    SNOWCAVE = "$biome_snowcave", -- 3層 雪のどん底
    SNOWCASTLE = "$biome_snowcastle", -- 4層 ヒーシ基地
    VAULT = "$biome_vault", -- 6層 金庫室
    CRYPT = "$biome_crypt", -- 7層 芸術の神殿
    HOLYMOUNTAIN = "$biome_holymountain", -- 聖なる山
    BOSS_VICTORYROOM = "$biome_boss_victoryroom", -- 至聖所
    BOSS_ARENA = "$biome_boss_arena", -- 研究所
    DESERT = "$biome_desert", -- 砂漠
    DRAGONCAVE = "$biome_dragoncave", -- ドラゴンの洞窟
    GOLD = "$biome_gold", -- ゴールド
    LAKE = "$biome_lake", -- 湖
    SANDCAVE = "$biome_sandcave", -- 砂の洞窟
    TOWER = "$biome_tower", -- タワー
    VAULT_FROZEN = "$biome_vault_frozen", -- 凍った埋葬室
    CLOUDS = "$biome_clouds", -- 雲景
    LIQUIDCAVE = "$biome_liquidcave", -- 古代研究所
    SECRET_LAB = "$biome_secret_lab", -- 化学実験室跡 / 古代研究所(深部)
    ORBROOM = "$biome_orbroom",  -- オーブの部屋
    WIZARDCAVE = "$biome_wizardcave", -- 魔法使いの棲家
    RAINFOREST_DARK = "$biome_rainforest_dark", -- ルッキの隠れ家
    MESTARI_SECRET = "$biome_mestari_secret", -- 王座の部屋
    GHOST_SECRET = "$biome_ghost_secret", -- 忘れられた洞窟
    WINTER_CAVES = "$biome_winter_caves", -- 雪の裂け目
    WANDCAVE = "$biome_wandcave", -- 魔法の神殿
    WINTER = "$biome_winter", -- 雪の荒地
    FUN = "$biome_fun", -- 生い茂った洞窟
    ROBOBASE = "$biome_robobase"  -- 発電所
  }
}

