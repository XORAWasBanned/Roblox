-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ConversationList
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("HttpRbxApiService")
local v_u_4 = require(v1.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank
local v5 = game:GetService("CoreGui")
local v6 = v5:WaitForChild("RobloxGui")
local v_u_7 = game:GetService("Players")
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = require(v1.Packages.Roact)
local v10 = require(v1.Packages.RoactRodux)
local v11 = v5.RobloxGui.Modules
local v12 = v6.Modules.Settings.Pages.ShareGame
local v13 = require(v11.Settings.Theme)
local v_u_14 = require(v12.Constants)
local v_u_15 = require(v1.Workspace.Packages.GameInvite).GameInviteEvents
local v_u_16 = require(v12.Components.ConversationEntry)
local v_u_17 = require(v12.Components.InviteListEntry)
local v_u_18 = require(v12.Components.FriendsErrorPage)
local v_u_19 = require(v12.Thunks.InviteUserIdToPlaceId)
local v_u_20 = require(v12.Thunks.InviteUserIdToPlaceIdCustomized)
local v_u_21 = require(v12.NewInviteMenuExperimentManager)
local v_u_22 = require(v12.Components.LoadingFriendsPage)
local v_u_23 = require(v12.Components.NoFriendsPage)
local v_u_24 = require(v5.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate)
local v_u_25 = require(v11.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local v_u_26 = require(v11.Flags.GetFFlagEnableNewInviteMenu)
local v_u_27 = require(v11.Flags.GetFFlagEnableNewInviteSendEndpoint)
local v28 = require(v1.Workspace.Packages.UserLib).Models.UserModel
local v_u_29 = require(v11.Common.httpRequest)
local v30 = require(v1.Workspace.Packages.AppCommonLib).memoize
local v_u_31 = require(v1.Workspace.Packages.Http).Enum.RetrievalStatus
local v_u_32 = require(v1.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank
local v_u_33 = require(v12.getTranslator)()
local v_u_34 = v13.font(Enum.Font.SourceSans)
local v_u_35 = v_u_14.Color.GRAY3
local v_u_36 = v13.textSize(19)
local v_u_37 = {
	[v28.PresenceType.ONLINE] = 3,
	[v28.PresenceType.IN_GAME] = 2,
	[v28.PresenceType.IN_STUDIO] = 1,
	[v28.PresenceType.OFFLINE] = 0
}
local v_u_38 = {
	["SORT_BY_FREQUENCY"] = 1,
	["SORT_BY_PRESENCE_AND_FREQUENCY"] = 2
}
local v39 = v_u_9.PureComponent:extend("ConversationList")
v39.defaultProps = {
	["entryHeight"] = 62,
	["entryPadding"] = 16
}
function v39.init(p_u_40) -- name: init
	-- upvalues: (copy) v_u_9
	p_u_40.scrollingRef = v_u_9.createRef()
	function p_u_40.inviteUser(p41)
		-- upvalues: (copy) p_u_40
		return p_u_40.props.inviteUser(p41, p_u_40.props.analytics, p_u_40.props.trigger, p_u_40.props.inviteMessageId, p_u_40.props.launchData)
	end
end
function v39.render(p42) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_27, (copy) v_u_26, (copy) v_u_24, (copy) v_u_17, (copy) v_u_8, (copy) v_u_16, (copy) v_u_31, (copy) v_u_22, (copy) v_u_23, (copy) v_u_18, (copy) v_u_34, (copy) v_u_33, (copy) v_u_35, (copy) v_u_36
	local v43 = p42.props.analytics
	local v44 = p42.props[v_u_9.Children] or {}
	local v45 = p42.props.entryHeight
	local v46 = p42.props.entryPadding
	local v47 = p42.props.friends
	local v48 = p42.props.friendsRetrievalStatus
	local v49 = p42.props.layoutOrder
	local v50 = p42.props.size
	local v51 = p42.props.zIndex
	local v52 = p42.props.topPadding
	local v53 = p42.props.invites
	local v54 = p42.props.inviteUser
	local v55 = p42.props.searchText
	if v_u_27() then
		v54 = p42.inviteUser
	end
	local v56 = v_u_26()
	v44.RowListLayout = v_u_9.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Vertical,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, v46)
	})
	local v57 = 0
	for v58, v59 in ipairs(v47) do
		local v60 = v_u_24(v55, v59.name, v59.displayName)
		if v56 then
			v44["User-" .. tostring(v58)] = v_u_9.createElement(v_u_17, {
				["analytics"] = v43,
				["user"] = v59,
				["visible"] = v60,
				["layoutOrder"] = v58,
				["inviteUser"] = v54,
				["inviteStatus"] = v53[v59.id],
				["isFullRowActivatable"] = v_u_8.GamepadEnabled,
				["trigger"] = p42.props.trigger,
				["inviteMessageId"] = p42.props.inviteMessageId,
				["launchData"] = p42.props.launchData
			})
		else
			v44["User-" .. tostring(v58)] = v_u_9.createElement(v_u_16, {
				["analytics"] = v43,
				["visible"] = v60,
				["size"] = UDim2.new(1, 0, 0, v45),
				["layoutOrder"] = v58,
				["zIndex"] = v51,
				["title"] = v59.displayName,
				["subtitle"] = "@" .. v59.name,
				["presence"] = v59.presence,
				["users"] = { v59 },
				["inviteUser"] = v54,
				["inviteStatus"] = v53[v59.id]
			})
		end
		if not v60 then
			continue
		end
		v57 = v57 + 1
	end
	if #v47 == 0 or v48 == v_u_31.Fetching then
		local v61 = v_u_22
		if v48 == v_u_31.Done then
			v61 = v_u_23
		elseif v48 == v_u_31.Failed then
			v61 = v_u_18
		end
		return v_u_9.createElement(v61, {
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = nil,
			["Position"] = nil,
			["ZIndex"] = nil,
			["LayoutOrder"] = v49,
			["Position"] = UDim2.new(0, 0, 0, v52),
			["ZIndex"] = v51
		})
	end
	if v57 == 0 then
		return v_u_9.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Font"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["TextTransparency"] = 0.22,
			["ZIndex"] = nil,
			["Position"] = nil,
			["LayoutOrder"] = v49,
			["Font"] = v_u_34,
			["Size"] = UDim2.new(1, 0, 0, v45),
			["Text"] = v_u_33:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"),
			["TextColor3"] = v_u_35,
			["TextSize"] = v_u_36,
			["ZIndex"] = v51,
			["Position"] = UDim2.new(0, 0, 0, v52)
		})
	end
	local v62 = v_u_9.createElement
	local v63 = "ScrollingFrame"
	local v64 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = v49,
		["Size"] = v50,
		["BorderSizePixel"] = 0,
		["Position"] = UDim2.new(0, 0, 0, v52)
	}
	local v65
	if v56 then
		v65 = UDim2.new()
	else
		v65 = UDim2.new(0, 0, 0, v57 * (v45 + v46))
	end
	v64.CanvasSize = v65
	local v66
	if v56 then
		v66 = Enum.AutomaticSize.Y
	else
		v66 = nil
	end
	v64.AutomaticCanvasSize = v66
	v64.ScrollBarThickness = 0
	v64.ZIndex = v51
	v64.Selectable = false
	v64[v_u_9.Ref] = p42.scrollingRef
	return v62(v63, v64, v44)
