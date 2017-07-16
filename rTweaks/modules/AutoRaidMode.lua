-- 该脚本用来在玩家到达某个地下城附近时自动切换到设定的难度
-- 主要方便玩家单刷某些低级团队副本

-- 设置地下城难度
-- /run SetDungeonDifficultyID(#)
-- 1  -> 普通
-- 2  -> 英雄
-- 8  -> 挑战
-- 23 -> 史诗
local Dungeons = {
    ["旋云之巅"]     = 2,
    ["祖尔格拉布"]   = 2,
}

-- 设置旧世界团队副本难度
-- /run SetLegacyRaidDifficultyID(#)
------------------------------------
-- 1.	"Normal" (Dungeons)
-- 2.	"Heroic" (Dungeons)
-- 3.	"10 Player"
-- 4.	"25 Player"
-- 5.	"10 Player (Heroic)"
-- 6.	"25 Player (Heroic)"
-- 7.	"Looking For Raid" (Legacy; everything prior to Siege of Orgrimmar)
-- 8.	"Challenge Mode"
-- 9.	"40 Player"
-- 11.	"Heroic Scenario"
-- 12.	"Normal Scenario"
-- 14.	"Normal" (Raids)
-- 15.	"Heroic" (Raids)
-- 16.	"Mythic" (Raids)
-- 17.	"Looking For Raid"
-- 18.	"Event"
-- 19.	"Event"
-- 20.	"Event Scenario"
-- 23.	"Mythic" (Dungeons)
-- 24.	"Timewalker"
------------------------------------

local Raids = {
    ["奥妮克希亚的巢穴"] = 4,
    ["奥杜尔"]           = 4,

    ["纳克萨玛斯"]       = 4,
    ["银色比武场"]       = 6,
    ["冰冠堡垒"]         = 6,

    ["时光之穴"]         = 6,
    ["黑翼血环"]         = 6,
    ["风神王座"]         = 6,
    ["烈焰王座"]         = 6,
    ["暮光堡垒"]         = 6,

    ["魔古山圣台"]       = 3,
    ["雷神之基"]         = 5,
    ["永春之门"]         = 6,
}

-- 通过 mapID 以及坐标位置确定副本的位置
-- 取得当前大地图的 mapID
--      /dump GetCurrentMapAreaID()

local AutoRaidMode = CreateFrame('Frame')
AutoRaidMode:RegisterEvent('ZONE_CHANGED')
AutoRaidMode:RegisterEvent('ZONE_CHANGED_INDOORS')
AutoRaidMode:RegisterEvent('ZONE_CHANGED_NEW_AREA')
AutoRaidMode:SetScript('OnEvent', function(self, event, ...)

    -- 如果玩家已经在战场，竞技场，副本，团队副本中
    if IsInInstance() then return end

    local zoneText = GetMinimapZoneText()
    if Dungeons[zoneText] then
        SetDungeonDifficultyID(Dungeons[zoneText])
    end
    if Raids[zoneText] then
        SetLegacyRaidDifficultyID(Raids[zoneText])
    end
end)

