-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InviteFriendsPage.InviteFriendsList
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.RoactRodux
local v6 = v3.t
local v_u_7 = require(v1.Packages.RoactGamepad)
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Components.PlayerLabelV2)
local v_u_10 = require(v8.Flags.GetFFlagIGMGamepadSelectionHistory)
local v_u_11 = require(v8.Components.Divider)
local v_u_12 = require(script.Parent.SendInviteButton)
local v_u_13 = require(script.Parent.SearchBox)
local v_u_14 = require(v8.Components.BarOnTopScrollingFrame)
local v_u_15 = require(v8.Utility.PlayerSearchPredicate)
local v_u_16 = require(v8.Components.Connection.FocusHandler)
local v_u_17 = require(v8.Components.Connection.RootedConnection)
local v_u_18 = require(v8.Resources.Constants)
local v_u_19 = v_u_18.InviteStatus
local v_u_20 = require(v8.Thunks.InviteUserToPlaceId)
local v21 = game.PlaceId
local v_u_22 = tostring(v21)
local v23 = v_u_4.PureComponent:extend("InviteFriendsList")
local v24 = v6.strictInterface
local v25 = {
	["friends"] = v6.array(v6.strictInterface({
		["IsOnline"] = v6.boolean,
		["Id"] = v6.integer,
		["Username"] = v6.string,
		["DisplayName"] = v6.string
	})),
	["invitesState"] = v6.table
}
local v26
if v_u_10() then
	v26 = v6.optional(v6.boolean) or nil
else
	v26 = nil
end
v25.shouldForgetPreviousSelection = v26
v25.dispatchInviteUserToPlaceId = v6.callback
v25.canCaptureFocus = v6.boolean
v25.searchBoxRef = v6.table
v23.validateProps = v24(v25)
function v23.init(p27) -- name: init
	-- upvalues: (copy) v_u_7
	p27.playerRefs = v_u_7.createRefCache()
	p27.state = {
		["searchText"] = ""
	}
	p27.inviteAnimationInProgress = {}
end
function v23.renderListEntries(p_u_28) -- name: renderListEntries
	-- upvalues: (copy) v_u_4, (copy) v_u_15, (copy) v_u_9, (copy) v_u_19, (copy) v_u_22, (copy) v_u_12, (copy) v_u_11
	local v29 = p_u_28.props.friends
	local v30 = #v29
	local v31 = {
		["ListLayout"] = v_u_4.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
		})
	}
	local v32 = 0
	local v33 = 1
	for v34, v_u_35 in pairs(v29) do
		local v36 = v_u_35.Id
		local v_u_37 = tostring(v36)
		local v_u_38 = p_u_28.props.invitesState[v_u_37]
		local v39 = v_u_15(p_u_28.state.searchText, v_u_35.Username, v_u_35.DisplayName)
		if v39 then
			v32 = v32 + 1
		end
		local v40 = "friend_" .. v34
		local v41 = v_u_4.createElement
		local v42 = v_u_9
		local v43 = {
			["username"] = v_u_35.Username,
			["displayName"] = v_u_35.DisplayName,
			["userId"] = v_u_35.Id,
			["isOnline"] = v_u_35.IsOnline,
			["isSelected"] = false,
			["LayoutOrder"] = v33,
			["Visible"] = v39,
			[v_u_4.Ref] = p_u_28.playerRefs[v34],
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) v_u_38, (ref) v_u_19, (copy) p_u_28, (copy) v_u_35, (copy) v_u_37, (ref) v_u_22
				if v_u_38 ~= v_u_19.Pending and (v_u_38 ~= v_u_19.Success and not p_u_28.inviteAnimationInProgress[v_u_35.Id]) then
					p_u_28.props.dispatchInviteUserToPlaceId(v_u_37, v_u_22)
				end
			end
		}
		local v44 = {}
		local v45 = {
			["userInviteStatus"] = v_u_38,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_28, (copy) v_u_37, (ref) v_u_22
				p_u_28.props.dispatchInviteUserToPlaceId(v_u_37, v_u_22)
			end,
			["animationBegun"] = function() -- name: animationBegun
				-- upvalues: (copy) p_u_28, (copy) v_u_35
				p_u_28.inviteAnimationInProgress[v_u_35.Id] = true
			end,
			["animationEnded"] = function() -- name: animationEnded
				-- upvalues: (copy) p_u_28, (copy) v_u_35
				p_u_28.inviteAnimationInProgress[v_u_35.Id] = nil
			end
		}
		v44.InviteButton = v_u_4.createElement(v_u_12, v45)
		v31[v40] = v41(v42, v43, v44)
		v33 = v33 + 1
		if v34 >= v30 then
			continue
		end
		v31["divider_" .. v33] = v_u_4.createElement(v_u_11, {
			["LayoutOrder"] = v33,
			["Size"] = UDim2.new(1, -104, 0, 1),
			["Visible"] = v39
		})
		v33 = v33 + 1
	end
	return v31, v32
