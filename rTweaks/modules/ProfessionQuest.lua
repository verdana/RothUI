--[[
--------------------------------------------------
在专业制造界面创建一个小按钮
当你接到一个专业制造的世界任务时
点击这个按钮自动将自动选中并制造相应的物品
--------------------------------------------------
--]]

local ButtonCreated = false

local AutoProfQuest = CreateFrame("Frame")
AutoProfQuest:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)

AutoProfQuest:RegisterEvent("TRADE_SKILL_SHOW")
AutoProfQuest:RegisterEvent("TRADE_SKILL_CLOSE")
AutoProfQuest:RegisterEvent("TRADE_SHOW")
AutoProfQuest:RegisterEvent("QUEST_ACCEPTED")

local function CreateButton()
    if ButtonCreated == true then return end

    local button = CreateFrame("Button", "AutoProfQuestButton", TradeSkillFrame, "UIPanelButtonTemplate")
    button:SetText("世界任务物品")
    button:SetPoint("RIGHT", TradeSkillFrame.FilterButton, "LEFT", 0, 0)
    button:SetSize(140, 22)
    button:Show()
    ButtonCreated = true

    -- 点击按钮
    button:SetScript("OnClick", function(self)
        for i = 1, GetNumQuestWatches() do
            local questID, title, questLogIndex, numObjectives, requiredMoney, isComplete, startEvent, isAutoComplete, failureTime, timeElapsed, questType, isTask, isBounty, isStory, isOnMap, hasLocalPOI, isHidden = GetQuestWatchInfo(i);
            print(questID .. title)
            if ( questID ) then
                -- see if we already have a block for this quest
                -- local block = QUEST_TRACKER_MODULE:GetExistingBlock(questID);
            end
        end
    end)
end

function AutoProfQuest:TRADE_SKILL_SHOW(event)
    -- CreateButton()
end

function AutoProfQuest:TRADE_SKILL_CLOSE(event)
end

function AutoProfQuest:TRADE_SHOW(event)
end

function AutoProfQuest:QUEST_ACCEPTED(event, questIndex, questID)
end
