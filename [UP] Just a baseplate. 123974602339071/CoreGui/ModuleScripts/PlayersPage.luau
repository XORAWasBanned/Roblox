-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Pages.PlayersPage
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("RbxAnalyticsService")
local v5 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v6 = require(v2.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v8 = v6.UIBlox
local v_u_9 = v6.Cryo
local v10 = v6.RoactRodux
local v11 = v6.t
local v12 = require(v2.Packages.Foundation)
local v13 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_14
if v13 then
	v_u_14 = v12.UNSTABLE.withCursorMigration
else
	v_u_14 = v8.App.SelectionImage.withSelectionCursorProvider
end
local v_u_15
if v13 then
	v_u_15 = v12.Enums.CursorType
else
	v_u_15 = v8.App.SelectionImage.CursorKind
end
local v_u_16 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_17 = v8.App.ImageSet.Images
local v18 = script.Parent.Parent.Parent
local v_u_19 = require(v18.Localization.withLocalization)
local v20 = v18.Flags
local v_u_21 = require(v20.GetFFlagIGMGamepadSelectionHistory)
local v_u_22 = require(script.Parent.Parent.Connection.FocusHandler)
local v_u_23 = require(v5.Modules.VoiceChat.Components.VoiceIndicator)
local v_u_24 = require(v5.Modules.VoiceChat.Constants)
local v_u_25 = require(v18.Components.PlayerLabelV2)
local v_u_26 = require(v18.Components.PlayerContextualMenu)
local v_u_27 = require(v18.Flags.FFlagLuaMenuPerfImprovements)
local v_u_28 = require(v18.Components.PageNavigationWatcher)
local v_u_29 = require(v18.Components.Divider)
local v_u_30 = require(v18.Components.BarOnTopScrollingFrame)
local v_u_31 = require(v18.Components.Page)
local v_u_32 = require(v18.Thunks.CloseMenu)
local v_u_33 = require(v18.Resources.Assets)
local v_u_34 = require(v18.Resources.Constants)
local v_u_35 = require(v18.Utility.SendAnalytics)
local v_u_36 = require(v5.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_37 = require(v2.Workspace.Packages.BlockingUtility)
local v_u_38 = require(v5.Modules.PlayerList.Thunks.UnblockPlayer)
local v_u_39 = require(v5.Modules.TrustAndSafety)
local v_u_40 = require(v5.Modules.Settings.onBlockButtonActivated)
local v_u_41 = require(v2.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local v_u_42 = settings():GetFVariable("InGameGlobalGuiInset") + 24
local v43 = v_u_7.PureComponent:extend("PlayersPage")
v43.validateProps = v11.strictInterface({
	["isMenuOpen"] = v11.boolean,
	["voiceEnabled"] = v11.optional(v11.boolean),
	["inspectMenuEnabled"] = v11.boolean,
	["friends"] = v11.map(v11.integer, v11.enum(Enum.FriendStatus)),
	["closeMenu"] = v11.callback,
	["unblockPlayer"] = v11.callback,
	["pageTitle"] = v11.string,
	["screenSize"] = v11.Vector2,
	["currentPage"] = v11.optional(v11.string),
	["isRespawnDialogOpen"] = v11.optional(v11.boolean),
	["isReportDialogOpen"] = v11.optional(v11.boolean),
	["isGamepadLastInput"] = v11.optional(v11.boolean),
	["isCurrentZoneActive"] = v11.optional(v11.boolean)
})
function v43.init(p_u_44) -- name: init
	-- upvalues: (copy) v_u_1, (copy) v_u_21, (copy) v_u_7, (copy) v_u_27
	p_u_44:setState({
		["players"] = nil,
		["selectedPlayer"] = nil,
		["selectedPlayerPosition"] = nil,
		["pageSizeY"] = 0,
		["voiceChatEnabled"] = false,
		["allMuted"] = false,
		["selectedPlayerRef"] = nil,
		["firstPlayerRef"] = nil,
		["players"] = v_u_1:GetPlayers(),
		["selectedPlayerPosition"] = Vector2.new(0, 0)
	})
	function p_u_44.setSelectedPlayerRef(p45)
		-- upvalues: (ref) v_u_21, (copy) p_u_44, (ref) v_u_7
		if v_u_21() then
			p_u_44:setState({
				["selectedPlayerRef"] = p45
			})
		else
			p_u_44:setState({
				["selectedPlayerRef"] = p45,
				["firstPlayerRef"] = v_u_7.None
			})
		end
	end
	function p_u_44.setFirstPlayerRef(p46)
		-- upvalues: (copy) p_u_44
		p_u_44:setState({
			["firstPlayerRef"] = p46
		})
	end
	if v_u_27 then
		function p_u_44.positionChanged(p47)
			-- upvalues: (copy) p_u_44
			p_u_44:setState({
				["selectedPlayerPosition"] = p47.AbsolutePosition
			})
		end
		function p_u_44.toggleMoreActions(p48)
			-- upvalues: (ref) v_u_1, (copy) p_u_44, (ref) v_u_7
			local v49 = v_u_1:GetPlayerByUserId(p48)
			if p_u_44.state.selectedPlayer == v49 then
				p_u_44:setState({
					["selectedPlayer"] = v_u_7.None
				})
			else
				p_u_44:setState({
					["selectedPlayer"] = v49
				})
			end
		end
	end
end
local function v_u_52(p50, p51) -- name: sortPlayers
	return p50.Name:lower() < p51.Name:lower()
end
function v43.renderListEntries(p_u_53, p54) -- name: renderListEntries
	-- upvalues: (copy) v_u_9, (copy) v_u_52, (copy) v_u_7, (copy) v_u_27, (copy) v_u_1, (copy) v_u_25, (copy) v_u_23, (copy) v_u_29
	local v55 = v_u_9.List.sort(p54, v_u_52)
	local v56 = {
		["ListLayout"] = v_u_7.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
		})
	}
	local v57 = 0
	for v58, v_u_59 in pairs(v55) do
		local v60
		if v_u_27 then
			v60 = v_u_59.UserId or v58
		else
			v60 = v58
		end
		local v63 = v_u_27 and (p_u_53.positionChanged or function(p62)
			-- upvalues: (copy) p_u_53
			p_u_53:setState({
				["selectedPlayerPosition"] = p62.AbsolutePosition
			})
		end) or function(p62)
			-- upvalues: (copy) p_u_53
			p_u_53:setState({
				["selectedPlayerPosition"] = p62.AbsolutePosition
			})
		end
		local v64 = v_u_27 and p_u_53.toggleMoreActions or function()
			-- upvalues: (copy) p_u_53, (copy) v_u_59, (ref) v_u_7
			if p_u_53.state.selectedPlayer == v_u_59 then
				p_u_53:setState({
					["selectedPlayer"] = v_u_7.None
				})
			else
				p_u_53:setState({
					["selectedPlayer"] = v_u_59
				})
			end
		end
		local v65 = nil
		if v58 == 1 and not p_u_53.state.selectedPlayer then
			v65 = p_u_53.setFirstPlayerRef
		elseif p_u_53.state.selectedPlayer == v_u_59 then
			v65 = p_u_53.setSelectedPlayerRef
		end
		local v66 = v_u_59 == v_u_1.LocalPlayer and "MicLight" or "SpeakerLight"
		local v67 = "player_" .. v60
		local v68 = v_u_7.createElement
		local v69 = v_u_25
		local v70 = {
			["username"] = v_u_59.Name,
			["displayName"] = v_u_59.DisplayName,
			["userId"] = v_u_59.UserId,
			["isOnline"] = true,
			["isSelected"] = p_u_53.state.selectedPlayer == v_u_59,
			["LayoutOrder"] = v57,
			["onActivated"] = v64,
			[v_u_7.Change.AbsolutePosition] = p_u_53.state.selectedPlayer == v_u_59 and v63 and v63 or nil,
			[v_u_7.Ref] = v65
		}
		local v71 = {}
		local v72 = p_u_53.props.voiceEnabled
		if v72 then
			if v_u_59 == v_u_1.LocalPlayer then
				v72 = false
			else
				local v73 = v_u_7.createElement
				local v74 = v_u_23
				local v75 = {
					["userId"] = nil,
					["hideOnError"] = true,
					["iconStyle"] = nil,
					["onClicked"] = nil
				}
				local v76 = v_u_59.UserId
				v75.userId = tostring(v76)
				v75.iconStyle = v66
				v75.onClicked = v64
				v72 = v73(v74, v75)
			end
		end
		v71.Icon = v72
		v56[v67] = v68(v69, v70, v71)
		v57 = v57 + 1
		if v58 >= #v55 then
			continue
		end
		v56["divider_" .. v60] = v_u_7.createElement(v_u_29, {
			["LayoutOrder"] = v57,
			["Size"] = UDim2.new(1, -104, 0, 1)
		})
		v57 = v57 + 1
	end
	return v56
end
function v43.getMoreActions(p_u_77, p78) -- name: getMoreActions
	-- upvalues: (copy) v_u_1, (copy) v_u_17, (copy) v_u_4, (copy) v_u_35, (copy) v_u_34, (copy) v_u_7, (copy) v_u_33, (copy) v_u_3, (copy) v_u_39, (copy) v_u_36, (copy) v_u_41, (copy) v_u_24, (copy) v_u_37, (copy) v_u_40
	local v79 = {}
	if p_u_77.state.selectedPlayer ~= nil then
		if p_u_77.state.selectedPlayer ~= v_u_1.LocalPlayer then
			local v_u_80 = Enum.FriendStatus.Unknown
			if p_u_77.props.friends[p_u_77.state.selectedPlayer.UserId] then
				v_u_80 = p_u_77.props.friends[p_u_77.state.selectedPlayer.UserId]
			end
			local v81 = p78.addFriend
			local v82 = v_u_17["icons/actions/friends/friendAdd"]
			if v_u_80 == Enum.FriendStatus.Friend then
				v81 = p78.unfriend
				v82 = v_u_17["icons/actions/friends/friendRemove"]
			elseif v_u_80 == Enum.FriendStatus.FriendRequestSent then
				v81 = p78.cancelFriend
				v82 = v_u_17["icons/actions/friends/friendRemove"]
			elseif v_u_80 == Enum.FriendStatus.FriendRequestReceived then
				v81 = p78.acceptFriend
			end
			local v84 = {
				["text"] = v81,
				["icon"] = v82,
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) p_u_77, (ref) v_u_80, (ref) v_u_1, (ref) v_u_4, (ref) v_u_35, (ref) v_u_34, (ref) v_u_7
					local v83 = p_u_77.state.selectedPlayer
					if v_u_80 == Enum.FriendStatus.Friend or v_u_80 == Enum.FriendStatus.FriendRequestSent then
						v_u_1.LocalPlayer:RevokeFriendship(v83)
					else
						v_u_1.LocalPlayer:RequestFriendship(v83)
						v_u_4:ReportCounter("PlayersMenu-RequestFriendship")
						v_u_35(v_u_34.AnalyticsMenuActionName, v_u_34.AnalyticsRequestFriendName, {})
					end
					p_u_77:setState({
						["selectedPlayer"] = v_u_7.None
					})
				end
			}
			table.insert(v79, v84)
		end
		local v85 = {
			["text"] = p78.viewAvatar,
			["icon"] = v_u_33.Images.ViewAvatar,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) v_u_3, (copy) p_u_77, (ref) v_u_7, (ref) v_u_35, (ref) v_u_34
				v_u_3:InspectPlayerFromUserIdWithCtx(p_u_77.state.selectedPlayer.UserId, "escapeMenu")
				p_u_77:setState({
					["selectedPlayer"] = v_u_7.None
				})
				p_u_77.props.closeMenu()
				v_u_35(v_u_34.AnalyticsMenuActionName, v_u_34.AnalyticsExamineAvatarName, {})
			end
		}
		table.insert(v79, v85)
		if p_u_77.state.selectedPlayer ~= v_u_1.LocalPlayer then
			local v87 = {
				["text"] = p78.reportAbuse,
				["icon"] = v_u_17["icons/actions/feedback"],
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) p_u_77, (ref) v_u_39, (ref) v_u_34, (ref) v_u_7
					local v86 = p_u_77.state.selectedPlayer
					v_u_39.openReportDialogForPlayer(v86, v_u_34.AnalyticsMenuActionName)
					p_u_77:setState({
						["selectedPlayer"] = v_u_7.None
					})
				end
			}
			table.insert(v79, v87)
			if p_u_77.props.voiceEnabled then
				local v88 = v_u_36.participants
				local v89 = p_u_77.state.selectedPlayer.UserId
				local v90 = v88[tostring(v89)]
				if v90 then
					local v91 = v90.isMutedLocally
					local v93 = {
						["text"] = v91 and "Unmute Player" or "Mute Player",
						["icon"] = v_u_36:GetIcon(v91 and "Unmute" or "Mute", "Misc"),
						["onActivated"] = function() -- name: onActivated
							-- upvalues: (copy) p_u_77, (ref) v_u_41, (ref) v_u_36, (ref) v_u_24, (ref) v_u_7
							local v92 = p_u_77.state.selectedPlayer
							v_u_41:debug("Muting Player {}", v92.UserId)
							v_u_36:ToggleMutePlayer(v92.UserId, v_u_24.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
							p_u_77:setState({
								["selectedPlayer"] = v_u_7.None
							})
						end
					}
					table.insert(v79, v93)
				end
			end
			local v_u_94 = p_u_77.state.selectedPlayer
			local v_u_95 = v_u_37:IsPlayerBlockedByUserId(v_u_94.UserId)
			local v96 = {
				["text"] = v_u_95 and p78.unblockPlayer or p78.blockPlayer,
				["icon"] = v_u_17["icons/actions/block"],
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) v_u_95, (copy) p_u_77, (copy) v_u_94, (ref) v_u_40, (ref) v_u_7
					if v_u_95 then
						p_u_77.props.unblockPlayer(v_u_94)
					else
						v_u_40(v_u_94, nil, p_u_77.__componentName)
					end
					p_u_77:setState({
						["selectedPlayer"] = v_u_7.None
					})
				end
			}
			table.insert(v79, v96)
		end
	end
	return v79
