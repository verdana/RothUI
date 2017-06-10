
-- 载入要塞追随者 UI
if (not IsAddOnLoaded("Blizzard_GarrisonUI")) then LoadAddOn("Blizzard_GarrisonUI") end

-- 统计所有追随者的职业
local GetAllClassSpecs = function()
    local data = {}
    local followers = C_Garrison.GetFollowers(LE_FOLLOWER_TYPE_GARRISON_6_0)
    for i = 1, #followers do
        local follower = followers[i]
        if follower.isCollected then -- 已经拥有的
            if not data[follower.classSpec] then
                data[follower.classSpec] = {}
            end
            table.insert(data[follower.classSpec], {
                name    = follower.name,
                level   = follower.level,
                iLevel  = follower.iLevel,
                quality = follower.quality,
                status  = follower.status
            })
        end
    end
    return data
end

-- 在旅馆招募界面显示出3个可选追随者的名字下方显示职业信息
hooksecurefunc("GarrisonRecruitSelectFrame_UpdateRecruits", function(waiting)
    if not waiting then
        local classSpecs   = GetAllClassSpecs()
        local recruitFrame = GarrisonRecruitSelectFrame.FollowerSelection
        local followers    = C_Garrison.GetAvailableRecruits()
        for i=1, 3 do
            local follower = followers[i]
            local frame    = recruitFrame["Recruit"..i]
            if follower then
                local classFrame = CreateFrame("frame", nil, frame)
                classFrame:SetSize(120, 30)
                classFrame:SetPoint("LEFT", frame, "TOPLEFT", 66, -48)

                local classFont  = classFrame:CreateFontString(nil, "BACKGROUND")
                classFont:SetFontObject(GameFontNormal)
                classFont:SetJustifyH("LEFT")
                classFont:SetPoint("LEFT", classFrame)
                classFont:SetText(follower.className)

                local class = follower.classAtlas:match('^GarrMission_ClassIcon%-(.+)$'):upper()
                local classColor = RAID_CLASS_COLORS[class]
                classFont:SetTextColor(classColor.r, classColor.g, classColor.b)

                classFrame:SetScript("OnEnter", function()
                    GameTooltip:SetOwner(classFrame, "ANCHOR_BOTTOMLEFT", 0, 25)
                    GameTooltip:SetText("相同职业的追随者：")

                    if not classSpecs[follower.classSpec] then
                        GameTooltip:AddLine(GRAY_FONT_COLOR_CODE .. "无此职业", 1, 1, 1, 1)
                    else
                        for i=1, #classSpecs[follower.classSpec] do
                            local f = classSpecs[follower.classSpec][i]

                            -- 追随者的品质（为名字着色）
                            local color = ITEM_QUALITY_COLORS[f.quality].hex

                            -- 追随者的等级或者装等
                            local level = tostring(f.level < 100 and f.level or f.iLevel)

                            -- 追随者的状态
                            local status = ""
                            if f.status == GARRISON_FOLLOWER_INACTIVE then
                                status = RED_FONT_COLOR_CODE .. " (" .. GARRISON_FOLLOWER_INACTIVE .. ")"
                            elseif f.status == GARRISON_FOLLOWER_WORKING then
                                status = YELLOW_FONT_COLOR_CODE .. " (" .. GARRISON_FOLLOWER_WORKING .. ")"
                            end

                            GameTooltip:AddLine(color .. "[" .. level .. "] " .. f.name .. status, 1, 1, 1, 1)
                        end
                    end
                    GameTooltip:Show()
                end)

                classFrame:SetScript("OnLeave", function() GameTooltip:Hide() end)
            end
        end
    end
end)
