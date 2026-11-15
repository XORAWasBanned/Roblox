-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.InspectAndBuy
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("ContextActionService")
local v_u_6 = game:GetService("GuiService")
local v_u_7 = game:GetService("MarketplaceService")
local v_u_8 = game:GetService("Players")
local v_u_9 = require(v2.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_10 = require(v2.Packages.Roact)
local v_u_11 = require(v2.Packages.Rodux)
local v_u_12 = require(v2.Packages.RoactRodux)
local v13 = require(v2.Workspace.Packages.AppCommonLib).Symbol
local v_u_14 = require(v1.RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_15 = require(v2.Packages.UIBlox).App.SelectionImage.SelectionCursorProvider
local v_u_16 = require(v2.Workspace.Packages.IxpUtils)
local v_u_17 = game:DefineFastString("AXInspectAndBuyLayerName", "Experience.Menu")
local v_u_18 = game:DefineFastFlag("AXEnableInspectAndBuyExposureLogging", false)
local v19 = v1:WaitForChild("RobloxGui")
local v20 = require(v2.Workspace.Packages.FocusNavigationUtils)
local v_u_21 = v20.FocusNavigableSurfaceIdentifierEnum
local v_u_22 = v20.FocusRoot
local v_u_23 = require(v2.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v24 = v19.Modules.Chrome
local v_u_25 = require(v2.Workspace.Packages.Chrome).Enabled
local v_u_26
if v_u_25() then
	v_u_26 = require(v24.Service)
else
	v_u_26 = nil
end
local v_u_27 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v28 = script.Parent.Parent
local v_u_29 = require(v28.Actions.SetDetailsInformation)
local v_u_30 = require(v28.Actions.SetTryingOnInfo)
local v_u_31 = require(v28.Thunk)
local v_u_32 = require(v28.Services.Network)
local v_u_33 = require(v28.Services.Analytics)
local v_u_34 = require(v28.Reducers.InspectAndBuyReducer)
local v_u_35 = require(v28.Components.Container)
local v_u_36 = require(v28.Components.InspectAndBuyBaseContainer)
local v_u_37 = require(v28.Constants)
local v_u_38 = require(v28.CompactView)
local v_u_39 = require(v28.WideView)
local v_u_40 = require(v28.WideLandscapeView)
local v_u_41 = require(v28.Actions.SetGamepadEnabled)
local v_u_42 = require(v28.Actions.SetView)
local v_u_43 = require(v28.Actions.SetPlayerId)
local v_u_44 = require(v28.Actions.SetPlayerName)
local v_u_45 = require(v28.Actions.SetLocale)
local v_u_46 = require(v28.Actions.SetItemBeingPurchased)
local v_u_47 = require(v28.Actions.SetIsSubjectToChinaPolicies)
local v_u_48 = require(v28.Actions.UpdateStoreId)
local v_u_49
if require(v28.Flags.FFlagAXEnableFetchAvatarPreview) then
	v_u_49 = require(v28.Thunks.GetAssetsFromHumanoidDescriptionV2)
else
	v_u_49 = require(v28.Thunks.GetAssetsFromHumanoidDescription)
end
local v_u_50 = require(v28.Thunks.UpdateOwnedStatus)
local v_u_51 = require(v28.Thunks.ReportPurchaseSuccessUnifiedEvent)
local v_u_52 = require(v28.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)
local v_u_53 = require(v28.Thunks.GetCharacterModelFromUserId)
local v_u_54 = require(v28.Thunks.GetPlayerName)
local v_u_55 = require(v28.Components.InspectAndBuyContext)
local v_u_56 = require(v28.Actions.CloseOverlay)
local v57 = require(v2.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v_u_58 = v57.Utils.getViewType
local v_u_59 = v57.Enums.InspectAndBuyVersion
local v60 = require(v2.Workspace.Packages.AvatarExperienceFlags)
local v_u_61 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableInspectAndBuyV2RootFlag
local v_u_62 = require(v28.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics)
local v_u_63 = v60.FFlagAXEnableInspectAndBuyFocusNavigation
local v_u_64 = v60.FFlagAXInspectAndBuyAvatarBackground
local v_u_65 = require(v2.Workspace.Packages.CachedPolicyService)
local v_u_66 = require(v28.Flags.FFlagAXEnableNewInspectAndBuyContainer)
local v_u_67 = v13.named("OverrideCursorInspectMenu")
local v68 = v_u_10.PureComponent:extend("InspectAndBuy")
function v68.pushMouseIconOverride(_) -- name: pushMouseIconOverride
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_67
	if v_u_4:GetLastInputType().Name:find("Gamepad") then
		v_u_9.push(v_u_67, Enum.OverrideMouseIconBehavior.ForceHide)
	else
		v_u_9.push(v_u_67, Enum.OverrideMouseIconBehavior.ForceShow)
	end
end
function v68.popMouseIconOverride(_) -- name: popMouseIconOverride
	-- upvalues: (copy) v_u_9, (copy) v_u_67
	v_u_9.pop(v_u_67)
end
function v68.configureInputType(p69, p70) -- name: configureInputType
	-- upvalues: (copy) v_u_4, (copy) v_u_41
	if (p70 or v_u_4:GetLastInputType()).Name:find("Gamepad") then
		p69.state.store:dispatch(v_u_41(true))
	else
		p69.state.store:dispatch(v_u_41(false))
	end
end
function v68.updateView(p71) -- name: updateView
	-- upvalues: (copy) v_u_66, (copy) v_u_42, (copy) v_u_58, (copy) v_u_37
	local v72 = workspace.CurrentCamera.ViewportSize
	if v_u_66 then
		p71.state.store:dispatch(v_u_42(v_u_58(v72)))
	else
		local v73 = v_u_37.View.Wide
		if v72.X < 600 then
			v73 = v_u_37.View.Compact
		elseif v72.X > v72.Y and v72.X < 800 then
			v73 = v_u_37.View.WideLandscape
		end
		p71.state.store:dispatch(v_u_42(v73))
	end
end
function v68.init(p_u_74) -- name: init
	-- upvalues: (copy) v_u_32, (copy) v_u_62, (copy) v_u_33, (copy) v_u_61, (copy) v_u_59, (copy) v_u_11, (copy) v_u_34, (copy) v_u_31, (copy) v_u_37, (copy) v_u_38, (copy) v_u_39, (copy) v_u_40, (copy) v_u_48, (copy) v_u_44, (copy) v_u_45, (copy) v_u_3, (copy) v_u_43, (copy) v_u_49, (copy) v_u_52, (copy) v_u_51, (copy) v_u_50, (copy) v_u_46
	local v75 = p_u_74.props.playerId
	local v76 = p_u_74.props.playerName
	local v77 = p_u_74.props.ctx
	p_u_74.connections = {}
	p_u_74.network = p_u_74.props.network or v_u_32.new()
	local v78
	if v_u_62 then
		local v79 = v_u_33.new
		local v80
		if v_u_61 then
			v80 = v_u_59.Version2
		else
			v80 = v_u_59.Version1
		end
		v78 = v79(v75, v77, v80)
	else
		v78 = v_u_33.new(v75, v77)
	end
	p_u_74.analytics = v78
	p_u_74.humanoidDescription = p_u_74.props.humanoidDescription
	p_u_74.analytics.reportOpenInspectMenu()
	p_u_74.state = {
		["store"] = v_u_11.Store.new(v_u_34, {}, { v_u_31.middleware({
				[v_u_32] = p_u_74.network,
				[v_u_33] = p_u_74.analytics
			}) }),
		["views"] = {
			[v_u_37.View.Compact] = v_u_38,
			[v_u_37.View.Wide] = v_u_39,
			[v_u_37.View.WideLandscape] = v_u_40
		}
	}
	p_u_74.state.store:dispatch(v_u_48())
	p_u_74.state.store:dispatch(v_u_44(v76))
	p_u_74.state.store:dispatch(v_u_45(v_u_3.RobloxLocaleId))
	if v75 then
		p_u_74.state.store:dispatch(v_u_43(v75))
	end
	if p_u_74.humanoidDescription then
		p_u_74.state.store:dispatch(v_u_49(p_u_74.humanoidDescription, false))
	end
	function p_u_74.onPromptPurchaseFinished(_, p81, p82)
		-- upvalues: (copy) p_u_74, (ref) v_u_37, (ref) v_u_52, (ref) v_u_51, (ref) v_u_50, (ref) v_u_46
		local v83 = p_u_74.state.store:getState().itemBeingPurchased
		p_u_74.analytics.sendCounter(v_u_37.Counters.PurchaseFinished)
		if p82 and tostring(p81) == v83.itemId then
			if v_u_52 then
				p_u_74.state.store:dispatch(v_u_51(v83.itemId, v83.itemType, v83.resalePrice))
			else
				p_u_74.analytics.reportPurchaseSuccess(v83.itemType, v83.itemId)
			end
			p_u_74.state.store:dispatch(v_u_50(v83.itemId, v83.itemType))
			if v83.itemType == v_u_37.ItemType.Asset then
				p_u_74.analytics.sendCounter(v_u_37.Counters.PurchaseSucceededAsset)
			elseif v83.itemType == v_u_37.ItemType.Bundle then
				p_u_74.analytics.sendCounter(v_u_37.Counters.PurchaseSucceededBundle)
			else
				p_u_74.analytics.sendCounter(v_u_37.Counters.PurchaseSucceededOther)
			end
		end
		p_u_74.state.store:dispatch(v_u_46(nil, nil))
	end
end
function v68.didMount(p_u_84) -- name: didMount
	-- upvalues: (copy) v_u_18, (copy) v_u_16, (copy) v_u_17, (copy) v_u_27, (copy) v_u_25, (copy) v_u_26, (copy) v_u_4, (copy) v_u_3, (copy) v_u_45, (copy) v_u_6, (copy) v_u_65, (copy) v_u_47, (copy) v_u_7, (copy) v_u_8, (copy) v_u_53, (copy) v_u_49, (copy) v_u_64, (copy) v_u_54
	local v85 = p_u_84.props.playerId
	p_u_84.isMounted = true
	p_u_84:updateView()
	p_u_84:bindButtonB()
	p_u_84:configureInputType()
	p_u_84:pushMouseIconOverride()
	if v_u_18 then
		v_u_16.logLayerExposure(v_u_17)
	end
	if v_u_27 and v_u_25() then
		v_u_26:setHideShortcutBar("InspectAndBuy", true)
	end
	local v87 = v_u_4.LastInputTypeChanged:Connect(function(p86)
		-- upvalues: (copy) p_u_84
		p_u_84:configureInputType(p86)
	end)
	local v88 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		-- upvalues: (copy) p_u_84
		p_u_84:updateView()
	end)
	local v89 = v_u_3:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
		-- upvalues: (copy) p_u_84, (ref) v_u_45, (ref) v_u_3
		p_u_84.state.store:dispatch(v_u_45(v_u_3.RobloxLocaleId))
	end)
	local v90 = v_u_6.MenuOpened:Connect(function()
		-- upvalues: (copy) p_u_84, (ref) v_u_6
		p_u_84:popMouseIconOverride()
		v_u_6.SelectedCoreObject = nil
	end)
	local v91 = v_u_6.MenuClosed:Connect(function()
		-- upvalues: (copy) p_u_84
		p_u_84:pushMouseIconOverride()
	end)
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_65, (copy) p_u_84, (ref) v_u_47
		local v92 = v_u_65:IsSubjectToChinaPolicies()
		p_u_84.state.store:dispatch(v_u_47(v92))
	end)()
	local v93 = v_u_7.PromptPurchaseFinished:Connect(p_u_84.onPromptPurchaseFinished)
	local v94 = v_u_7.PromptBundlePurchaseFinished:Connect(p_u_84.onPromptPurchaseFinished)
	local v97 = p_u_84.state.store.changed:connect(function(p95, p96)
		-- upvalues: (copy) p_u_84
		p_u_84:update(p95, p96)
	end)
	local v98 = p_u_84.connections
	table.insert(v98, v88)
	local v99 = p_u_84.connections
	table.insert(v99, v89)
	local v100 = p_u_84.connections
	table.insert(v100, v90)
	local v101 = p_u_84.connections
	table.insert(v101, v91)
	local v102 = p_u_84.connections
	table.insert(v102, v87)
	local v103 = p_u_84.connections
	table.insert(v103, v93)
	local v104 = p_u_84.connections
	table.insert(v104, v94)
	local v105 = p_u_84.connections
	table.insert(v105, v97)
	local v106 = v_u_8.LocalPlayer.UserId
	p_u_84.state.store:dispatch(v_u_53(v106, true, function(p107)
		-- upvalues: (copy) p_u_84, (ref) v_u_49
		if p_u_84 and p_u_84.isMounted then
			p_u_84.localPlayerModel = p107
			local v108 = p107.Humanoid.HumanoidDescription
			if v108 then
				p_u_84.state.store:dispatch(v_u_49(v108, true))
			end
			p_u_84:setState({
				["obtainedLocalPlayerModel"] = true
			})
		end
	end))
	if v85 then
		p_u_84.state.store:dispatch(v_u_53(v85, false, function(p109)
			-- upvalues: (copy) p_u_84, (ref) v_u_64, (ref) v_u_49
			if p_u_84 and p_u_84.isMounted then
				p_u_84.playerModel = p109
				local v110 = p_u_84.playerModel.Humanoid.HumanoidDescription
				if v110 then
					local v111 = v_u_64 and function()
						-- upvalues: (ref) p_u_84
						return p_u_84.isMounted
					end or nil
					p_u_84.state.store:dispatch(v_u_49(v110, false, v111))
				end
				p_u_84:setState({
					["obtainedPlayerModel"] = true
				})
			end
		end))
		p_u_84.state.store:dispatch(v_u_54(v85))
	end
end
function v68.update(p112, p113, p114) -- name: update
	-- upvalues: (copy) v_u_5
	if p113.visible or not p114.visible then
		if p113.visible and not p114.visible then
			p112:bindButtonB()
		end
	else
		v_u_5:UnbindCoreAction("BackButtonInspectMenu")
	end
end
function v68.willUnmount(p115) -- name: willUnmount
	-- upvalues: (copy) v_u_5, (copy) v_u_27, (copy) v_u_25, (copy) v_u_26
	p115.isMounted = false
	for _, v116 in pairs(p115.connections) do
		v116:disconnect()
	end
	v_u_5:UnbindCoreAction("BackButtonInspectMenu")
	p115:popMouseIconOverride()
	if v_u_27 and v_u_25() then
		v_u_26:setHideShortcutBar("InspectAndBuy", false)
	end
end
function v68.render(p117) -- name: render
	-- upvalues: (copy) v_u_66, (copy) v_u_10, (copy) v_u_23, (copy) v_u_63, (copy) v_u_12, (copy) v_u_36, (copy) v_u_64, (copy) v_u_22, (copy) v_u_21, (copy) v_u_55, (copy) v_u_14, (copy) v_u_15, (copy) v_u_35
	local v118 = p117.localPlayerModel
	if v_u_66 then
		local v119 = v_u_10.createElement
		local v120 = "Folder"
		local v121 = {
			["Name"] = "InspectAndBuyApp"
		}
		local v122 = {}
		local v123 = v_u_10.createElement
		local v124 = v_u_23
		local v125 = {}
		local v126
		if v_u_63 then
			v126 = {}
			local v127 = v_u_10.createElement
			local v128 = v_u_12.StoreProvider
			local v129 = {
				["store"] = p117.state.store
			}
			local v130 = {}
			local v131 = v_u_10.createElement
			local v132 = v_u_36
			local v133 = {
				["localPlayerModel"] = v118,
				["analytics"] = p117.analytics
			}
			local v134
			if v_u_64 then
				v134 = p117.props.playerId
			else
				v134 = nil
			end
			v133.playerId = v134
			v130.Container = v131(v132, v133)
			v126.StoreProvider = v127(v128, v129, v130)
		else
			v126 = {}
			local v135 = v_u_10.createElement
			local v136 = v_u_22
			local v137 = {
				["surfaceIdentifier"] = v_u_21.CentralOverlay
			}
			local v138 = {}
			local v139 = v_u_10.createElement
			local v140 = v_u_12.StoreProvider
			local v141 = {
				["store"] = p117.state.store
			}
			local v142 = {}
			local v143 = v_u_10.createElement
			local v144 = v_u_36
			local v145 = {
				["localPlayerModel"] = v118,
				["analytics"] = p117.analytics
			}
			local v146
			if v_u_64 then
				v146 = p117.props.playerId
			else
				v146 = nil
			end
			v145.playerId = v146
			v142.Container = v143(v144, v145)
			v138.StoreProvider = v139(v140, v141, v142)
			v126.FocusNavigationWrapper = v135(v136, v137, v138)
		end
		v122.CoreScriptsRootProvider = v123(v124, v125, v126)
		return v119(v120, v121, v122)
	end
	local v147 = v_u_10.createElement
	local v148 = v_u_55.Provider
	local v149 = {
		["value"] = p117.state.views
	}
	local v150 = {}
	local v151 = v_u_10.createElement
	local v152 = v_u_12.StoreProvider
	local v153 = {
		["store"] = p117.state.store
	}
	local v154 = {}
	local v155 = v_u_14
	local v156 = {
		["CursorProvider"] = v_u_10.createElement(v_u_15, {}, {
			["Container"] = v_u_10.createElement(v_u_35, {
				["localPlayerModel"] = v118
			})
		})
	}
	v154.ThemeProvider = v155(v156)
	v150.StoreProvider = v151(v152, v153, v154)
	return v147(v148, v149, v150)
end
function v68.bindButtonB(p_u_157) -- name: bindButtonB
	-- upvalues: (copy) v_u_5, (copy) v_u_56, (copy) v_u_29, (copy) v_u_30, (copy) v_u_6
	v_u_5:BindCoreAction("BackButtonInspectMenu", function(_, p158, p159)
		-- upvalues: (copy) p_u_157, (ref) v_u_56, (ref) v_u_29, (ref) v_u_30, (ref) v_u_6
		if p158 == Enum.UserInputState.End and p159.KeyCode == Enum.KeyCode.ButtonB then
			local v160 = p_u_157.state.store:getState()
			local v161 = v160.detailsInformation.viewingDetails
			if v160.overlay and v160.overlay.overlay ~= nil then
				p_u_157.state.store:dispatch(v_u_56())
			elseif v161 then
				p_u_157.state.store:dispatch(v_u_29(false, nil))
				p_u_157.state.store:dispatch(v_u_30(false, nil))
			else
				v_u_6:CloseInspectMenu()
			end
		elseif p158 == Enum.UserInputState.Begin and p159.KeyCode == Enum.KeyCode.Escape or p159.KeyCode == Enum.KeyCode.ButtonStart then
			v_u_6:CloseInspectMenu()
			return Enum.ContextActionResult.Pass
		end
		return Enum.ContextActionResult.Sink
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape, Enum.KeyCode.ButtonStart)
end
return v68