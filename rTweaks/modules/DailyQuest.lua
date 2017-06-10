
--- 需要自动接受，自动完成的日常任务列表
local markedQuests = {
    -- 破碎群岛
    [43994] = true,     -- 喂食塔莉萨
    [43995] = true,     -- 喂食瓦尔托伊
    [43106] = true,     -- 给欧库勒斯喂食
    [46125] = true,     -- 神器研究
    [47040] = true,     -- 封印命运

    [42233] = true,     -- 高岭诸族

    -- 托尔巴拉德
    [28678] = true,     -- P·哈里斯船长
    [28679] = true,     -- 激怒敌人
    [28680] = true,     -- 鼓舞士气
    [28681] = true,     -- 巨鲨坦克
    [28682] = true,     -- 占领要塞
    [28683] = true,     -- 削减蜘蛛的数量
    [28684] = true,     -- 棘手的任务
    [28685] = true,     -- 绝不浪费武器
    [28686] = true,     -- 不友善的村落
    [28687] = true,     -- 弄点黑鲈鱼来
    [28689] = true,     -- 被遗忘的灵魂
    [28690] = true,     -- 回收残骸
    [28691] = true,     -- 康纳中尉
    [28692] = true,     -- 磁铁的原理是什么呢？
    [28693] = true,     -- 收尾工作
    [28694] = true,     -- 当心鬼魂！
    [28695] = true,     -- 通缉令：工头维尔松
    [28696] = true,     -- 炮弹发射！
    [28697] = true,     -- 鬼魂毁灭者
    [28698] = true,     -- 炮弹！
    [28700] = true,     -- 夺回拉尔戈的瞭望台

    -- 银白比武场
    [13779] = true,     -- 珍贵的武器
    [13782] = true,     -- 总决赛
    [13809] = true,     -- 空中的威胁
    [13810] = true,     -- 攻入敌阵
    [13811] = true,     -- 冠军的比武
    [13860] = true,     -- 兵临城下
    [13862] = true,     -- 堡垒外的战斗
    [14092] = true,     -- 勇士的早餐
    [14101] = true,     -- 德罗丁·洛斯加尔
    [14105] = true,     -- 亡语者卡罗斯
    [14107] = true,     -- 阵亡者的命运
    [14108] = true,     -- 猎捕海怪！
    [14140] = true,     -- 抗击侵略者
    [14141] = true,     -- 戈莫克想要他的狗头人
    [14142] = true,     -- 这次你真的做到了，库尔
    [14144] = true,     -- 圣光的仁慈

    -- 雷神岛
    [32201] = true,     --  严峻局势
    [32206] = true,     --  这不管用
    [32208] = true,     --  电容上限
    [32209] = true,     --  救救斥候！
    [32218] = true,     --  敌人的骨灰
    [32219] = true,     --  冷血石像
    [32226] = true,     --  进入墓穴
    [32233] = true,     --  缴除武装
    [32254] = true,     --  掌控蜥蜴人
    [32292] = true,     --  近在眼前！
    [32494] = true,     --  以多打少
    [32520] = true,     --  魔法竞赛
    [32521] = true,     --  渗透力量
    [32524] = true,     --  巨魔鼓声
    [32677] = true,     --  突袭宝库
    [32728] = true,     --  白骨庭院
    [32730] = true,     --  伊瓜鲁克峭壁
    [35998] = true,     --  巫王的遗产

    -- 暗月马戏团
    [29434] = true,     -- 坦克指挥官
    [29436] = true,     -- 人肉炮弹
    [29438] = true,     -- 射击得分
    [29455] = true,     -- 目标：乌龟
    [29463] = true,     -- 痛扁豺狼人
    [32175] = true,     -- 暗月宠物对战
    [33756] = true,     -- 让我们继续竞速！
    [36471] = true,     -- 一个新的挑战者
    [36481] = true,     -- 不死鸟大挑战

    -- 布林顿
    [31752] = true,     -- 布林顿4000
    [34774] = true,     -- 布林顿5000
    [40753] = true,     -- 布林顿6000

    -- 永恒岛宠物对战
    [33137] = true,     -- 天神比武大会
    [33222] = true,     -- 新手小汤米

    -- 要塞钓鱼
    [35066] = true,     -- 熔火鱿鱼
    [35071] = true,     -- 无颚潜鱼
    [35072] = true,     -- 塘鲈
    [35073] = true,     -- 盲眼湖鲟
    [35074] = true,     -- 黑水鞭尾鱼
    [35075] = true,     -- 深渊大嘴鳗
    [36517] = true,     -- 深渊大嘴鳗

    -- 要塞战争工坊
    [38175] = true,     -- 熔铸碎片（联盟）
    [38188] = true,     -- 熔铸碎片（部落）

    -- 要塞宠物小屋
    [38299] = true,     -- 德拉诺的小动物们

    -- 德拉诺宠物对战
    [37201] = true,     -- 凯米尔·辉刃
    [37203] = true,     -- 阿什雷
    [37205] = true,     -- 加戈拉
    [37206] = true,     -- 可怕的塔尔
    [37207] = true,     -- 维沙尔
    [37208] = true,     -- 塔拉鲁恩

    -- 埃匹希斯水晶
    [36667] = true,     -- 突袭沙塔斯港口
    [36669] = true,     -- 突袭石怒崖
    [36688] = true,     -- 突袭斯克提斯
    [36689] = true,     -- 突袭命运之柱
    [36691] = true,     -- 突袭索克雷萨高地
    [36692] = true,     -- 突袭黑潮栖木
    [36693] = true,     -- 突袭莫高尔岗哨
    [36694] = true,     -- 突袭破碎悬崖
    [36695] = true,     -- 突袭永茂丛林
    [36696] = true,     -- 突袭钢铁军工厂
    [36697] = true,     -- 突袭玛戈纳洛克
    [36698] = true,     -- 阿什兰的战斗
    [36699] = true,     -- 突袭沙塔斯市中心
    [36700] = true,     -- 鲜血竞技场的挑战
    [36701] = true,     -- 突袭黑石矿坑

    -- 塔纳安丛林，部落
    [37940] = true,     -- 突袭铁城港
    [38044] = true,     -- 血环之血
    [38047] = true,     -- 钢铁前线之战
    [38252] = true,     -- 突袭卡纳克废墟
    [38441] = true,     -- 突袭邪能熔炉
    [38449] = true,     -- 突袭沙纳尔神殿
    [38586] = true,     -- 突袭基尔加丹王座
    [39433] = true,     -- 无法看到的影响
    [39509] = true,     -- 泽斯高的血腥刀刃
    [39510] = true,     -- 水上作业
    [39511] = true,     -- 堕落兄弟之血
    [39512] = true,     -- 暗影议会的秘密
    [39513] = true,     -- 解除沙纳尔的武装
    [39514] = true,     -- 掌控它们的力量
    [39519] = true,     -- 塔纳安屠魔者
    [39526] = true,     -- 加强攻势
    [39529] = true,     -- 尖牙与利爪
    [39532] = true,     -- 打击钢铁部落

    -- 塔纳安丛林，联盟
    [37891] = true,     -- 突袭铁城港
    [38045] = true,     -- 血环之血
    [38046] = true,     -- 钢铁前线之战
    [39567] = true,     -- 泽斯高的血腥刀刃
    [39568] = true,     -- 水上作业
    [39569] = true,     -- 打破邪能枷锁
    [39570] = true,     -- 暗影议会的秘密
    [39571] = true,     -- 解除沙纳尔的武装
    [39574] = true,     -- 加强攻势
    [39581] = true,     -- 塔纳安屠魔者
    [39582] = true,     -- 尖牙与利爪
    [39586] = true,     -- 打击钢铁部落

    -- 潘达利亚宠物对战
    [31953] = true,     -- 驯宠宗师俞娜
    [31954] = true,     -- 驯宠宗师莫鲁克
    [31955] = true,     -- 驯宠宗师倪石
    [31956] = true,     -- 驯宠宗师尹勇
    [31957] = true,     -- 驯宠宗师苏游
    [31958] = true,     -- 驯宠宗师亚济
    [31991] = true,     -- 驯宠宗师祖什
    [32434] = true,     -- 熊猫人烈焰之灵
    [32439] = true,     -- 熊猫人流水之灵
    [32440] = true,     -- 熊猫人微风之灵
    [32441] = true,     -- 熊猫人雷霆之灵

    [32604] = true,     -- <寓言之兽>第一册
    [32868] = true,     -- <寓言之兽>第二册
    [32869] = true,     -- <寓言之兽>第三册

    -- 德拉诺宠物对战
    [37201] = true,     -- 凯米尔·辉刃
    [37203] = true,     -- 阿什雷
    [37205] = true,     -- 加戈拉
    [37206] = true,     -- 可怕的塔尔
    [37207] = true,     -- 维沙尔
    [37208] = true,     -- 塔拉鲁恩
}

