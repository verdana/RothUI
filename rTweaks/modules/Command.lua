-- 简化重新载入界面的命令
SLASH_RELOADUI1 = "/rl"
SlashCmdList["RELOADUI"] = function(msg)
    ReloadUI()
end

-- 查詢物品 ID
SLASH_ITEMID1 = "/itemid"
SlashCmdList["ITEMID"] = function(msg)
    local _, link = GetItemInfo(msg)
    if link then
        print(msg .. " has item ID: |cFFFFD200" .. link:match("item:(%d+):") .. "|r")
    end
end

-- 随机使用物品（替代垃圾的 /userandom）
SLASH_USERAND1 = "/userand"
SLASH_USERAND2 = "/urand"
SlashCmdList["USERAND"] = function(msg)
    local items = {}
    for itemID in string.gmatch(msg, "[0-9]+") do
        items[tonumber(itemID)] = true
    end

    local valid = {}
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, GetContainerNumSlots(bag) do
            local _, count, _, quality, _, _, link, _, novalue, itemID = GetContainerItemInfo(bag, slot)
            if items[itemID] and IsUsableItem(itemID) then
                tinsert(valid, itemID)
            end
        end
    end

    if #valid > 0 then
        randItemID = valid[math.random(#valid)]
        if not InCombatLockdown() and randItemID then
            EditMacro("随机鱼饵", nil, nil, "#showtooltip\n/use item:"..randItemID)
            -- UseItemByName(randItemID)
        end
    end
end

-- 查询任务是否完成
SLASH_QUESTID1 = "/questid"
SlashCmdList["QUESTID"] = function(questID)
    for k, v in pairs({QuestCompleted = questID}) do
        print(format("%s: %s", k, IsQuestFlaggedCompleted(v) and "\124cff00ff00Yes\124r" or "\124cffff0000No\124r"))
    end
end

-- 优化的随机坐骑宏
SLASH_MOUNT1 = "/mount"
SlashCmdList["MOUNT"] = function(msg)
    -- 如果在飞行中，防止手贱误操作摔死
    if IsFlying() then return end

    -- 检测是否在战斗中
    if InCombatLockdown() then return end

    -- 优先离开载具
    if CanExitVehicle() then VehicleExit() end

    -- 离开坐骑
    if IsMounted() then
        C_MountJournal.Dismiss()
        return
    end

    -- 万圣节使用魔法扫帚
    if GetItemCount(37011) >= 1 then
        UseItemByName(37011)
        return
    end

    -- 这里是瓦丝琪尔
    local map = GetMapInfo()
    if map and strsub(map, 0, 7) == "Vashjir" and IsUsableSpell(75207) then
        CastSpellByName(GetSpellInfo(75207))
        return
    end

    -- 游泳时使用暴雪自己的 API
    if IsSwimming() then
        C_MountJournal.SummonByID(0)
        return
    end

    -- 检查数据库
    if not MountsDB["flyable"] or not MountsDB["ground"] then
        DEFAULT_CHAT_FRAME:AddMessage("尚未扫描偏好坐骑列表", YELLOW_FONT_COLOR.r, YELLOW_FONT_COLOR.g, YELLOW_FONT_COLOR.b)
        return
    end

    -- 无法飞行，但 IsFlyableArea() 却返回 true 的区域
    local notFlyableAreas = {
        ["ValhallasWarriorOrderHome"] = true,   -- 战士职业大厅
    }

    -- 可飞行区域
    if IsFlyableArea() and notFlyableAreas[GetMapInfo()] == nil then
        local n = math.random(#MountsDB["flyable"])
        C_MountJournal.SummonByID(MountsDB["flyable"][n])
        return
    end

    -- 不可飞行的区域
    local n = math.random(#MountsDB["ground"])
    C_MountJournal.SummonByID(MountsDB["ground"][n])
    return
end

-- 导出所有宠物信息
SLASH_DUMPETS1 = "/dumpets"
SlashCmdList["DUMPETS"] = function(msg)
    local numPets, numOwned = C_PetJournal.GetNumPets()
    print("I have own " .. numOwned .. " of " .. numPets .. " pets.")

    PetsDB = {}
    local cnt = 0
    for i = 1, numOwned do
        local petID, speciesID, isOwned, _, level, _, isRevoked, name, icon, petType, creatureID, sourceText, description, isWildPet, canBattle = C_PetJournal.GetPetInfoByIndex(i)
        if isOwned and canBattle and isRevoked == false then
            cnt = cnt + 1
            table.insert(PetsDB, {
                ["creature_id"] = creatureID,
                ["description"] = description,
                ["icon"]        = icon,
                ["is_wild_pet"] = isWildPet,
                ["level"]       = level,
                ["name"]        = name,
                ["pet_id"]      = petID,
                ["pet_type"]    = petType,
                ["source_text"] = sourceText,
                ["species_id"]  = speciesID,
            })
        end
    end
    print(cnt .. " pets was dumped.")
end

-- 位面团人数统计
SLASH_PLANE1 = "/plane"
SlashCmdList["PLANE"] = function(msg)
    partySize = GetNumGroupMembers()
    if partySize == 0 then
        print("你不在队伍或者团队中。")
        return
    end

    t, b = {}, {}
    for i = 1, GetNumGroupMembers() do
        n, r = UnitName("raid" .. i)
        if r == "" or (not r) then r = "|cffADFF2F" .. GetRealmName() end
        t[r] = t[r] and (t[r] + 1) or 1
    end
    for k, v in pairs(t) do
        print(k .. "人数：" .. v)
    end
end

-- 防暂离宏
SLASH_NOAFK1 = "/noafk"
SlashCmdList["NOAFK"] = function(msg)
end

-- 写入 CVar 配置信息
-- http://bbs.nga.cn/read.php?&tid=9622396
do
    local UIConfig = function()
        -- 显示脚本错误 --
        SetCVar("scriptErrors", 1)

        -- 激活插件错误日志
        SetCVar('taintLog', 1)

        -- 截图质量
        SetCVar("screenshotQuality", 10)
        SetCVar("screenshotFormat", "jpg")

        -- 自动追踪任务
        SetCVar("autoQuestProgress", 1)

        -- 背包与物品拾取
        SetCVar("autoLootDefault", 1)
        SetCVar("lootUnderMouse", 1)

        -- 移动时地图半透明
        SetCVar("mapFade", 0)

        -- 對目標傷害，0關；如果要關閉傷害數字，使用這項
        SetCVar("floatingCombatTextCombatDamage", 1)
        -- 對目標治療，0關；如果要關閉治療數字，使用這項
        SetCVar("floatingCombatTextCombatHealing", 1)

        -- 新的浮動戰鬥文字運動方式，1往上 2往下 3弧形
        SetCVar("floatingCombatTextFloatMode", 1)
        -- 舊的動戰鬥文字運動方式，0開；使用這項，浮動戰鬥文字就會垂直往上
        SetCVar("floatingCombatTextCombatDamageDirectionalScale", 0)
    end

    -- 确认框
    StaticPopupDialogs.SET_UI = {
        text           = "是否要加载预设的 CVAR 配置？",
        button1        = ACCEPT,
        button2        = CANCEL,
        OnAccept       = function()UIConfig()ReloadUI() end,
        timeout        = 0,
        whileDead      = 1,
        hideOnEscape   = true,
        preferredIndex = 5,
    }

    SLASH_SETUI1 = "/setui"
    SlashCmdList["SETUI"] = function()
        StaticPopup_Show("SET_UI")
    end
end

