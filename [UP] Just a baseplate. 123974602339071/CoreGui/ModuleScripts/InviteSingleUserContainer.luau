-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.InviteSingleUserContainer
local v_u_1 = game:GetService("ContextActionService")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("HttpRbxApiService")
local v_u_6 = require(v3.Packages.React)
local v7 = require(v3.Packages.RoactRodux)
local v8 = v2.RobloxGui.Modules
local v_u_9 = require(v8.Common.renderWithCoreScriptsStyleProvider)
local v10 = v8.Settings.Pages.ShareGame
local v_u_11 = require(v3.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local v_u_12 = require(v10.Constants)
local v_u_13 = require(v3.Workspace.Packages.GameInvite).GameInviteEvents
local v_u_14 = v_u_12.InviteStatus
local v_u_15 = require(v10.getTranslator)()
local v_u_16 = require(v8.Common.httpRequest)
local v_u_17 = require(v10.Thunks.InviteUserIdToPlaceId)
local v_u_18 = require(v3.Workspace.Packages.Http).Enum.RetrievalStatus
local v_u_19 = require(v10.Thunks.InviteUserIdToPlaceIdCustomized)
local v_u_20 = require(v10.ThrottleFunctionCall)
local v_u_21 = require(v10.Components.SingleUserThumbnail)
local v_u_22 = require(v3.Packages.Signals)
local v_u_23 = require(v3.Packages.SignalsReact)
local v_u_24 = require(v3.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local v_u_25 = require(v10.Components.LoadingModal)
local v_u_26 = require(v8.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local v_u_27 = require(v8.Flags.GetFFlagEnableNewInviteSendEndpoint)
local v_u_28 = require(v3.Workspace.Packages.SharedFlags).FFlagFixPromptGameInviteUIMissingDisplayName
local v_u_29 = require(v8.Flags.GetFFlagThrottleInviteSendEndpoint)
local v_u_30 = require(v8.Flags.GetFIntThrottleInviteSendEndpointDelay)
local v_u_31 = require(v8.Settings.Flags.GetFFlagSingleUserInvitePageKeybind)
local v32 = require(v3.Packages.UIBlox)
local v_u_33 = v32.App.Button.Button
local v_u_34 = v32.App.Button.Enum.ButtonType
local v_u_35 = v32.App.Text.StyledTextLabel
local v_u_36 = v32.Core.Style.useStyle
local v_u_37 = Color3.fromRGB(41, 41, 41)
local function v_u_79(p_u_38)
	-- upvalues: (copy) v_u_36, (copy) v_u_6, (copy) v_u_28, (copy) v_u_24, (copy) v_u_22, (copy) v_u_23, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_26, (copy) v_u_4, (copy) v_u_31, (copy) v_u_1, (copy) v_u_29, (copy) v_u_20, (copy) v_u_30, (copy) v_u_18, (copy) v_u_25, (copy) v_u_37, (copy) v_u_35, (copy) v_u_15, (copy) v_u_11, (copy) v_u_21, (copy) v_u_33, (copy) v_u_34
	local v39 = p_u_38.friends
	local v40 = p_u_38.inviteUserId
	local v_u_41 = v39[tostring(v40)]
	local v_u_42
	if v_u_41 then
		v_u_42 = p_u_38.invites[v_u_41.id]
	else
		v_u_42 = v_u_41
	end
	local v43 = v_u_36()
	local v44, v_u_45 = v_u_6.useState(false)
	local v_u_46
	if v_u_28 then
		v_u_46 = v_u_6.useMemo(function()
			-- upvalues: (ref) v_u_24, (copy) p_u_38
			local v47 = v_u_24.get().fetchNamesByUserIds
			local v48 = {}
			local v49 = p_u_38.inviteUserId
			__set_list(v48, 1, {(tostring(v49))})
			return v47(v48)
		end, { p_u_38.inviteUserId })
	else
		v_u_46 = nil
	end
	local v50
	if v_u_28 then
		v50 = v_u_6.useMemo(function()
			-- upvalues: (ref) v_u_22, (copy) v_u_46
			return v_u_22.createComputed(function(p51)
				-- upvalues: (ref) v_u_46
				local v52 = v_u_46(p51)
				local v53 = v52 and v52.data
				if v53 then
					v53 = v52.data[1]
				end
				if v53 then
					v53 = v53.names
				end
				local v54
				if v53 then
					v54 = v53.getCombinedName(p51)
					if v54 == "" then
						v54 = v53.getUsername(p51)
					end
				else
					v54 = ""
				end
				return {
					["name"] = v54,
					["isFetching"] = v52 == nil and true or v52.status == "fetching"
				}
			end)
		end, { v_u_46 })
	else
		v50 = nil
	end
	local v55
	if v_u_28 then
		v55 = v_u_23.useSignalState(v50)
	else
		v55 = nil
	end
	v_u_6.useEffect(function()
		-- upvalues: (copy) p_u_38, (ref) v_u_12, (ref) v_u_13
		if p_u_38.promptMessage and p_u_38.analytics then
			p_u_38.analytics:sendEvent(v_u_12.Triggers.DeveloperSingle, v_u_13.CustomTextShown)
		end
	end, {})
	local v_u_56 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_38
		p_u_38.closePage()
		if p_u_38.onAfterClosePage then
			p_u_38.onAfterClosePage()
		end
	end, { p_u_38.closePage, p_u_38.onAfterClosePage })
	local v_u_57 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_38, (ref) v_u_12, (ref) v_u_13, (copy) v_u_56
		p_u_38.analytics:sendEvent(v_u_12.Triggers.DeveloperSingle, v_u_13.CancelInvite)
		v_u_56()
	end, { v_u_56 })
	local v_u_68 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_45, (copy) p_u_38, (copy) v_u_42, (ref) v_u_14, (ref) v_u_12, (ref) v_u_13, (copy) v_u_41, (ref) v_u_26, (ref) v_u_4, (copy) v_u_56
		v_u_45(true)
		local v58 = p_u_38.inviteUser
		local v_u_59 = p_u_38.analytics
		if not v_u_42 or v_u_42 == v_u_14.Failed then
			local v60
			if p_u_38.launchData == nil then
				v60 = false
			else
				v60 = p_u_38.launchData ~= ""
			end
			local v61 = v_u_12.Triggers.DeveloperSingle
			local v62 = v_u_13.SendInvite
			local v63 = {
				["recipient"] = v_u_41.id
			}
			if not v_u_26() then
				v60 = nil
			end
			v63.isLaunchDataProvided = v60
			v_u_59:sendEvent(v61, v62, v63)
			local function v66(p64)
				-- upvalues: (ref) v_u_45, (ref) v_u_41, (ref) v_u_4, (copy) v_u_59, (ref) v_u_56
				v_u_45(false)
				if p64 then
					local v65 = { v_u_41.id }
					if v_u_4.LocalPlayer and p64.conversationId then
						v_u_59:onActivatedInviteSent(v_u_4.LocalPlayer.UserId, p64.conversationId, v65)
					end
					v_u_56()
				end
			end
			local v67 = v_u_41.id
			v58(tostring(v67), v_u_59, p_u_38.inviteMessageId, p_u_38.launchData):andThen(v66, v_u_56)
		end
	end, {
		p_u_38.inviteUser,
		p_u_38.inviteMessageId,
		p_u_38.launchData,
		p_u_38.analytics,
		v_u_45,
		v_u_42,
		v_u_41,
		v_u_56
	})
	if v_u_31() then
		v_u_6.useEffect(function()
			-- upvalues: (copy) p_u_38, (ref) v_u_1, (ref) v_u_68, (copy) v_u_57
			if not p_u_38.isVisible then
				return nil
			end
			v_u_1:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p69, _)
				-- upvalues: (ref) v_u_68
				if p69 == Enum.UserInputState.Begin then
					v_u_68()
				end
			end, false, Enum.KeyCode.ButtonA)
			v_u_1:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p70, _)
				-- upvalues: (ref) v_u_57
				if p70 == Enum.UserInputState.Begin then
					v_u_57()
				end
			end, false, Enum.KeyCode.ButtonB)
			return function()
				-- upvalues: (ref) v_u_1
				v_u_1:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
				v_u_1:UnbindCoreAction("ProductPurchaseCancelButtonBind")
			end
		end, { p_u_38.isVisible, v_u_68, v_u_57 })
	end
	if v_u_29() then
		local v71 = v_u_6.useCallback(v_u_20(v_u_30(), v_u_68), { v_u_68 })
		v_u_68 = v71
	end
	if v_u_41 then
		if v_u_28 and (v55.name == "" and v55.isFetching) then
			return v_u_6.createElement(v_u_25)
		end
		local v72
		if v_u_28 then
			if v55.name == "" then
				v72 = v_u_41.displayName or ""
			else
				v72 = v55.name
			end
		else
			v72 = v_u_41.displayName
		end
		if v_u_42 then
			v_u_42 = v_u_42 ~= v_u_14.Failed
		end
		local v73 = v_u_6.createElement
		local v74 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.1,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["BackgroundColor3"] = v_u_37
		}
		local v75 = {
			["SizeConstraint"] = v_u_6.createElement("UISizeConstraint", {
				["MaxSize"] = Vector2.new(442, (1 / 0)),
				["MinSize"] = Vector2.new(0, 0)
			}),
			["Corner"] = v_u_6.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 8)
			}),
			["Padding"] = v_u_6.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24),
				["PaddingBottom"] = UDim.new(0, 24)
			}),
			["Header"] = v_u_6.createElement(v_u_35, {
				["fontStyle"] = v43.Font.Header1,
				["colorStyle"] = v43.Theme.TextEmphasis,
				["text"] = v_u_15:FormatByKey("Feature.SettingsHub.Heading.InviteUser", {
					["DisplayName"] = v72
				}),
				["size"] = UDim2.new(1, 0, 0, 48),
				["textXAlignment"] = Enum.TextXAlignment.Center
			}),
			["Divider"] = v_u_6.createElement("Frame", {
				["Position"] = nil,
				["Size"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundColor3"] = nil,
				["Position"] = UDim2.new(0, 0, 0, 48),
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = v_u_11.GRAPHITE
			})
		}
		local v76 = v_u_6.createElement
		local v77 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["Position"] = UDim2.new(0, 0, 0, 56)
		}
		local v78 = {
			["ListLayout"] = v_u_6.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 24)
			}),
			["Thumbnail"] = v_u_6.createElement(v_u_21, {
				["user"] = nil,
				["size"] = nil,
				["layoutOrder"] = 1,
				["square"] = true,
				["backgroundTransparency"] = 1,
				["user"] = v_u_41,
				["size"] = UDim2.new(0, 95, 0, 95)
			}),
			["TextBody"] = v_u_6.createElement(v_u_35, {
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["text"] = nil,
				["textXAlignment"] = nil,
				["automaticSize"] = nil,
				["size"] = nil,
				["layoutOrder"] = 2,
				["fontStyle"] = v43.Font.Header2,
				["colorStyle"] = v43.Theme.TextEmphasis,
				["text"] = p_u_38.promptMessage or v_u_15:FormatByKey("Feature.SettingsHub.Label.DefaultInviteMessage", {
					["DisplayName"] = v72
				}),
				["textXAlignment"] = Enum.TextXAlignment.Center,
				["automaticSize"] = Enum.AutomaticSize.Y,
				["size"] = UDim2.new(1, 0, 0, 0)
			}),
			["ButtonWrapper"] = v_u_6.createElement("Frame", {
				["Size"] = nil,
				["LayoutOrder"] = 3,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 48)
			}, {
				["CancelButton"] = v_u_6.createElement(v_u_33, {
					["buttonType"] = v_u_34.Secondary,
					["size"] = UDim2.new(0.5, -12, 1, 0),
					["text"] = v_u_15:FormatByKey("Feature.SettingsHub.Action.Cancel"),
					["onActivated"] = v_u_57,
					["isDisabled"] = v44
				}),
				["InviteButton"] = v_u_6.createElement(v_u_33, {
					["buttonType"] = v_u_34.PrimarySystem,
					["size"] = UDim2.new(0.5, -12, 1, 0),
					["position"] = UDim2.new(0.5, 12, 0, 0),
					["text"] = v_u_15:FormatByKey(v_u_42 and "Feature.SettingsHub.Label.Invited" or "Feature.SettingsHub.Action.InviteFriend"),
					["onActivated"] = v_u_68,
					["isLoading"] = v44,
					["isDisabled"] = v_u_42
				})
			})
		}
		v75.Wrapper = v76("Frame", v77, v78)
		return v73("Frame", v74, v75)
	end
	if p_u_38.friendsRetrievalStatus == v_u_18.Done or p_u_38.friendsRetrievalStatus == v_u_18.Failed then
		v_u_56()
	end
