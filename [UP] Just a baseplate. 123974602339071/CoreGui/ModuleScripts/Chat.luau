-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.Chat
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent
if require(v3.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.UpdateChatMessages)
local v6 = require(v4.UpdateUnreadMessagesBadge)
local v7 = require(v4.UpdateChatVisible)
local v8 = require(v4.SetCanChat)
return v2.createReducer({
	["canChat"] = false,
	["visible"] = true,
	["lastReadMessages"] = 0,
	["unreadMessages"] = 0
}, {
	[v6.name] = function(p9, p10)
		return p9.visible and {
			["canChat"] = nil,
			["visible"] = true,
			["lastReadMessages"] = 0,
			["unreadMessages"] = 0,
			["canChat"] = p9.canChat
		} or {
			["canChat"] = nil,
			["visible"] = false,
			["lastReadMessages"] = 0,
			["unreadMessages"] = nil,
			["canChat"] = p9.canChat,
			["unreadMessages"] = p10.messages
		}
	end,
	[v5.name] = function(p11, p12)
		return p11.visible and {
			["canChat"] = nil,
			["visible"] = true,
			["lastReadMessages"] = nil,
			["unreadMessages"] = 0,
			["canChat"] = p11.canChat,
			["lastReadMessages"] = p12.messages
		} or {
			["canChat"] = nil,
			["visible"] = false,
			["lastReadMessages"] = nil,
			["unreadMessages"] = nil,
			["canChat"] = p11.canChat,
			["lastReadMessages"] = p11.lastReadMessages,
			["unreadMessages"] = p12.messages - p11.lastReadMessages
		}
	end,
	[v7.name] = function(p13, p14)
		return p14.visible and {
			["canChat"] = nil,
			["visible"] = true,
			["lastReadMessages"] = nil,
			["unreadMessages"] = 0,
			["canChat"] = p13.canChat,
			["lastReadMessages"] = p13.lastReadMessages + p13.unreadMessages
		} or {
			["canChat"] = nil,
			["visible"] = false,
			["lastReadMessages"] = nil,
			["unreadMessages"] = nil,
			["canChat"] = p13.canChat,
			["lastReadMessages"] = p13.lastReadMessages,
			["unreadMessages"] = p13.unreadMessages
		}
	end,
	[v8.name] = function(p15, p16)
		return {
			["canChat"] = p16.canChat,
			["visible"] = p15.visible,
			["lastReadMessages"] = p15.lastReadMessages,
			["unreadMessages"] = p15.unreadMessages
		}
	end
})