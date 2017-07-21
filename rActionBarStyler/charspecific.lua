
-----------------------------
-- INIT
-----------------------------

--get the addon namespace
local addon, ns = ...
local cfg = ns.cfg

-----------------------------
-- CHARSPECIFIC REWRITES
-----------------------------

local playername, _ = UnitName("player")
local _, playerclass = UnitClass("player")
local realm = GetRealmName()

cfg.bars.bar4.mouseover.enable = false
cfg.bars.bar5.mouseover.enable = false

