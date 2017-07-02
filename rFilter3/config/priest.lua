local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "PRIEST" then return end

----------
-- 牧师 --
----------

-- 戒律
cfg.player_spec[256] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 神圣
cfg.player_spec[257] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 暗影
cfg.player_spec[258] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

