-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationMobile.FriendDropDownButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v_u_4 = game:GetService("LocalizationService")
local v_u_5 = require(v1.Packages.Cryo)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.t)
local v8 = require(v1.Packages.UIBlox)
local v_u_9 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_10 = require(v1.Packages.ReactFocusNavigation).useFocusGuiObject
local v_u_11 = require(script.Parent.DropDownButtonAnimator)
local v_u_12 = v8.App.ImageSet.Images
local v_u_13 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_14 = v2.LocalPlayer
local v_u_15 = v_u_6.PureComponent:extend("FriendDropDownButton")
local v16 = v7.strictInterface
local v17 = {
	["layoutOrder"] = v7.integer,
	["playerRelationship"] = v7.strictInterface({
		["isBlocked"] = v7.boolean,
		["friendStatus"] = v7.enum(Enum.FriendStatus),
		["isFollowing"] = v7.boolean,
		["isFollower"] = v7.boolean
	}),
	["selectedPlayer"] = v7.optional(v7.instanceIsA("Player")),
	["dropDownOpen"] = v7.boolean,
	["requestFriendship"] = v7.callback,
	["contentVisible"] = v7.boolean,
	["isUsingGamepad"] = v7.optional(v7.boolean),
	["focusGuiObject"] = v7.callback
}
v_u_15.validateProps = v16(v17)
local function v_u_22(p18) -- name: getFriendTextAndIcon
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_13
	local v19 = v_u_12["icons/actions/friends/friendAdd"]
	local v20 = v_u_12["icons/actions/friends/friendRemove"]
	local v21 = v_u_9.new(v_u_4.RobloxLocaleId)
	if p18 == Enum.FriendStatus.Friend then
		return v21:Format("Feature.Friends.Action.Unfriend"), v20
	elseif p18 == Enum.FriendStatus.Unknown or p18 == Enum.FriendStatus.NotFriend then
		return v21:Format("Feature.Friends.Label.FriendRequest"), v19
	elseif p18 == Enum.FriendStatus.FriendRequestSent then
		return v_u_13:FormatByKey("InGame.PlayerDropDown.CancelRequest"), v19
	elseif p18 == Enum.FriendStatus.FriendRequestReceived then
		return v_u_13:FormatByKey("InGame.PlayerDropDown.Accept"), v19
	else
		return v21:Format("Feature.Friends.Label.FriendRequest"), v19
	end
end
function v_u_15.init(p_u_23) -- name: init
	-- upvalues: (copy) v_u_6
	p_u_23.state = {
		["unfriendConfirm"] = false
	}
	p_u_23.dropDownButtonAnimatorRef = v_u_6.createRef()
	function p_u_23.onAnimationComplete()
		-- upvalues: (copy) p_u_23
		if p_u_23.props.isUsingGamepad then
			p_u_23.props.focusGuiObject(p_u_23.dropDownButtonAnimatorRef.current)
		end
	end
end
function v_u_15.render(p_u_24) -- name: render
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_22, (copy) v_u_6, (copy) v_u_11
	local v_u_25 = p_u_24.props.playerRelationship
	local v_u_26 = p_u_24.props.selectedPlayer
	local v27 = v_u_25.friendStatus == Enum.FriendStatus.Friend and not p_u_24.state.unfriendConfirm and function()
		-- upvalues: (copy) p_u_24
		p_u_24:setState({
			["unfriendConfirm"] = true
		})
	end or function()
		-- upvalues: (copy) v_u_25, (ref) v_u_14, (copy) v_u_26, (copy) p_u_24, (ref) v_u_3
		if v_u_25.friendStatus == Enum.FriendStatus.Friend then
			v_u_14:RevokeFriendship(v_u_26)
			return
		elseif v_u_25.friendStatus == Enum.FriendStatus.Unknown or v_u_25.friendStatus == Enum.FriendStatus.NotFriend then
			p_u_24.props.requestFriendship(v_u_26, false)
			return
		elseif v_u_25.friendStatus == Enum.FriendStatus.FriendRequestSent then
			v_u_3:ReportCounter("PlayerDropDown-RevokeFriendship")
			v_u_3:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
			v_u_14:RevokeFriendship(v_u_26)
		elseif v_u_25.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			v_u_3:ReportCounter("PlayerDropDown-RequestFriendship")
			v_u_3:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
			p_u_24.props.requestFriendship(v_u_26, true)
		end
	end
	local v28 = v_u_25.friendStatus == Enum.FriendStatus.FriendRequestReceived and function()
		-- upvalues: (ref) v_u_14, (copy) v_u_26
		v_u_14:RevokeFriendship(v_u_26)
	end or nil
	local v29 = p_u_24.state.unfriendConfirm and function()
		-- upvalues: (copy) p_u_24
		p_u_24:setState({
			["unfriendConfirm"] = false
		})
	end or nil
	local v30, v31 = v_u_22(v_u_25.friendStatus)
	return v_u_6.createElement(v_u_11, {
		["layoutOrder"] = nil,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = false,
		["onActivated"] = nil,
		["forceShowOptions"] = nil,
		["selectedPlayer"] = nil,
		["onDecline"] = nil,
		["onDismiss"] = nil,
		["contentVisible"] = nil,
		["forwardRef"] = nil,
		["onAnimationComplete"] = nil,
		["layoutOrder"] = p_u_24.props.layoutOrder,
		["text"] = v30,
		["icon"] = v31,
		["onActivated"] = v27,
		["forceShowOptions"] = p_u_24.state.unfriendConfirm,
		["selectedPlayer"] = v_u_26,
		["onDecline"] = v28,
		["onDismiss"] = v29,
		["contentVisible"] = p_u_24.props.contentVisible,
		["forwardRef"] = p_u_24.dropDownButtonAnimatorRef,
		["onAnimationComplete"] = p_u_24.onAnimationComplete
	})
end
function v_u_15.didUpdate(p32, p33, p34) -- name: didUpdate
	if p33.playerRelationship.friendStatus ~= p32.props.playerRelationship.friendStatus then
		p32:setState({
			["unfriendConfirm"] = false
		})
	end
	if p33.selectedPlayer ~= p32.props.selectedPlayer or p33.dropDownOpen ~= p32.props.dropDownOpen then
		p32:setState({
			["unfriendConfirm"] = false
		})
	end
	if p32.props.isUsingGamepad then
		local v35 = p32.state.unfriendConfirm or p32.props.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived
		if v35 and v35 ~= (p34.unfriendConfirm or p33.playerRelationship.friendStatus == Enum.FriendStatus.FriendRequestReceived) then
			p32.props.focusGuiObject(p32.dropDownButtonAnimatorRef.current)
			return
		end
	elseif p33.isUsingGamepad ~= p32.props.isUsingGamepad then
		p32.props.focusGuiObject(nil)
	end
end
function FriendDropDownButtonWrapper(p36) -- name: FriendDropDownButtonWrapper
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_15, (copy) v_u_5
	local v37 = {
		["focusGuiObject"] = v_u_10()
	}
	return v_u_6.createElement(v_u_15, v_u_5.Dictionary.join(p36, v37))
end
return FriendDropDownButtonWrapper