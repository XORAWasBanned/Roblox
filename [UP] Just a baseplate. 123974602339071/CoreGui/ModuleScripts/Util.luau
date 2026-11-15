-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.DefaultClientChatModules.CommandModules.Util
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatConstants"))
local v3 = {}
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.SendSystemMessageToSelf(_, p5, p6, p7) -- name: SendSystemMessageToSelf
	-- upvalues: (copy) v_u_2
	p6:AddMessageToChannel({
		["ID"] = -1,
		["FromSpeaker"] = nil,
		["SpeakerUserId"] = 0,
		["OriginalChannel"] = nil,
		["IsFiltered"] = true,
		["MessageLength"] = nil,
		["MessageLengthUtf8"] = nil,
		["Message"] = nil,
		["MessageType"] = nil,
		["Time"] = nil,
		["ExtraData"] = nil,
		["OriginalChannel"] = p6.Name,
		["MessageLength"] = string.len(p5),
		["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p5)),
		["Message"] = p5,
		["MessageType"] = v_u_2.MessageTypeSystem,
		["Time"] = os.time(),
		["ExtraData"] = p7
	})
end
function v3.new() -- name: new
	-- upvalues: (copy) v_u_4
	local v8 = v_u_4
	local v9 = setmetatable({}, v8)
	v9.COMMAND_MODULES_VERSION = 1
	v9.KEY_COMMAND_PROCESSOR_TYPE = "ProcessorType"
	v9.KEY_PROCESSOR_FUNCTION = "ProcessorFunction"
	v9.IN_PROGRESS_MESSAGE_PROCESSOR = 0
	v9.COMPLETED_MESSAGE_PROCESSOR = 1
	return v9
end
return v3.new()