end
function v23.render(p_u_46) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_2, (copy) v_u_14, (copy) v_u_10, (copy) v_u_17, (copy) v_u_16
	local v47, v48 = p_u_46:renderListEntries()
	local v49 = v_u_4.createElement
	local v50 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v52 = {
		["SearchBox"] = v_u_4.createElement(v_u_13, {
			["Size"] = UDim2.new(1, -48, 0, 36),
			["Position"] = UDim2.new(0.5, 0, 0, 8),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["searchUpdated"] = function(p51) -- name: searchUpdated
				-- upvalues: (copy) p_u_46
				p_u_46:setState({
					["searchText"] = p51
				})
			end,
			["searchCleared"] = function() -- name: searchCleared
				-- upvalues: (copy) p_u_46, (ref) v_u_2
				p_u_46:setState({
					["searchText"] = ""
				})
				if p_u_46.props.canCaptureFocus then
					v_u_2.SelectedCoreObject = p_u_46.props.searchBoxRef:getValue()
				end
			end,
			["itemRef"] = p_u_46.props.searchBoxRef
		}),
		["List"] = v_u_4.createElement(v_u_14, {
			["Position"] = UDim2.new(0, 0, 0, 64),
			["Size"] = UDim2.new(1, 0, 1, -64),
			["CanvasSize"] = UDim2.new(1, 0, 0, v48 * 72)
		}, v47)
	}
	local v_u_53 = v49("Frame", v50, v52)
	local v_u_54
	if v_u_10() then
		v_u_54 = p_u_46.props.shouldForgetPreviousSelection
	else
		v_u_54 = nil
	end
	local v57 = {
		["render"] = function(p55) -- name: render
			-- upvalues: (ref) v_u_4, (ref) v_u_16, (copy) p_u_46, (ref) v_u_54, (ref) v_u_10, (ref) v_u_2, (copy) v_u_53
			return v_u_4.createElement(v_u_16, {
				["isFocused"] = p_u_46.props.canCaptureFocus and p55,
				["shouldForgetPreviousSelection"] = v_u_54,
				["didFocus"] = v_u_10() and function(p56)
					-- upvalues: (ref) v_u_2, (ref) p_u_46
					v_u_2.SelectedCoreObject = p56 or (p_u_46:getFirstVisiblePlayerRef() or p_u_46.props.searchBoxRef:getValue())
				end or function()
					-- upvalues: (ref) v_u_2, (ref) p_u_46
					v_u_2.SelectedCoreObject = p_u_46:getFirstVisiblePlayerRef() or p_u_46.props.searchBoxRef:getValue()
				end
			}, {
				["FriendsList"] = v_u_53
			})
		end
	}
	return v_u_4.createElement(v_u_17, v57)
end
function v23.getFirstVisiblePlayerRef(p58) -- name: getFirstVisiblePlayerRef
	-- upvalues: (copy) v_u_15
	local v59 = p58.props.friends
	for v60, v61 in pairs(v59) do
		if not v_u_15(p58.state.searchText, v61.Username, v61.DisplayName) then
			continue
		end
		return p58.playerRefs[v60]:getValue()
	end
	return nil
end
return v5.UNSTABLE_connect2(function(p62, _)
	-- upvalues: (copy) v_u_10, (copy) v_u_18
	local v63
	if v_u_10() then
		v63 = p62.menuPage == v_u_18.MainPagePageKey and true or p62.currentZone == 0
	else
		v63 = nil
	end
	return {
		["invitesState"] = p62.invites,
		["shouldForgetPreviousSelection"] = v63
	}
end, function(p_u_64)
	-- upvalues: (copy) v_u_20
	return {
		["dispatchInviteUserToPlaceId"] = function(p65, p66) -- name: dispatchInviteUserToPlaceId
			-- upvalues: (copy) p_u_64, (ref) v_u_20
			p_u_64(v_u_20(p65, p66))
		end
	}
end)(v23)