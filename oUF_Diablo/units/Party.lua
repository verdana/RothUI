
--get the addon namespace
local addon, ns = ...

--get oUF namespace (just in case needed)
local oUF = ns.oUF or oUF

--get the config
local cfg = ns.cfg

--get the functions
local func = ns.func

--get the unit container
local unit = ns.unit

---------------------------------------------
-- UNIT SPECIFIC FUNCTIONS
---------------------------------------------

--init parameters
local initUnitParameters = function(self)
    self:RegisterForClicks("AnyDown")
    self:SetScript("OnEnter", UnitFrame_OnEnter)
    self:SetScript("OnLeave", UnitFrame_OnLeave)
end

--actionbar background
local createArtwork = function(self)
    local t = self:CreateTexture(nil,"BACKGROUND",nil,-8)
    t:SetAllPoints(self)
    t:SetTexture("Interface\\AddOns\\oUF_Diablo\\media\\targettarget")
end

--create health frames
local createHealthFrame = function(self)
    local cfg = self.cfg.health

    --health
    local h = CreateFrame("StatusBar", nil, self)
    if self.cfg.vertical == true then
        h:SetPoint("TOP",0,-21.9)
        h:SetPoint("LEFT",41.5,0)
        h:SetPoint("RIGHT",-41.5,0)
        h:SetPoint("BOTTOM",0,28.7)
    else
        h:SetPoint("TOP",0,-21.9)
        h:SetPoint("LEFT",24.5,0)
        h:SetPoint("RIGHT",-24.5,0)
        h:SetPoint("BOTTOM",0,28.7)
    end
    h:SetStatusBarTexture(cfg.texture)
    h.bg = h:CreateTexture(nil,"BACKGROUND",nil,-6)
    h.bg:SetTexture(cfg.texture)
    h.bg:SetAllPoints(h)

    h.glow = h:CreateTexture(nil,"OVERLAY",nil,-5)
    h.glow:SetTexture("Interface\\AddOns\\oUF_Diablo\\media\\targettarget_hpglow")
    h.glow:SetAllPoints(self)
    h.glow:SetVertexColor(0,0,0,1)

    h.highlight = h:CreateTexture(nil,"OVERLAY",nil,-4)
    h.highlight:SetTexture("Interface\\AddOns\\oUF_Diablo\\media\\targettarget_highlight")
    h.highlight:SetAllPoints(self)

    self.Health = h
    self.Health.Smooth = true
    self.Health.frequentUpdates = self.cfg.health.frequentUpdates or false
end

--create power frames
local createPowerFrame = function(self)
    local cfg = self.cfg.power

    --power
    local h = CreateFrame("StatusBar", nil, self)
    if self.cfg.vertical == true then
        h:SetPoint("TOP",0,-38.5)
        h:SetPoint("LEFT",41.5,0)
        h:SetPoint("RIGHT",-41.5,0)
        h:SetPoint("BOTTOM",0,21.9)
    else
        h:SetPoint("TOP",0,-38.5)
        h:SetPoint("LEFT",24.5,0)
        h:SetPoint("RIGHT",-24.5,0)
        h:SetPoint("BOTTOM",0,21.9)
    end
    h:SetStatusBarTexture(cfg.texture)

    h.bg = h:CreateTexture(nil,"BACKGROUND",nil,-6)
    h.bg:SetTexture(cfg.texture)
    h.bg:SetAllPoints(h)

    h.glow = h:CreateTexture(nil,"OVERLAY",nil,-5)
    h.glow:SetTexture("Interface\\AddOns\\oUF_Diablo\\media\\targettarget_ppglow")
    h.glow:SetAllPoints(self)
    h.glow:SetVertexColor(0,0,0,1)

    self.Power = h
    self.Power.Smooth = true
    self.Power.frequentUpdates = self.cfg.power.frequentUpdates or false
end

--create health power strings
local createHealthPowerStrings = function(self)
    local name = func.createFontString(self.Health, cfg.font, self.cfg.misc.nameFontSize, "THINOUTLINE")
    name:SetPoint("BOTTOM", self, "TOP", 0, -13)
    name:SetPoint("LEFT", self.Health, 0, 0)
    name:SetPoint("RIGHT", self.Health, 0, 0)
    self.Name = name

    local hpval = func.createFontString(self.Health, cfg.font, self.cfg.health.fontSize, "THINOUTLINE")
    hpval:SetPoint(self.cfg.health.point, self.cfg.health.x,self.cfg.health.y)

    self:Tag(name, "[diablo:name]")
    self:Tag(hpval, self.cfg.health.tag or "")
end

---------------------------------------------
-- PARTY STYLE FUNC
---------------------------------------------

