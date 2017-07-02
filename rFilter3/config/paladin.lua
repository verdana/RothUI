local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "PALADIN" then return end

------------
-- 圣骑士 --
------------

-- 神圣
cfg.player_spec[65] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 防护
cfg.player_spec[66] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 惩戒
cfg.player_spec[70] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

