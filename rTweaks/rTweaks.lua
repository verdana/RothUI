
local Tweak = CreateFrame("Frame")
Tweak:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)

-- 注册事件
Tweak:RegisterEvent("ADDON_LOADED")
Tweak:RegisterEvent("PLAYER_REGEN_ENABLED")
Tweak:RegisterEvent("PLAYER_REGEN_DISABLED")

-- 插件载入时
function Tweak:ADDON_LOADED(event, name)
    if name ~= "rTweaks" then return end
    -- do something
end

-- 进入战斗时打开敌方姓名板
function Tweak:PLAYER_REGEN_DISABLED()
    SetCVar("nameplateShowEnemies", 1)
end

-- 离开战斗时关闭敌方姓名板
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

-- 修改战斗字体
DAMAGE_TEXT_FONT = "Fonts\\DAMAGE.ttf"

-- 关闭烦人的 TalkingHead， 太烦人了！
UIParent:UnregisterEvent("TALKINGHEAD_REQUESTED")

-- vim: set fdm=indent ts=4 sw=4 tw=0 et :

