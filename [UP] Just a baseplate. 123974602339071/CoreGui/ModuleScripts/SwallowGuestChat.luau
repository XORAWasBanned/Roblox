-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.CommandModules.SwallowGuestChat
local v_u_1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = game:GetService("RunService")
local v_u_3 = nil
local function v4()
	-- upvalues: (ref) v_u_3
	v_u_3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v4)
v_u_3 = v_u_3 == nil and {
	["Get"] = function(_, _, p5) -- name: Get
		return p5
	end
} or v_u_3
function ProcessMessage(_, p6, _) -- name: ProcessMessage
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_3
	local v7 = game:GetService("Players").LocalPlayer
	if not v7 or (v7.UserId >= 0 or v_u_2:IsStudio()) then
		return false
	end
	local v8 = p6:GetCurrentChannel()
	if v8 then
		v_u_1:SendSystemMessageToSelf(v_u_3:Get("GameChat_SwallowGuestChat_Message", "Create a free account to get access to chat permissions!"), v8, {})
	end
	return true
end
return {
	[v_u_1.KEY_COMMAND_PROCESSOR_TYPE] = v_u_1.COMPLETED_MESSAGE_PROCESSOR,
	[v_u_1.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}