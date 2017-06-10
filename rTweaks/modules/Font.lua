-- 默认字体
local font = "Fonts\\ARIALN.TTF"

-- 调整数字字体，原版去掉了描边，结果产生了毛刺
NumberFontNormalSmall:SetFont(font, 12, "OUTLINE")
NumberFontNormalSmallGray:SetFont(font, 12, "OUTLINE")

-- 修复查询页面角色等级文字被裁剪的问题
for i = 1,20 do
    local button = _G["WhoFrameButton"..i]
    if button then
        local name = _G["WhoFrameButton"..i.."Name"];
        name:SetFont(font, 14, "OUTLINE")

        local variable = _G["WhoFrameButton"..i.."Variable"];
        variable:SetFont(font, 14, "OUTLINE")

        local level = _G["WhoFrameButton"..i.."Level"];
        level:SetFont(font, 14, "OUTLINE")
        level:SetJustifyH("LEFT")
        level:SetWidth(level:GetWidth() + 5)

        local class = _G["WhoFrameButton"..i.."Class"];
        class:SetFont(font, 14, "OUTLINE")
    end
end