end
function v43.renderFocusHandler(p_u_97, p98) -- name: renderFocusHandler
	-- upvalues: (copy) v_u_21, (copy) v_u_34, (copy) v_u_7, (copy) v_u_22, (copy) v_u_3
	local v99
	if v_u_21() then
		v99 = p_u_97.props.currentPage == v_u_34.MainPagePageKey and true or not p_u_97.props.isCurrentZoneActive
	else
		v99 = nil
	end
	local v100 = v_u_7.createElement
	local v101 = v_u_22
	local v102 = {}
	local v103 = p98 and (p_u_97.props.currentPage == "Players" and p_u_97.props.isMenuOpen) and not (p_u_97.props.isReportDialogOpen or p_u_97.state.selectedPlayer)
	if v103 then
		v103 = (p_u_97.state.selectedPlayerRef or p_u_97.state.firstPlayerRef) ~= nil
	end
	v102.isFocused = v103
	v102.shouldForgetPreviousSelection = v99
	v102.didFocus = v_u_21() and function(p104)
		-- upvalues: (ref) v_u_3, (copy) p_u_97
		v_u_3.SelectedCoreObject = p104 or p_u_97.state.firstPlayerRef
	end or function()
		-- upvalues: (ref) v_u_3, (copy) p_u_97
		v_u_3.SelectedCoreObject = p_u_97.state.selectedPlayerRef or p_u_97.state.firstPlayerRef
	end
	return v100(v101, v102)
