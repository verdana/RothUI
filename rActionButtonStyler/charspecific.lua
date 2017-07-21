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

if playername == "Zörk" then
    cfg.hotkeys.show = false
    cfg.macroname.show = false
end

-- vim: set fdm=indent ts=4 sw=4 tw=0 et :

