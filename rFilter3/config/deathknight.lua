local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "DEATHKNIGHT" then return end

----------
-- 死骑 --
----------

-- 鲜血
cfg.player_spec[250] = {
    buff = {
        {
            spellid = 195181,  -- 白骨之盾
            pos     = { x = 200, y = 50 },
        },
        {
            spellid = 101568,  -- 黑暗援助
            pos     = { x = 250, y = 50 },
        }
    },
    debuff = {
    },
    cooldown = {
        {
            spellid = 205223,   -- 吞噬
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 194844,   -- 白骨风暴
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 49028,    -- 符文刃舞
            pos     = { x = 300, y = -50 },
        }
    },
}

-- 冰霜
cfg.player_spec[251] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 邪恶
cfg.player_spec[252] = {
    buff = {
        {
            spellid = 101568,  -- 黑暗援助
            pos     = { x = 300, y = 50 },
        }
    },

    debuff = {
        {
            spellid = 194310,  -- 溃烂之伤
            pos     = { x = 200, y = 50 },
            unit    = "target",
        },
        {
            spellid = 191587,  -- 恶性瘟疫
            pos     = { x = 250, y = 50 },
            unit    = "target",
        },
    },

    cooldown = {
        {
            spellid = 43265,    -- 枯萎凋零
            pos     = { x = 200, y = -50 },
        },
        {
            spellid = 220143,   -- 天启
            pos     = { x = 250, y = -50 },
        },
        {
            spellid = 194918,   -- 符文武器
            pos     = { x = 300, y = -50 },
        },
        {
            spellid = 63560,    -- 黑暗突变
            pos     = { x = 350, y = -50 },
        },
        {
            spellid = 207349,   -- 黑暗仲裁者
            pos     = { x = 400, y = -50 },
        }
    },
}

