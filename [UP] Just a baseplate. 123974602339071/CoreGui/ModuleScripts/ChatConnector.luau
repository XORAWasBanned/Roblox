-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.ChatConnector
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent.Parent
if require(v6.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local v_u_7 = require(v6.Actions.UpdateChatVisible)
local v_u_8 = require(v6.Actions.UpdateChatMessages)
local v9 = v2:WaitForChild("RobloxGui")
local v_u_10 = require(v9.Modules.ChatSelector)
local v_u_11 = UserSettings().GameSettings
local v12 = v3.PureComponent:extend("ChatConnector")
v12.validateProps = v5.strictInterface({
	["isSmallTouchScreen"] = v5.boolean,
	["updateChatVisible"] = v5.callback,
	["updateChatMessages"] = v5.callback
})
function v12.didMount(p_u_13) -- name: didMount
	-- upvalues: (copy) v_u_11, (copy) v_u_10
	local v14 = v_u_11.ChatVisible
	if p_u_13.props.isSmallTouchScreen then
		v14 = false
	end
	v_u_10:SetVisible(v14)
	p_u_13.props.updateChatMessages(v_u_10:GetMessageCount())
	p_u_13.props.updateChatVisible(v_u_10:GetVisibility())
	p_u_13.chatVisibleConnection = v_u_10.VisibilityStateChanged:connect(function(p15)
		-- upvalues: (copy) p_u_13
		p_u_13.props.updateChatVisible(p15)
	end)
	p_u_13.chatMessagesConnection = v_u_10.MessagesChanged:connect(function(p16)
		-- upvalues: (copy) p_u_13
		p_u_13.props.updateChatMessages(p16)
	end)
end
function v12.render(_) -- name: render
	return nil
end
function v12.willUnmount(p17) -- name: willUnmount
	p17.chatVisibleConnection:disconnect()
	p17.chatMessagesConnection:disconnect()
end
return v4.UNSTABLE_connect2(function(p18) -- name: mapStateToProps
	return {
		["isSmallTouchScreen"] = p18.displayOptions.isSmallTouchDevice
	}
end, function(p_u_19) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	return {
		["updateChatVisible"] = function(p20) -- name: updateChatVisible
			-- upvalues: (copy) p_u_19, (ref) v_u_7
			return p_u_19(v_u_7(p20))
		end,
		["updateChatMessages"] = function(p21) -- name: updateChatMessages
			-- upvalues: (copy) p_u_19, (ref) v_u_8
			return p_u_19(v_u_8(p21))
		end
	}
end)(v12)