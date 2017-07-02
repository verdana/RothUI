local addon, ns = ...
local cfg = ns.cfg

if cfg.player_class ~= "DEAMONHUNTER" then return end

--------------
-- 恶魔猎手 --
--------------

-- 浩劫
cfg.player_spec[577] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

-- 复仇
cfg.player_spec[581] = {
    buff = {},
    debuff = {},
    cooldown = {},
}

