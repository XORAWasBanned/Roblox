-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.CommandProcessor
local v1 = {}
local v_u_2 = {}
v_u_2.__index = v_u_2
local v3 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_4 = v3:WaitForChild("CommandModules")
local v_u_5 = require(v_u_4:WaitForChild("Util"))
local _ = script.Parent
local v_u_6 = require(v3:WaitForChild("ChatSettings"))
function v_u_2.SetupCommandProcessors(p7) -- name: SetupCommandProcessors
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v8 = v_u_4:GetChildren()
	for v9 = 1, #v8 do
		if not v8[v9]:IsA("ModuleScript") or v8[v9].Name == "Util" then
			continue
		end
		local v10 = require(v8[v9])
		local v11 = v10[v_u_5.KEY_COMMAND_PROCESSOR_TYPE]
		local v12 = v10[v_u_5.KEY_PROCESSOR_FUNCTION]
		if v11 == v_u_5.IN_PROGRESS_MESSAGE_PROCESSOR then
			local v13 = p7.InProgressMessageProcessors
			table.insert(v13, v12)
		else
			if v11 ~= v_u_5.COMPLETED_MESSAGE_PROCESSOR then
				continue
			end
			local v14 = p7.CompletedMessageProcessors
			table.insert(v14, v12)
		end
	end
end
function v_u_2.ProcessCompletedChatMessage(p15, p16, p17) -- name: ProcessCompletedChatMessage
	-- upvalues: (copy) v_u_6
	for v18 = 1, #p15.CompletedMessageProcessors do
		if not p15.CompletedMessageProcessors[v18](p16, p17, v_u_6) then
			continue
		end
		return true
	end
	return false
end
function v_u_2.ProcessInProgressChatMessage(p19, p20, p21, p22) -- name: ProcessInProgressChatMessage
	-- upvalues: (copy) v_u_6
	for v23 = 1, #p19.InProgressMessageProcessors do
		local v24 = p19.InProgressMessageProcessors[v23](p20, p21, p22, v_u_6)
		if not v24 then
			continue
		end
		return v24
	end
	return nil
end
function v1.new() -- name: new
	-- upvalues: (copy) v_u_2
	local v25 = v_u_2
	local v26 = setmetatable({}, v25)
	v26.CompletedMessageProcessors = {}
	v26.InProgressMessageProcessors = {}
	v26:SetupCommandProcessors()
	return v26
end
return v1