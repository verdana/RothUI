
-- 打开银行界面时自动放入材料
local frame = CreateFrame("Frame")
frame:RegisterEvent("BANKFRAME_OPENED")
frame:SetScript("OnEvent", function(self, event, ...)
    if not BankFrameItemButton_Update_OLD then
        BankFrameItemButton_Update_OLD = BankFrameItemButton_Update

        BankFrameItemButton_Update = function(button)
            if BankFrameItemButton_Update_PASS == false then
                BankFrameItemButton_Update_OLD(button)
            else
                BankFrameItemButton_Update_PASS = false
            end
        end
    end

    BankFrameItemButton_Update_PASS = true
    DepositReagentBank()
    DEFAULT_CHAT_FRAME:AddMessage("材料已自动放入材料银行。", YELLOW_FONT_COLOR.r, YELLOW_FONT_COLOR.g, YELLOW_FONT_COLOR.b)
end)

