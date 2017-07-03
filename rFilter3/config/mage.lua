local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "MAGE" then return end

----------
-- 法师 --
----------

-- 奥术
cfg.player_spec[62] = {
    buff = {
    },
    debuff = {
    },
    cooldown = {
    },
}

-- 火焰
cfg.player_spec[63] = {
    buff = {
    },
    debuff = {
    },
    cooldown = {
        {
            spellid = 194466,   -- 凤凰烈焰
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 108853,   -- 火焰冲击
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 31661,    -- 龙息术
            pos     = { x = 300, y = -50 },
        },
        {
            spellid = 190319,   -- 燃烧
            pos     = { x = 350, y = -50 },
        },
        {
            spellid = 55342,    -- 镜像
            pos     = { x = 400, y = -50 },
        },
        {
            spellid = 80353,    -- 时间扭曲
            pos     = { x = 450, y = -50 },
        },
    },
}

-- 冰霜
cfg.player_spec[64] = {
    buff = {
        {
            spellid  = 11426,	-- 寒冰护体
            pos      = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = -210, y = 140 },
            hide_ooc = false,
        }
    },
    debuff = {
    },
    cooldown = {
        {
            spellid = 214634,   -- 黑冰箭
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 84714,    -- 寒冰宝珠
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 12472,    -- 冰冷血脉
            pos     = { x = 300, y = -50 },
        },
        {
            spellid = 80353,    -- 时空扭曲
            pos     = { x = 350, y = -50 },
        },
    },
}

