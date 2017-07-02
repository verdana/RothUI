local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "SHAMAN" then return end

----------
-- 萨满 --
----------

-- 元素
cfg.player_spec[262] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 增强
cfg.player_spec[263] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 恢复
cfg.player_spec[264] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

