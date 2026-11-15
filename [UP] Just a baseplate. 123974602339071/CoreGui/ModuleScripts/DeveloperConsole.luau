-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.CommandModules.DeveloperConsole
local v_u_1 = game:GetService("StarterGui")
local v2 = require(script.Parent:WaitForChild("Util"))
function ProcessMessage(p3, _, _) -- name: ProcessMessage
	-- upvalues: (copy) v_u_1
	if string.sub(p3, 1, 8):lower() ~= "/console" and string.sub(p3, 1, 11):lower() ~= "/newconsole" then
		return false
	end
	local function v4()
		-- upvalues: (ref) v_u_1
		return v_u_1:GetCore("DevConsoleVisible")
	end
	local v5, v_u_6 = pcall(v4)
	if v5 then
		local function v7()
			-- upvalues: (ref) v_u_1, (copy) v_u_6
			v_u_1:SetCore("DevConsoleVisible", not v_u_6)
		end
		local v8, v9 = pcall(v7)
		if not v8 and v9 then
			print("Error making developer console visible: " .. v9)
		end
	end
	return true
end
return {
	[v2.KEY_COMMAND_PROCESSOR_TYPE] = v2.COMPLETED_MESSAGE_PROCESSOR,
	[v2.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}