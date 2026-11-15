-- Path: CorePackages.Packages._Index.NetworkingChat.NetworkingChat.createRequestThunks
require(script.Parent.networkingChatTypes)
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createAddToConversation)
local v_u_3 = require(v1.createRemoveFromConversation)
local v_u_4 = require(v1.createRenameGroupConversation)
local v_u_5 = require(v1.createStartGroupConversation)
local v_u_6 = require(v1.createStartOneToOneConversation)
local v_u_7 = require(v1.createSetConversationUniverse)
local v_u_8 = require(v1.createResetConversationUniverse)
local v_u_9 = require(v1.createSendMessage)
local v_u_10 = require(v1.createSendGameLinkMessage)
local v_u_11 = require(v1.createUpdateUserTypingStatus)
local v_u_12 = require(v1.createMarkAsRead)
local v_u_13 = require(v1.createMarkAsSeen)
local v_u_14 = require(v1.createGetMessages)
local v_u_15 = require(v1.createGetUserConversations)
local v_u_16 = require(v1.createGetConversations)
local v_u_17 = require(v1.createGetLatestMessages)
local v_u_18 = require(v1.createGetUnreadConversationCount)
local v_u_19 = require(v1.createGetUnreadMessages)
local v_u_20 = require(v1.createGetChatSettings)
local v_u_21 = require(v1.createGetRolloutSettings)
local v_u_22 = require(v1.createGetMetadata)
return function(p23)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22
	return {
		["AddToConversation"] = v_u_2(p23),
		["RemoveFromConversation"] = v_u_3(p23),
		["RenameGroupConversation"] = v_u_4(p23),
		["StartGroupConversation"] = v_u_5(p23),
		["StartOneToOneConversation"] = v_u_6(p23),
		["SetConversationUniverse"] = v_u_7(p23),
		["ResetConversationUniverse"] = v_u_8(p23),
		["SendMessage"] = v_u_9(p23),
		["SendGameLinkMessage"] = v_u_10(p23),
		["UpdateUserTypingStatus"] = v_u_11(p23),
		["MarkAsRead"] = v_u_12(p23),
		["MarkAsSeen"] = v_u_13(p23),
		["GetMessages"] = v_u_14(p23),
		["GetUserConversations"] = v_u_15(p23),
		["GetConversations"] = v_u_16(p23),
		["GetLatestMessages"] = v_u_17(p23),
		["GetUnreadConversationCount"] = v_u_18(p23),
		["GetUnreadMessages"] = v_u_19(p23),
		["GetChatSettings"] = v_u_20(p23),
		["GetRolloutSettings"] = v_u_21(p23),
		["GetMetadata"] = v_u_22(p23)
	}
end