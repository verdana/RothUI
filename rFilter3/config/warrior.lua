local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "WARRIOR" then return end

----------
-- 战士 --
----------

-- 武器
cfg.player_spec[71] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 狂怒
cfg.player_spec[72] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 防护
cfg.player_spec[73] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

