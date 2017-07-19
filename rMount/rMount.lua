
local rMount = CreateFrame("Frame")
rMount:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)

-- 注册事件
rMount:RegisterEvent("ADDON_LOADED")

-- 创建扫描按钮
function CreateScanButton()
    local button = CreateFrame("Button", "MountJournalScanButton", MountJournal, "MagicButtonTemplate")
    button:SetText("扫描")
    button:SetPoint("BOTTOMRIGHT")
    button:SetSize(140, 22)
    MagicButton_OnLoad(button)  -- magic button should be created in xml
    button.RightSeparator:Hide()

    -- 添加鼠标提示
    button:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        GameTooltip:SetText("扫描坐骑", 1, 1, 1);
        GameTooltip:AddLine("扫描偏好的坐骑，之后可以使用 /mount 宏随机召唤坐骑了", nil, nil, nil, true)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    -- 点击动作
    button:SetScript("OnClick", function(self)
        ScanMounts()
    end)
end

-- 扫描所有的坐骑信息
function ScanMounts()
    -- 首先清空已保存的数据
    MountsDB["ground"]  = {}
    MountsDB["flyable"] = {}

    -- 暴雪的 API C_MountJournal.SummonByID(0);
    -- 在有些地图中无法正确判断是否可以飞行
    local count    = 0
    local mountIDs = C_MountJournal.GetMountIDs();
    for i, mountID in ipairs(mountIDs) do
        local _, spellID, _, _, isUsable, _, isFavorite, _, _, hideOnChar, isCollected = C_MountJournal.GetMountInfoByID(mountID)
        if isCollected and isFavorite and hideOnChar == false then
            local _, _, _, _, mountType = C_MountJournal.GetMountInfoExtraByID(mountID)
            if mountType == 230 or mountType == 269 then
                -- 230 为普通地面坐骑, 269 为水面坐骑，比如水黾
                table.insert(MountsDB["ground"], mountID)
            elseif mountType == 248 then
                -- 248 为飞行坐骑，包括可自适应地形的，比如无敌
                table.insert(MountsDB["flyable"], mountID)
            else
                -- 其他各种水下坐骑，特殊区域坐骑（如安其拉的4色虫子）
                -- 还是交给暴雪的 API 自己判断吧！
            end

            count = count + 1
        end
    end

    DEFAULT_CHAT_FRAME:AddMessage(string.format("扫描完毕，您总共收藏了 %d 只坐骑！", count), YELLOW_FONT_COLOR.r, YELLOW_FONT_COLOR.g, YELLOW_FONT_COLOR.b)
end

-- 事件方法
function rMount:ADDON_LOADED(event, name)
    if name ~= "rMount" then return end

    -- 默认的数据库变量
    if not MountsDB or not MountsDB["ground"] or not MountsDB["flyable"] then
        MountsDB = {
            ["ground"]  = {},
            ["flyable"] = {},
        }
    end

    -- 建立按钮
    CreateScanButton()
end

-- vim: set fdm=indent ts=4 sw=4 tw=0 et :