local function createStyle(self)
    --apply config to self
    self.cfg = cfg.units.party
    self.cfg.style = "party"

    self.cfg.width = self.cfg.portrait.width
    self.cfg.height = 64

    --init
    initUnitParameters(self)

    --create the art
    createArtwork(self)

    --createhealthPower
    createHealthFrame(self)
    createPowerFrame(self)

    --health power strings
    createHealthPowerStrings(self)

    --health power update
    self.Health.PostUpdate = func.updateHealth
    self.Power.PostUpdate = func.updatePower

    --create portrait
    if self.cfg.portrait.show then
        func.createPortrait(self)
        if self.PortraitHolder then
            if(InCombatLockdown()) then
                self.PortraitHolder:RegisterEvent("PLAYER_REGEN_ENABLED")
            else
                if self.cfg.vertical then
                    self:SetHitRectInsets(-35,0, -17, 0)
                else
                    self:SetHitRectInsets(0,0,-100,0)
                end
            end
            self.PortraitHolder:SetScript("OnEvent", function(...)
                self.PortraitHolder:UnregisterEvent("PLAYER_REGEN_ENABLED")
                self:SetHitRectInsets(0, 0, -100, 0)
            end)
        end
    end

    --auras
    if self.cfg.auras.show then
        func.createDebuffs(self)
        self.Debuffs.PostCreateIcon = func.createAuraIcon
        func.createBuffs(self)
        self.Buffs.PostCreateIcon = func.createAuraIcon
    end

    --aurawatch
    if self.cfg.aurawatch.show then
        func.createAuraWatch(self)
    end

    --debuffglow
    func.createDebuffGlow(self)

    --range
    self.Range = {
        insideAlpha = 1,
        outsideAlpha = self.cfg.alpha.notinrange
    }

    --icons
    self.RaidTargetIndicator = func.createIcon(self,"BACKGROUND",18,self.Name,"RIGHT","LEFT",0,0,-1)
    self.ReadyCheckIndicator = func.createIcon(self.Health,"OVERLAY",24,self.Health,"CENTER","CENTER",0,0,-1)
    if self.Border then
        self.LeaderIndicator = func.createIcon(self,"BACKGROUND",13,self.Border,"BOTTOMRIGHT","BOTTOMLEFT",16,18,-1)
        if self.cfg.portrait.use3D then
            self.GroupRoleIndicator = func.createIcon(self.BorderHolder,"OVERLAY",12,self.Health,"CENTER","CENTER",0,0,5)
        else
            self.GroupRoleIndicator = func.createIcon(self.PortraitHolder,"OVERLAY",12,self.Health,"CENTER","CENTER",0,0,5)
        end
    else
        self.LeaderIndicator = func.createIcon(self,"BACKGROUND",13,self,"RIGHT","LEFT",16,-18,-1)
        self.GroupRoleIndicator = func.createIcon(self,"BACKGROUND",12,self,"RIGHT","LEFT",16,18,-1)
    end
    self.GroupRoleIndicator:SetTexture("Interface\\AddOns\\oUF_Diablo\\media\\lfd_role")
    --self.GroupRoleIndicator:SetDesaturated(1)

    --add heal prediction
    func.healthPrediction(self)

    --add total absorb
    func.totalAbsorb(self)

    --threat
    self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", func.checkThreat)
end

---------------------------------------------
-- SPAWN PARTY UNIT
---------------------------------------------

if cfg.units.party.show then
    oUF:RegisterStyle("diablo:party", createStyle)
    oUF:SetActiveStyle("diablo:party")

    local attr = cfg.units.party.attributes

    local partyDragFrame = CreateFrame("Frame", "oUF_DiabloPartyDragFrame", UIParent)
    partyDragFrame:SetSize(50,50)
    partyDragFrame:SetPoint(cfg.units.party.pos.a1,cfg.units.party.pos.af,cfg.units.party.pos.a2,cfg.units.party.pos.x,cfg.units.party.pos.y)
    func.applyDragFunctionality(partyDragFrame)
    table.insert(oUF_Diablo_Units,"oUF_DiabloPartyDragFrame") --add frames to the slash command function

    if cfg.units.party.vertical == true then
        local party = oUF:SpawnHeader(
        "oUF_DiabloPartyHeader",
        nil,
        attr.visibility,
        "showPlayer",         attr.showPlayer,
        "showSolo",           attr.showSolo,
        "showParty",          attr.showParty,
        "showRaid",           attr.showRaid,
        "point",              attr.VerticalPoint,
        "oUF-initialConfigFunction", ([[
        self:SetWidth(%d)
        self:SetHeight(%d)
        self:SetScale(%f)
        ]]):format(228, 64, cfg.units.party.scale)
        )
        party:SetPoint("TOPLEFT",partyDragFrame,0,0)
    else
        local party = oUF:SpawnHeader(
        "oUF_DiabloPartyHeader",
        nil,
        attr.visibility,
        "showPlayer",         attr.showPlayer,
        "showSolo",           attr.showSolo,
        "showParty",          attr.showParty,
        "showRaid",           attr.showRaid,
        "point",             	attr.HorizontalPoint,
        "oUF-initialConfigFunction", ([[
        self:SetWidth(%d)
        self:SetHeight(%d)
        self:SetScale(%f)
        ]]):format(128, 64, cfg.units.party.scale)
        )
        party:SetPoint("TOPLEFT",partyDragFrame,0,0)
    end
end