end
local function v_u_70(p67) -- name: handleBinding
	-- upvalues: (copy) v_u_26, (copy) v_u_8, (copy) v_u_2
	if not v_u_26() or v_u_8.GamepadEnabled then
		local v68 = p67.scrollingRef:getValue()
		if v68 and (v68:FindFirstAncestorOfClass("ScreenGui").Enabled and v_u_2.SelectedCoreObject == nil) then
			v_u_2:AddSelectionParent("invitePrompt", v68)
			for _, v69 in ipairs(v68:GetChildren()) do
				if not v69:IsA("GuiObject") or v69.LayoutOrder ~= 1 then
					continue
				end
				v_u_2.SelectedCoreObject = v69
				return
			end
		end
	end
end
v39.didUpdate = v_u_70
if v_u_27() then
	function v39.didMount(p71) -- name: didMount
		-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_25, (copy) v_u_70
		if p71.props.analytics and p71.props.trigger == v_u_14.Triggers.GameMenu then
			local v72
			if p71.props.launchData == nil then
				v72 = false
			else
				v72 = p71.props.launchData ~= ""
			end
			p71.props.analytics:sendEvent(p71.props.trigger, v_u_15.ModalOpened, v_u_25() and {
				["isLaunchDataProvided"] = v72
			} or nil)
		end
		v_u_70(p71)
	end
