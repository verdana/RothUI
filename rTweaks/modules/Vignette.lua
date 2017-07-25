-- // rVignette
-- // zork - 2014
-----------------------------
-- VARIABLES
-----------------------------
local an, at = ...

local addon = CreateFrame("Frame")
addon.vignettes = {}
addon.ignore = {
    ["不稳定的虚空传送门"] = true,
}

-----------------------------
-- FUNCTIONS
-----------------------------
local function OnEvent(self, event, id)
    if id and not self.vignettes[id] then
        local x, y, name, icon = C_Vignettes.GetVignetteInfoFromInstanceID(id)
        if name and icon and self.ignore[name] == nil then
            local left, right, top, bottom = GetObjectIconTextureCoords(icon)
            PlaySoundFile("Sound\\Interface\\RaidWarning.wav")
            -- local str = "|TInterface\\MINIMAP\\OBJECTICONS:0:0:0:0:256:256:"..(left*256)..":"..(right*256)..":"..(top*256)..":"..(bottom*256).."|t"
            local str = ""
            RaidNotice_AddMessage(RaidWarningFrame, "发现 " .. str .. (name or "Unknown"), ChatTypeInfo["RAID_WARNING"])
            self.vignettes[id] = true
        end
    end
end

-----------------------------
-- REGISTER/CALL
-----------------------------
addon:RegisterEvent("VIGNETTE_ADDED")
addon:SetScript("OnEvent", OnEvent)
