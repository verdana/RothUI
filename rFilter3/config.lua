
-- // rFilter3
-- // zork - 2012

local addon, ns = ...
local cfg = CreateFrame("Frame")
ns.cfg = cfg

-- 玩家
cfg.player_spec  = {}
cfg.player_class = select(2, UnitClass("player"))

-- 增益模板
cfg.rf3_BuffList = {}
cfg.Buff = {
    spellid       = nil,
    spec          = nil,
    size          = 36,
    pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 0, y = 0 },
    unit          = "player",
    validate_unit = false,
    ismine        = true,
    desaturate    = true,
    hide_ooc      = true,
    move_ingame   = true,
    alpha = {
        found     = { frame = 0.8, icon = 0.8 },
        not_found = { frame = 0.0, icon = 0.0 },
    },
}

-- 减益模板
cfg.rf3_DebuffList = {}
cfg.Debuff = {
    spellid       = nil,
    spec          = nil,
    size          = 36,
    pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 0, y = 0 },
    unit          = "target",
    validate_unit = false,
    ismine        = true,
    desaturate    = true,
    hide_ooc      = true,
    move_ingame   = true,
    alpha = {
        found     = { frame = 0.8, icon = 0.8 },
        not_found = { frame = 0.0, icon = 0.0 },
    },
}

-- 冷却模板
cfg.rf3_CooldownList = {}
cfg.Cooldown = {
    spellid          = nil,
    spelllist        = {},
    spec             = nil,
    size             = 36,
    pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 0, y = 0 },
    visibility_state = nil,
    desaturate       = true,
    hide_ooc         = true,
    move_ingame      = true,
    alpha = {
        cooldown    = { frame = 1.0,  icon = 0.6 },
        no_cooldown = { frame = 1.0,  icon = 1.0 },
    },
}

-----------------------------
-- DEFAULT CONFIG
-----------------------------

cfg.highlightPlayerSpells = true  -- player spells will have a blue border
cfg.updatetime            = 0.1   -- how fast should the timer update itself
cfg.timeFontSize          = 15
cfg.countFontSize         = 18

