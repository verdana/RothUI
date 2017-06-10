--[[
自动把战斗石邮寄给主号
--]]

-- 物品会被自动邮寄给这个角色
local player = "月遥"
local realm = "黑龙军团"

-- 自动邮寄的物品
local items = {
    [92665] = "无瑕元素战斗石",
    [92675] = "无瑕野兽战斗石",
    [92676] = "无瑕小动物战斗石",
    [92678] = "无瑕魔法战斗石",
    [92679] = "无瑕水栖战斗石",
    [92680] = "无瑕机械战斗石",
    [92681] = "无瑕亡灵战斗石",
}

-- 注册一个 Frame
local AutoMail = CreateFrame('Frame')
AutoMail:SetScript('OnEvent', function(self, event, ...)
    self[event](self, event, ...)
end)
AutoMail:RegisterEvent'MAIL_SHOW'
AutoMail:RegisterEvent'MAIL_CLOSE'

-- 当玩家打开邮箱时
function AutoMail:MAIL_SHOW(event, up)
    -- 如果是收信角色登录
    local name = UnitName("player")
    if player == name and realm == GetRealmName() then
        return nil
    end

    -- 扫描包裹里面的物品
    if self:ScanBags() then
        -- 切换到发件箱
        MailFrameTab_OnClick(self, 2)

        -- 设定邮寄人
        SendMailNameEditBox:SetText(player .. "-" .. realm)

        -- 送出邮件
        SendMailFrame_SendMail()

        -- 关闭发件箱
        -- HideUIPanel(MailFrame)
    end
end

-- 检测你的包裹
function AutoMail:ScanBags()
    local hasItems = false
    for bag=0, NUM_BAG_SLOTS do
        for slot=1, GetContainerNumSlots(bag) do
            local itemId = GetContainerItemID(bag, slot)
            if items[itemId] then
                PickupContainerItem(bag, slot)
                ClickSendMailItemButton()
                hasItems = true
            end
        end
    end
    return hasItems
end

