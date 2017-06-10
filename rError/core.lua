
-- Which messages to remove
local Blacklists = {
    [LE_GAME_ERR_ABILITY_COOLDOWN]                 = true,
    [LE_GAME_ERR_ATTACK_DEAD]                      = true,
    [LE_GAME_ERR_GENERIC_NO_TARGET]                = true,
    [LE_GAME_ERR_INVALID_ATTACK_TARGET]            = true,
    [LE_GAME_ERR_ITEM_COOLDOWN]                    = true,
    [LE_GAME_ERR_NO_ATTACK_TARGET]                 = true,
    [LE_GAME_ERR_OUT_OF_ENERGY]                    = true,
    [LE_GAME_ERR_OUT_OF_FOCUS]                     = true,
    [LE_GAME_ERR_OUT_OF_RUNIC_POWER]               = true,
    [LE_GAME_ERR_SPELL_COOLDOWN]                   = true,
    [LE_GAME_ERR_SPELL_FAILED_ANOTHER_IN_PROGRESS] = true,
    [LE_GAME_ERR_SPELL_FAILED_S]                   = true,
    [LE_GAME_ERR_SPELL_OUT_OF_RANGE]               = true,
}

local useCombatTextToShowErrors = false

-- Disable default error message
UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")

local frame = CreateFrame("Frame")
frame.UI_ERROR_MESSAGE = function(self, event, errType, message)
    if (not Blacklists[errType]) then
        if CombatText_AddMessage and useCombatTextToShowErrors then
            CombatText_AddMessage(errType, COMBAT_TEXT_SCROLL_FUNCTION, 1, 0, 0, "sticky", nil)
        else
            UIErrorsFrame:AddMessage(message, 1, .1, .1)
        end

        -- for debug
        -- print("[" .. errType .. "] " .. GetGameMessageInfo(errType))
    end
end

frame:SetScript("OnEvent", function(self, event, ...)
    self[event](self, event, ...)
end)

frame:RegisterEvent "UI_ERROR_MESSAGE"
