
--- 需要自动接受，自动完成的日常任务列表
local MarkedQuests = {
    -- 破碎群岛
    [42170] = true,     -- 织梦者
    [42233] = true,     -- 高岭诸族
    [42234] = true,     -- 瓦拉加尔
    [42420] = true,     -- 法罗迪斯宫廷
    [42421] = true,     -- 堕夜精灵
    [42422] = true,     -- 守望者

    [46743] = true,     -- 至高岭的物资
    [46745] = true,     -- 宫廷的物资
    [46746] = true,     -- 瓦拉加尔的物资
    [46747] = true,     -- 织梦者的物资
    [46748] = true,     -- 堕夜精灵的物资
    [46749] = true,     -- 守望者的物资
    [46777] = true,     -- 抗魔联军的馈赠

    [43994] = true,     -- 喂食塔莉萨
    [43995] = true,     -- 喂食瓦尔托伊
    [43106] = true,     -- 给欧库勒斯喂食
    [44159] = true,     -- 马林的宝库赠品券
    [44175] = true,     -- 世界在等待

    [46904] = true,     -- 指挥中心之赐 - 协调强化
    [46997] = true,     -- 指挥中心之赐
    [46998] = true,     -- 指挥中心之赐 - 全力备战
    [46999] = true,     -- 指挥中心之赐
    [47007] = true,     -- 法师塔之赐
    [47008] = true,     -- 法师塔之赐
    [47009] = true,     -- 法师塔之赐 - 势不可挡
    [47010] = true,     -- 法师塔之赐 - 声望高绝
    [47014] = true,     -- 法师塔之赐 - 虚空风暴
    [47015] = true,     -- 虚空干扰器之赐
    [47016] = true,     -- 虚空干扰器之赐
    [47017] = true,     -- 只有上品
    [47040] = true,     -- 封印命运
    [47045] = true,     -- 新的进展
    [47054] = true,     -- 命运之触

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

    -- 要塞宠物小屋
    [38299] = true,     -- 德拉诺的小动物们

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

local AutoQuest = CreateFrame("Frame") do
    AutoQuest:SetScript("OnEvent", function(self, event, ...) self[event](self, event, ...) end)
    AutoQuest:RegisterEvent('ADDON_LOADED')
    AutoQuest:RegisterEvent('GOSSIP_SHOW')
    AutoQuest:RegisterEvent('QUEST_COMPLETE')
    AutoQuest:RegisterEvent('QUEST_DETAIL')
    AutoQuest:RegisterEvent('QUEST_GREETING')
    AutoQuest:RegisterEvent('QUEST_PROGRESS')
end

local function IsMarkedQuestByID(questID)
    return MarkedQuests[questID];
end

local function IsMarkedQuestByTitle(title)
    for questID, text in pairs(QuestsDB) do
        if text == title then
            return true
        end
    end
    return false
end

function AutoQuest:ADDON_LOADED(event, addon)
    if addon ~= "rTweaks" then
        return
    end
    if not QuestsDB then
        QuestsDB = {}
    end
end

function AutoQuest:GOSSIP_SHOW(event)
    if IsModifierKeyDown() then return end

    local availableQuests = { GetGossipAvailableQuests() }
    local activeQuests    = { GetGossipActiveQuests() }

    for i = 1, #availableQuests, 7 do
        local title = availableQuests[i+0]
        if IsMarkedQuestByTitle(title) then
            SelectGossipAvailableQuest(i)
            return
        end
    end

    for i = 1, #activeQuests, 6 do
        local title      = activeQuests[i+0]
        local isComplete = activeQuests[i+3]

        if IsMarkedQuestByTitle(title) and isComplete then
            SelectGossipActiveQuest(i)
            return
        end
    end
end

function AutoQuest:QUEST_PROGRESS(event)
    local questID = GetQuestID()
    if IsModifierKeyDown() or not IsMarkedQuestByID(questID) then
        return
    end

    if not QuestsDB[questID] then
        local title = GetTitleText()
        QuestsDB[questID] = title
        return
    end

    if IsQuestCompletable() and IsMarkedQuestByID(questID) then
        CompleteQuest()
    end
end

function AutoQuest:QUEST_COMPLETE(event)
    local questID = GetQuestID()
    if IsModifierKeyDown() or not IsMarkedQuestByID(questID) then
        return
    end

    if not QuestsDB[questID] then
        local title = GetTitleText()
        QuestsDB[questID] = title
        return
    end

    local choices = GetNumQuestChoices()
    if choices <= 1 then
        GetQuestReward(0)
        return
    end
end

function AutoQuest:QUEST_GREETING(event)
end

function AutoQuest:QUEST_DETAIL(event)
end

