local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "ROGUE" then return end

----------
-- 盗贼 --
----------

-- 刺杀
cfg.player_spec[259] = {
    buff = {},
    debuff = {},
    cooldown = {
        {
            spellid = 192759,   -- 君王之灾
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 79140,    -- 宿敌
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 185311,   -- 猩红之瓶
            pos     = { x = 300, y = -50 },
        },
    },
}

-- 狂徒
cfg.player_spec[260] = {
    buff = {
        {
            spellid = 193356, -- 强势连击
            pos     = { x = 0, y = -100 },
        },
        {
            spellid = 193357, -- 暗鲨涌动
            pos     = { x = -50, y = -100 },
        },
        {
            spellid = 193359, -- 精准定位
            pos     = { x = 50, y = -100 },
        },
        {
            spellid = 199600, -- 埋藏的宝藏
            pos     = { x = -100, y = -100 },
        },
        {
            spellid = 199603, -- 骷髅黑帆
            pos     = { x = 100, y = -100 },
        },
        {
            spellid = 195627, -- 可乘之机
            pos     = { x = 200, y = 50 },
        },
        {
            spellid = 193538, -- 敏锐
            pos     = { x = 250, y = 50 },
        },
    },
    debuff = {},
    cooldown = {},
}

-- 敏锐
cfg.player_spec[261] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

