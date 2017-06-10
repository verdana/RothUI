
-----------------------------
-- INIT
-----------------------------

--get the addon namespace
local addon, ns = ...
local cfg = ns.cfg

-----------------------------
-- CHARSPECIFIC REWRITES
-----------------------------

local player_name = UnitName("player")
local _, player_class = UnitClass("player")

-- 法师
if player_class == "MAGE" then
    cfg.rf3_BuffList =
    {
        {
            spellid       = 11426,	-- 寒冰护体
            spec          = nil,
            size          = 36,
            pos           = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = -210, y = 140 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        }
    }

    cfg.rf3_DebuffList =
    {
    }

    -- 55342,   -- 镜像
    -- 153595,   -- 彗星风暴
    cfg.rf3_CooldownList =
    {
        {
            spellid          = 214634,   -- 黑冰箭
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 84714,  -- 寒冰宝珠
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 12472, -- 冰冷血脉
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 80353, -- 时空扭曲
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
    }
end

-- 术士
if player_class == "WARLOCK" then
    cfg.rf3_BuffList =
    {
        {
            spellid       = 20707,  -- 灵魂石
            spec          = nil,
            size          = 36,
            pos           = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = -210, y = 140 },
            unit          = "player",
            validate_unit = true,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.6, icon = 0.6 },
                not_found = { frame = 0.2, icon = 0.5 },
            },
        },
        {
            spellid       = 12472,
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 0 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0, icon = 0 },
            },
        },
    }

    cfg.rf3_DebuffList =
    {
        {
            spellid       = 980,  -- 痛楚
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 0 },
            unit          = "target",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 146739,  -- 腐蚀术
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = 0 },
            unit          = "target",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 30108,  -- 痛苦无常
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = 0 },
            unit          = "target",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
    }

    cfg.rf3_CooldownList =
    {
        {
            spellid          = 196098,  -- 灵魂收割
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1.0 },
            },
        },

        {
            spellid          = 111859,  -- 魔典：小鬼
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1.0 },
            },
        }
    }
end

-- 战士
if player_class == "WARRIOR" then
    cfg.rf3_BuffList =
    {
        {
            spellid       = 184362,  -- 激怒
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 206333,  -- 血腥气息
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 85739,  -- 血肉顺劈
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 215570,  -- 摧枯拉朽
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        }
    }

    cfg.rf3_DebuffList =
    {}

    cfg.rf3_CooldownList =
    {
        {
            spellid          = 228920, -- 破坏者
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 23922, -- 盾牌猛击
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 6343, -- 雷霆一击
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 6572, -- 复仇
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 203524, -- 耐萨里奥之怒
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 400, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        }
    }
end

-- 盗贼
if player_class == "ROGUE" then
    cfg.rf3_BuffList =
    {
        {
            spellid       = 193356, -- 强势连击
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 0, y = -100 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 193357, -- 暗鲨涌动
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -50, y = -100 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 193359, -- 精准定位
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 50, y = -100 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 199600, -- 埋藏的宝藏
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -100, y = -100 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 199603, -- 骷髅黑帆
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 100, y = -100 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },

        {
            spellid       = 195627, -- 可乘之机
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 193538, -- 敏锐
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
    }

    cfg.rf3_DebuffList =
    {
    }

    cfg.rf3_CooldownList =
    {
        {
            spellid          = 192759,    -- 君王之灾
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = false,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 79140,    -- 宿敌
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = false,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 185311,    -- 猩红之瓶
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = false,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
    }
end

-- 猎人
if player_class == "HUNTER" then
    cfg.rf3_BuffList     =
    {
        {
            spellid       = 136,        -- 治疗宠物
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = 0 },
            unit          = "pet",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 35079,        -- 误导
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 0, y = 100 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
    }

    cfg.rf3_DebuffList   =
    {
        {
            spellid       = 146739,  -- 腐蚀术
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 0 },
            unit          = "target",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
    }

    cfg.rf3_CooldownList =
    {
        {
            spellid          = 34026,    -- 杀戮命令
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 120679,   -- 凶暴野兽
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 120360,   -- 弹幕射击
            spelllist        = {131894,194386}, -- 夺命黑鸦/乱射
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 53209,   -- 奇美拉射击
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 19574,    -- 狂野怒火
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 400, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
    }
end

-- 圣骑士
if player_class == "PALADIN" then
end

-- 死亡骑士
if player_class == "DEATHKNIGHT" then
    cfg.rf3_BuffList =
    {
        {
            spellid       = 195181,  -- 白骨之盾
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        },
        {
            spellid       = 101568,  -- 黑暗援助
            spec          = nil,
            size          = 36,
            pos           = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 50 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = true,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        }
    }

    cfg.rf3_DebuffList =
    {
    }

    cfg.rf3_CooldownList =
    {
        {
            spellid          = 205223,   -- 吞噬
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 194844,    -- 白骨风暴
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 49028,    -- 符文刃舞
            spelllist        = {},
            spec             = nil,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        }
    }
end

-- 萨满
if player_class == "SHAMAN" then
    cfg.rf3_BuffList =
    {
        {
            spellid       = 53390,  -- 潮汐奔涌
            spec          = nil,
            size          = 36,
            pos           = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = -210, y = 140 },
            unit          = "player",
            validate_unit = false,
            ismine        = true,
            desaturate    = true,
            move_ingame   = true,
            hide_ooc      = false,
            alpha = {
                found     = { frame = 0.8, icon = 0.8 },
                not_found = { frame = 0.0, icon = 0.0 },
            },
        }
    }

    cfg.rf3_CooldownList =
    {
        -- 增强天赋
        {
            spellid          = 17364,   -- 风暴打击
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 60103,   -- 熔岩猛击
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 73680,    -- 元素释放
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 152255,    -- 岩浆
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = 0 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },

        -- 治疗天赋
        {
            spellid          = 5394,   -- 治疗之泉图腾
            spelllist        = {},
            spec             = 3,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 73920,   -- 治疗之雨
            spelllist        = {},
            spec             = 3,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 16188,    -- 先祖迅捷
            spelllist        = {},
            spec             = 3,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -400, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 117014,    -- 元素冲击
            spelllist        = {},
            spec             = 3,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -250, y = -100 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 73685,    -- 生命释放
            spelllist        = {},
            spec             = 3,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -300, y = -100 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 79206,    -- 灵魂行者的恩赐
            spelllist        = {},
            spec             = 3,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = -400, y = -100 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
    }
end

-- 恶魔猎手
if player_class == "DEMONHUNTER" then
    cfg.rf3_BuffList = {}
    cfg.rf3_DebuffList = {}
    cfg.rf3_CooldownList =
    {
        {
            spellid          = 178740,   -- 献祭光环
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 200, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 204596,   -- 烈焰符咒
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 250, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 204021,   -- 烈焰烙印
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 300, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
        {
            spellid          = 203720,   -- 恶魔尖刺
            spelllist        = {},
            spec             = 2,
            visibility_state = nil,
            size             = 36,
            hide_ooc         = true,
            desaturate       = true,
            move_ingame      = true,
            pos              = { a1 = "CENTER", a2 = "CENTER", af = "UIParent", x = 350, y = -50 },
            alpha = {
                cooldown    = { frame = 1,  icon = 0.6 },
                no_cooldown = { frame = 1,  icon = 1 },
            },
        },
    }
end

