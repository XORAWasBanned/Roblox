-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.MessageCreatorModules.UnknownMessage
local v1 = script.Parent.Parent
require(v1:WaitForChild("ChatSettings"))
local v2 = require(script.Parent:WaitForChild("Util"))
function CreateUnknownMessageLabel(p3) -- name: CreateUnknownMessageLabel
	print("No message creator for message: " .. p3.Message)
end
return {
	[v2.KEY_MESSAGE_TYPE] = "UnknownMessage",
	[v2.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
}