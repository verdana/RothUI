local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "WARLOCK" then return end

----------
-- 术士 --
----------

-- 痛苦
cfg.player_spec[265] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 恶魔
cfg.player_spec[266] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 毁灭
cfg.player_spec[267] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

