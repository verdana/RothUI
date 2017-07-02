local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "HUNTER" then return end

----------
-- 猎人 --
----------

-- 野兽控制
cfg.player_spec[253] = {
    buff = {
        {
            spellid = 136,      -- 治疗宠物
            pos     = { x = 200, y = 0 },
            unit    = "pet",
        },
        {
            spellid = 35079,    -- 误导
            pos     = { x = 0, y = 100 },
            unit    = "player",
        },
    },

    debuff = {
    },

    cooldown = {
        {
            spellid = 34026,    -- 杀戮命令
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 120679,   -- 凶暴野兽
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 120360,   -- 弹幕射击
            pos     = { x = 300, y = -50 },
        },
        {
            spellid = 53209,    -- 奇美拉射击
            pos     = { x = 350, y = -50 },
        },
        {
            spellid = 19574,    -- 狂野怒火
            pos     = { x = 400, y = -50 },
        },
    }
}

-- 射击
cfg.player_spec[254] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 生存
cfg.player_spec[255] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