end
return v7.connect(function(p80)
	-- upvalues: (copy) v_u_4
	local v81 = {
		["friends"] = p80.Users
	}
	local v82 = v_u_4.LocalPlayer
	if v82 then
		local v83 = p80.Friends.retrievalStatus
		local v84 = v_u_4.LocalPlayer.UserId
		v82 = v83[tostring(v84)]
	end
	v81.friendsRetrievalStatus = v82
	v81.invites = p80.Invites
	return v81
end, function(p_u_85)
	-- upvalues: (copy) v_u_16, (copy) v_u_5, (copy) v_u_27, (copy) v_u_19, (copy) v_u_12, (copy) v_u_17
	return {
		["inviteUser"] = function(p86, p87, p88, p89) -- name: inviteUser
			-- upvalues: (ref) v_u_16, (ref) v_u_5, (ref) v_u_27, (copy) p_u_85, (ref) v_u_19, (ref) v_u_12, (ref) v_u_17
			local v90 = v_u_16(v_u_5)
			local v91 = game.PlaceId
			local v92 = tostring(v91)
			if v_u_27() then
				return p_u_85(v_u_19(v90, p86, v92, p87, v_u_12.Triggers.DeveloperSingle, p88, p89))
			else
				return p_u_85(v_u_17(v90, p86, v92))
			end
		end
	}
end)(function(p93)
	-- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_79
	return v_u_9({
		["SingleUserInvite"] = v_u_6.createElement(v_u_79, p93)
	})
end)