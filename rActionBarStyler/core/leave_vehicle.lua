-----------------------------
-- INIT
-----------------------------

--get the addon namespace
local addon, ns = ...
local gcfg = ns.cfg
--get some values from the namespace
local cfg = gcfg.bars.leave_vehicle
local dragFrameList = ns.dragFrameList

-----------------------------
-- FUNCTIONS
-----------------------------

if not cfg.enable then return end

local num = 1
local buttonList = {}

--create the frame to hold the buttons
local frame = CreateFrame("Frame", "rABS_LeaveVehicle", UIParent, "SecureHandlerStateTemplate")
frame:SetWidth(num*cfg.buttons.size + (num-1)*cfg.buttons.margin + 2*cfg.padding)
frame:SetHeight(cfg.buttons.size + 2*cfg.padding)
frame:SetPoint(cfg.pos.a1,cfg.pos.af,cfg.pos.a2,cfg.pos.x,cfg.pos.y)
frame:SetScale(cfg.scale)

--the button
local button = CreateFrame("BUTTON", "rABS_LeaveVehicleButton", frame, "SecureHandlerClickTemplate, SecureHandlerStateTemplate")
table.insert(buttonList, button) --add the button object to the list
button:SetSize(cfg.buttons.size, cfg.buttons.size)
button:SetPoint("BOTTOMLEFT", frame, cfg.padding, cfg.padding)
button:RegisterForClicks("AnyUp")
button:RegisterEvent("PLAYER_ENTERING_WORLD")
button:RegisterEvent("UPDATE_BONUS_ACTIONBAR")
button:RegisterEvent("UPDATE_MULTI_CAST_ACTIONBAR")
button:RegisterEvent("UNIT_ENTERED_VEHICLE")
button:RegisterEvent("UNIT_EXITED_VEHICLE")
button:RegisterEvent("VEHICLE_UPDATE")

button:SetScript("OnEvent", function(self)
    if (CanExitVehicle() and ActionBarController_GetCurrentActionBarState() == LE_ACTIONBAR_STATE_MAIN) then
        self:Show()
        self:Enable()
    else
        self:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]], "ADD")
        self:UnlockHighlight()
        self:Hide()
    end
end)

button:SetScript("OnClick", function(self)
    if UnitOnTaxi("player") then
        TaxiRequestEarlyLanding()
        self:Disable()
        self:SetHighlightTexture([[Interface\Buttons\CheckButtonHilight]], "ADD")
        self:LockHighlight()
    else
        VehicleExit()
    end
end)

button:SetScript("OnEnter", function(self)
    if ( UnitOnTaxi("player") ) then
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
        GameTooltip:SetText(TAXI_CANCEL, 1, 1, 1);
        GameTooltip:AddLine(TAXI_CANCEL_DESCRIPTION, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, true);
        GameTooltip:Show();
    else
        GameTooltip_AddNewbieTip(self, LEAVE_VEHICLE, 1.0, 1.0, 1.0, nil);
    end
end)

button:SetScript("OnLeave", function(self)
    GameTooltip_Hide()
end)

button:SetNormalTexture([[INTERFACE\PLAYERACTIONBARALT\NATURAL]])
button:SetPushedTexture([[INTERFACE\PLAYERACTIONBARALT\NATURAL]])
button:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]])

local nt = button:GetNormalTexture()
local pu = button:GetPushedTexture()
local hi = button:GetHighlightTexture()

nt:SetTexCoord(0.0859375,0.1679688,0.359375,0.4414063)
pu:SetTexCoord(0.001953125,0.08398438,0.359375,0.4414063)
-- hi:SetTexCoord(0.6152344,0.6972656,0.359375,0.4414063)
hi:SetBlendMode("ADD")

--the button will spawn if a vehicle exists, but no vehicle ui is in place (the vehicle ui has its own exit button)
RegisterStateDriver(button, "visibility", "[petbattle] hide; [overridebar][canexitvehicle][vehicleui][possessbar][@vehicle,exists] show; hide")
--frame is visibile when no vehicle ui is visible
RegisterStateDriver(frame, "visibility", "[petbattle] hide; show")

--create drag frame and drag functionality
if cfg.userplaced.enable then
    rCreateDragFrame(frame, dragFrameList, -2 , true) --frame, dragFrameList, inset, clamp
end

--create the mouseover functionality
if cfg.mouseover.enable then
    rButtonBarFader(frame, buttonList, cfg.mouseover.fadeIn, cfg.mouseover.fadeOut) --frame, buttonList, fadeIn, fadeOut
end

-- vim: set fdm=indent ts=4 sw=4 tw=0 et :

