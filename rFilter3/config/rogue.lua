local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "ROGUE" then return end

----------
-- 盗贼 --
----------

-- 刺杀
cfg.player_spec[259] = {
    buff = {
        {
            spellid = 215126,   -- 黏性物质
            pos     = { x = 250, y = 50 },
        }
    },
    debuff = {
        {
            spellid = 1943,     -- 割裂
            pos     = { x = 200, y = 50 },
        }
    },
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
    buff = {
        {
            spellid = 185422,   -- 暗影之舞
            pos     = { x = 200, y = 50 },
        },
        {
            spellid = 197498,   -- 夜刃
            pos     = { x = 250, y = 50 },
        },
        {
            spellid = 197496,   -- 终结技：剔骨
            pos     = { x = 300, y = 50 },
        },
    },
    debuff = {},
    cooldown = {
        {
            spellid = 209782,   -- 赤喉之咬
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 185313,   -- 暗影之舞
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 212283,   -- 死亡符记
            pos     = { x = 300, y = -50 },
        },
        {
            spellid = 121471,   -- 暗影之力
            pos     = { x = 350, y = -50 },
        },
    },
}

