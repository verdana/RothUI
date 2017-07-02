local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "DRUID" then return end

------------
-- 德鲁伊 --
------------

-- 平衡
cfg.player_spec[102] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 野性
cfg.player_spec[103] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 守护
cfg.player_spec[104] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 恢复
cfg.player_spec[105] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