local numAvailableQuests = 0
local numActiveQuests    = 0
local lastNPC            = 0
local lastAvailableQuest = 0
local lastActiveQuest    = 0

local dailyFrame = CreateFrame("Frame") do
    dailyFrame:RegisterEvent'GOSSIP_CONFIRM'
    dailyFrame:RegisterEvent'GOSSIP_SHOW'
    dailyFrame:RegisterEvent'QUEST_COMPLETE'
    dailyFrame:RegisterEvent'QUEST_DETAIL'
    dailyFrame:RegisterEvent'QUEST_GREETING'
    dailyFrame:RegisterEvent'QUEST_PROGRESS'
end

dailyFrame:SetScript("OnEvent", function(self, event, ...)
    if IsModifierKeyDown() then return end

    if event == "QUEST_GREETING" then
        numAvailableQuests = GetNumAvailableQuests()
        numActiveQuests    = GetNumActiveQuests()
    end

    -- 打开 NPC 任务、对话列表
    if event == "GOSSIP_SHOW" then
        if IsModifierKeyDown() then return end
        numAvailableQuests =   GetNumGossipAvailableQuests()        -- 新任务数量
        numActiveQuests    =   GetNumGossipActiveQuests()           -- 已接受的任务数量
        availableQuests    = { GetGossipAvailableQuests() }
        activeQuests       = { GetGossipActiveQuests() }
    end

    if numAvailableQuests > 0 or numActiveQuests > 0 then
        local guid = UnitGUID("target")

        if lastNPC ~= guid then
            lastActiveQuest    = 1
            lastAvailableQuest = 1
            lastNPC            = guid
        end

        -- 快速完成任务
        if lastActiveQuest > numActiveQuests then
            lastActiveQuest = 1
        end

        for i = lastActiveQuest, numActiveQuests do
            lastActiveQuest = i

            if event == "QUEST_GREETING" then
                SelectActiveQuest(i)
                return
            elseif event == "GOSSIP_SHOW" then
                -- 如果任务已经完成
                if activeQuests[(i-1)*5 + 4] ~= false then
                    SelectGossipActiveQuest(i)
                    return
                end
            end
        end

        -- 快速接受新任务
        if lastAvailableQuest > numAvailableQuests then
            lastAvailableQuest = 1
        end

        for i = lastAvailableQuest, numAvailableQuests do
            lastAvailableQuest = i

            if event == "QUEST_GREETING" then
                SelectAvailableQuest(i)
                return
            elseif event == "GOSSIP_SHOW" then
                if availableQuests[(i-1)*6+5] == false then
                    SelectGossipAvailableQuest(i)
                    return
                end
            end
        end
    end

    -- 打开新任务的明细面板
    if event == "QUEST_DETAIL" then
        -- 春节祭拜长老
        local title = GetTitleText()
        if title:match("长者") then
            AcceptQuest()
            return
        end

        if markedQuests[GetQuestID()] then
            AcceptQuest()
            return
        end
    end

    -- 任务进度
    if event == "QUEST_PROGRESS" then
        if not IsQuestCompletable() then return end
        if markedQuests[GetQuestID()] then
            CompleteQuest()
            return
        end
    end

    -- 选择完成任务的奖品
    if event == "QUEST_COMPLETE" then
        -- 春节祭拜长老
        local title = GetTitleText()
        if title:match("长者") then
            GetQuestReward(0)
            return
        end

        -- 仲夏节祭拜/亵渎火焰
        if title:match("火焰") then
            GetQuestReward(0)
            return
        end

        -- 要塞：炼金实验室
        if title:match("炼金实验品") then
            GetQuestReward(3)
        end

        local choices = GetNumQuestChoices()
        if markedQuests[GetQuestID()] then
            print("|cFF1EFF00完成任务|r|cFFFFD200" .. GetTitleText())

            -- 没有任务奖励物品
            -- 仅有一项奖励没得选
            if choices <= 1 then
                GetQuestReward(0)
                return
            end

            -- 如果任务奖励大于1件需要选择
            if choices >= 2 then
                local link = GetQuestItemLink('choice', 2)
                if link then
                    local itemid = link:match("item:(%d+):")
                    if itemid == "45724" then   -- 银白：冠军的钱包
                        GetQuestReward(2)
                    end
                    if itemid == "120302" then  -- 战争工坊：随机选择一个升级徽记
                        GetQuestReward(math.random(1,2))
                    end
                end
            end
        end
    end
end)

-- 任务明细面板标题中显示任务的 QuestID
hooksecurefunc("QuestLogPopupDetailFrame_Update", function()
    local title   = QuestInfoTitleHeader:GetText()
    local questID = QuestLogPopupDetailFrame.questID
    QuestInfoTitleHeader:SetText("[" .. questID .. "] " .. title)
end)