end
function v43.renderWithLocalizedAndSelectionCursor(p_u_105, p106, p107) -- name: renderWithLocalizedAndSelectionCursor
	-- upvalues: (copy) v_u_42, (copy) v_u_7, (copy) v_u_26, (copy) v_u_31, (copy) v_u_36, (copy) v_u_24, (copy) v_u_15, (copy) v_u_16, (copy) v_u_30, (copy) v_u_28, (copy) v_u_1
	local v108, v109, v110
	if p_u_105.state.selectedPlayer == nil then
		v108 = {}
		v109 = 0
		v110 = 0
	else
		v108 = p_u_105:getMoreActions(p106)
		local v111 = #v108 * 56
		local v112 = p_u_105.props.screenSize.X
		local v113 = p_u_105.props.screenSize.Y
		if p_u_105.state.selectedPlayerPosition.Y + v111 + v_u_42 < v113 then
			v110 = p_u_105.state.selectedPlayerPosition.Y
		else
			v110 = v113 - v111 - v_u_42
		end
		if p_u_105.state.selectedPlayerPosition.X + 400 + 20 + 352 + 24 <= v112 then
			v109 = p_u_105.state.selectedPlayerPosition.X + 400 + 20
		else
			v109 = v112 - 352 - 24
		end
	end
	local v114 = p_u_105.props.isGamepadLastInput and not p_u_105.props.isRespawnDialogOpen
	if v114 then
		v114 = p_u_105.props.isCurrentZoneActive
	end
	local v_u_115
	if p_u_105.state.selectedPlayer then
		local v116 = {
			["moreActions"] = nil,
			["actionWidth"] = 352,
			["xOffset"] = nil,
			["yOffset"] = nil,
			["canCaptureFocus"] = nil,
			["onClose"] = nil,
			["moreActions"] = v108,
			["xOffset"] = v109,
			["yOffset"] = v110,
			["canCaptureFocus"] = v114,
			["onClose"] = function() -- name: onClose
				-- upvalues: (copy) p_u_105, (ref) v_u_7
				p_u_105:setState({
					["selectedPlayer"] = v_u_7.None
				})
			end
		}
		v_u_115 = v_u_7.createElement(v_u_26, v116) or nil
	else
		v_u_115 = nil
	end
	local v117 = v_u_7.createElement
	local v118 = v_u_31
	local v119 = {
		["pageTitle"] = p_u_105.props.pageTitle
	}
	local v120 = p_u_105.props.voiceEnabled
	if v120 then
		v120 = v_u_7.createElement("ImageButton", {
			["Size"] = UDim2.fromOffset(36, 36),
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.new(1, 4, 0.5, 0),
			["Image"] = v_u_36:GetIcon(p_u_105.state.allMuted and "UnmuteAll" or "MuteAll", "Misc"),
			[v_u_7.Event.Activated] = function()
				-- upvalues: (ref) v_u_36, (copy) p_u_105, (ref) v_u_24
				v_u_36:MuteAll(not p_u_105.state.allMuted, v_u_24.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				p_u_105:setState({
					["allMuted"] = not p_u_105.state.allMuted
				})
			end,
			["SelectionImageObject"] = p107(v_u_15.RoundedRect)
		})
	end
	v119.titleChildren = v120
	local v125 = {
		["PlayerListContent"] = v_u_16(function(_)
			return {}
		end, function(_)
			-- upvalues: (ref) v_u_7, (copy) p_u_105, (ref) v_u_30, (ref) v_u_115
			local v121 = v_u_7.createElement
			local v123 = {
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				[v_u_7.Change.AbsoluteSize] = function(p122)
					-- upvalues: (ref) p_u_105
					p_u_105:setState({
						["pageSizeY"] = p122.AbsoluteSize.Y
					})
				end
			}
			local v124 = {
				["PlayerList"] = v_u_7.createElement(v_u_30, {
					["Position"] = UDim2.new(0, 0, 0, 0),
					["Size"] = UDim2.new(1, 0, 1, 0),
					["CanvasSize"] = UDim2.new(1, 0, 0, #p_u_105.state.players * 72),
					["ScrollingEnabled"] = p_u_105.state.selectedPlayer == nil
				}, p_u_105:renderListEntries(p_u_105.state.players)),
				["MoreActionsMenu"] = v_u_115
			}
			return v121("Frame", v123, v124)
		end),
		["FocusHandler"] = p_u_105:renderFocusHandler(v114)
	}
	local v126 = {
		["desiredPage"] = "Players",
		["onNavigateTo"] = nil,
		["onNavigateAway"] = nil,
		["onNavigateTo"] = function() -- name: onNavigateTo
			-- upvalues: (copy) p_u_105, (ref) v_u_1
			p_u_105:setState({
				["players"] = v_u_1:GetPlayers()
			})
		end,
		["onNavigateAway"] = function() -- name: onNavigateAway
			-- upvalues: (copy) p_u_105, (ref) v_u_7
			p_u_105:setState({
				["selectedPlayer"] = v_u_7.None
			})
		end
	}
	v125.Watcher = v_u_7.createElement(v_u_28, v126)
	return v117(v118, v119, v125)
end
function v43.renderWithLocalized(p_u_127, p_u_128) -- name: renderWithLocalized
	-- upvalues: (copy) v_u_14
	return v_u_14(function(p129)
		-- upvalues: (copy) p_u_127, (copy) p_u_128
		return p_u_127:renderWithLocalizedAndSelectionCursor(p_u_128, p129)
	end)
end
function v43.render(p_u_130) -- name: render
	-- upvalues: (copy) v_u_19
	return v_u_19({
		["addFriend"] = "CoreScripts.InGameMenu.Actions.AddFriend",
		["acceptFriend"] = "CoreScripts.InGameMenu.Actions.AcceptFriend",
		["unfriend"] = "CoreScripts.InGameMenu.Actions.Unfriend",
		["cancelFriend"] = "CoreScripts.InGameMenu.Actions.CancelFriend",
		["viewAvatar"] = "CoreScripts.InGameMenu.Actions.ViewAvatar",
		["reportAbuse"] = "CoreScripts.InGameMenu.Actions.ReportAbuse",
		["blockPlayer"] = "CoreScripts.InGameMenu.Actions.BlockPlayer",
		["unblockPlayer"] = "CoreScripts.InGameMenu.Actions.UnblockPlayer"
	})(function(p131)
		-- upvalues: (copy) p_u_130
		return p_u_130:renderWithLocalized(p131)
	end)
end
function v43.didUpdate(p132, p133, _) -- name: didUpdate
	-- upvalues: (copy) v_u_1, (copy) v_u_7
	if p132.props.isMenuOpen and not p133.isMenuOpen then
		p132:setState({
			["players"] = v_u_1:GetPlayers(),
			["selectedPlayer"] = v_u_7.None
		})
	end
	local v134 = p132.state.selectedPlayerRef
	if v134 and p132.state.selectedPlayerPosition ~= v134.AbsolutePosition then
		p132:setState({
			["selectedPlayerPosition"] = v134.AbsolutePosition
		})
	end
end
return v10.UNSTABLE_connect2(function(p135, _)
	-- upvalues: (copy) v_u_34
	return {
		["isMenuOpen"] = p135.isMenuOpen,
		["voiceEnabled"] = p135.voiceState.voiceEnabled,
		["friends"] = p135.friends,
		["inspectMenuEnabled"] = p135.displayOptions.inspectMenuEnabled,
		["screenSize"] = p135.screenSize,
		["currentPage"] = p135.menuPage,
		["isRespawnDialogOpen"] = p135.respawn.dialogOpen,
		["isReportDialogOpen"] = p135.report.dialogOpen or p135.report.reportSentOpen,
		["isGamepadLastInput"] = p135.displayOptions.inputType == v_u_34.InputType.Gamepad,
		["isCurrentZoneActive"] = p135.currentZone == 1
	}
end, function(p_u_136)
	-- upvalues: (copy) v_u_32, (copy) v_u_38
	return {
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_136, (ref) v_u_32
			p_u_136(v_u_32)
		end,
		["unblockPlayer"] = function(p137) -- name: unblockPlayer
			-- upvalues: (copy) p_u_136, (ref) v_u_38
			return p_u_136(v_u_38(p137))
		end
	}
end)(v43)