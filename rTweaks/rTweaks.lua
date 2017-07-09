
-- 修改战斗字体
DAMAGE_TEXT_FONT = "Fonts\\DAMAGE.ttf"

-- 进入战斗后自动打开敌方姓名板
local np = CreateFrame("Frame")
do
    np:RegisterEvent("PLAYER_REGEN_ENABLED")
    np:RegisterEvent("PLAYER_REGEN_DISABLED")
    np:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_REGEN_ENABLED" then
            SetCVar("nameplateShowEnemies", 0)  -- 离开战斗
        elseif event == "PLAYER_REGEN_DISABLED" then
            SetCVar("nameplateShowEnemies", 1)  -- 进入战斗
        end
    end)
end

-- 退出战斗时自动清理内存
local gc = CreateFrame("Frame")
do
    gc:RegisterEvent("PLAYER_REGEN_ENABLED")
    gc:SetScript("OnEvent", function() _G.collectgarbage("collect") end)
    gc:SetScript("OnEvent", eventHandler)
end

-- 导出变量信息
function dump(o)
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

-- 关闭 TalkingHead 太烦人了！
UIParent:UnregisterEvent("TALKINGHEAD_REQUESTED")

