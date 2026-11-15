-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.MessageLabelCreator
local v1 = {}
local v_u_2 = game:GetService("Chat")
local v3 = v_u_2:WaitForChild("ClientChatModules")
local v_u_4 = v3:WaitForChild("MessageCreatorModules")
local v_u_5 = require(v_u_4:WaitForChild("Util"))
local v6 = script.Parent
require(v3:WaitForChild("ChatSettings"))
local v_u_7 = require(v6:WaitForChild("ObjectPool"))
require(v6:WaitForChild("MessageSender"))
local v_u_8 = {}
v_u_8.__index = v_u_8
function mergeProps(p9, p10) -- name: mergeProps
	if p9 then
		for v11, v12 in pairs(p9) do
			p10[v11] = v12
		end
	end
end
function ReturnToObjectPoolRecursive(p13, p14) -- name: ReturnToObjectPoolRecursive
	local v15 = p13:GetChildren()
	for v16 = 1, #v15 do
		ReturnToObjectPoolRecursive(v15[v16], p14)
	end
	p13.Parent = nil
	p14:ReturnInstance(p13)
end
function GetMessageCreators() -- name: GetMessageCreators
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v17 = v_u_4:GetChildren()
	local v18 = {}
	for v19 = 1, #v17 do
		if not v17[v19]:IsA("ModuleScript") or v17[v19].Name == "Util" then
			continue
		end
		local v20 = require(v17[v19])
		v18[v20[v_u_5.KEY_MESSAGE_TYPE]] = v20[v_u_5.KEY_CREATOR_FUNCTION]
	end
	return v18
end
function v_u_8.WrapIntoMessageObject(p21, p22, p23) -- name: WrapIntoMessageObject
	-- upvalues: (copy) v_u_5
	local v24 = p23[v_u_5.KEY_BASE_FRAME]
	local v25
	if v_u_5.KEY_BASE_MESSAGE then
		v25 = p23[v_u_5.KEY_BASE_MESSAGE]
	else
		v25 = nil
	end
	local v26 = p23[v_u_5.KEY_UPDATE_TEXT_FUNC]
	local v27 = p23[v_u_5.KEY_GET_HEIGHT]
	local v28 = p23[v_u_5.KEY_FADE_IN]
	local v29 = p23[v_u_5.KEY_FADE_OUT]
	local v30 = p23[v_u_5.KEY_UPDATE_ANIMATION]
	return {
		["ID"] = p22.ID,
		["BaseFrame"] = v24,
		["BaseMessage"] = v25,
		["UpdateTextFunction"] = v26 or function()
			warn("NO MESSAGE RESIZE FUNCTION")
		end,
		["GetHeightFunction"] = v27,
		["FadeInFunction"] = v28,
		["FadeOutFunction"] = v29,
		["UpdateAnimFunction"] = v30,
		["ObjectPool"] = p21.ObjectPool,
		["Destroyed"] = false,
		["Destroy"] = function(p31) -- name: Destroy
			ReturnToObjectPoolRecursive(p31.BaseFrame, p31.ObjectPool)
			p31.Destroyed = true
		end
	}
end
function v_u_8.CreateMessageLabel_Chat(p32, p_u_33, p34, p35) -- name: CreateMessageLabel_Chat
	-- upvalues: (copy) v_u_2
	p_u_33.Channel = p34
	local v_u_36 = nil
	local function v37()
		-- upvalues: (ref) v_u_36, (ref) v_u_2, (copy) p_u_33
		v_u_36 = v_u_2:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p_u_33)
	end
	pcall(v37)
	p_u_33.ExtraData = p_u_33.ExtraData or {}
	mergeProps(v_u_36, p_u_33.ExtraData)
	local v38 = p_u_33.MessageType
	if p32.MessageCreators[v38] then
		local v39 = p32.MessageCreators[v38](p_u_33, p34, p35)
		if v39 then
			return p32:WrapIntoMessageObject(p_u_33, v39)
		end
	elseif p32.DefaultCreatorType then
		local v40 = p32.MessageCreators[p32.DefaultCreatorType](p_u_33, p34, p35)
		if v40 then
			return p32:WrapIntoMessageObject(p_u_33, v40)
		end
	else
		error("No message creator available for message type: " .. v38)
	end
end
function v_u_8.CreateMessageLabel(p41, p_u_42, p43) -- name: CreateMessageLabel
	-- upvalues: (copy) v_u_2
	p_u_42.Channel = p43
	local v_u_44 = nil
	local function v45()
		-- upvalues: (ref) v_u_44, (ref) v_u_2, (copy) p_u_42
		v_u_44 = v_u_2:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p_u_42)
	end
	pcall(v45)
	p_u_42.ExtraData = p_u_42.ExtraData or {}
	mergeProps(v_u_44, p_u_42.ExtraData)
	local v46 = p_u_42.MessageType
	if p41.MessageCreators[v46] then
		local v47 = p41.MessageCreators[v46](p_u_42, p43)
		if v47 then
			return p41:WrapIntoMessageObject(p_u_42, v47)
		end
	elseif p41.DefaultCreatorType then
		local v48 = p41.MessageCreators[p41.DefaultCreatorType](p_u_42, p43)
		if v48 then
			return p41:WrapIntoMessageObject(p_u_42, v48)
		end
	else
		error("No message creator available for message type: " .. v46)
	end
end
function v1.new() -- name: new
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_5
	local v49 = v_u_8
	local v50 = setmetatable({}, v49)
	v50.ObjectPool = v_u_7.new(50)
	v50.MessageCreators = GetMessageCreators()
	v50.DefaultCreatorType = v_u_5.DEFAULT_MESSAGE_CREATOR
	v_u_5:RegisterObjectPool(v50.ObjectPool)
	return v50
end
function v1.GetStringTextBounds(_, p51, p52, p53, p54) -- name: GetStringTextBounds
	-- upvalues: (copy) v_u_5
	return v_u_5:GetStringTextBounds(p51, p52, p53, p54)
end
return v1