else
	v39.didMount = v_u_70
end
local v_u_81 = v30(function(p73)
	-- upvalues: (copy) v_u_37
	local function v78(p74, p75) -- name: friendPreference
		-- upvalues: (ref) v_u_37
		local v76 = v_u_37[p74.presence]
		local v77 = v_u_37[p75.presence]
		if v76 == v77 then
			return p74.name:lower() < p75.name:lower()
		else
			return v77 < v76
		end
	end
	local v79 = {}
	for _, v80 in pairs(p73) do
		if not v80.isFriend then
			continue
		end
		v79[#v79 + 1] = v80
	end
	table.sort(v79, v78)
	return v79
end)
local v_u_85 = v30(function(p82)
	-- upvalues: (copy) v_u_4
	local v83 = {}
	for _, v84 in pairs(p82) do
		if not v84.isFriend then
			continue
		end
		v83[#v83 + 1] = v84
	end
	table.sort(v83, v_u_4)
	return v83
end)
local v_u_96 = v30(function(p86)
	local v87 = {}
	local function v94(p88, p89) -- name: friendPreference
		local v90 = p88.friendFrequentRank
		local v91 = tonumber(v90) or 0
		local v92 = p89.friendFrequentRank
		local v93 = tonumber(v92) or 0
		if v91 == v93 then
			return p88.name:lower() < p89.name:lower()
		else
			return v91 < v93
		end
	end
	for _, v95 in pairs(p86) do
		if not v95.isFriend then
			continue
		end
		v87[#v87 + 1] = v95
	end
	table.sort(v87, v94)
	return v87
end)
return v10.UNSTABLE_connect2(function(p97, _)
	-- upvalues: (copy) v_u_81, (copy) v_u_32, (copy) v_u_21, (copy) v_u_38, (copy) v_u_96, (copy) v_u_85, (copy) v_u_7
	local v98 = v_u_81
	if v_u_32() then
		local v99 = v_u_21.default:getInviteListSortOrder() or 0
		if v99 == v_u_38.SORT_BY_FREQUENCY then
			v98 = v_u_96
		elseif v99 == v_u_38.SORT_BY_PRESENCE_AND_FREQUENCY then
			v98 = v_u_85
		else
			v98 = v_u_81
		end
	end
	local v100 = {
		["friends"] = v98(p97.Users)
	}
	local v101 = p97.Friends.retrievalStatus
	local v102 = v_u_7.LocalPlayer.UserId
	v100.friendsRetrievalStatus = v101[tostring(v102)]
	v100.invites = p97.Invites
	return v100
end, function(p_u_103)
	-- upvalues: (copy) v_u_29, (copy) v_u_3, (copy) v_u_27, (copy) v_u_20, (copy) v_u_19
	return {
		["inviteUser"] = function(p104, p105, p106, p107, p108) -- name: inviteUser
			-- upvalues: (ref) v_u_29, (ref) v_u_3, (ref) v_u_27, (copy) p_u_103, (ref) v_u_20, (ref) v_u_19
			local v109 = v_u_29(v_u_3)
			local v110 = game.PlaceId
			local v111 = tostring(v110)
			if v_u_27() then
				return p_u_103(v_u_20(v109, p104, v111, p105, p106, p107, p108))
			else
				return p_u_103(v_u_19(v109, p104, v111))
			end
		end
	}
end)(v39)