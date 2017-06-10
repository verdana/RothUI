local _, ns = ...
ns.setting = {
    EnableExecute = false,  -- 开启斩杀提示
    OnlyShowBoss = false,   -- 仅显示Boss的斩杀提示
    AutoThreshold = true,   -- 根据职业自动判断斩杀阶段
    ExecuteThreshold = 0.2, -- 斩杀阶段血量
}

ns.texts = {
    EnterCombat = {
        "进入战斗",
    },
    LeaveCombat = {
        "离开战斗",
    },
    ExecutePhase = {
        "灵魂收割",
    },
}

-- 每个职业每个天赋的斩杀阶段血量，统计可能不准确，0即为不显示，3个数字依次是3系天赋
ns.class = {
    ["WARRIOR"]     = {0.2, 0.2, 0.2},
    ["DRUID"]       = {0, 0.25, 0.25},
    ["PALADIN"]     = {0, 0, 0.2},
    ["PRIEST"]      = {0, 0, 0.20},
    ["DEATHKNIGHT"] = {0.47, 0.47, 0.47},
    ["WARLOCK"]     = {0.25, 0.25, 0.20},
    ["ROGUE"]       = {0.35, 0, 0},
    ["HUNTER"]      = {0.2, 0.2, 0.2},
    ["MAGE"]        = {0, 0.35, 0},
    ["SHAMAN"]      = {0, 0, 0},
    ["MONK"]        = {0, 0, 0},
    ["DEMONHUNTER"] = {0, 0, 0},
}

local MyAddon = CreateFrame("Frame")
local imsg = CreateFrame("Frame", "CombatAlert")
imsg:SetSize(400, 50)
imsg:SetPoint("CENTER", 0, 200)
imsg:Hide()
imsg.bg = imsg:CreateTexture(nil, 'BACKGROUND')
imsg.bg:SetTexture([[Interface\LevelUp\LevelUpTex]])
imsg.bg:SetPoint('BOTTOM')
imsg.bg:SetSize(300, 50)
imsg.bg:SetTexCoord(0.00195313, 0.63867188, 0.03710938, 0.23828125)
imsg.bg:SetVertexColor(1, 1, 1, 0.6)

imsg.lineTop = imsg:CreateTexture(nil, 'BACKGROUND')
imsg.lineTop:SetDrawLayer('BACKGROUND', 2)
imsg.lineTop:SetTexture([[Interface\LevelUp\LevelUpTex]])
imsg.lineTop:SetPoint("TOP")
imsg.lineTop:SetSize(400, 5)
imsg.lineTop:SetTexCoord(0.00195313, 0.81835938, 0.01953125, 0.03320313)

imsg.lineBottom = imsg:CreateTexture(nil, 'BACKGROUND')
imsg.lineBottom:SetDrawLayer('BACKGROUND', 2)
imsg.lineBottom:SetTexture([[Interface\LevelUp\LevelUpTex]])
imsg.lineBottom:SetPoint("BOTTOM")
imsg.lineBottom:SetSize(400, 5)
imsg.lineBottom:SetTexCoord(0.00195313, 0.81835938, 0.01953125, 0.03320313)

imsg.text = imsg:CreateFontString(nil, 'ARTWORK', 'GameFont_Gigantic')
imsg.text:SetFont("Fonts\\FRIZQT__.TTF", 20, select(3, imsg.text:GetFont()))
imsg.text:SetPoint("CENTER", 0, -4)
imsg.text:SetTextColor(1, 0.82, 0)
imsg.text:SetJustifyH("CENTER")

local flag = 0
ExecuteThreshold = ns.setting.ExecuteThreshold
local function ShowAlert(texts)
    CombatAlert.text:SetText(texts[math.random(1, table.getn(texts))])
    CombatAlert:Show()
end

MyAddon:RegisterEvent("PLAYER_REGEN_ENABLED")
MyAddon:RegisterEvent("PLAYER_REGEN_DISABLED")
if ns.setting.EnableExecute then
    MyAddon:RegisterEvent("UNIT_HEALTH")
    MyAddon:RegisterEvent("PLAYER_TARGET_CHANGED")
end
if ns.setting.AutoThreshold then
    MyAddon:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
    MyAddon:RegisterEvent("PLAYER_ENTERING_WORLD")
end

MyAddon:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_DISABLED" then
        ShowAlert(ns.texts.EnterCombat)
        flag = 0
    elseif event == "PLAYER_REGEN_ENABLED" then
        ShowAlert(ns.texts.LeaveCombat)
        flag = 0
    elseif event == "PLAYER_TARGET_CHANGED" then
        flag = 0
    elseif event == "UNIT_HEALTH" then
        if (UnitName("target") and UnitCanAttack("player", "target") and not UnitIsDead("target") and (UnitHealth("target") / UnitHealthMax("target") < ExecuteThreshold) and flag == 0) then
            if ((ns.setting.OnlyShowBoss and UnitLevel("target") == -1) or (not ns.setting.OnlyShowBoss)) then
                ShowAlert(ns.texts.ExecutePhase)
                flag = 1
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" or event == "ACTIVE_TALENT_GROUP_CHANGED" then
        ExecuteThreshold = ns.class[select(2, UnitClass("player"))][GetSpecialization() or 1]
    end
end)

local timer = 1
imsg:SetScript("OnShow", function(self)
    timer = 0
    self:SetScript("OnUpdate", function(self, elasped)
        timer = timer + elasped
        if (timer < 0.5) then self:SetAlpha(timer * 2) end
        if (timer > 1 and timer < 1.5) then self:SetAlpha(1 - (timer - 1) * 2) end
        if (timer >= 1.5) then self:Hide() end
    end)
end)
