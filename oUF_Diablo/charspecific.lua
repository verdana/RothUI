
local addon, ns = ...
local cfg = ns.cfg

-- 修改血球尺寸
cfg.units.player.size = 130
cfg.units.player.scale = 0.82

-- 默认仅显示自己的减益效果
cfg.units.target.auras.onlyShowPlayerDebuffs = true

-- 小队纵向排列 默认
cfg.units.party.show      = true
cfg.units.party.vertical  = true
cfg.units.party.scale     = 0.82
cfg.units.party.pos       = {a1 = "TOPLEFT", a2 = "TOPLEFT", af = "UIParent", x = 50, y = -80}

-- 小队横向排列
-- cfg.units.party.show     = true
-- cfg.units.party.vertical = false
-- cfg.units.party.scale    = 0.9
-- cfg.units.party.pos      = {a1 = "TOPLEFT", a2 = "TOPLEFT", af = "UIParent", x = 50, y = -70}

-- 治疗职业不显示团队界面
if cfg.playername == "麒麟朔夜" and cfg.playerclass == "SHAMAN" then
    cfg.units.raid.show = false
end

-- 如果身处队长要塞中，那么不显示团队界面
-- 钓鱼团使用
if C_Garrison.IsUsingPartyGarrison() then
    cfg.units.raid.show = false
end
