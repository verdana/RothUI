
-- 需要过滤的关键字
local keywords = {
    "10元", "20元", "30元", "50元",
    "一万G",
    "交易",
    "人民币",
    "便宜处理",
    "先G",
    "先金",
    "块钱",
    "散卖",
    "老板",
    "诚心要",
    "金币",
    "阿克门票",
    "自上号",
    "下单",
    "手工G"
}

-- 关键字出现多少个后触发过滤器
local threshold = 3

-- 临时变量
local lastMessage = 0
local prevMessage, prevPlayer

-- 主函数用来过滤消息
local function ChatFilter(self, event, msg, player, ...)
    -- 不要过滤来自公会，好友，以及队伍或者团队中的消息
    if UnitIsInMyGuild(player) or UnitIsFriend("player", player) or UnitInRaid(player) or UnitInParty(player) then
        return false
    end

    -- 重复消息过滤
    if filterDupes then
        if prevMessage == msg and prevPlayer == player then
            return true
        end

        prevMessage = msg
        prevPlayer = player
    end

    -- 屏蔽邪恶的关键字
    local temp = strlower(msg)
    local count = 0
    for i = 1, #keywords do
        if temp:find(keywords[i]) then
            count = count + 1
        end
    end
    if count >= threshold then
        -- 这里可以屏蔽这个 player
        return true
    end

    -- 团队图标
    -- local term;
    -- for tag in string.gmatch(msg, "%b{}") do
    --     term = strlower(string.gsub(tag, "[{}]", ""))
    --     if ICON_TAG_LIST[term] and ICON_LIST[ICON_TAG_LIST[term]] then
    --         msg = gsub(msg, tag, "")
    --     end
    -- end
    -- return false, msg, player, ...
end

-- 聊天窗口事件钩子
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",     ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL",    ChatFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ChatFilter)
