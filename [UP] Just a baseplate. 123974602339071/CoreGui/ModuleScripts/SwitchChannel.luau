-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.CommandModules.SwitchChannel
local v_u_1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = nil
local function v3()
	-- upvalues: (ref) v_u_2
	v_u_2 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end
pcall(v3)
v_u_2 = v_u_2 == nil and {
	["Get"] = function(_, _, p4) -- name: Get
		return p4
	end
} or v_u_2
function ProcessMessage(p5, p6, p7) -- name: ProcessMessage
	-- upvalues: (copy) v_u_1, (ref) v_u_2
	if string.sub(p5, 1, 3):lower() ~= "/c " then
		return false
	end
	local v8 = string.sub(p5, 4)
	local v9 = p6:GetChannel(v8)
	if v9 then
		p6:SwitchCurrentChannel(v8)
		if not p7.ShowChannelsBar and p6:GetCurrentChannel() then
			v_u_1:SendSystemMessageToSelf(string.gsub(v_u_2:Get("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: \'%s\'", v8), {
				["RBX_NAME"] = v8
			}), "{RBX_NAME}", v8), v9, {})
		end
	else
		local v10 = p6:GetCurrentChannel()
		if v10 then
			v_u_1:SendSystemMessageToSelf(string.gsub(v_u_2:Get("GameChat_SwitchChannel_NotInChannel", string.format("You are not in channel: \'%s\'", v8), {
				["RBX_NAME"] = v8
			}), "{RBX_NAME}", v8), v10, {
				["ChatColor"] = Color3.fromRGB(245, 50, 50)
			})
		end
	end
	return true
end
return {
	[v_u_1.KEY_COMMAND_PROCESSOR_TYPE] = v_u_1.COMPLETED_MESSAGE_PROCESSOR,
	[v_u_1.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}