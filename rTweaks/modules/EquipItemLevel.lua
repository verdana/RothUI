local _G = getfenv(0)
local xo, yo = 0, -5 -- X-offset, Y-offset
local equiped = {} -- Table to store equiped items
local f = CreateFrame("Frame", nil, _G.PaperDollFrame) -- iLvel number frame
f:RegisterEvent("PLAYER_LOGIN")

-- Tooltip and scanning by Phanx @ http://www.wowinterface.com/forums/showthread.php?p=271406
local S_ITEM_LEVEL = "^" .. gsub(ITEM_LEVEL, "%%d", "(%%d+)")

local scantip = CreateFrame("GameTooltip", "iLvlScanningTooltip", nil, "GameTooltipTemplate")
scantip:SetOwner(UIParent, "ANCHOR_NONE")

local function _getRealItemLevel(slotId)
	local hasItem = scantip:SetInventoryItem("player", slotId)
	if not hasItem then return nil end -- With this we don't get ilvl for offhand if we equip 2h weapon

	for i = 2, scantip:NumLines() do -- Line 1 is always the name so you can skip it.
		local text = _G["iLvlScanningTooltipTextLeft"..i]:GetText()
		if text and text ~= "" then
			local realItemLevel = strmatch(text, S_ITEM_LEVEL)
			if realItemLevel then
				return realItemLevel
			end
		end
	end
end

local function _updateItems()
	for i = 1, 17 do -- Only check changed items or items without ilvl text, skip the shirt (4)
		local itemLink = GetInventoryItemLink("player", i)
		if i ~= 4 and (equiped[i] ~= itemLink or f[i]:GetText() == nil) then
			equiped[i] = itemLink
			f[i]:SetText(_getRealItemLevel(i))
		end
	end
end

local function _createStrings()
	local function _stringFactory(parent, myPoint, parentPoint, x, y)
		local s = f:CreateFontString(nil, "OVERLAY")
		s:SetFont(STANDARD_TEXT_FONT, 12, "THINOUTLINE")
		s:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
		s:SetPoint(myPoint, parent, parentPoint, x or 0, y or 0)
		return s
	end

	f:SetFrameLevel(_G.CharacterHeadSlot:GetFrameLevel())

	f[1]  = _stringFactory(_G.CharacterHeadSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[2]  = _stringFactory(_G.CharacterNeckSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[3]  = _stringFactory(_G.CharacterShoulderSlot, 	"BOTTOM", "BOTTOM", xo, yo)
	f[15] = _stringFactory(_G.CharacterBackSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[5]  = _stringFactory(_G.CharacterChestSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[9]  = _stringFactory(_G.CharacterWristSlot, 		"BOTTOM", "BOTTOM", xo, yo)

	f[10] = _stringFactory(_G.CharacterHandsSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[6]  = _stringFactory(_G.CharacterWaistSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[7]  = _stringFactory(_G.CharacterLegsSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[8]  = _stringFactory(_G.CharacterFeetSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[11] = _stringFactory(_G.CharacterFinger0Slot, 	"BOTTOM", "BOTTOM", xo, yo)
	f[12] = _stringFactory(_G.CharacterFinger1Slot, 	"BOTTOM", "BOTTOM", xo, yo)
	f[13] = _stringFactory(_G.CharacterTrinket0Slot, 	"BOTTOM", "BOTTOM", xo, yo)
	f[14] = _stringFactory(_G.CharacterTrinket1Slot, 	"BOTTOM", "BOTTOM", xo, yo)

	f[16] = _stringFactory(_G.CharacterMainHandSlot, 		"BOTTOM", "BOTTOM", xo, yo)
	f[17] = _stringFactory(_G.CharacterSecondaryHandSlot, 	"BOTTOM", "BOTTOM", xo, yo)

	f:Hide()
end

local function OnEvent(self, event, ...) -- Event handler
	if event == "PLAYER_LOGIN" then
		self:UnregisterEvent(event)

		_createStrings()

		_G.PaperDollFrame:HookScript("OnShow", function(self)
			f:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
			_updateItems()
			f:Show()
		end)

		_G.PaperDollFrame:HookScript("OnHide", function(self)
			f:UnregisterEvent("PLAYER_EQUIPMENT_CHANGED")
			f:Hide()
		end)
	elseif event == "PLAYER_EQUIPMENT_CHANGED" then
		_updateItems()
	end
end
f:SetScript("OnEvent", OnEvent)

-- vim: set fdm=indent ts=4 sw=4 tw=0 et :

