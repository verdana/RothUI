
local frame = CreateFrame("frame") do
    frame:SetScript("OnEvent", function(self, event, ...)
        self[event](self, event, ...)
    end)

    --[[
    frame.ADDON_LOADED = function(event, addon)
        if addon ~= 'vKeybinds' then return end
        if not Keybinds then Keybinds = {} end
    end
    frame.VARIABLES_LOADED = function()
        print("|c00FF78F1/kb|r to manage key binds.")
    end
    --]]

    --frame:RegisterEvent"ADDON_LOADED"
    --frame:RegisterEvent"VARIABLES_LOADED"
end

SLASH_KB1="/kb"
SlashCmdList["KB"] = function(msg)
    local cmd, arg = string.split(" ", msg, 2)
	cmd = string.lower(cmd or "")
	arg = arg or ""

    -- 保存当前按键设定
    if cmd == "save" then
        Keybinds = {} -- 清空原有设定
        local count = 0
        for i=1, GetNumBindings() do
            local command, key1, key2 = GetBinding(i)
            if key1 ~= nil then
                Keybinds[command] = {}
                table.insert(Keybinds[command], tostring(key1))
                if key2 ~= nil then
                    table.insert(Keybinds[command], tostring(key2))
                end
                count = count + 1
            end
        end
        print("Your key binds saved (|c00FF78F1" .. count .. "|r).")
    elseif cmd == "load" then
        for command, keys in pairs(Keybinds) do
            -- 读取并清除当前命令所绑定的原有快捷键
            local current_keys = {GetBindingKey(command)}
            for i=1, #current_keys do
                SetBinding(current_keys[i])
            end

            -- 绑定新的按键
            if #keys > 0 then
                for _, key in ipairs(keys) do
                    SetBinding(key, command)
                end
            end
        end
        SaveBindings(2) -- 设定为角色专有按键
        print("Your key binds loaded.")
    elseif cmd == "reset" then
        print("Reset your key binds.")
    end
end
