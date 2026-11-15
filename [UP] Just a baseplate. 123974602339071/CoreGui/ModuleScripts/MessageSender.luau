-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.MessageSender
local v1 = {}
local _ = script.Parent
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.SendMessage(p3, p4, p5) -- name: SendMessage
	p3.SayMessageRequest:FireServer(p4, p5)
end
function v_u_2.RegisterSayMessageFunction(p6, p7) -- name: RegisterSayMessageFunction
	p6.SayMessageRequest = p7
end
function v1.new() -- name: new
	-- upvalues: (copy) v_u_2
	local v8 = v_u_2
	local v9 = setmetatable({}, v8)
	v9.SayMessageRequest = nil
	return v9
end
return v1.new()