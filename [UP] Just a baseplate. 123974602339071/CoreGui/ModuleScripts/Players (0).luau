-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.Players
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = v1:WaitForChild("RobloxGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("UserInputService")
local v_u_7 = game:GetService("RbxAnalyticsService")
local v_u_8 = game:GetService("RunService")
local v_u_9 = game:GetService("LocalizationService")
local v_u_10 = require(v_u_3.Modules.VoiceChat.VoiceChatServiceManager).default
v_u_3:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v11 = require(v2.Workspace.Packages.UserProfiles)
local v_u_12 = v11.Formatters.formatUsername
local v_u_13 = require(v2.Packages.Cryo)
local v_u_14 = require(v2.Packages.React)
local v_u_15 = require(v2.Packages.ReactRoblox)
local v_u_16 = require(v2.Packages.UIBlox).Utility.OpenTypeSupport
local v_u_17 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_18 = require(v_u_3.Modules.Settings.Utility)
local v_u_19 = require(v2.Workspace.Packages.AppCommonLib).Create
local v_u_20 = require(v_u_3.Modules.Settings.Pages.ReportAbuseMenuContainerPage)
local v_u_21 = require(v_u_3.Modules:WaitForChild("SocialUtil"))
local v_u_22 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_23 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local v_u_24 = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics)
local v_u_25 = require(v_u_3.Modules.VoiceChat.Constants)
local v_u_26 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local v_u_27 = require(v2.Workspace.Packages.BlockingUtility)
local v_u_28 = require(v2.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_29 = require(v_u_3.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local v_u_30 = require(v2.Packages.BuilderIcons)
local v_u_31 = v_u_30.Migration.uiblox
local v_u_32 = require(v2.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
local v33 = require(v2.Workspace.Packages.SharedFlags)
local v_u_34 = v33.FFlagUserProfilePlatformProfile
local v_u_35 = v33.GetFFlagLuaAppEnableOpenTypeSupport
local v_u_36 = v33.FFlagIEMTabFocusNav
local v_u_37 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_38 = require(v_u_3.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local v_u_39 = require(v_u_3.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local v_u_40 = require(v_u_3.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM)
local v_u_41 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_42 = v33.FFlagHidePeoplePageInviteFriends
local v_u_43 = v33.FFlagAddInviteFriendsIntegration
local v_u_44 = v11.Stores.UserProfileStore
local _, v_u_45 = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local v_u_46 = require(script.Parent.Parent.Theme)
local v_u_47 = require(v_u_3.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_48 = UDim2.new(0.5, -10, 0, 52)
local v_u_49 = v_u_5.LocalPlayer
while not v_u_49 do
	v_u_5.ChildAdded:wait()
	v_u_49 = v_u_5.LocalPlayer
end
local v_u_50 = require(v_u_3.Modules.Flags.GetFFlagVoiceChatUILogging)
local v_u_51 = require(v_u_3.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty)
local v_u_52 = require(v_u_3.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint)
local v_u_53 = require(v_u_3.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave)
local v_u_54 = require(v_u_3.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice)
local v_u_55 = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false)
local v_u_56 = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false)
local v_u_57 = require(v_u_3.Modules.Flags.isEngineTruncationEnabledForIngameSettings)
local v_u_58 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local v_u_59 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local v_u_60 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false)
local v_u_61 = game:DefineFastFlag("CheckShareGameButtonInMuteAllLayout", false)
local v_u_62 = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false)
local v_u_63 = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200)
local v_u_64 = require(v_u_3.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton)
local v_u_65 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false)
local v_u_66 = require(v2.Workspace.Packages.Chrome).Enabled()
local v_u_67 = v_u_10.MuteStatusIcons
local v_u_68 = v_u_10.PlayerMuteStatusIcons
return (function() -- name: Initialize
	-- upvalues: (copy) v_u_3, (copy) v_u_41, (copy) v_u_7, (copy) v_u_9, (copy) v_u_17, (copy) v_u_31, (copy) v_u_30, (ref) v_u_49, (copy) v_u_18, (copy) v_u_27, (copy) v_u_46, (copy) v_u_47, (copy) v_u_51, (copy) v_u_24, (copy) v_u_63, (copy) v_u_54, (copy) v_u_64, (copy) v_u_56, (copy) v_u_4, (copy) v_u_26, (copy) v_u_23, (copy) v_u_22, (copy) v_u_67, (copy) v_u_59, (copy) v_u_58, (copy) v_u_10, (copy) v_u_25, (copy) v_u_19, (copy) v_u_37, (copy) v_u_38, (copy) v_u_39, (copy) v_u_52, (copy) v_u_36, (copy) v_u_68, (copy) v_u_20, (copy) v_u_66, (copy) v_u_48, (copy) v_u_55, (copy) v_u_45, (copy) v_u_35, (copy) v_u_16, (copy) v_u_65, (copy) v_u_44, (copy) v_u_57, (copy) v_u_60, (copy) v_u_12, (copy) v_u_5, (copy) v_u_6, (copy) v_u_42, (copy) v_u_43, (copy) v_u_8, (copy) v_u_32, (copy) v_u_21, (copy) v_u_50, (copy) v_u_28, (copy) v_u_61, (copy) v_u_13, (copy) v_u_34, (copy) v_u_62, (copy) v_u_53, (copy) v_u_15, (copy) v_u_14, (copy) v_u_29, (copy) v_u_40
	local v_u_69 = require(v_u_3.Modules.Settings.SettingsPageFactory):CreateNewPage()
	v_u_69.PageListLayout.Padding = UDim.new(0, 16)
	v_u_69.playSessionId = ""
	if v_u_41 then
		v_u_69.playSessionId = v_u_7:GetPlaySessionId()
	end
	local v_u_70 = {}
	local v_u_71 = v_u_9.RobloxLocaleId
	if not v_u_70[v_u_71] then
		v_u_70[v_u_71] = v_u_17.new(v_u_71)
	end
	v_u_69.TabHeader.Name = "PlayersTab"
	local v72 = v_u_31["icons/menu/friends"]
	v_u_69.TabHeader.TabLabel.Icon.Text = v72.name
	v_u_69.TabHeader.TabLabel.Icon.FontFace = v_u_30.Font[v72.variant]
	v_u_69.TabHeader.TabLabel.Title.Text = "People"
	v_u_69.Page.Name = "Players"
	local function v_u_83(p73, p_u_74) -- name: createFriendStatusTextLabel
		-- upvalues: (ref) v_u_46, (copy) v_u_70, (copy) v_u_71, (ref) v_u_47, (ref) v_u_51, (ref) v_u_49, (ref) v_u_7, (ref) v_u_18
		if p73 == nil then
			return nil
		end
		local v75 = Instance.new("Frame")
		v75.BackgroundTransparency = 1
		local v_u_76 = nil
		local v_u_77 = nil
		if p73 == Enum.FriendStatus.Friend or p73 == Enum.FriendStatus.FriendRequestSent then
			v_u_76 = Instance.new("TextButton")
			v_u_76.BackgroundTransparency = 1
			v_u_76.FontSize = v_u_46.fontSize(Enum.FontSize.Size24)
			v_u_76.Font = v_u_46.font(Enum.Font.SourceSans)
			v_u_76.TextColor3 = Color3.new(1, 1, 1)
			v_u_76.SelectionImageObject = v75
			if p73 == Enum.FriendStatus.Friend then
				v_u_76.Text = v_u_70[v_u_71]:Format(v_u_47.FriendLocalizedKey)
			else
				v_u_76.Text = "Request Sent"
			end
		elseif p73 == Enum.FriendStatus.Unknown or (p73 == Enum.FriendStatus.NotFriend or p73 == Enum.FriendStatus.FriendRequestReceived) then
			local function v78()
				-- upvalues: (ref) v_u_76, (ref) v_u_77, (ref) v_u_51, (ref) v_u_70, (ref) v_u_71, (ref) v_u_47, (ref) v_u_49, (copy) p_u_74, (ref) v_u_7
				if v_u_76 and (v_u_77 and v_u_77.Text ~= "") then
					v_u_76.ImageTransparency = 1
					v_u_77.Text = ""
					if v_u_51() then
						v_u_77.Text = v_u_70[v_u_71]:Format(v_u_47.AddFriendLocalizedKey)
					end
					if v_u_49 and p_u_74 then
						v_u_7:ReportCounter("PlayersMenu-RequestFriendship")
						v_u_7:SetRBXEventStream(v_u_47.AnalyticsTargetName, v_u_47.AnalyticsRequestFriendContext, v_u_47.AnalyticsRequestFriendName, {
							["category"] = "Game"
						})
						v_u_49:RequestFriendship(p_u_74)
					end
				end
			end
			local v79, v80 = v_u_18:MakeStyledButton("FriendStatus", v_u_70[v_u_71]:Format(v_u_47.AddFriendLocalizedKey), UDim2.new(0, 182, 0, v_u_46.ButtonHeight), v78)
			local v81 = v79
			local v82 = v80
			v82.ZIndex = 3
			v82.Position = v82.Position + UDim2.new(0, 0, 0, 1)
			v_u_77 = v82
			v_u_76 = v81
		end
		if v_u_76 then
			v_u_76.Name = "FriendStatus"
			v_u_76.ZIndex = 3
			v_u_76.Size = UDim2.new(0, 150, 0, v_u_46.ButtonHeight)
			v_u_76.Position = UDim2.new(1, -198, 0, 7)
			if v_u_77 then
				v_u_77.Position = UDim2.new(0, 0, 0, 0)
			end
		end
		return v_u_76
	end
	local function v_u_94(p84, p_u_85) -- name: createFriendStatusImageLabel
		-- upvalues: (ref) v_u_18, (ref) v_u_46, (ref) v_u_49, (ref) v_u_7, (ref) v_u_47
		if p84 == Enum.FriendStatus.Friend or p84 == Enum.FriendStatus.FriendRequestSent then
			local v86, v87
			if p84 == Enum.FriendStatus.Friend then
				v86 = "icons/menu/friends"
				v87 = 0
			else
				v86 = "icons/actions/friends/friendAdd"
				v87 = 0.5
			end
			local v88, _ = v_u_18:MakeStyledImageButton("FriendStatus", v86, UDim2.new(0, v_u_46.ButtonHeight, 0, v_u_46.ButtonHeight), UDim2.new(0, 28, 0, 28))
			v88.Name = "FriendStatus"
			v88.Selectable = false
			v88.FriendStatusTextLabel.TextTransparency = v87
			return v88
		end
		if p84 ~= Enum.FriendStatus.Unknown and (p84 ~= Enum.FriendStatus.NotFriend and p84 ~= Enum.FriendStatus.FriendRequestReceived) then
			return nil
		end
		local v_u_89 = nil
		local v_u_90 = nil
		local function v91()
			-- upvalues: (ref) v_u_89, (ref) v_u_90, (ref) v_u_49, (copy) p_u_85, (ref) v_u_7, (ref) v_u_47
			if v_u_89 and (v_u_90 and v_u_89.ImageTransparency ~= 1) then
				v_u_89.ImageTransparency = 1
				v_u_90.TextTransparency = 1
				if v_u_49 and p_u_85 then
					v_u_7:ReportCounter("PlayersMenu-RequestFriendship")
					v_u_7:SetRBXEventStream(v_u_47.AnalyticsTargetName, v_u_47.AnalyticsRequestFriendContext, v_u_47.AnalyticsRequestFriendName, {
						["category"] = "Game"
					})
					v_u_49:RequestFriendship(p_u_85)
				end
			end
		end
		local v92, v93 = v_u_18:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, v_u_46.ButtonHeight, 0, v_u_46.ButtonHeight), UDim2.new(0, 28, 0, 28), v91)
		v_u_89 = v92
		v_u_90 = v93
		v_u_89.Name = "FriendStatus"
		v_u_89.Selectable = true
		return v_u_89
	end
	local v_u_95 = nil
	local v_u_96 = nil
	local v_u_97 = nil
	local v_u_98 = nil
	local v_u_99 = {}
	local v_u_100 = v_u_24.new(v_u_7, "Players")
	local v_u_101 = false
	local v_u_102 = {}
	local v_u_103 = nil
	local v_u_104 = nil
	local function v_u_105()
		-- upvalues: (copy) v_u_69, (ref) v_u_63, (ref) v_u_102
		return v_u_69.Page.AbsoluteSize.X < v_u_63 * #v_u_102
	end
	local function v_u_123()
		-- upvalues: (ref) v_u_102, (ref) v_u_95, (ref) v_u_96, (ref) v_u_97, (ref) v_u_54, (ref) v_u_98, (ref) v_u_101, (ref) v_u_105, (ref) v_u_103, (ref) v_u_64, (ref) v_u_104, (ref) v_u_56
		v_u_102 = {}
		if v_u_95 then
			local v106 = v_u_102
			local v107 = v_u_95
			table.insert(v106, v107)
		end
		if v_u_96 then
			local v108 = v_u_102
			local v109 = v_u_96
			table.insert(v108, v109)
		end
		if v_u_97 then
			local v110 = v_u_102
			local v111 = v_u_97
			table.insert(v110, v111)
		end
		if v_u_54() and v_u_98 then
			local v112 = v_u_102
			local v113 = v_u_98
			table.insert(v112, v113)
		end
		v_u_101 = v_u_105()
		if #v_u_102 > 0 then
			local v114 = UDim2.new(1 / #v_u_102, 0, 0, 52)
			local v115 = {
				["Size"] = UDim2.new(1, (#v_u_102 - 1) * -20, 0, 52),
				["AutomaticSize"] = Enum.AutomaticSize.None
			}
			local v116 = {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 20)
			}
			if v_u_101 then
				v114 = UDim2.new(1, 0, 0, 52)
				v115 = {
					["Size"] = UDim2.fromScale(1, 0),
					["AutomaticSize"] = Enum.AutomaticSize.Y
				}
				v116 = {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["VerticalAlignment"] = Enum.VerticalAlignment.Top,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["Padding"] = UDim.new(0, 16)
				}
			end
			local v117 = 1
			for _, v118 in v_u_102 do
				v118.Size = v114
				v118.Parent = v_u_103
				v118.LayoutOrder = v117
				v117 = v117 + 1
			end
			for v119, v120 in v116 do
				if v_u_64() then
					if not v_u_104 then
						continue
					end
					v_u_104[v119] = v120
				else
					v_u_104[v119] = v120
				end
			end
			for v121, v122 in v115 do
				if v_u_64() then
					if not v_u_103 then
						continue
					end
					v_u_103[v121] = v122
				else
					v_u_103[v121] = v122
				end
			end
		elseif v_u_56 then
			if v_u_103 then
				v_u_103:Destroy()
				v_u_103 = nil
				return
			end
		else
			v_u_103:Destroy()
			v_u_103 = nil
		end
	end
	local function v_u_133(p124, p_u_125, p126, p127) -- name: resizeFriendButton
		-- upvalues: (ref) v_u_49, (ref) v_u_27, (copy) v_u_94, (copy) v_u_83, (ref) v_u_18
		local v128 = p124:FindFirstChild("FriendStatus")
		if not v128 or p126 ~= p127 then
			if v128 then
				v128:Destroy()
				v128 = nil
			end
			local v129 = nil
			local v130
			if p_u_125 then
				if p_u_125 == v_u_49 or p_u_125.UserId <= 0 then
					v130 = false
				else
					v130 = v_u_49.UserId > 0
				end
			else
				v130 = p_u_125
			end
			if v130 then
				local function v131()
					-- upvalues: (ref) v_u_49, (copy) p_u_125
					return v_u_49:GetFriendStatus(p_u_125)
				end
				local v132
				v132, v129 = pcall(v131)
				if not v132 then
					v129 = Enum.FriendStatus.NotFriend
				end
			end
			if v_u_27:IsPlayerBlockedByUserId(p_u_125.UserId) == false then
				if p126 then
					v128 = v_u_94(v129, p_u_125)
				else
					v128 = v_u_83(v129, p_u_125)
				end
			end
			if v128 then
				v128.Name = "FriendStatus"
				v128.LayoutOrder = 5
				v128.Selectable = true
				v_u_18:MakeFocusState(v128, "utility-focus-state" .. "-friendstatuslabel-" .. p_u_125.Name)
				v128.Parent = p124
			end
		end
	end
	local function v_u_138(p134, p135) -- name: friendStatusCreate
		-- upvalues: (ref) v_u_4, (ref) v_u_95, (copy) v_u_133, (ref) v_u_18
		local v136
		if p134 then
			v136 = p134:FindFirstChild("RightSideButtons")
		else
			v136 = nil
		end
		if v136 then
			for _, v137 in pairs(v136:GetChildren()) do
				if not v137 or v137.Name ~= "FriendStatus" then
					continue
				end
				if v_u_4.SelectedCoreObject == v137 then
					v_u_4.SelectedCoreObject = v_u_95
				end
				v137:Destroy()
			end
			v_u_133(v136, p135, v_u_18:IsPortrait(), nil)
		end
	end
	v_u_49.FriendStatusChanged:connect(function(p139, _)
		-- upvalues: (copy) v_u_69, (copy) v_u_138
		local v140 = p139 and v_u_69.Page:FindFirstChild("PlayerLabel" .. p139.Name)
		if v140 then
			v_u_138(v140, p139)
		end
	end)
	local v_u_141 = nil
	local v_u_142 = nil
	local v143 = {
		["EventStream"] = v_u_7
	}
	local v_u_144 = v_u_26.new(v_u_49.UserId, v143)
	local function v_u_153(p_u_145, p_u_146, p_u_147, _) -- name: createBlockButton
		-- upvalues: (ref) v_u_27, (ref) v_u_141, (copy) v_u_133, (ref) v_u_142, (ref) v_u_4, (ref) v_u_23, (copy) v_u_144, (ref) v_u_47, (ref) v_u_18, (ref) v_u_22, (ref) v_u_46
		local function v151() -- name: blockUser
			-- upvalues: (ref) v_u_4, (ref) v_u_23, (copy) p_u_146, (ref) v_u_144, (ref) v_u_47, (ref) v_u_141, (copy) p_u_145, (copy) p_u_147, (ref) v_u_133, (ref) v_u_142
			local v_u_148 = v_u_4.SelectedCoreObject ~= nil and true or v_u_4.SelectedObject ~= nil
			v_u_23(p_u_146, v_u_144, v_u_47.AnalyticsInGameMenuName):andThen(function()
				-- upvalues: (copy) v_u_148, (ref) v_u_141, (ref) p_u_145, (ref) p_u_146, (ref) p_u_147, (ref) v_u_133, (ref) v_u_142
				local v149 = v_u_148
				local v150 = v_u_141(p_u_145, p_u_146, p_u_147, not p_u_147)
				v_u_133(p_u_145, p_u_146, p_u_147, not p_u_147)
				if v149 then
					v_u_142(v150)
				end
			end)
		end
		local function v152() -- name: unBlockUser
			-- upvalues: (ref) v_u_27, (copy) p_u_146, (ref) v_u_144, (ref) v_u_141, (copy) p_u_145, (copy) p_u_147, (ref) v_u_133
			if v_u_27:UnblockPlayerAsync(p_u_146) then
				v_u_144:action("SettingsHub", "unblockUser", {
					["blockeeUserId"] = p_u_146.UserId
				})
				v_u_141(p_u_145, p_u_146, p_u_147, not p_u_147)
				v_u_133(p_u_145, p_u_146, p_u_147, not p_u_147)
			end
		end
		if v_u_27:IsPlayerBlockedByUserId(p_u_146.UserId) then
			return v_u_18:MakeStyledButton("BlockButton", v_u_22:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, v_u_46.ButtonHeight), v152)
		else
			return v_u_18:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, v_u_46.ButtonHeight, 0, v_u_46.ButtonHeight), UDim2.new(0, 28, 0, 28), v151)
		end
	end
	v_u_142 = function(p154) -- name: trySelection
		-- upvalues: (ref) v_u_4
		if p154 and not p154.Selectable then
			v_u_4:Select(p154)
		else
			v_u_4.SelectedCoreObject = p154
		end
	end
	v_u_141 = function(p155, p156, p157, p158) -- name: resizeBlockButton
		-- upvalues: (ref) v_u_49, (copy) v_u_153, (ref) v_u_18
		local v159 = p155:FindFirstChild("BlockButton")
		if v159 and p157 == p158 then
			return v159
		end
		if v159 then
			v159:Destroy()
			v159 = nil
		end
		local v160
		if p156 then
			if p156 == v_u_49 or p156.UserId <= 0 then
				v160 = false
			else
				v160 = v_u_49.UserId > 0
			end
		else
			v160 = p156
		end
		if v160 then
			v159 = v_u_153(p155, p156, p157, p158)
		end
		if v159 then
			v159.Name = "BlockButton"
			v159.LayoutOrder = 4
			v159.Selectable = true
			v_u_18:MakeFocusState(v159, "utility-focus-state" .. "-blockbutton-" .. p156.Name)
			v159.Parent = p155
		end
		return v159
	end
	local v_u_161 = false
	local v_u_162 = false
	local function v_u_179(p163, p_u_164) -- name: muteButtonUpdate
		-- upvalues: (ref) v_u_67, (ref) v_u_59, (ref) v_u_58, (ref) v_u_10, (copy) v_u_99, (ref) v_u_18, (ref) v_u_46, (copy) v_u_100, (ref) v_u_25
		local v165
		if p163 then
			v165 = p163:FindFirstChild("RightSideButtons")
		else
			v165 = nil
		end
		if v165 then
			local v166 = v165:FindFirstChild("MuteStatusButton")
			if p_u_164 == nil then
				if v166 then
					v166:Destroy()
				end
				return
			else
				local v167 = UDim2.fromOffset(36, 36)
				local v168 = UDim2.fromOffset(0, 0)
				local v169 = 0
				local v170 = p_u_164.isMuted and v_u_67.MicOff or v_u_67.MicOn
				if p_u_164.subscriptionFailed then
					v170 = v_u_67.Error
					v167 = UDim2.fromOffset(36, 36)
					v168 = UDim2.fromOffset(2, -2)
					if v_u_59 and v_u_58 then
						v169 = 0.5
					end
				elseif p_u_164.isMutedLocally then
					v170 = v_u_67.MicDisabled
					v169 = 0.5
				elseif p_u_164.subscriptionCompleted then
					if p_u_164.isSignalActive then
						local v171 = 0.5 + 5 * math.random()
						local v172 = math.floor(v171) * 20
						v170 = v_u_10:GetIcon("Unmuted" .. tostring(v172), "SpeakerLight")
					end
				else
					v170 = v_u_67.Loading
				end
				if v166 then
					local v173 = v_u_99[p_u_164.userId] or v165:FindFirstChild("MuteStatusImageLabel", true)
					v173.Image = v170
					v173.Size = v167
					v173.ImageTransparency = v169
				elseif v_u_10.voiceUIVisible then
					local v177, v178 = v_u_18:MakeStyledImageButton("MuteStatus", v170, UDim2.fromOffset(v_u_46.ButtonHeight, v_u_46.ButtonHeight), v167, function()
						-- upvalues: (ref) v_u_10, (copy) p_u_164, (ref) v_u_100, (ref) v_u_25, (ref) v_u_59, (ref) v_u_58
						local v174 = v_u_10.participants
						local v175 = p_u_164.userId
						local v176 = v174[tostring(v175)]
						if v176.subscriptionCompleted then
							if v_u_100 then
								v_u_100:onToggleMutePlayer(p_u_164.userId, not v176.isMutedLocally)
							end
							v_u_10:ToggleMutePlayer(p_u_164.userId, v_u_25.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
						elseif v176.subscriptionFailed then
							if v_u_59 then
								if not v_u_58 then
									v_u_10:SubscribeRetry(p_u_164.userId)
									return
								end
							else
								v_u_10:SubscribeRetry(p_u_164.userId)
							end
						end
					end)
					v_u_99[p_u_164.userId] = v178
					v178.ZIndex = 3
					v178.Position = v178.Position + v168
					v178.ImageTransparency = v169
					v_u_18:MakeFocusState(v177, "utility-focus-state" .. "-mutestatusbutton-" .. p_u_164.userId)
					v177.Parent = v165
				end
			end
		else
			return
		end
	end
	local v_u_180 = v_u_19("Frame")({
		["Name"] = "ButtonsContainer",
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Parent"] = nil,
		["Visible"] = false,
		["Size"] = UDim2.new(1, 0, 0, v_u_46.ButtonHeight),
		["Parent"] = v_u_69.Page
	})
	v_u_69.ButtonsContainer = v_u_180
	if v_u_37 or v_u_38 and (v_u_39 == 1 or v_u_39 == 3) then
		v_u_180.Parent = nil
	end
	v_u_19("UIPadding")({
		["PaddingBottom"] = UDim.new(0, 1),
		["PaddingTop"] = UDim.new(0, 1),
		["PaddingLeft"] = UDim.new(0, 1),
		["PaddingRight"] = UDim.new(0, 1),
		["Parent"] = v_u_180
	})
	local function v181()
		-- upvalues: (ref) v_u_52, (copy) v_u_69, (ref) v_u_25
		if v_u_52() and v_u_69.HubRef.leaveGameUpsellProp ~= v_u_25.PHONE_UPSELL_VALUE_PROP.None then
			v_u_69.HubRef:SwitchToPage(v_u_69.HubRef.LeaveGameUpsellPage, nil, 1, true)
		else
			v_u_69.HubRef:SwitchToPage(v_u_69.HubRef.LeaveGamePage, false, 1)
		end
	end
	local v182, v_u_183 = v_u_18:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -12, 1, 0), v181)
	v182.AnchorPoint = Vector2.new(0, 0)
	v182.Position = UDim2.new(0, 0, 0, 0)
	v_u_183.Size = UDim2.new(1, -4, 1, 0)
	v_u_183.Position = UDim2.new(0, 2, 0, 0)
	v_u_19("UIListLayout")({
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["Parent"] = v182
	})
	v_u_19("UIPadding")({
		["PaddingLeft"] = UDim.new(0.025, 0),
		["Parent"] = v182
	})
	v_u_183.Size = UDim2.new(0, 0, 1, 0)
	v_u_19("UIFlexItem")({
		["FlexMode"] = Enum.UIFlexMode.Grow,
		["Parent"] = v_u_183
	})
	if not v_u_38 or v_u_39 == 0 then
		v182.Parent = v_u_180
	end
	local v184, v_u_185 = v_u_18:MakeStyledButton("ResetButton", v_u_70[v_u_71]:Format(v_u_47.RespawnLocalizedKey), UDim2.new(0.3333333333333333, -12, 1, 0), function()
		-- upvalues: (copy) v_u_69
		v_u_69.HubRef:SwitchToPage(v_u_69.HubRef.ResetCharacterPage, false, 1)
	end)
	v184.AnchorPoint = Vector2.new(0.5, 0)
	v184.Position = UDim2.new(0.5, 0, 0, 0)
	v_u_185.Size = UDim2.new(1, -4, 1, 0)
	v_u_185.Position = UDim2.new(0, 2, 0, 0)
	if not v_u_38 or v_u_39 == 0 then
		v184.Parent = v_u_180
	end
	local function v192()
		-- upvalues: (copy) v_u_69, (ref) v_u_7, (ref) v_u_47
		v_u_69.HubRef:SetVisibility(false)
		local v186 = v_u_7
		local v187 = v_u_47.AnalyticsTargetName
		local v188 = v_u_47.AnalyticsResumeGameName
		local v189 = v_u_47.AnalyticsMenuActionName
		local v190 = {
			["source"] = v_u_47.AnalyticsResumeButtonSource,
			["playsessionid"] = v_u_69.playSessionId
		}
		local v191 = game.GameId
		v190.universeid = tostring(v191)
		v186:SetRBXEventStream(v187, v188, v189, v190)
	end
	local v193, v_u_194 = v_u_18:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -12, 1, 0), v192)
	v193.AnchorPoint = Vector2.new(1, 0)
	v193.Position = UDim2.new(1, 0, 0, 0)
	v_u_194.Size = UDim2.new(1, -4, 1, 0)
	v_u_194.Position = UDim2.new(0, 2, 0, 0)
	if not v_u_38 or v_u_39 == 0 then
		v193.Parent = v_u_180
		if v_u_36 then
			v_u_69.FirstSelectableObjects = { v193, v184, v182 }
			v_u_69.FirstSelectableObjectsUpdated:fire()
		end
	end
	local function v_u_198() -- name: pollImage
		-- upvalues: (ref) v_u_10, (ref) v_u_68
		local v195 = v_u_10.localMuted
		if v195 == nil then
			return v_u_68.Loading
		end
		if v195 then
			return v_u_68.MicOff
		end
		if not v_u_10.isTalking then
			return v_u_68.MicOn
		end
		local v196 = 0.5 + 5 * math.random()
		local v197 = math.floor(v196) * 20
		return v_u_10:GetIcon("Unmuted" .. tostring(v197), "MicLight")
	end
	local function v_u_212() -- name: resetButtonRow
		-- upvalues: (ref) v_u_38, (ref) v_u_39, (copy) v_u_180
		if not v_u_38 or v_u_39 == 0 then
			local v199 = UDim2.new(1, 0, 0, 0)
			local v200 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local v201 = Vector2.new(1, 0)
			local v202 = v_u_180:FindFirstChild("ResumeButtonButton", true)
			if v202 then
				v202.Position = v199
				v202.Size = v200
				v202.AnchorPoint = v201
			end
			local v203 = UDim2.new(0.5, 0, 0, 0)
			local v204 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local v205 = Vector2.new(0.5, 0)
			local v206 = v_u_180:FindFirstChild("ResetButtonButton", true)
			if v206 then
				v206.Position = v203
				v206.Size = v204
				v206.AnchorPoint = v205
			end
			local v207 = UDim2.new(0, 0, 0, 0)
			local v208 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local v209 = Vector2.new(0, 0)
			local v210 = v_u_180:FindFirstChild("LeaveButtonButton", true)
			if v210 then
				v210.Position = v207
				v210.Size = v208
				v210.AnchorPoint = v209
			end
		end
		local v211 = v_u_180:FindFirstChild("PlayerMuteButtonButton", true)
		if v211 then
			v211:Destroy()
		end
	end
	v_u_18:OnResized(v_u_180, function(_, p213)
		-- upvalues: (ref) v_u_18, (ref) v_u_46, (copy) v_u_180, (ref) v_u_38, (ref) v_u_39, (copy) v_u_185, (copy) v_u_183, (copy) v_u_194
		if (p213 or v_u_18:IsSmallTouchScreen()) and not v_u_46.AlwaysShowBottomBar() then
			local v214 = p213 and v_u_46.textSize(18) or v_u_46.textSize(24)
			v_u_180.Visible = true
			v_u_180.Size = UDim2.new(1, 0, 0, v_u_46.ButtonHeight)
			if not v_u_38 or v_u_39 == 0 then
				v_u_185.TextSize = v214
				v_u_183.TextSize = v214
				v_u_194.TextSize = v214
				return
			end
		else
			v_u_180.Visible = false
			v_u_180.Size = UDim2.new(1, 0, 0, 0)
		end
	end)
	local function v_u_222(p215, p_u_216) -- name: reportAbuseButtonCreate
		-- upvalues: (ref) v_u_49, (ref) v_u_20, (ref) v_u_18, (ref) v_u_46
		local v217 = p215:FindFirstChild("RightSideButtons")
		if v217 then
			local v218 = v217:FindFirstChild("ReportPlayer")
			if v218 then
				v218:Destroy()
			end
			local v219
			if p_u_216 then
				if p_u_216 == v_u_49 or p_u_216.UserId <= 0 then
					v219 = false
				else
					v219 = v_u_49.UserId > 0
				end
			else
				v219 = p_u_216
			end
			if v219 then
				local function v220()
					-- upvalues: (ref) v_u_20, (copy) p_u_216
					v_u_20:ReportPlayer(p_u_216, "MenuPlayerList")
				end
				local v221 = v_u_18:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, v_u_46.ButtonHeight, 0, v_u_46.ButtonHeight), UDim2.new(0, 28, 0, 28), v220)
				v221.Name = "ReportPlayer"
				v221.Position = UDim2.new(1, -260, 0, 7)
				v221.LayoutOrder = 3
				v221.Selectable = true
				v_u_18:MakeFocusState(v221, "utility-focus-state" .. "-reportplayer-" .. p_u_216.Name)
				v221.Parent = v217
			end
		end
	end
	local v_u_223 = false
	local v_u_224 = nil
	local function v_u_226() -- name: shouldShowJoinVoiceButton
		-- upvalues: (ref) v_u_54, (ref) v_u_223, (ref) v_u_66, (ref) v_u_10
		local v225 = v_u_54() and game:GetEngineFeature("VoiceChatSupported") and (not (v_u_223 or v_u_66) and (v_u_10:verifyUniverseAndPlaceCanUseVoice() and v_u_10:ShouldShowJoinVoiceOnDisconnect()))
		if v225 then
			if v_u_10:GetVoiceConnectCookie() == "" then
				v225 = v_u_10:HasSeamlessVoiceFeature("InitialJoinVoice")
			else
				v225 = false
			end
		end
		return v225
	end
	local function v_u_234(p227, p228, p229) -- name: createRow
		-- upvalues: (ref) v_u_46, (ref) v_u_19
		local v230 = Instance.new(p227)
		v230.Size = UDim2.new(1, 0, 0, 62)
		v230.Position = UDim2.new(0, 0, 0, 0)
		v230.ZIndex = 2
		v230.BackgroundColor3 = v_u_46.color("PlayerRowFrame")
		v230.BackgroundTransparency = v_u_46.transparency("PlayerRowFrame")
		v_u_19("UICorner")({
			["CornerRadius"] = v_u_46.DefaultCornerRadius,
			["Parent"] = v230
		})
		local v231
		if p229 then
			v231 = Instance.new("TextLabel")
			v231.TextColor3 = Color3.new(1, 1, 1)
			v231.TextSize = 24
		else
			v231 = Instance.new("ImageLabel")
		end
		v231.Name = "Icon"
		v231.BackgroundTransparency = 1
		v231.Size = UDim2.new(0, 36, 0, 36)
		v231.Position = UDim2.new(0, 12, 0, 12)
		v231.ZIndex = 3
		v231.Parent = v230
		local v232 = Instance.new("TextLabel")
		v232.Text = ""
		v232.TextXAlignment = Enum.TextXAlignment.Left
		v232.Font = v_u_46.font(Enum.Font.SourceSans, "DisplayName")
		v232.FontSize = p228 and v_u_46.fontSize(Enum.FontSize.Size36, "DisplayName") or v_u_46.fontSize(Enum.FontSize.Size24, "DisplayName")
		v232.TextColor3 = Color3.new(1, 1, 1)
		v232.BackgroundTransparency = 1
		v232.Position = p228 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0)
		v232.Size = UDim2.new(0, 0, 0, 0)
		v232.ZIndex = 3
		v232.Parent = v230
		if p228 then
			local v233 = Instance.new("TextLabel")
			v233.Text = ""
			v233.Name = "SecondRow"
			v233.TextXAlignment = Enum.TextXAlignment.Left
			v233.Font = v_u_46.font(Enum.Font.SourceSans)
			v233.FontSize = v_u_46.fontSize(Enum.FontSize.Size24, "Username")
			v233.TextColor3 = Color3.fromRGB(162, 162, 162)
			v233.BackgroundTransparency = 1
			v233.Position = UDim2.new(0, 60, 0.5, 12)
			v233.Size = UDim2.new(0, 0, 0, 0)
			v233.ZIndex = 3
			v233.Parent = v230
		end
		return v230
	end
	local function v_u_242()
		-- upvalues: (copy) v_u_234, (ref) v_u_223, (ref) v_u_54, (copy) v_u_226, (ref) v_u_48, (ref) v_u_46, (copy) v_u_70, (copy) v_u_71, (ref) v_u_47, (ref) v_u_31, (ref) v_u_30, (ref) v_u_18
		local v_u_235 = v_u_234("ImageButton", nil, true)
		v_u_235.Size = UDim2.new(1, 0, 0, 52)
		local v236 = v_u_235.TextLabel
		local v237 = v_u_235.Icon
		if v_u_223 or v_u_54() and v_u_226() then
			v_u_235.Size = v_u_48
			v236.Size = UDim2.new(1, -60, 0, 0)
			v236.TextTruncate = Enum.TextTruncate.AtEnd
			v_u_235.AnchorPoint = Vector2.new(0, 0)
		end
		v236.Font = v_u_46.font(Enum.Font.SourceSansSemibold, "Semibold")
		v236.AutoLocalize = false
		v236.Text = v_u_70[v_u_71]:Format(v_u_47.InviteFriendsLocalizedKey)
		v237.AnchorPoint = Vector2.new(0, 0.5)
		v237.Position = UDim2.new(0, 18, 0.5, 0)
		local v238 = v_u_31["icons/actions/friends/friendInvite"]
		local v239
		if v238 then
			v239 = v_u_31["icons/actions/friends/friendInvite"]
		else
			v239 = v_u_46.Images["icons/actions/friends/friendInvite"]
		end
		if v239 then
			if v238 then
				v237.Text = v239.name
				v237.FontFace = v_u_30.Font[v239.variant]
			else
				v237.Image = v239.Image
				v237.ImageRectOffset = v239.ImageRectOffset
				v237.ImageRectSize = v239.ImageRectSize
			end
		end
		v_u_235.InputBegan:Connect(function()
			-- upvalues: (copy) v_u_235
			v_u_235.ImageTransparency = 0.65
		end)
		v_u_235.InputEnded:Connect(function()
			-- upvalues: (copy) v_u_235
			v_u_235.ImageTransparency = 0.85
		end)
		v_u_235.Activated:Connect(function()
			-- upvalues: (copy) v_u_235
			v_u_235.ImageTransparency = 0.85
		end)
		v_u_235.TouchPan:Connect(function(_, p240)
			-- upvalues: (copy) v_u_235
			local v241 = p240.Y
			if math.abs(v241) > 20 then
				v_u_235.ImageTransparency = 0.85
			end
		end)
		v_u_235.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_235
			v_u_235.ImageTransparency = 0.65
		end)
		v_u_235.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_235
			v_u_235.ImageTransparency = 0.85
		end)
		v_u_235.SelectionImageObject = v_u_235:Clone()
		v_u_18:MakeFocusState(v_u_235, "utility-focus-state-sharegame")
		return v_u_235
	end
	local function v_u_248()
		-- upvalues: (copy) v_u_234, (ref) v_u_95, (ref) v_u_46, (ref) v_u_22, (ref) v_u_10, (ref) v_u_18
		local v_u_243 = v_u_234("ImageButton")
		v_u_243.Size = UDim2.new(v_u_95 and 0.5 or 1, -10, 0, 52)
		v_u_243.Position = UDim2.new(1, 0, 0, 0)
		v_u_243.AnchorPoint = Vector2.new(1, 0)
		local v244 = v_u_243.TextLabel
		local v245 = v_u_243.Icon
		v244.Size = UDim2.new(1, -60, 0, 0)
		v244.TextTruncate = Enum.TextTruncate.AtEnd
		v244.Font = v_u_46.font(Enum.Font.SourceSansSemibold, "Semibold")
		v244.AutoLocalize = false
		v244.Text = v_u_22:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		v245.Size = UDim2.new(0, 32, 0, 32)
		v245.Position = UDim2.new(0, 18, 0, 16)
		v245.Image = v_u_10:GetIcon("UnmuteAll", "Misc")
		v245.AnchorPoint = Vector2.new(0, 0.5)
		v245.Position = UDim2.new(0, 18, 0.5, 0)
		v_u_243.InputBegan:Connect(function()
			-- upvalues: (copy) v_u_243
			v_u_243.ImageTransparency = 0.65
		end)
		v_u_243.InputEnded:Connect(function()
			-- upvalues: (copy) v_u_243
			v_u_243.ImageTransparency = 0.85
		end)
		v_u_243.Activated:Connect(function()
			-- upvalues: (copy) v_u_243
			v_u_243.ImageTransparency = 0.85
		end)
		v_u_243.TouchPan:Connect(function(_, p246)
			-- upvalues: (copy) v_u_243
			local v247 = p246.Y
			if math.abs(v247) > 20 then
				v_u_243.ImageTransparency = 0.85
			end
		end)
		v_u_243.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_243
			v_u_243.ImageTransparency = 0.65
		end)
		v_u_243.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_243
			v_u_243.ImageTransparency = 0.85
		end)
		v_u_243.SelectionImageObject = v_u_243:Clone()
		v_u_18:MakeFocusState(v_u_243, "utility-focus-state-muteall")
		return v_u_243
	end
	local function v_u_257()
		-- upvalues: (copy) v_u_234, (ref) v_u_46, (copy) v_u_198, (ref) v_u_18, (copy) v_u_70, (copy) v_u_71, (ref) v_u_10, (ref) v_u_224, (ref) v_u_161, (ref) v_u_64, (ref) v_u_103, (copy) v_u_100, (ref) v_u_97
		local v_u_249 = v_u_234("ImageButton")
		v_u_249.Name = "MuteSelfButton"
		v_u_249.Size = UDim2.new(0, v_u_46.ButtonHeight, 0, v_u_46.ButtonHeight)
		v_u_249.Position = UDim2.new(1, 0, 0, 0)
		v_u_249.AnchorPoint = Vector2.new(1, 0)
		local v_u_250 = v_u_249.TextLabel
		local v251 = v_u_249.Icon
		v_u_250.Size = UDim2.new(1, -60, 0, 0)
		v_u_250.TextTruncate = Enum.TextTruncate.AtEnd
		v_u_250.Font = v_u_46.font(Enum.Font.SourceSansSemibold, "Semibold")
		v_u_250.AutoLocalize = false
		v251.Name = "MuteSelfButtonImageLabel"
		v251.Size = UDim2.new(0, 32, 0, 32)
		v251.Position = UDim2.new(0, 18, 0, 16)
		v251.Image = v_u_198()
		v251.AnchorPoint = Vector2.new(0, 0.5)
		v251.Position = UDim2.new(0, 18, 0.5, 0)
		v_u_249.InputBegan:Connect(function()
			-- upvalues: (copy) v_u_249
			v_u_249.ImageTransparency = 0.65
		end)
		v_u_249.InputEnded:Connect(function()
			-- upvalues: (copy) v_u_249
			v_u_249.ImageTransparency = 0.85
		end)
		v_u_249.Activated:Connect(function()
			-- upvalues: (copy) v_u_249
			v_u_249.ImageTransparency = 0.85
		end)
		v_u_249.TouchPan:Connect(function(_, p252)
			-- upvalues: (copy) v_u_249
			local v253 = p252.Y
			if math.abs(v253) > 20 then
				v_u_249.ImageTransparency = 0.85
			end
		end)
		v_u_249.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_249
			v_u_249.ImageTransparency = 0.65
		end)
		v_u_249.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_249
			v_u_249.ImageTransparency = 0.85
		end)
		v_u_249.SelectionImageObject = v_u_249:Clone()
		v_u_18:MakeFocusState(v_u_249, "utility-focus-state-playermute")
		local v254 = v_u_10.localMuted and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf"
		v_u_250.Text = v_u_70[v_u_71]:Format(v254)
		v_u_224 = v_u_10.muteChanged.Event:Connect(function(p255)
			-- upvalues: (ref) v_u_161, (ref) v_u_64, (ref) v_u_103, (ref) v_u_198, (copy) v_u_250, (ref) v_u_70, (ref) v_u_71
			v_u_161 = p255
			local v256 = nil
			if v_u_64() then
				if v_u_103 then
					v256 = v_u_103:FindFirstChild("MuteSelfButtonImageLabel", true)
				end
			else
				v256 = v_u_103:FindFirstChild("MuteSelfButtonImageLabel", true)
			end
			if v256 then
				v256.Image = v_u_198()
			end
			v_u_250.Text = v_u_70[v_u_71]:Format(p255 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf")
		end)
		v_u_249.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_100, (ref) v_u_161
			v_u_10:ToggleMic("InGameMenuPlayers")
			if v_u_100 then
				v_u_100:onToggleMuteSelf(v_u_161)
			end
		end)
		if v_u_64() then
			return v_u_249
		end
		v_u_97 = v_u_249
	end
	local v_u_265 = v_u_54() and function()
		-- upvalues: (copy) v_u_234, (ref) v_u_48, (ref) v_u_46, (ref) v_u_55, (copy) v_u_70, (copy) v_u_71, (ref) v_u_31, (ref) v_u_30, (ref) v_u_18, (ref) v_u_10, (ref) v_u_25
		local v_u_258 = v_u_234("ImageButton", nil, true)
		v_u_258.Size = UDim2.new(1, 0, 0, 52)
		v_u_258.Size = v_u_48
		v_u_258.AnchorPoint = Vector2.new(0, 0)
		local v259 = v_u_258.TextLabel
		v259.Size = UDim2.new(1, -60, 0, 0)
		v259.TextTruncate = Enum.TextTruncate.AtEnd
		v259.Font = v_u_46.font(Enum.Font.SourceSansSemibold, "Semibold")
		v259.AutoLocalize = false
		if v_u_55 then
			v259.Text = v_u_70[v_u_71]:Format("Feature.SettingsHub.Action.ConnectVoiceChat")
		else
			v259.Text = "Connect Voice Chat"
		end
		local v260 = v_u_258.Icon
		v260.AnchorPoint = Vector2.new(0, 0.5)
		v260.Position = UDim2.new(0, 18, 0.5, 0)
		local v261 = v_u_31["icons/controls/publicAudioJoin"]
		local v262
		if v261 then
			v262 = v_u_31["icons/controls/publicAudioJoin"]
		else
			v262 = v_u_46.Images["icons/controls/publicAudioJoin"]
		end
		if v262 then
			if v261 then
				v260.Text = v262.name
				v260.FontFace = v_u_30.Font[v262.variant]
			else
				v260.Image = v262.Image
				v260.ImageRectOffset = v262.ImageRectOffset
				v260.ImageRectSize = v262.ImageRectSize
			end
		end
		v_u_258.InputBegan:Connect(function()
			-- upvalues: (copy) v_u_258
			v_u_258.ImageTransparency = 0.65
		end)
		v_u_258.InputEnded:Connect(function()
			-- upvalues: (copy) v_u_258
			v_u_258.ImageTransparency = 0.85
		end)
		v_u_258.Activated:Connect(function()
			-- upvalues: (copy) v_u_258
			v_u_258.ImageTransparency = 0.85
		end)
		v_u_258.TouchPan:Connect(function(_, p263)
			-- upvalues: (copy) v_u_258
			local v264 = p263.Y
			if math.abs(v264) > 20 then
				v_u_258.ImageTransparency = 0.85
			end
		end)
		v_u_258.SelectionGained:connect(function()
			-- upvalues: (copy) v_u_258
			v_u_258.ImageTransparency = 0.65
		end)
		v_u_258.SelectionLost:connect(function()
			-- upvalues: (copy) v_u_258
			v_u_258.ImageTransparency = 0.85
		end)
		v_u_258.SelectionImageObject = v_u_258:Clone()
		v_u_18:MakeFocusState(v_u_258, "utility-focus-state-joinVoice")
		v_u_258.Activated:Connect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_25
			v_u_10.pendingConnectionSource = v_u_25.VOICE_CONNECTION_SOURCE.SETTINGS_TOGGLE_ON
			v_u_10:JoinVoice()
		end)
		return v_u_258
	end or nil
	local function v_u_279(p266, p_u_267, p268, p269) -- name: resizeInspectButton
		-- upvalues: (ref) v_u_7, (ref) v_u_47, (copy) v_u_69, (ref) v_u_4, (ref) v_u_18, (ref) v_u_46
		local v270 = p266:FindFirstChild("Inspect")
		if not v270 or p268 ~= p269 then
			if v270 then
				v270:Destroy()
			end
			local function v277()
				-- upvalues: (ref) v_u_7, (ref) v_u_47, (ref) v_u_69, (ref) v_u_4, (copy) p_u_267
				local v271 = v_u_7
				local v272 = v_u_47.AnalyticsTargetName
				local v273 = v_u_47.AnalyticsExamineAvatarName
				local v274 = v_u_47.AnalyticsMenuActionName
				local v275 = {
					["playsessionid"] = v_u_69.playSessionId
				}
				local v276 = game.GameId
				v275.universeid = tostring(v276)
				v271:SetRBXEventStream(v272, v273, v274, v275)
				v_u_4:InspectPlayerFromUserIdWithCtx(p_u_267.UserId, "escapeMenu")
				v_u_69.HubRef:SetVisibility(false)
			end
			local v278 = v_u_18:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v_u_46.ButtonHeight, 0, v_u_46.ButtonHeight), UDim2.new(0, 28, 0, 28), v277)
			v278.Name = "Inspect"
			v278.LayoutOrder = 2
			v278.Selectable = true
			v278.Parent = p266
			v_u_18:MakeFocusState(v278, "utility-focus-state" .. "-inspect-" .. p_u_267.Name)
		end
	end
	local function v_u_289(p280, p281, p_u_282) -- name: resizePlatformName
		-- upvalues: (ref) v_u_45, (ref) v_u_18, (ref) v_u_46, (ref) v_u_19
		local v283 = p280:FindFirstChild("PlatformNameContainer")
		if v283 then
			v283:Destroy()
		end
		if p281 ~= nil then
			local v284 = Instance.new("Frame")
			v284.Name = "PlatformNameContainer"
			v284.BackgroundTransparency = 1
			v284.ZIndex = 3
			v284.Position = UDim2.new(0, 0, 0, 0)
			v284.Size = UDim2.new(0, 0, 1, 0)
			v284.AutomaticSize = Enum.AutomaticSize.X
			v284.Selectable = false
			v284.LayoutOrder = -1
			v284.Parent = p280
			local v285 = game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (v_u_45 and (v_u_45:IsProfileEnabled() and (p_u_282 and p_u_282 ~= "")))) and function()
				-- upvalues: (ref) v_u_45, (copy) p_u_282
				v_u_45:ShowProfile(p_u_282)
			end or nil
			local v286, v287 = v_u_18:MakeStyledButton("consoleNameContainer", p281, UDim2.new(0, 0, 0, v_u_46.ButtonHeight), v285)
			v286.AnchorPoint = Vector2.new(0, 0.5)
			v286.Position = UDim2.fromScale(0, 0.5)
			v286.AutomaticSize = Enum.AutomaticSize.X
			v286.Parent = v284
			v287.Size = UDim2.fromScale(0, 1)
			v287.AutoLocalize = false
			v287.TextSize = v_u_46.platformNameTextSize
			v287.TextScaled = false
			v287.TextWrapped = false
			v287.AutomaticSize = Enum.AutomaticSize.X
			local v288 = v_u_19("ImageLabel")({
				["Name"] = "iconLabel",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Image"] = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
				["ImageColor3"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["Size"] = v_u_46.platformNameIconSize,
				["ImageColor3"] = Color3.new(1, 1, 1)
			})
			v288.Parent = v286
			v_u_19("UIListLayout")({
				["Name"] = "PLatformNameUIListLayout",
				["FillDirection"] = nil,
				["HorizontalAlignment"] = nil,
				["VerticalAlignment"] = nil,
				["SortOrder"] = nil,
				["Padding"] = nil,
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 12)
			}).Parent = v286
			v288.LayoutOrder = 1
			v287.LayoutOrder = 2
			v_u_19("UIPadding")({
				["PaddingLeft"] = UDim.new(0, 12),
				["PaddingRight"] = UDim.new(0, 12),
				["Parent"] = v286
			})
			return v284
		end
	end
	local function v_u_296()
		-- upvalues: (copy) v_u_234, (ref) v_u_35, (ref) v_u_16, (ref) v_u_4
		local v_u_290 = v_u_234("ImageLabel", true)
		v_u_290.TextLabel.Name = "DisplayNameLabel"
		v_u_290.SecondRow.Name = "NameLabel"
		v_u_290.Selectable = false
		v_u_290.SelectionGroup = true
		if v_u_35() then
			v_u_290.NameLabel.OpenTypeFeatures = v_u_16:getUserNameStylisticAlternative()
		end
		local v_u_291 = Instance.new("Frame")
		v_u_291.Name = "RightSideButtons"
		v_u_291.BackgroundTransparency = 1
		v_u_291.ZIndex = 2
		v_u_291.Position = UDim2.new(0, 0, 0, 0)
		v_u_291.Size = UDim2.new(1, -12, 1, 0)
		v_u_291.Parent = v_u_290
		local v_u_292 = nil
		v_u_291.ChildAdded:connect(function(p_u_293)
			-- upvalues: (ref) v_u_292, (copy) v_u_290, (ref) v_u_4, (copy) v_u_291
			if p_u_293:IsA("GuiObject") then
				if v_u_292 and p_u_293 ~= v_u_292 then
					v_u_292:Destroy()
					v_u_292 = nil
				end
				p_u_293.SelectionGained:connect(function()
					-- upvalues: (ref) v_u_290, (ref) v_u_4, (ref) v_u_291
					if v_u_290 then
						if v_u_4.SelectedCoreObject and (v_u_4.SelectedCoreObject ~= nil and v_u_4.SelectedCoreObject.Parent == v_u_291) then
							v_u_290.ImageTransparency = 0.65
							return
						end
						v_u_290.ImageTransparency = 0.85
					end
				end)
				p_u_293.SelectionLost:connect(function()
					-- upvalues: (copy) p_u_293, (ref) v_u_290, (ref) v_u_4, (ref) v_u_291
					local v294 = p_u_293
					if v_u_290 then
						if v_u_4.SelectedCoreObject and (v_u_4.SelectedCoreObject ~= v294 and v_u_4.SelectedCoreObject.Parent == v_u_291) then
							v_u_290.ImageTransparency = 0.65
							return
						end
						v_u_290.ImageTransparency = 0.85
					end
				end)
			end
		end)
		v_u_292 = Instance.new("Frame")
		v_u_292.Selectable = true
		v_u_292.Size = UDim2.new(1, 0, 1, 0)
		v_u_292.BackgroundTransparency = 1
		v_u_292.SelectionImageObject = v_u_292:Clone()
		v_u_292.Parent = v_u_291
		local v295 = Instance.new("UIListLayout")
		v295.Name = "RightSideListLayout"
		v295.FillDirection = Enum.FillDirection.Horizontal
		v295.HorizontalAlignment = Enum.HorizontalAlignment.Right
		v295.VerticalAlignment = Enum.VerticalAlignment.Center
		v295.SortOrder = Enum.SortOrder.LayoutOrder
		v295.Padding = UDim.new(0, 12)
		v295.Parent = v_u_291
		pcall(function()
			-- upvalues: (copy) v_u_290
			v_u_290.NameLabel.Localize = false
			v_u_290.DisplayNameLabel.Localize = false
		end)
		return v_u_290
	end
	local function v_u_362(p_u_297, p_u_298) -- name: managePlayerNameCutoff
		-- upvalues: (ref) v_u_65, (ref) v_u_44, (ref) v_u_57, (ref) v_u_18, (ref) v_u_60, (ref) v_u_12
		local v_u_299 = nil
		local v_u_300 = nil
		local function v_u_312(p301, p302, p303) -- name: reportFlagChanged
			-- upvalues: (ref) v_u_299, (copy) p_u_297, (copy) p_u_298
			if p302 == "AbsolutePosition" and v_u_299 then
				local v304 = p301.AbsolutePosition.X - 20 - p_u_297.NameLabel.AbsolutePosition.X
				p_u_297.NameLabel.Text = "@" .. p_u_298.Name
				p_u_297.DisplayNameLabel.Text = p_u_298.DisplayName
				if p303 then
					p_u_297.DisplayNameLabel.Text = p303
				end
				local v305 = utf8.len(p_u_298.DisplayName)
				if p303 then
					v305 = utf8.len(p303)
				end
				while v304 < p_u_297.NameLabel.TextBounds.X and v305 > 0 do
					if p303 then
						local v306 = utf8.offset(p303, v305)
						p_u_297.NameLabel.Text = string.sub(p303, 1, v306) .. "..."
					else
						local v307 = utf8.offset(p_u_298.DisplayName, v305)
						local v308 = p_u_297.NameLabel
						local v309 = p_u_298.DisplayName
						v308.Text = string.sub(v309, 1, v307) .. "..."
					end
					v305 = v305 - 1
				end
				local v310 = "@" .. p_u_298.Name
				local v311 = string.len(v310)
				while v304 < p_u_297.NameLabel.TextBounds.X and v311 > 0 do
					p_u_297.NameLabel.Text = string.sub(v310, 1, v311) .. "..."
					v311 = v311 - 1
				end
			end
		end
		local function v_u_324(p_u_313, _, _) -- name: reportFlagChangedWithCombinedName
			-- upvalues: (ref) v_u_65, (copy) p_u_298, (copy) v_u_312, (ref) v_u_44, (copy) p_u_297
			if v_u_65 and not p_u_298.UserId then
				v_u_312(p_u_313, "AbsolutePosition")
			else
				local v314 = v_u_44.get().fetchNamesByUserIds
				local v315 = {}
				local v316 = p_u_298.UserId
				__set_list(v315, 1, {(tostring(v316))})
				v314(v315, function(p317)
					-- upvalues: (ref) p_u_297, (ref) v_u_312, (copy) p_u_313, (ref) p_u_298
					local v318 = p_u_297
					local v319
					if v318 and v318.Parent then
						v319 = v318:FindFirstChild("DisplayNameLabel")
					else
						v319 = nil
					end
					if v319 == nil then
						return
					else
						local v320 = p317.data
						local v321
						if #v320 == 0 then
							v321 = ""
						else
							local v322 = v320[1]
							if v322 == nil then
								v321 = ""
							else
								local v323 = v322.names
								v321 = v323 == nil and "" or v323.getInExperienceCombinedName(false)
							end
						end
						if string.len(v321) > 0 and v321 ~= v319.Text then
							v_u_312(p_u_313, "AbsolutePosition", v321)
						elseif p_u_298.DisplayName ~= v319.Text then
							v_u_312(p_u_313, "AbsolutePosition")
						end
					end
				end)
			end
		end
		if not v_u_57() then
			v_u_18:OnResized(p_u_297.NameLabel, function(_, p325)
				-- upvalues: (ref) v_u_299, (ref) v_u_18, (ref) v_u_300, (copy) p_u_297, (copy) v_u_324, (copy) p_u_298, (ref) v_u_65, (ref) v_u_44
				if v_u_299 == nil or v_u_299 ~= p325 then
					if p325 then
						local v326 = v_u_18:IsSmallTouchScreen()
						if v326 then
							v326 = v_u_18:IsPortrait()
						end
						p325 = not v326
					end
					v_u_299 = p325
					if p325 then
						if v_u_300 == nil then
							v_u_300 = p_u_297.RightSideButtons.ChildAdded:connect(function(p_u_327)
								-- upvalues: (ref) v_u_324
								if p_u_327.Name == "Inspect" then
									p_u_327.Changed:connect(function(_)
										-- upvalues: (ref) v_u_324, (copy) p_u_327
										v_u_324(p_u_327, "AbsolutePosition")
									end)
									v_u_324(p_u_327, "AbsolutePosition")
								end
							end)
						end
						local v_u_328 = p_u_297.RightSideButtons:FindFirstChild("Inspect")
						if v_u_328 then
							v_u_328.Changed:connect(function(p329)
								-- upvalues: (ref) v_u_324, (copy) v_u_328
								v_u_324(v_u_328, p329)
							end)
							v_u_324(v_u_328, "AbsolutePosition")
							return
						end
					else
						if not p_u_297:FindFirstChild("NameLabel") then
							return
						end
						p_u_297.NameLabel.Text = "@" .. p_u_298.Name
						if v_u_65 and not p_u_298.UserId then
							p_u_297.DisplayNameLabel.Text = p_u_298.DisplayName
							return
						end
						local v330 = v_u_44.get().fetchNamesByUserIds
						local v331 = {}
						local v332 = p_u_298.UserId
						__set_list(v331, 1, {(tostring(v332))})
						v330(v331, function(p333)
							-- upvalues: (ref) p_u_297, (ref) p_u_298
							local v334 = p_u_297
							local v335
							if v334 and v334.Parent then
								v335 = v334:FindFirstChild("DisplayNameLabel")
							else
								v335 = nil
							end
							if v335 == nil then
								return
							else
								local v336 = p333.data
								local v337
								if #v336 == 0 then
									v337 = ""
								else
									local v338 = v336[1]
									if v338 == nil then
										v337 = ""
									else
										local v339 = v338.names
										v337 = v339 == nil and "" or v339.getInExperienceCombinedName(false)
									end
								end
								if string.len(v337) > 0 and v337 ~= v335.Text then
									v335.Text = v337
								else
									local v340 = p_u_298.DisplayName
									if v340 ~= v335.Text then
										v335.Text = v340
									end
								end
							end
						end)
					end
				end
			end)
		end
		local function v_u_343() -- name: getNearestRightSideButtonXPosition
			-- upvalues: (copy) p_u_297
			local v341 = nil
			for _, v342 in pairs(p_u_297.RightSideButtons:GetChildren()) do
				if not v342:IsA("ImageButton") or v341 and v342.AbsolutePosition.X >= v341 then
					continue
				end
				v341 = v342.AbsolutePosition.X
			end
			return v341
		end
		local v_u_344 = nil
		local function v_u_360() -- name: rightSideButtonsChanged
			-- upvalues: (copy) v_u_343, (ref) v_u_344, (copy) p_u_297, (ref) v_u_60, (ref) v_u_12, (copy) p_u_298, (ref) v_u_65, (ref) v_u_44
			local v345 = v_u_343()
			if v345 == v_u_344 then
				return
			else
				v_u_344 = v345
				local v346
				if v345 then
					v346 = UDim2.new(0, v345 - p_u_297.NameLabel.AbsolutePosition.X - 20, 0, 0)
				else
					v346 = UDim2.new(1, -20, 0, 0)
				end
				p_u_297.NameLabel.Size = v346
				p_u_297.DisplayNameLabel.Size = v346
				local v347 = p_u_297.NameLabel
				local v348
				if v_u_60 then
					v348 = v_u_12(p_u_298.Name)
				else
					v348 = "@" .. p_u_298.Name
				end
				v347.Text = v348
				if v_u_65 and not p_u_298.UserId then
					p_u_297.DisplayNameLabel.Text = p_u_298.DisplayName
				else
					local v349 = v_u_44.get().fetchNamesByUserIds
					local v350 = {}
					local v351 = p_u_298.UserId
					__set_list(v350, 1, {(tostring(v351))})
					v349(v350, function(p352)
						-- upvalues: (ref) p_u_297, (ref) p_u_298
						local v353 = p_u_297
						local v354
						if v353 and v353.Parent then
							v354 = v353:FindFirstChild("DisplayNameLabel")
						else
							v354 = nil
						end
						if v354 == nil then
							return
						else
							local v355 = p352.data
							local v356
							if #v355 == 0 then
								v356 = ""
							else
								local v357 = v355[1]
								if v357 == nil then
									v356 = ""
								else
									local v358 = v357.names
									v356 = v358 == nil and "" or v358.getInExperienceCombinedName(false)
								end
							end
							if string.len(v356) > 0 and v356 ~= v354.Text then
								v354.Text = v356
							else
								local v359 = p_u_298.DisplayName
								if v359 ~= v354.Text then
									v354.Text = v359
								end
							end
						end
					end)
				end
			end
		end
		if v_u_57() then
			p_u_297.RightSideButtons.ChildAdded:connect(function(p361)
				-- upvalues: (copy) v_u_360
				v_u_360()
				p361:GetPropertyChangedSignal("AbsolutePosition"):Connect(v_u_360)
			end)
			v_u_360()
		end
	end
	local v_u_363 = nil
	local v_u_364 = {}
	local v_u_365 = {}
	local v_u_366 = false
	local function v_u_375() -- name: updateAllMuteButtons
		-- upvalues: (ref) v_u_96, (ref) v_u_10, (ref) v_u_5, (copy) v_u_364, (copy) v_u_179, (ref) v_u_162, (ref) v_u_22
		if v_u_96 then
			if v_u_10.voiceUIVisible then
				local v367 = v_u_5:GetPlayers()
				local v368 = true
				for _, v369 in ipairs(v367) do
					local v370 = v_u_364[v369.Name]
					if not (v369 and v370) then
						continue
					end
					local v371 = v_u_10.participants
					local v372 = v369.UserId
					local v373 = v371[tostring(v372)]
					if v373 and not v373.isMutedLocally then
						v368 = false
					end
					v_u_179(v370, v373)
				end
				if v368 then
					v_u_162 = true
				else
					v_u_162 = false
				end
				local v374 = v_u_162 and v_u_22:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v_u_22:FormatByKey("Feature.SettingsHub.Action.MuteAll")
				if v_u_96 and v_u_96:FindFirstChild("TextLabel") then
					v_u_96.TextLabel.Text = v374
					v_u_96.Icon.Image = v_u_10:GetIcon(v_u_162 and "MuteAll" or "UnmuteAll", "Misc")
				end
			else
				return
			end
		else
			return
		end
	end
	local function v_u_380() -- name: destroyAllUserMuteButtons
		-- upvalues: (ref) v_u_5, (copy) v_u_364, (ref) v_u_4, (ref) v_u_6, (ref) v_u_95
		for _, v376 in v_u_5:GetPlayers() do
			local v377 = v_u_364[v376.Name]
			if not v377 then
				continue
			end
			local v378 = v377:FindFirstChild("RightSideButtons")
			if not v378 then
				continue
			end
			local v379 = v378:FindFirstChild("MuteStatusButton")
			if not v379 then
				continue
			end
			if v_u_4.SelectedCoreObject == v379 then
				if v_u_6.GamepadEnabled then
					v_u_4.SelectedCoreObject = v_u_95
				else
					v_u_4.SelectedCoreObject = nil
				end
			end
			v379:Destroy()
		end
	end
	local function v_u_443(_)
		-- upvalues: (copy) v_u_69, (ref) v_u_36, (ref) v_u_363, (ref) v_u_5, (ref) v_u_66, (ref) v_u_49, (ref) v_u_18, (ref) v_u_223, (ref) v_u_96, (ref) v_u_10, (ref) v_u_42, (ref) v_u_43, (ref) v_u_37, (ref) v_u_95, (ref) v_u_8, (ref) v_u_103, (ref) v_u_19, (ref) v_u_104, (ref) v_u_48, (ref) v_u_32, (ref) v_u_242, (ref) v_u_54, (copy) v_u_226, (ref) v_u_98, (ref) v_u_265, (ref) v_u_123, (ref) v_u_4, (copy) v_u_364, (copy) v_u_365, (ref) v_u_296, (copy) v_u_179, (ref) v_u_21, (ref) v_u_60, (ref) v_u_12, (ref) v_u_57, (copy) v_u_362, (copy) v_u_138, (copy) v_u_133, (ref) v_u_141, (copy) v_u_279, (copy) v_u_222, (ref) v_u_248, (ref) v_u_162, (ref) v_u_22, (ref) v_u_50, (ref) v_u_28, (copy) v_u_100, (ref) v_u_25, (copy) v_u_375, (ref) v_u_61, (ref) v_u_65, (ref) v_u_13, (ref) v_u_44, (copy) v_u_289, (ref) v_u_34, (ref) v_u_366, (ref) v_u_64, (copy) v_u_198, (ref) v_u_6, (ref) v_u_62
		v_u_69.LastSelectableObjects = {}
		if v_u_36 and not v_u_69.ButtonsContainer.Visible then
			v_u_69.FirstSelectableObjects = {}
		end
		v_u_363 = v_u_5:GetPlayers()
		if v_u_66 then
			table.sort(v_u_363, function(p381, p382)
				-- upvalues: (ref) v_u_49
				local v383 = p381.Name:lower()
				local v384 = p382.Name:lower()
				return (p381 == v_u_49 and " " or v383) < (p382 == v_u_49 and " " or v384)
			end)
		else
			table.sort(v_u_363, function(p385, p386)
				return p385.Name:lower() < p386.Name:lower()
			end)
		end
		local v387 = (v_u_18:IsSmallTouchScreen() or v_u_18:IsPortrait()) and 85 or 20
		local v388 = v_u_223 and not v_u_96
		if v388 then
			v388 = v_u_10.voiceUIVisible
		end
		local v389 = v_u_42 and v_u_43
		if v389 then
			v389 = v_u_37
		end
		local v390 = v_u_49.UserId > 0 and not v_u_95
		if v390 then
			v390 = not v_u_8:IsStudio()
			if v390 then
				v390 = not v389
			end
		end
		if (v390 or v388) and not v_u_103 then
			v_u_103 = v_u_19("Frame")({
				["Name"] = "Holder",
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["Parent"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.fromScale(1, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["Parent"] = v_u_69.Page
			})
			v_u_104 = v_u_19("UIListLayout")({
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 20),
				["Parent"] = v_u_103
			})
		end
		local function v391() -- name: layoutMuteAll
			-- upvalues: (ref) v_u_103, (ref) v_u_19, (ref) v_u_69, (ref) v_u_95, (ref) v_u_48, (ref) v_u_96
			if not v_u_103 then
				v_u_103 = v_u_19("Frame")({
					["Name"] = "Holder",
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["Parent"] = nil,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(1, 0, 0, 52),
					["Parent"] = v_u_69.Page
				})
			end
			v_u_95.Parent = v_u_103
			v_u_95.Size = v_u_48
			v_u_96.Parent = v_u_103
		end
		local v392 = not v_u_8:IsStudio()
		if v_u_49.UserId > 0 and (not v_u_95 and (v392 and not v389)) then
			local v_u_393 = v_u_32:withButtonName(v_u_32.ButtonName.SettingsHub)
			v_u_95 = v_u_242()
			v_u_95.Activated:connect(function()
				-- upvalues: (copy) v_u_393, (ref) v_u_69
				v_u_393:inputShareGameEntryPoint()
				v_u_69.HubRef:InviteToGame()
			end)
			v_u_95.LayoutOrder = 1
			if v388 then
				v_u_95.Parent = v_u_103
			else
				v_u_95.Parent = v_u_69.Page
			end
		end
		if v_u_54() and v_u_226() then
			if v_u_226() and not v_u_98 then
				v_u_98 = v_u_265()
			end
			v_u_123()
		end
		if v_u_36 then
			if v388 then
				local v394 = v_u_69.FirstSelectableObjects
				local v395 = v_u_96
				table.insert(v394, v395)
			end
			if v390 then
				local v396 = v_u_69.FirstSelectableObjects
				local v397 = v_u_95
				table.insert(v396, v397)
			end
			if v388 or v390 then
				v_u_69.FirstSelectableObjectsUpdated:fire()
			end
		end
		local v_u_398 = v_u_4:GetInspectMenuEnabled()
		for v399 = 1, #v_u_363 do
			local v_u_400 = v_u_363[v399]
			local v_u_401 = v_u_364[v_u_400.Name]
			if not v_u_400 then
				continue
			end
			v_u_365[v_u_400.Name] = true
			if not (v_u_401 and v_u_401.Parent) then
				v_u_401 = v_u_296((v399 - 1) * 80 + v387)
				v_u_401.Parent = v_u_69.Page
				v_u_364[v_u_400.Name] = v_u_401
			end
			v_u_401.Name = "PlayerLabel" .. v_u_400.Name
			if v_u_223 then
				local v402 = v_u_10.participants
				local v403 = v_u_400.UserId
				v_u_179(v_u_401, v402[tostring(v403)])
			end
			local v404 = v_u_21.GetPlayerImage
			local v405 = v_u_400.UserId
			local v406 = v404(math.max(1, v405), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail)
			v_u_401.Icon.Image = v406
			local v407 = v_u_401.NameLabel
			local v408
			if v_u_60 then
				v408 = v_u_12(v_u_400.Name)
			else
				v408 = "@" .. v_u_400.Name
			end
			v407.Text = v408
			v_u_401.ImageTransparency = 0.85
			v_u_401.LayoutOrder = v399 + 1
			if v_u_57() then
				v_u_401.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
				v_u_401.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
			end
			v_u_362(v_u_401, v_u_400)
			v_u_138(v_u_401, v_u_400)
			local v_u_409 = nil
			v_u_18:OnResized(v_u_401, function(_, p410)
				-- upvalues: (ref) v_u_401, (ref) v_u_18, (ref) v_u_133, (copy) v_u_400, (ref) v_u_409, (ref) v_u_141, (copy) v_u_398, (ref) v_u_279
				local v411 = v_u_401:FindFirstChild("RightSideButtons")
				local v412 = v_u_401:FindFirstChild("DisplayNameLabel")
				local v413 = v_u_401:FindFirstChild("NameLabel")
				local v414
				if v411 then
					v414 = v411:FindFirstChild("RightSideListLayout")
				else
					v414 = v411
				end
				local v415 = v_u_18:IsSmallTouchScreen()
				if v415 then
					v415 = v_u_18:IsPortrait()
				end
				if v415 then
					v_u_401.Size = UDim2.new(1, 0, 0, 105)
					if v412 then
						if v413 then
							v412.Position = UDim2.new(0, 60, 0.275, -10)
							v413.Position = UDim2.new(0, 60, 0.275, 12)
						else
							v412.Position = UDim2.new(0, 60, 0.275, 0)
						end
					end
					if v411 then
						v411.Position = UDim2.new(0, 57, 0, -2)
						v411.Size = UDim2.new(1, -12, 0.99, -8)
					end
					if v414 then
						v414.HorizontalAlignment = Enum.HorizontalAlignment.Left
						v414.VerticalAlignment = Enum.VerticalAlignment.Bottom
					end
				else
					v_u_401.Size = UDim2.new(1, 0, 0, 62)
					if v412 then
						if v413 then
							v412.Position = UDim2.new(0, 60, 0.5, -10)
							v413.Position = UDim2.new(0, 60, 0.5, 12)
						else
							v412.Position = UDim2.new(0, 60, 0.5, 0)
						end
					end
					if v411 then
						v411.Position = UDim2.new(0, 0, 0, 0)
						v411.Size = UDim2.new(1, -12, 1, 0)
					end
					if v414 then
						v414.HorizontalAlignment = Enum.HorizontalAlignment.Right
						v414.VerticalAlignment = Enum.VerticalAlignment.Center
					end
				end
				if v411 then
					v_u_133(v411, v_u_400, p410, v_u_409)
					v_u_141(v411, v_u_400, p410, v_u_409)
					if v_u_398 then
						v_u_279(v411, v_u_400, p410, v_u_409)
					end
					v_u_409 = p410
				end
			end)
			v_u_222(v_u_401, v_u_400)
			if v399 == #v_u_363 then
				local v416 = v_u_401:FindFirstChild("RightSideButtons")
				if v416 then
					for _, v417 in v416:GetChildren() do
						if not v417:IsA("ImageButton") then
							continue
						end
						local v418 = v_u_69.LastSelectableObjects
						table.insert(v418, v417)
					end
					v_u_69.LastSelectableObjectsUpdated:fire()
				end
			end
			if not v_u_36 or (v399 ~= 1 or #v_u_69.FirstSelectableObjects ~= 0) then
				continue
			end
			local v419 = v_u_401:FindFirstChild("RightSideButtons")
			if not v419 then
				continue
			end
			for _, v420 in v419:GetChildren() do
				if not v420:IsA("ImageButton") then
					continue
				end
				local v421 = v_u_69.FirstSelectableObjects
				table.insert(v421, v420)
			end
			v_u_69.FirstSelectableObjectsUpdated:fire()
		end
		if v388 then
			v_u_96 = v_u_248()
			v_u_96.Activated:connect(function()
				-- upvalues: (ref) v_u_162, (ref) v_u_22, (ref) v_u_96, (ref) v_u_10, (ref) v_u_50, (ref) v_u_28, (ref) v_u_100, (ref) v_u_25, (ref) v_u_375
				v_u_162 = not v_u_162
				local v422 = v_u_162 and v_u_22:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v_u_22:FormatByKey("Feature.SettingsHub.Action.MuteAll")
				v_u_96.TextLabel.Text = v422
				v_u_96.Icon.Image = v_u_10:GetIcon(v_u_162 and "MuteAll" or "UnmuteAll", "Misc")
				if v_u_50() then
					v_u_28:debug("{} all players", v_u_162 and "Muting" or "Unmuting")
				end
				if v_u_100 then
					v_u_100:onToggleMuteAll(v_u_162)
				end
				v_u_10:MuteAll(v_u_162, v_u_25.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				v_u_375()
			end)
			v_u_96.LayoutOrder = 1
			if not v_u_61 and true or v_u_95 ~= nil then
				v391()
			else
				v_u_96.Parent = v_u_103
			end
			v_u_123()
		end
		local v423
		if v_u_65 then
			v423 = v_u_13.List.filterMap(v_u_363, function(p424)
				if not p424.UserId then
					return nil
				end
				local v425 = p424.UserId
				return tostring(v425)
			end)
		else
			v423 = v_u_13.List.filter(v_u_363, function(p426)
				local v427 = p426.UserId
				return tostring(v427)
			end)
		end
		for _, v428 in ipairs(v_u_363) do
			v_u_364[v428.Name].DisplayNameLabel.Text = v428.DisplayName
		end
		v_u_44.get().fetchNamesByUserIds(v423, function(p429)
			-- upvalues: (ref) v_u_364, (ref) v_u_289
			for _, v430 in p429.data do
				local v431 = v_u_364[v430.names.getUsername(false)]
				if not v431 then
					continue
				end
				local v432 = v430.names.getInExperienceCombinedName(false)
				if string.len(v432) > 0 and v432 ~= v431.DisplayNameLabel.Text then
					v431.DisplayNameLabel.Text = v432
				end
				local v433 = v431:FindFirstChild("RightSideButtons")
				local v434
				if v430.names.getPlatformName(false) == "" then
					v434 = nil
				else
					v434 = v430.names.getPlatformName(false)
				end
				if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
					v_u_289(v433, v434, v430.getPlatformProfileId(false))
				else
					v_u_289(v433, v434)
				end
			end
		end, v_u_34)
		local v_u_435 = 0
		if v_u_223 and not v_u_366 then
			v_u_28:debug("Setting Up Playerlist Mic Update Renderstep Hook")
			v_u_8:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function()
				-- upvalues: (ref) v_u_435, (ref) v_u_375, (ref) v_u_64, (ref) v_u_103, (ref) v_u_198
				v_u_435 = v_u_435 + 1
				if v_u_435 % 3 == 0 then
					v_u_375()
					local v436 = nil
					if v_u_64() then
						if v_u_103 then
							v436 = v_u_103:FindFirstChild("MuteSelfButtonImageLabel", true)
						end
					else
						v436 = v_u_103:FindFirstChild("MuteSelfButtonImageLabel", true)
					end
					if not v436 then
						return
					end
					v436.Image = v_u_198()
				end
			end)
			v_u_366 = true
		end
		for v437, v438 in pairs(v_u_364) do
			if v_u_365[v437] then
				continue
			end
			v438:Destroy()
			v_u_364[v437] = nil
		end
		if v_u_6.GamepadEnabled and not (v_u_36 and v_u_4.SelectedCoreObject) then
			if v_u_64() then
				local function v439()
					-- upvalues: (ref) v_u_62, (ref) v_u_69, (ref) v_u_4, (ref) v_u_95
					if v_u_62 then
						if v_u_69.Active then
							v_u_4.SelectedCoreObject = v_u_95
							return
						end
					else
						v_u_4.SelectedCoreObject = v_u_95
					end
				end
				pcall(v439)
			else
				v_u_4.SelectedCoreObject = v_u_95
			end
		end
		v_u_18:OnResized("MenuPlayerListExtraPageSize", function(_, _)
			-- upvalues: (ref) v_u_18, (ref) v_u_363, (ref) v_u_69
			local v440 = (v_u_18:IsSmallTouchScreen() or v_u_18:IsPortrait()) and 85 or 20
			local v441 = #v_u_363 + 1
			local v442 = v_u_18:IsSmallTouchScreen()
			if v442 then
				v442 = v_u_18:IsPortrait()
			end
			if v442 then
				v_u_69.Page.Size = UDim2.new(1, 0, 0, v440 + v441 * 123 - 5)
			else
				v_u_69.Page.Size = UDim2.new(1, 0, 0, v440 + v441 * 80 - 5)
			end
		end)
	end
	local function v444()
		-- upvalues: (ref) v_u_366, (ref) v_u_28, (ref) v_u_8
		if v_u_366 then
			v_u_28:debug("Unbinding Playerlist Mic Update Renderstep Hook")
			v_u_366 = false
			v_u_8:UnbindFromRenderStep("player-list-mute-update")
		end
	end
	if game:GetEngineFeature("VoiceChatSupported") and not v_u_223 then
		v_u_10:asyncInit():andThen(function()
			-- upvalues: (ref) v_u_223, (ref) v_u_10, (ref) v_u_66, (ref) v_u_64, (ref) v_u_97, (ref) v_u_257, (copy) v_u_375, (copy) v_u_99, (ref) v_u_96, (ref) v_u_123, (ref) v_u_224, (ref) v_u_54, (ref) v_u_98, (copy) v_u_443, (copy) v_u_180, (copy) v_u_380, (copy) v_u_212
			v_u_223 = true
			v_u_10:SetupParticipantListeners()
			if not v_u_66 then
				if v_u_64() then
					v_u_97 = v_u_257()
				else
					v_u_257()
				end
			end
			v_u_10.participantsUpdate.Event:Connect(function()
				-- upvalues: (ref) v_u_375
				v_u_375()
			end)
			v_u_10.participantLeft.Event:Connect(function(_, p445)
				-- upvalues: (ref) v_u_375, (ref) v_u_99
				v_u_375()
				v_u_99[p445] = nil
			end)
			v_u_10:getService().StateChanged:Connect(function(_, p446)
				-- upvalues: (ref) v_u_96, (ref) v_u_123, (ref) v_u_97, (ref) v_u_224, (ref) v_u_54, (ref) v_u_98, (ref) v_u_223, (ref) v_u_443
				if p446 == Enum.VoiceChatState.Ended then
					if v_u_96 then
						v_u_96.Visible = false
						v_u_96:Destroy()
						v_u_96 = nil
					end
					v_u_123()
					if v_u_97 then
						v_u_97.Visible = false
						v_u_97:Destroy()
						v_u_97 = nil
					end
					if v_u_224 then
						v_u_224:Disconnect()
						v_u_224 = nil
					end
					v_u_123()
					if v_u_54() then
						if v_u_98 then
							v_u_98.Visible = false
							v_u_98:Destroy()
							v_u_98 = nil
						end
						v_u_123()
					end
					v_u_223 = false
				elseif p446 == Enum.VoiceChatState.Joined and v_u_223 == false then
					v_u_223 = true
					if v_u_54() then
						if v_u_98 then
							v_u_98.Visible = false
							v_u_98:Destroy()
							v_u_98 = nil
						end
						v_u_123()
					end
					v_u_443()
				end
			end)
			if not v_u_64() then
				v_u_443()
			end
			v_u_10.showVoiceUI.Event:Connect(function()
				-- upvalues: (ref) v_u_64, (ref) v_u_97, (ref) v_u_66, (ref) v_u_257, (ref) v_u_180, (ref) v_u_54, (ref) v_u_98, (ref) v_u_123, (ref) v_u_443
				if v_u_64() then
					if not (v_u_97 or v_u_66) then
						if v_u_64() then
							v_u_97 = v_u_257()
						else
							v_u_257()
						end
					end
				elseif not (v_u_180:FindFirstChild("MuteSelfButton", true) or v_u_66) then
					if v_u_64() then
						v_u_97 = v_u_257()
					else
						v_u_257()
					end
				end
				if v_u_54() then
					if v_u_98 then
						v_u_98.Visible = false
						v_u_98:Destroy()
						v_u_98 = nil
					end
					v_u_123()
				end
				v_u_443()
			end)
			v_u_10.hideVoiceUI.Event:Connect(function()
				-- upvalues: (ref) v_u_96, (ref) v_u_123, (ref) v_u_97, (ref) v_u_224, (ref) v_u_380, (ref) v_u_443, (ref) v_u_212
				if v_u_96 then
					if v_u_96 then
						v_u_96.Visible = false
						v_u_96:Destroy()
						v_u_96 = nil
					end
					v_u_123()
				end
				if v_u_97 then
					v_u_97.Visible = false
					v_u_97:Destroy()
					v_u_97 = nil
				end
				if v_u_224 then
					v_u_224:Disconnect()
					v_u_224 = nil
				end
				v_u_123()
				v_u_380()
				v_u_443()
				v_u_212()
			end)
			v_u_10.muteAllChanged.Event:Connect(function()
				-- upvalues: (ref) v_u_375
				v_u_375()
			end)
		end):catch(function(_)
			-- upvalues: (ref) v_u_50, (ref) v_u_28
			if v_u_50() then
				v_u_28:warning("Failed to init VoiceChatServiceManager")
			end
		end)
	end
	v_u_69.Displayed.Event:connect(v_u_443)
	v_u_69.Hidden.Event:connect(v444)
	v_u_5.PlayerRemoving:Connect(function(p447)
		-- upvalues: (copy) v_u_365, (copy) v_u_364, (ref) v_u_4, (ref) v_u_6, (ref) v_u_95, (ref) v_u_53
		v_u_365[p447.Name] = nil
		local v448 = v_u_364[p447.Name]
		if v448 then
			local v449 = v448:FindFirstChild("RightSideButtons")
			if v449 then
				local v450 = v449:FindFirstChild("FriendStatus")
				if v450 then
					if v_u_4.SelectedCoreObject == v450 then
						if v_u_6.GamepadEnabled then
							v_u_4.SelectedCoreObject = v_u_95
						else
							v_u_4.SelectedCoreObject = nil
						end
					end
					v450:Destroy()
				end
				local v451 = v449:FindFirstChild("ReportPlayer")
				if v451 then
					if v_u_4.SelectedCoreObject == v451 then
						if v_u_6.GamepadEnabled then
							v_u_4.SelectedCoreObject = v_u_95
						else
							v_u_4.SelectedCoreObject = nil
						end
					end
					v451:Destroy()
				end
				local v452 = v449:FindFirstChild("MuteStatusButton")
				if v452 then
					if v_u_4.SelectedCoreObject == v452 then
						if v_u_6.GamepadEnabled then
							v_u_4.SelectedCoreObject = v_u_95
						else
							v_u_4.SelectedCoreObject = nil
						end
					end
					v452:Destroy()
				end
				local v453 = v449:FindFirstChild("BlockButton")
				if v453 then
					if v_u_4.SelectedCoreObject == v453 then
						if v_u_6.GamepadEnabled then
							v_u_4.SelectedCoreObject = v_u_95
						else
							v_u_4.SelectedCoreObject = nil
						end
					end
					v453:Destroy()
				end
				local v454 = v449:FindFirstChild("Inspect")
				if v454 then
					if v_u_4.SelectedCoreObject == v454 then
						v_u_4.SelectedCoreObject = nil
					end
					v454:Destroy()
				end
				if v_u_53() then
					v_u_364[p447.Name] = nil
					v448:Destroy()
				end
			end
		else
			return
		end
	end)
	local function v_u_458() -- name: removeInspectButtons
		-- upvalues: (copy) v_u_364, (ref) v_u_4
		for _, v455 in pairs(v_u_364) do
			local v456 = v455:FindFirstChild("RightSideButtons")
			if not v456 then
				continue
			end
			local v457 = v456:FindFirstChild("Inspect")
			if not v457 then
				continue
			end
			if v_u_4.SelectedCoreObject == v457 then
				v_u_4.SelectedCoreObject = nil
			end
			v457:Destroy()
		end
	end
	v_u_4.InspectMenuEnabledChangedSignal:Connect(function(p459)
		-- upvalues: (copy) v_u_458
		if not p459 then
			v_u_458()
		end
	end)
	function v_u_69.CreateMenuButtonsContainer(_) -- name: CreateMenuButtonsContainer
		-- upvalues: (ref) v_u_39, (copy) v_u_69, (ref) v_u_15, (copy) v_u_180, (ref) v_u_14, (ref) v_u_29
		if v_u_39 == 2 then
			if v_u_69.buttonsContainerRoot then
				return
			end
			v_u_69.buttonsContainerRoot = v_u_15.createRoot(v_u_180)
			local v460 = v_u_69.HubRef:GetExperienceControlStore()
			v_u_69.buttonsContainerRoot:render(v_u_14.createElement(v_u_29, {
				["onLeaveGame"] = v460.onLeaveGame,
				["onRespawn"] = v460.onRespawn,
				["onResume"] = v460.onResume,
				["setAddMenuKeyBindings"] = function() -- name: setAddMenuKeyBindings end,
				["setRemoveMenuKeyBindings"] = function() -- name: setRemoveMenuKeyBindings end,
				["getVisibility"] = function() -- name: getVisibility
					return true
				end,
				["getCanRespawn"] = v460.getCanRespawn
			}))
		end
	end
	function v_u_69.UnmountMenuButtonsContainer(_) -- name: UnmountMenuButtonsContainer
		-- upvalues: (ref) v_u_40, (ref) v_u_39, (copy) v_u_69
		if v_u_40 and (v_u_39 == 2 and v_u_69.buttonsContainerRoot) then
			v_u_69.buttonsContainerRoot:unmount()
			v_u_69.buttonsContainerRoot = nil
		end
	end
	return v_u_69
end)()