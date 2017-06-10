-- 将小地图时间文字稍微向下移动
if IsAddOnLoaded("rMinimap") then
    LoadAddOn("Blizzard_TimeManager")
    TimeManagerClockTicker:SetPoint("CENTER", TimeManagerClockButton, "CENTER", 0, -8)
end

-- 追随者界面的小地图按钮移动到地图下面
do
    GarrisonLandingPageMinimapButton:ClearAllPoints()
    GarrisonLandingPageMinimapButton:SetPoint("TOP", rABS_MultiBarRight, "TOP", 0, 100)
    GarrisonLandingPageMinimapButton:SetSize(75, 75)
    GarrisonLandingPageMinimapButton:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_NONE")
        GameTooltip:SetPoint("RIGHT", self, "LEFT")
        GameTooltip:SetText(GARRISON_LANDING_PAGE_TITLE, 1, 1, 1)
        GameTooltip:AddLine(MINIMAP_GARRISON_LANDING_PAGE_TOOLTIP, nil, nil, nil, true)
        GameTooltip:Show()
    end)
end

-- 使整个 ObjectiveTrackerFrame 可以移动
do
    local otf = ObjectiveTrackerFrame
    otf:SetClampedToScreen(true)
    otf:ClearAllPoints()
    otf.ClearAllPoints = function() end
    otf:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOM", -150, -30)
    -- otf.SetPoint = function() end
    otf:SetMovable(true)
    otf:SetUserPlaced(true)
    otf:SetHeight(500)
    otf.HeaderMenu.MinimizeButton:Hide()

    local mover = CreateFrame("FRAME", nil, otf)
    mover:SetHeight(25)
    mover:SetPoint("TOPLEFT", otf, 0, 0)
    mover:SetPoint("TOPRIGHT", otf)
    mover:EnableMouse(true)
    mover:RegisterForDrag("LeftButton")

    mover:SetScript("OnDragStart", function(self, button)
        if IsModifiedClick() and button == "LeftButton" then
            local f = self:GetParent()
            f:StartMoving()
        end
    end)

    mover:SetScript("OnDragStop", function(self, button)
        local f = self:GetParent()
        f:StopMovingOrSizing()
    end)

    mover:SetScript("OnEnter", function(s)
        if C_Scenario.IsInScenario() or GetNumQuestWatches() > 0 or GetNumTrackedAchievements() > 0 then
            GameTooltip:SetOwner(s, "ANCHOR_TOPRIGHT")
            GameTooltip:AddLine("", 0, 1, .5)
            GameTooltip:SetText("按住 Ctrl/Alt/Shift 后拖动")
            GameTooltip:Show()
        end
    end)

    mover:SetScript("OnLeave", function(s)
        GameTooltip:Hide()
    end)
end

-- 加大 <团队信息> 界面
do
    local buttonHeight = RaidInfoScrollFrameButton1:GetHeight()
    local scrollFrameHeight = RaidInfoScrollFrame:GetHeight()
    local raidInfoFrameHeight = RaidInfoFrame:GetHeight()

    RaidInfoScrollFrame:SetHeight(scrollFrameHeight + (buttonHeight * 5))
    RaidInfoFrame:SetHeight(raidInfoFrameHeight + (buttonHeight * 5))

    HybridScrollFrame_CreateButtons(RaidInfoScrollFrame, "RaidInfoInstanceTemplate")
end

-- 可移动特殊能量框体 比如魔古山1号
do
    PlayerPowerBarAlt:SetScale(0.75)
    PlayerPowerBarAlt:SetMovable(true)
    PlayerPowerBarAlt:SetUserPlaced(true)
    PlayerPowerBarAlt:SetFrameStrata("HIGH")
    PlayerPowerBarAlt:SetScript("OnMouseDown", function()
        if (IsAltKeyDown()) then
            PlayerPowerBarAlt:ClearAllPoints()
            PlayerPowerBarAlt:StartMoving()
        end
    end)

    PlayerPowerBarAlt:SetScript('OnMouseUp', function(self, button)
        PlayerPowerBarAlt:StopMovingOrSizing()
    end)

    PlayerPowerBarAlt:SetPoint("BOTTOM", rABS_MultiBarBottomRight, "TOP", 0, 8)
end

-- 任务奖励物品着色，并略微调整字体大小
hooksecurefunc('QuestInfo_GetRewardButton', function(rewardsFrame, index)
    local questItem = rewardsFrame.RewardButtons[index]
    local _, quality
    if QuestInfoFrame.questLog then
        local choices = GetNumQuestLogChoices()
        if index > choices then -- is reward
            index = index - choices
            _, _, _, quality = GetQuestLogRewardInfo(index)
        else -- is choice
            _, _, _, quality = GetQuestLogChoiceInfo(index)
        end
    else
        local choices = GetNumQuestChoices()
        if index > choices then -- is reward
            index = index - choices
            _, _, _, quality = GetQuestItemInfo('reward', index)
        else -- is choice
            _, _, _, quality = GetQuestItemInfo('choice', index)
        end
    end

    -- 着色
    if quality and quality >= 2 then
        local color = ITEM_QUALITY_COLORS[quality]
        questItem.Name:SetTextColor(color.r or 1, color.g or 1, color.b or 1)
    else
        questItem.Name:SetTextColor(1, 1, 1)
    end

    -- 重设字体大小
    questItem.Name:SetTextHeight(13)
end)

-- 玻璃渣代码中的BUG导致玩家进入載具状态时
-- 没有隐藏 TempEnchant3
hooksecurefunc('TemporaryEnchantFrame_Hide', function()
    if ( BuffFrame.numEnchants > 0 ) then
        BuffFrame.numEnchants = 0;
        BuffFrame_Update();
    end
    for i=1, NUM_TEMP_ENCHANT_FRAMES do
        _G["TempEnchant"..i]:Hide();
        _G["TempEnchant"..i.."Duration"]:Hide();
    end
end)

