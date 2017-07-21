-- // rInfostrings
-- // zork - 2012
-----------------------------
-- INIT
-----------------------------
--get the addon namespace
local addon, ns = ...
local cfg = CreateFrame("Frame")
ns.cfg = cfg

-----------------------------
-- CONFIG
-----------------------------
cfg.frame = {
    scale       = 1.0,
    pos         = {a1 = "TOP", af = Minimap, a2 = "BOTTOM", x = 0, y = -30},
    userplaced  = true,
}

cfg.maxAddons = 10     -- 最多显示多少个插件的内存信息
cfg.fontSize  = 13     -- 字体大小
cfg.showXpRep = false  -- 是否显示经验/声望值
cfg.showMail  = false  -- 是否显示新邮件

-- 是否显示《军团再临》代币
-- www.wowhead.com/legion-currencies
cfg.showCurrencies = {
    1220,  -- 职业大厅资源
    1342,  -- 抗魔联军战争物资
    1226,  -- 虚空碎片
    1155,  -- 远古魔力
    1273,  -- 破碎命运印记
    1149,  -- 盲目之眼
    1275,  -- 古怪硬币
    1166,  -- 时空扭曲徽章
}

