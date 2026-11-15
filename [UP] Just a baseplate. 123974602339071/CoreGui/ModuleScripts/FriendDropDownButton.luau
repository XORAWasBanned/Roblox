-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.FriendDropDownButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v_u_4 = game:GetService("LocalizationService")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.t)
local v7 = require(v1.Packages.UIBlox)
local v_u_8 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_9 = require(script.Parent.DropDownButtonAnimator)
local v_u_10 = v7.App.ImageSet.Images
local v_u_11 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_12 = v2.LocalPlayer
local v13 = v_u_5.PureComponent:extend("FriendDropDownButton")
local v14 = v6.strictInterface
local v15 = {
	["layoutOrder"] = v6.integer,
	["playerRelationship"] = v6.strictInterface({
		["isBlocked"] = v6.boolean,
		["friendStatus"] = v6.enum(Enum.FriendStatus),
		["isFollowing"] = v6.boolean,
		["isFollower"] = v6.boolean
	}),
	["selectedPlayer"] = v6.optional(v6.instanceIsA("Player")),
	["dropDownOpen"] = v6.boolean,
	["requestFriendship"] = v6.callback,
	["contentVisible"] = v6.optional(v6.boolean)
}
v13.validateProps = v14(v15)
local function v_u_20(p16) -- name: getFriendTextAndIcon
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_4, (copy) v_u_11
	local v17 = v_u_10["icons/actions/friends/friendAdd"]
	local v18 = v_u_10["icons/actions/friends/friendRemove"]
	local v19 = v_u_8.new(v_u_4.RobloxLocaleId)
	if p16 == Enum.FriendStatus.Friend then
		return v19:Format("Feature.Friends.Action.Unfriend"), v18
	elseif p16 == Enum.FriendStatus.Unknown or p16 == Enum.FriendStatus.NotFriend then
		return v19:Format("Feature.Friends.Label.FriendRequest"), v17
	elseif p16 == Enum.FriendStatus.FriendRequestSent then
		return v_u_11:FormatByKey("InGame.PlayerDropDown.CancelRequest"), v17
	elseif p16 == Enum.FriendStatus.FriendRequestReceived then
		return v_u_11:FormatByKey("InGame.PlayerDropDown.Accept"), v17
	else
		return v19:Format("Feature.Friends.Label.FriendRequest"), v17
	end
end
function v13.init(p21) -- name: init
	p21.state = {
		["unfriendConfirm"] = false
	}
end
function v13.render(p_u_22) -- name: render
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_20, (copy) v_u_5, (copy) v_u_9
	local v_u_23 = p_u_22.props.playerRelationship
	local v_u_24 = p_u_22.props.selectedPlayer
	local v25 = v_u_23.friendStatus == Enum.FriendStatus.Friend and not p_u_22.state.unfriendConfirm and function()
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["unfriendConfirm"] = true
		})
	end or function()
		-- upvalues: (copy) v_u_23, (ref) v_u_12, (copy) v_u_24, (copy) p_u_22, (ref) v_u_3
		if v_u_23.friendStatus == Enum.FriendStatus.Friend then
			v_u_12:RevokeFriendship(v_u_24)
			return
		elseif v_u_23.friendStatus == Enum.FriendStatus.Unknown or v_u_23.friendStatus == Enum.FriendStatus.NotFriend then
			p_u_22.props.requestFriendship(v_u_24, false)
			return
		elseif v_u_23.friendStatus == Enum.FriendStatus.FriendRequestSent then
			v_u_3:ReportCounter("PlayerDropDown-RevokeFriendship")
			v_u_3:TrackEvent("Game", "RevokeFriendship", "PlayerDropDown")
			v_u_12:RevokeFriendship(v_u_24)
		elseif v_u_23.friendStatus == Enum.FriendStatus.FriendRequestReceived then
			v_u_3:ReportCounter("PlayerDropDown-RequestFriendship")
			v_u_3:TrackEvent("Game", "RequestFriendship", "PlayerDropDown")
			p_u_22.props.requestFriendship(v_u_24, true)
		end
	end
	local v26 = v_u_23.friendStatus == Enum.FriendStatus.FriendRequestReceived and function()
		-- upvalues: (ref) v_u_12, (copy) v_u_24
		v_u_12:RevokeFriendship(v_u_24)
	end or nil
	local v27 = p_u_22.state.unfriendConfirm and function()
		-- upvalues: (copy) p_u_22
		p_u_22:setState({
			["unfriendConfirm"] = false
		})
	end or nil
	local v28, v29 = v_u_20(v_u_23.friendStatus)
	return v_u_5.createElement(v_u_9, {
		["layoutOrder"] = nil,
		["text"] = nil,
		["icon"] = nil,
		["lastButton"] = false,
		["onActivated"] = nil,
		["forceShowOptions"] = nil,
		["selectedPlayer"] = nil,
		["onDecline"] = nil,
		["onDismiss"] = nil,
		["layoutOrder"] = p_u_22.props.layoutOrder,
		["text"] = v28,
		["icon"] = v29,
		["onActivated"] = v25,
		["forceShowOptions"] = p_u_22.state.unfriendConfirm,
		["selectedPlayer"] = v_u_24,
		["onDecline"] = v26,
		["onDismiss"] = v27
	})
end
function v13.didUpdate(p30, p31, _) -- name: didUpdate
	if p31.playerRelationship.friendStatus ~= p30.props.playerRelationship.friendStatus then
		p30:setState({
			["unfriendConfirm"] = false
		})
	end
	if p31.selectedPlayer ~= p30.props.selectedPlayer or p31.dropDownOpen ~= p30.props.dropDownOpen then
		p30:setState({
			["unfriendConfirm"] = false
		})
	end
end
return v13