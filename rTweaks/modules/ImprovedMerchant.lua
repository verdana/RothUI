
-- 自定义需要卖出的非灰色物品
local CustomItems = {
    [33820]  = true, -- 饱经风霜的渔帽
    [45991]  = true, -- 骨质鱼竿
    [45992]  = true, -- 珠宝鱼竿
    [67404]  = true, -- 玻璃浮漂
    [109222] = true, -- 德拉诺法力药水
    [109226] = true, -- 德拉诺活力药水

    [118380] = true, -- 超级捕鱼帽
    [118381] = true, -- 日抛型鱼竿
    [118391] = true, -- 超级鱼虫
    [118393] = true, -- 带触须的帽子

    [110274] = true, -- 无颚潜鱼鱼饵
    [110289] = true, -- 塘鲈鱼饵
    [110290] = true, -- 盲眼湖鲟鱼饵
    [110291] = true, -- 熔火鱿鱼鱼饵
    [110292] = true, -- 海蝎子鱼饵
    [110293] = true, -- 深渊大嘴鳗鱼饵
    [110294] = true, -- 黑水鞭尾鱼鱼饵
}

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
                        print("卖出物品：" .. link)
                    end
                end
            end
        end
    end
    if count > 0 then
        local g, s, c = math.floor(count/10000) or 0, math.floor((count%10000)/100) or 0, count%100
        DEFAULT_CHAT_FRAME:AddMessage("Your vendor trash has been sold and you earned |cffffffff"..g.."|cffffd700g |cffffffff"..s.."|cffc7c7cfs|cffffffff "..c.."|cffeda55fc|r.",255,255,0)
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
                DEFAULT_CHAT_FRAME:AddMessage("Your items have been repaired for |cffffffff"..g.."|cffffd700g |cffffffff"..s.."|cffc7c7cfs|cffffffff "..c.."|cffeda55fc|r.",255,255,0)
            else
                DEFAULT_CHAT_FRAME:AddMessage("You don't have enough money for repair!",255,0,0)
            end
        end
    end
end)
f:RegisterEvent("MERCHANT_SHOW")