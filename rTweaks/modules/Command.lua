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

        -- 在德拉诺的纳格兰，如果可以优先使用霜狼战狼/塔拉塔布羊
        -- 可以在战斗中使用的
        if not IsFlyableArea() and GetCurrentMapContinent() == 7 and GetZoneText() == "纳格兰" then
            -- 检查当前要塞技能 ID 是否为战狼
            local spellID = DraenorZoneAbilityFrame.SpellButton.currentSpellID or 0
            -- 部落 / 联盟
            if spellID == 164222 or spellID == 165803 then
                CastSpellByName("要塞技能")
                return
            end
        end

        -- 其它情况需要检测是否在战斗中
        if InCombatLockdown() then return end

        -- 万圣节使用魔法扫帚
        if GetItemCount(37011) >= 1 then
            UseItemByName(37011)
            return
        end

        -- 这里是瓦丝琪尔
        local map = GetMapInfo()
        if map and strsub(map, 0, 7) == "Vashjir" and IsUsableSpell(75207) then
            CastSpellByName(GetSpellInfo(75207))
        else
            C_MountJournal.SummonByID(0)
        end
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

