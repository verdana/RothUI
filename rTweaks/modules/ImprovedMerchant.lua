
-- 自定义需要卖出的非灰色物品
local CustomItems = {
    [33820]  = true, -- 饱经风霜的渔帽
}

local YFC = YELLOW_FONT_COLOR
local RFC = RED_FONT_COLOR

-- TODO 保留一些超级鱼虫
local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
    local count = 0
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            local _, count, _, quality, _, _, link, _, novalue, itemID = GetContainerItemInfo(bag, slot)
            if itemID and not novalue then
                local price = select(11, GetItemInfo(itemID))
                if price then
                    if CustomItems[itemID] or quality == 0 then
                        UseContainerItem(bag, slot)
                        PickupMerchantItem()

                        -- 计算收益
                        local sum = price * count
                        count = count + sum
                        DEFAULT_CHAT_FRAME:AddMessage("你卖出了：" .. link, 0, 2/3, 0)
                    end
                end
            end
        end
    end
    if count > 0 then
        local g, s, c = math.floor(count/10000) or 0, math.floor((count%10000)/100) or 0, count%100
        DEFAULT_CHAT_FRAME:AddMessage("Your vendor trash has been sold and you earned |cffffffff"..g.."|cffffd700g |cffffffff"..s.."|cffc7c7cfs|cffffffff "..c.."|cffeda55fc|r.", YFC.r, YFC.g, YFC.b)
    end

    hooksecurefunc("MerchantItemButton_OnModifiedClick", function(self, button)
        if (button=="RightButton") and IsShiftKeyDown() then
            OpenStackSplitFrame(100000, self, "BOTTOMLEFT", "TOPLEFT")
        end
    end)

    if CanMerchantRepair() then
        cost, possible = GetRepairAllCost()
        if cost > 0 then
            if possible then
                RepairAllItems()
                local c = cost%100
                local s = math.floor((cost%10000)/100)
                local g = math.floor(cost/10000)
                DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired for |cffffffff"..g.."|cffffd700g |cffffffff"..s.."|cffc7c7cfs|cffffffff "..c.."|cffeda55fc|r.", YFC.r, YFC.g, YFC.b)
            else
                DEFAULT_CHAT_FRAME:AddMessage("You don't have enough money for repair!", RFC.r, RFC.g, RFC.b)
            end
        end
    end
end)
f:RegisterEvent("MERCHANT_SHOW")

