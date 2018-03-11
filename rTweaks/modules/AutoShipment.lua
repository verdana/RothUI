
-- 当打开对应的框体时，自动制作物体或者招募部队
local markedItems = {
    "破碎命运印记",
    "神器调查笔记",
    "勇士武器",
    "聚焦水晶",
    "冰霜十字架",
}
local markedFollowers = {
    -- 法师
    [660]   = true,     -- 水元素
    [768]   = true,     -- 肯瑞托召唤师
    [1007]  = true,     -- 肯瑞托卫士

    -- 猎人
    [671]   = true,     -- 弓箭手小队
    [672]   = true,     -- 追踪者
    [800]   = true,     -- 探路者

    -- 盗贼
    [907]   = true,     -- 海盗
    [680]   = true,     -- 盗匪
    [681]   = true,     -- 迪菲亚盗贼

    -- 死亡骑士
    [662]   = true,     -- 结群食尸鬼
    [894]   = true,     -- 黑锋掠夺者
}

local CreateAllAndQuit = function(frame)
    GarrisonCapacitiveDisplayFrame.CreateAllWorkOrdersButton:Click()
    GarrisonCapacitiveDisplayFrame.CreateAllWorkOrdersButton:SetEnabled(false)
    frame:UnregisterEvent("SHIPMENT_CRAFTER_INFO")
end

local autoRecruit = CreateFrame("Frame") do
    autoRecruit:RegisterEvent("SHIPMENT_CRAFTER_OPENED")
    autoRecruit:SetScript("OnEvent", function(self, event, ...)
        if event == "SHIPMENT_CRAFTER_OPENED" then
            autoRecruit:RegisterEvent("SHIPMENT_CRAFTER_INFO")
        elseif event == "SHIPMENT_CRAFTER_INFO" then
            local success, _, maxShipments, ownedShipments, plotID = ...
            if success ~= 0 then
                local numPending = C_Garrison.GetNumPendingShipments()
                if (not numPending) then
                    return
                end

                local available = max(maxShipments - numPending - ownedShipments, 0)
                if available >= 1 then
                    local name, _, _, itemID, followerID, _ = C_Garrison.GetShipmentItemInfo()

                    -- 制造物品
                    for id, item in ipairs(markedItems) do
                        if item == name then
                            print("|cFF1EFF00制造|r|cFFFFD200" .. name)
                            CreateAllAndQuit(autoRecruit)
                            return
                        end
                    end

                    -- 招募部队
                    if markedFollowers[followerID] then
                        print("|cFF1EFF00招募|r|cFFFFD200" .. C_Garrison.GetFollowerInfo(followerID).name)
                        CreateAllAndQuit(autoRecruit)
                        return
                    end

                    -- 其它
                    if nil ~= followerID then
                        print(string.format("followerID = %d", followerID))
                    end
                    autoRecruit:UnregisterEvent("SHIPMENT_CRAFTER_INFO")
                    return
               end
            end
        end
    end)
end

