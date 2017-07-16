
-- 修改战斗字体
DAMAGE_TEXT_FONT = "Fonts\\DAMAGE.ttf"

-- 进入战斗后自动打开敌方姓名板
local Tweak = CreateFrame("Frame")
Tweak:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)

-- 注册事件
Tweak:RegisterEvent("ADDON_LOADED")
Tweak:RegisterEvent("PLAYER_REGEN_ENABLED")
Tweak:RegisterEvent("PLAYER_REGEN_DISABLED")

-- 插件载入时
function Tweak:ADDON_LOADED(event, name)
    if name ~= "rTweaks" then return end

    -- 加载所有的坐骑信息
    -- /mount 命令会用到
    -- 暴雪的 API C_MountJournal.SummonByID(0);
    -- 在有些地图中无法正确判断是否可以飞行
    if not MountsDB then
        MountsDB = {
            ["ground"]  = {},
            ["flyable"] = {},
        }
    end
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
        end
    end
end

-- 进入战斗时打开姓名板
function Tweak:PLAYER_REGEN_DISABLED()
    SetCVar("nameplateShowEnemies", 1)
end

-- 离开战斗时关闭地方姓名板
function Tweak:PLAYER_REGEN_ENABLED()
    SetCVar("nameplateShowEnemies", 0)
end

-- 导出变量信息
local dump = function(o)
    if type(o) == 'table' then
        local s = '{ '
        for k,v in pairs(o) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- 关闭烦人的 TalkingHead， 太烦人了！
UIParent:UnregisterEvent("TALKINGHEAD_REQUESTED")

-- vim: set fdm=indent ts=4 sw=4 tw=0 et :

