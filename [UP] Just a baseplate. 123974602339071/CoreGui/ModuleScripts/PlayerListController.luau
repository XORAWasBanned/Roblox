-- Path: CoreGui.RobloxGui.Modules.PlayerList.PlayerListController
local v_u_1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("StarterGui")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("RobloxReplicatedStorage")
local v_u_7 = game:GetService("UserInputService")
local v_u_8 = game:GetService("ContextActionService")
local v_u_9 = UserSettings():GetService("UserGameSettings")
local v_u_10 = v_u_2:WaitForChild("RobloxGui")
local v_u_11 = require(v_u_10.Modules.TenFootInterface)
local v_u_12 = require(v_u_10.Modules.Settings.Utility)
local v_u_13 = require(v_u_1.Workspace.Packages.CachedPolicyService)
local v_u_14 = require(v_u_1.Packages.Roact)
local v_u_15 = require(v_u_1.Packages.Rodux)
local v_u_16 = require(v_u_1.Packages.RoactRodux)
local v17 = require(v_u_1.Packages.UIBlox)
local v_u_18 = require(v_u_1.Packages.Foundation).Enums.ColorMode
local v_u_19 = v17.App.Style.Constants
local v_u_20 = require(v_u_2.RobloxGui.Modules.ApolloClient)
local v_u_21 = require(v_u_1.Packages.ApolloClient).ApolloProvider
local v_u_22 = script.Parent
local v_u_23 = require(v_u_1.Packages.Signals)
local v_u_24 = require(v_u_1.Workspace.Packages.InExperienceTopBar)
local v_u_25 = require(v_u_22.Reducers.Reducer)
local v_u_26 = require(v_u_22.GlobalConfig)
local v_u_27 = require(v_u_22.PlayerListSwitcher)
local v_u_28 = require(v_u_22.Thunks.MakePlayerInfoRequests)
local v_u_29 = require(v_u_1.Workspace.Packages.PlayerList)
local v_u_30 = require(v_u_1.Workspace.Packages.PlatformLeaderboardsClient)
local v31 = require(v_u_1.Workspace.Packages.PlayerIconInfoStore)
local v_u_32 = require(v_u_1.Workspace.Packages.BlockingUtility)
local v_u_33 = v_u_29.Common.Constants
local v_u_34 = v_u_29.PlayerRelationshipStore
local v_u_35 = require(v_u_22.Actions.SetPlayerListEnabled)
local v_u_36 = require(v_u_22.Actions.SetPlayerListVisibility)
local v_u_37 = require(v_u_22.Actions.SetTempHideKey)
local v_u_38 = require(v_u_22.Actions.SetTenFootInterface)
local v_u_39 = require(v_u_22.Actions.SetSmallTouchDevice)
local v_u_40 = require(v_u_22.Actions.SetIsUsingGamepad)
local v_u_41 = require(v_u_22.Actions.SetMinimized)
local v_u_42 = require(v_u_22.Actions.SetSubjectToChinaPolicies)
local v_u_43 = require(v_u_22.Actions.SetSettings)
if not v_u_5.LocalPlayer then
	v_u_5:GetPropertyChangedSignal("LocalPlayer"):Wait()
end
local v_u_44 = v_u_29.Flags.FFlagAddNewPlayerListFocusNav
local v_u_45 = require(v_u_22.Flags.FStringPlayerListOverrideType)
local v_u_46 = require(v_u_1.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local v_u_47 = require(v_u_1.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local v_u_48 = require(v_u_1.Workspace.Packages.SharedFlags).FFlagLuaSupportMicroGamepadPreferredInput
local v49 = v_u_29.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_50 = v_u_29.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_51 = v_u_29.Flags.FFlagEnableMobilePlayerListOnGamepad
local v_u_52 = v_u_29.Common.isReskinConsoleMobileRoute
local v_u_53 = v_u_29.Flags.FFlagPlayerListUseMobileOnSmallDisplay
local v_u_54 = v_u_29.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local v_u_55 = require(v_u_1.Workspace.Packages.SharedFlags).FFlagPlatformLeaderboardPersistStoreOnRemount
local v_u_56 = v_u_29.Flags.FFlagPlayerListReskin
local v_u_57 = require(v_u_22.Flags.FFlagPlayerListPersistVisibility)
local v_u_58 = v_u_29.Container.PlayerListContainer
local v_u_59 = v_u_29.LeaderboardStoreInstanceManager
local v_u_60 = v_u_29.PlayerListVisibilityStore
local v_u_61 = v_u_29.PlayerContextualMenuStore
local v_u_62 = v31.PlayerIconInfoStore
local v_u_63 = v_u_24.Flags.FFlagTopBarSignalizeSetCores
local function v_u_65(p_u_64) -- name: setupSettings
	-- upvalues: (copy) v_u_43, (copy) v_u_9
	p_u_64:dispatch(v_u_43({
		["reducedMotion"] = v_u_9.ReducedMotion,
		["preferredTransparency"] = v_u_9.PreferredTransparency
	}))
	v_u_9:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
		-- upvalues: (copy) p_u_64, (ref) v_u_43, (ref) v_u_9
		p_u_64:dispatch(v_u_43({
			["reducedMotion"] = v_u_9.ReducedMotion,
			["preferredTransparency"] = v_u_9.PreferredTransparency
		}))
	end)
	v_u_9:GetPropertyChangedSignal("ReducedMotion"):Connect(function()
		-- upvalues: (copy) p_u_64, (ref) v_u_43, (ref) v_u_9
		p_u_64:dispatch(v_u_43({
			["reducedMotion"] = v_u_9.ReducedMotion,
			["preferredTransparency"] = v_u_9.PreferredTransparency
		}))
	end)
end
local v_u_66 = {}
v_u_66.__index = v_u_66
function v_u_66.new() -- name: new
	-- upvalues: (copy) v_u_66, (copy) v_u_56, (copy) v_u_26, (copy) v_u_14, (copy) v_u_15, (copy) v_u_25, (copy) v_u_65, (copy) v_u_4, (copy) v_u_35, (copy) v_u_39, (copy) v_u_7, (copy) v_u_53, (copy) v_u_3, (copy) v_u_12, (copy) v_u_52, (copy) v_u_48, (copy) v_u_50, (copy) v_u_45, (copy) v_u_38, (copy) v_u_11, (copy) v_u_42, (copy) v_u_13, (copy) v_u_18, (copy) v_u_19, (copy) v_u_16, (copy) v_u_27, (copy) v_u_21, (copy) v_u_20, (copy) v_u_40, (copy) v_u_59, (copy) v_u_46, (copy) v_u_62, (copy) v_u_58, (copy) v_u_10, (copy) v_u_2, (copy) v_u_44, (copy) v_u_63, (copy) v_u_23, (copy) v_u_24
	local v67 = v_u_66
	local v_u_68 = setmetatable({}, v67)
	if v_u_56 then
		return v_u_68:_setupReskin()
	end
	if v_u_26.propValidation then
		v_u_14.setGlobalConfig({
			["propValidation"] = true
		})
	end
	if v_u_26.elementTracing then
		v_u_14.setGlobalConfig({
			["elementTracing"] = true
		})
	end
	v_u_68.layerCollectorRef = v_u_14.createRef()
	v_u_68.store = v_u_15.Store.new(v_u_25, nil, { v_u_15.thunkMiddleware })
	v_u_65(v_u_68.store)
	if not v_u_4:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
		v_u_68.store:dispatch(v_u_35(false))
	end
	coroutine.wrap(function()
		-- upvalues: (copy) v_u_68, (ref) v_u_39, (ref) v_u_7, (ref) v_u_53, (ref) v_u_3, (ref) v_u_12, (ref) v_u_52, (ref) v_u_48, (ref) v_u_50, (ref) v_u_45
		local v69 = v_u_68.store
		local v70 = v_u_39
		local v71 = v_u_7.PreferredInput
		local v72 = v_u_53
		if v72 then
			v72 = v_u_3.ViewportDisplaySize == Enum.DisplaySize.Small
		end
		local v73 = v_u_12:IsSmallTouchScreen()
		if v73 then
			v69:dispatch(v70(v73))
			return
		else
			if v_u_52({
				["displaySize"] = v_u_3.ViewportDisplaySize,
				["preferredInput"] = v71
			}) then
				v73 = true
			elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
				local v74 = v71 ~= Enum.PreferredInput.Touch and v71 ~= Enum.PreferredInput.Gamepad and v_u_48
				if v74 then
					v74 = v71 == Enum.PreferredInput.MicroGamepad
				end
				if v74 then
					v73 = v_u_50
				else
					v73 = false
				end
			else
				v73 = false
			end
			if v73 then
				v69:dispatch(v70(v73))
			else
				if v72 then
					v73 = v71 ~= Enum.PreferredInput.Touch and v71 ~= Enum.PreferredInput.Gamepad and v_u_48
					if v73 then
						v73 = v71 == Enum.PreferredInput.MicroGamepad
					end
					if v73 then
						v69:dispatch(v70(v73))
						return
					end
					v73 = v_u_45 == "mobile"
				else
					v73 = v_u_45 == "mobile"
				end
				v69:dispatch(v70(v73))
			end
		end
	end)()
	local v75 = v_u_68.store
	local v76 = v_u_38
	local v77 = v_u_7.PreferredInput
	local v78
	if v_u_52({
		["displaySize"] = v_u_3.ViewportDisplaySize,
		["preferredInput"] = v77
	}) or v_u_50 then
		v78 = false
	else
		v78 = v_u_11:IsEnabled()
	end
	v75:dispatch(v76(v78))
	coroutine.wrap(function()
		-- upvalues: (copy) v_u_68, (ref) v_u_42, (ref) v_u_13
		v_u_68.store:dispatch(v_u_42(v_u_13:IsSubjectToChinaPolicies()))
	end)()
	v_u_68:_trackEnabled()
	local v79 = {
		["themeName"] = v_u_18.Dark,
		["fontName"] = v_u_19.FontName.Gotham
	}
	v_u_68.root = v_u_14.createElement(v_u_16.StoreProvider, {
		["store"] = v_u_68.store
	}, {
		["Switcher"] = v_u_14.createElement(v_u_27, {
			["appStyleForUiModeStyleProvider"] = v79,
			["setLayerCollectorEnabled"] = function(p80) -- name: setLayerCollectorEnabled
				-- upvalues: (copy) v_u_68
				if v_u_68.layerCollectorRef.current then
					v_u_68.layerCollectorRef.current.Enabled = p80
				end
			end
		})
	})
	v_u_68.root = v_u_14.createElement(v_u_21, {
		["client"] = v_u_20
	}, {
		["StoreProvider"] = v_u_68.root
	})
	function v_u_68._setIsUsingGamepad()
		-- upvalues: (ref) v_u_7, (copy) v_u_68, (ref) v_u_40
		local v81 = v_u_7:GetLastInputType()
		if v81 then
			v81 = v81.Name:find("Gamepad")
		end
		v_u_68.store:dispatch(v_u_40(v81 ~= nil))
	end
	function v_u_68._mountLeaderboardStore()
		-- upvalues: (ref) v_u_59
		v_u_59.createLeaderboardStoreInstance()
	end
	function v_u_68._unmountLeaderboardStore()
		-- upvalues: (ref) v_u_59
		v_u_59.cleanUpInstance()
	end
	v_u_68._unmountPlayerIconInfoStore = v_u_46 and function()
		-- upvalues: (ref) v_u_62
		v_u_62.cleanUp()
	end or nil
	v_u_68._mountLeaderboardStore()
	v_u_68._setIsUsingGamepad()
	local v82 = v_u_14.createElement
	local v83 = v_u_58
	local v84 = {
		["leaderboardStore"] = v_u_59.getLeaderboardStoreInstance,
		["TopBarConstants"] = require(v_u_10.Modules.TopBar.Constants)
	}
	local v85 = v_u_7.PreferredInput
	local v86
	if v_u_52({
		["displaySize"] = v_u_3.ViewportDisplaySize,
		["preferredInput"] = v85
	}) or v_u_50 then
		v86 = false
	else
		v86 = v_u_11:IsEnabled()
	end
	v84.isTenFoot = v86
	v_u_68.root = v82(v83, v84, {
		["PlayerListRoot"] = v_u_68.root
	})
	v_u_68.root = v_u_14.createElement("ScreenGui", {
		["AutoLocalize"] = false,
		["IgnoreGuiInset"] = true,
		["DisplayOrder"] = 1,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		[v_u_14.Ref] = v_u_68.layerCollectorRef
	}, {
		["PlayerListRoot"] = v_u_68.root
	})
	v_u_68.element = v_u_14.mount(v_u_68.root, v_u_2, "PlayerList")
	v_u_68.topBarEnabled = true
	v_u_68.mounted = true
	v_u_68.coreGuiEnabled = v_u_4:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	v_u_68:_updateMounted()
	v_u_68.SetVisibleChangedEvent = Instance.new("BindableEvent")
	if v_u_44 then
		v_u_68.VisibilityChangedEvent = Instance.new("BindableEvent")
	end
	if v_u_63 then
		v_u_68.disposeEffect = v_u_23.createEffect(function(p87)
			-- upvalues: (ref) v_u_24, (copy) v_u_68
			local v88 = v_u_24.Stores.GetTopBarStore
			if v88 then
				v_u_68:SetTopBarEnabled(v88(p87).getTopBarCoreGuiEnabled(p87))
			end
		end)
	end
	v_u_68.store.changed:connect(function(p89, p90)
		-- upvalues: (copy) v_u_68, (ref) v_u_44
		if p89.displayOptions.setVisible ~= p90.displayOptions.setVisible then
			v_u_68.SetVisibleChangedEvent:Fire(p89.displayOptions.setVisible)
		end
		if v_u_44 and p89.displayOptions.isVisible ~= p90.displayOptions.isVisible then
			v_u_68.VisibilityChangedEvent:Fire(p89.displayOptions.isVisible)
		end
	end)
	return v_u_68
end
function v_u_66._updateMounted(p91) -- name: _updateMounted
	-- upvalues: (copy) v_u_7, (copy) v_u_52, (copy) v_u_3, (copy) v_u_50, (copy) v_u_11, (copy) v_u_14, (copy) v_u_2
	local v92 = v_u_7.PreferredInput
	local v93
	if v_u_52({
		["displaySize"] = v_u_3.ViewportDisplaySize,
		["preferredInput"] = v92
	}) or v_u_50 then
		v93 = false
	else
		v93 = v_u_11:IsEnabled()
	end
	if not v93 then
		local v94 = p91.coreGuiEnabled
		if v94 then
			v94 = p91.topBarEnabled
		end
		if v94 and not p91.mounted then
			p91._mountLeaderboardStore()
			p91._setIsUsingGamepad()
			p91.element = v_u_14.mount(p91.root, v_u_2, "PlayerList")
			p91.mounted = true
			return
		end
		if not v94 and p91.mounted then
			v_u_14.unmount(p91.element)
			p91._unmountLeaderboardStore()
			if p91._unmountPlayerIconInfoStore then
				p91._unmountPlayerIconInfoStore()
			end
			p91.mounted = false
			if p91.inspector then
				p91.inspector:destroy()
				p91.inspector = nil
			end
		end
	end
end
function v_u_66._trackEnabled(p_u_95) -- name: _trackEnabled
	-- upvalues: (copy) v_u_4, (copy) v_u_35, (copy) v_u_54, (copy) v_u_3, (copy) v_u_33
	v_u_4.CoreGuiChangedSignal:Connect(function(p96, p97)
		-- upvalues: (copy) p_u_95, (ref) v_u_35, (ref) v_u_54, (ref) v_u_3, (ref) v_u_33
		if p96 == Enum.CoreGuiType.All or p96 == Enum.CoreGuiType.PlayerList then
			p_u_95.coreGuiEnabled = p97
			p_u_95:_updateMounted()
			p_u_95.store:dispatch(v_u_35(p97))
			if v_u_54 and not p97 then
				v_u_3:SetMenuIsOpen(false, v_u_33.PLAYER_LIST_MENU)
			end
		end
	end)
end
if v49 then
	function v_u_66.GetIsModal(p98) -- name: GetIsModal
		-- upvalues: (copy) v_u_56, (copy) v_u_7, (copy) v_u_53, (copy) v_u_3, (copy) v_u_12, (copy) v_u_52, (copy) v_u_48, (copy) v_u_50, (copy) v_u_45
		if not v_u_56 then
			return p98.store:getState().displayOptions.isSmallTouchDevice
		end
		local v99 = v_u_7.PreferredInput
		local v100 = v_u_53
		if v100 then
			v100 = v_u_3.ViewportDisplaySize == Enum.DisplaySize.Small
		end
		local v101 = v_u_12:IsSmallTouchScreen()
		if v101 then
			return v101
		end
		if v_u_52({
			["displaySize"] = v_u_3.ViewportDisplaySize,
			["preferredInput"] = v99
		}) then
			v101 = true
		elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
			local v102 = v99 ~= Enum.PreferredInput.Touch and v99 ~= Enum.PreferredInput.Gamepad and v_u_48
			if v102 then
				v102 = v99 == Enum.PreferredInput.MicroGamepad
			end
			if v102 then
				v101 = v_u_50
			else
				v101 = false
			end
		else
			v101 = false
		end
		if v101 then
			return v101
		end
		if v100 then
			v101 = v99 ~= Enum.PreferredInput.Touch and (v99 ~= Enum.PreferredInput.Gamepad and v_u_48)
			if v101 then
				v101 = v99 == Enum.PreferredInput.MicroGamepad
			end
			if v101 then
				return v101
			end
			v101 = v_u_45 == "mobile"
		else
			v101 = v_u_45 == "mobile"
		end
		return v101
	end
end
function v_u_66._setupReskin(p_u_103) -- name: _setupReskin
	-- upvalues: (copy) v_u_1, (copy) v_u_10, (copy) v_u_29, (copy) v_u_22, (copy) v_u_7, (copy) v_u_52, (copy) v_u_3, (copy) v_u_50, (copy) v_u_11, (copy) v_u_53, (copy) v_u_12, (copy) v_u_48, (copy) v_u_45, (copy) v_u_61, (copy) v_u_60, (copy) v_u_55, (copy) v_u_30, (copy) v_u_57, (copy) v_u_23, (copy) v_u_33, (copy) v_u_9, (copy) v_u_58, (copy) v_u_59, (copy) v_u_5, (copy) v_u_34, (copy) v_u_28, (copy) v_u_62, (copy) v_u_32, (copy) v_u_47, (copy) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_51, (copy) v_u_8, (copy) v_u_63, (copy) v_u_24
	-- control flow flattened: this region could not be structured without a goto (unsupported in Luau), so it was lowered to the state-machine dispatch loop below to keep the output runnable.
	local v_u_104, v_u_105, v_u_106, v_u_107, v_u_108, v109, v110, v_u_111, v_u_112, v_u_113, v_u_114, v_u_115, v116, v_u_117, v_u_118, v119, v_u_120, v_u_121, v_u_122, v_u_123, v124, v_u_125, v_u_126, v127, v128, v_u_129, v130, v_u_131, v_u_132, v_u_133, v_u_134, v_u_135, v_u_136, v_u_137, v_u_138, v_u_139, v_u_140, v_u_141, v142, v_u_143
	local v144 = 16
	while true do
		if v144 == 1 then
			if v_u_135 then
				v144 = 13
			else
				v144 = 12
			end
		elseif v144 == 2 then
			if v_u_135 then
				v144 = 4
			else
				v144 = 12
			end
		elseif v144 == 3 then
			if v_u_135 then
				v144 = 14
			else
				v144 = 12
			end
		elseif v144 == 4 then
			v_u_118 = v_u_108.Console
			v144 = 15
		elseif v144 == 5 then
			v_u_126 = v_u_45 == "mobile"
			v144 = 1
		elseif v144 == 6 then
			if v_u_52({
				["displaySize"] = v_u_3.ViewportDisplaySize,
				["preferredInput"] = v110
			}) then
				v_u_126 = true
			elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
				v119 = v110 ~= Enum.PreferredInput.Touch and v110 ~= Enum.PreferredInput.Gamepad and v_u_48
				if v119 then
					v119 = v110 == Enum.PreferredInput.MicroGamepad
				end
				if v119 then
					v_u_126 = v_u_50
				else
					v_u_126 = false
				end
			else
				v_u_126 = false
			end
			if v_u_126 then
				v144 = 3
			else
				v144 = 9
			end
		elseif v144 == 7 then
			if v_u_135 then
				v144 = 8
			else
				v144 = 12
			end
		elseif v144 == 8 then
			v_u_118 = v_u_108.Console
			v144 = 15
		elseif v144 == 9 then
			if v124 then
				v144 = 10
			else
				v144 = 5
			end
		elseif v144 == 10 then
			v_u_126 = v110 ~= Enum.PreferredInput.Touch and v110 ~= Enum.PreferredInput.Gamepad and v_u_48
			if v_u_126 then
				v_u_126 = v110 == Enum.PreferredInput.MicroGamepad
			end
			if v_u_126 then
				v144 = 2
			else
				v144 = 11
			end
		elseif v144 == 11 then
			v_u_126 = v_u_45 == "mobile"
			v144 = 1
		elseif v144 == 12 then
			if v_u_52({
				["displaySize"] = v_u_3.ViewportDisplaySize,
				["preferredInput"] = v110
			}) then
				v127 = true
			elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
				v128 = v110 ~= Enum.PreferredInput.Touch and v110 ~= Enum.PreferredInput.Gamepad and v_u_48
				if v128 then
					v128 = v110 == Enum.PreferredInput.MicroGamepad
				end
				if v128 then
					v127 = v_u_50
				else
					v127 = false
				end
			else
				v127 = false
			end
			if v127 then
				v_u_118 = v_u_108.Console
			else
				v_u_118 = v_u_108.Unknown
			end
			v144 = 15
		elseif v144 == 13 then
			v_u_118 = v_u_108.Console
			v144 = 15
		elseif v144 == 14 then
			v_u_118 = v_u_108.Console
			v144 = 15
		elseif v144 == 15 then
			v_u_105 = function() -- name: restoreVisibilityOnDismiss
				-- upvalues: (ref) v_u_61, (ref) v_u_60
				if not v_u_61.takeSuppressNextDismissRestore() then
					v_u_60.setVisible(true)
				end
			end
			if v_u_126 then
				v_u_61.setOnDismiss(v_u_105)
			end
			v_u_61.setContextMenuOpener(function(p_u_145, p_u_146, p_u_147, p_u_148)
				-- upvalues: (copy) v_u_123, (ref) v_u_61, (ref) v_u_126
				task.spawn(function()
					-- upvalues: (ref) v_u_123, (copy) p_u_145, (ref) v_u_61, (ref) v_u_126, (copy) p_u_148, (copy) p_u_146, (copy) p_u_147
					local v149 = v_u_123.buildMenuData(p_u_145, v_u_61.closeContextMenu, v_u_126, p_u_148)
					if p_u_145.Parent ~= nil then
						v149.anchorPosition = p_u_146
						v_u_61.setMenuDataIfCurrent(v149, p_u_147)
					end
				end)
			end)
			v_u_129 = require(v_u_22.PlayerListInitialVisibleState)
			v_u_60.reset()
			if v_u_55 then
				v_u_30.reset()
			end
			v130 = v_u_60.setShouldPersistVisibility
			v116 = v_u_57
			if v116 then
				v116 = not v_u_126
				if v116 then
					v116 = not v_u_135
				end
			end
			v130(v116)
			v_u_60.setVisible(v_u_129())
			p_u_103.SetVisibleChangedEvent = Instance.new("BindableEvent")
			p_u_103.VisibilityChangedEvent = Instance.new("BindableEvent")
			v_u_137 = function() -- name: setupVisibilityEffect
				-- upvalues: (copy) p_u_103, (ref) v_u_23, (ref) v_u_60
				local v_u_150 = false
				p_u_103._reskinSetVisibleEffect = v_u_23.createEffect(function(p151)
					-- upvalues: (ref) v_u_60, (ref) v_u_150, (ref) p_u_103
					local v152 = v_u_60.getVisible(p151)
					if v_u_150 then
						p_u_103.SetVisibleChangedEvent:Fire(v152)
					else
						v_u_150 = true
					end
				end)
				local v_u_153 = false
				p_u_103._reskinVisibilityEffect = v_u_23.createEffect(function(p154)
					-- upvalues: (ref) v_u_60, (ref) v_u_153, (ref) p_u_103
					local v155 = v_u_60.getEffectiveVisible(p154)
					if v_u_153 then
						p_u_103.VisibilityChangedEvent:Fire(v155)
					else
						v_u_153 = true
					end
				end)
			end
			v_u_125 = v_u_107.TopBarHeight
			v_u_117 = function() -- name: computeMobilePosition
				-- upvalues: (copy) v_u_125, (ref) v_u_33, (copy) v_u_107
				local v156 = UDim2.new
				local v157 = v_u_125
				local v158 = v_u_33.MOBILE_EDGE_GAP
				local v159 = v_u_107.ApplyDisplayScale
				return v156(0.5, 0, 0, v157 + math.max(v158, v159(v158)))
			end
			v_u_104, v_u_138 = v_u_132.createBinding(v_u_117())
			v_u_139 = function() -- name: resolveContainerProps
				-- upvalues: (ref) v_u_126, (copy) v_u_104, (copy) v_u_107, (copy) v_u_125
				if v_u_126 then
					return {
						["AnchorPoint"] = nil,
						["Position"] = nil,
						["Size"] = nil,
						["tag"] = "auto-xy",
						["AnchorPoint"] = Vector2.new(0.5, 0),
						["Position"] = v_u_104,
						["Size"] = UDim2.fromOffset(0, 0)
					}
				end
				local v160 = v_u_107.ApplyDisplayScale
				local v161 = math.max(4, v160(4))
				return {
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["tag"] = "auto-xy",
					["AnchorPoint"] = Vector2.new(1, 0),
					["Position"] = UDim2.new(1, -v161, 0, v161 + v_u_125),
					["Size"] = UDim2.fromOffset(0, 0)
				}
			end
			v_u_106 = function() -- name: buildReskinElement
				-- upvalues: (copy) v_u_132, (copy) v_u_114, (copy) v_u_115, (ref) v_u_118, (ref) v_u_9, (copy) v_u_134, (ref) v_u_126, (copy) v_u_133, (copy) v_u_139, (ref) v_u_58, (ref) v_u_59, (copy) v_u_107, (copy) v_u_135, (copy) v_u_121, (copy) v_u_143, (copy) v_u_122
				local v162 = v_u_132.createElement
				local v163 = v_u_114
				local v164 = {
					["colorMode"] = v_u_115.Dark,
					["device"] = v_u_118,
					["preferences"] = {
						["preferredTransparency"] = v_u_9.PreferredTransparency
					}
				}
				local v165 = {}
				local v166 = {
					["isSmallTouchDevice"] = v_u_126
				}
				v165.Scrim = v_u_132.createElement(v_u_134, v166)
				local v167 = v_u_132.createElement
				local v168 = v_u_133.View
				local v169 = v_u_139()
				local v170 = {}
				local v171 = v_u_132.createElement
				local v172 = v_u_58
				local v173 = {
					["leaderboardStore"] = v_u_59.getLeaderboardStoreInstance,
					["TopBarConstants"] = v_u_107,
					["isTenFoot"] = v_u_135
				}
				local v174 = {}
				local v175 = {
					["isSmallTouchDevice"] = v_u_126,
					["title"] = v_u_143
				}
				v174.PlayerListPanel = v_u_132.createElement(v_u_121, v175)
				v170.ReskinContainer = v171(v172, v173, v174)
				v165.Container = v167(v168, v169, v170)
				local v176 = {
					["isSmallTouchDevice"] = v_u_126
				}
				v165.ContextMenu = v_u_132.createElement(v_u_122, v176)
				return v162(v163, v164, v165)
			end
			v_u_140 = function() -- name: setupPlayerInfoRequests
				-- upvalues: (ref) v_u_5, (ref) v_u_34, (ref) v_u_28, (copy) p_u_103, (ref) v_u_62, (ref) v_u_61, (ref) v_u_32, (ref) v_u_47, (ref) v_u_6
				local v_u_178 = {
					["getState"] = function() -- name: getState
						-- upvalues: (ref) v_u_5
						return {
							["players"] = v_u_5:GetPlayers()
						}
					end,
					["dispatch"] = function(_, p177) -- name: dispatch
						-- upvalues: (ref) v_u_34
						if type(p177) == "table" then
							if p177.type == "SetPlayerIsBlocked" and p177.userId then
								v_u_34.patchPlayerRelationship(p177.userId, {
									["isBlocked"] = p177.isBlocked
								})
							elseif p177.type == "SetPlayerFriendStatus" and p177.userId then
								v_u_34.patchPlayerRelationship(p177.userId, {
									["friendStatus"] = p177.friendStatus
								})
							end
						else
							return
						end
					end
				}
				local function v180(p179) -- name: request
					-- upvalues: (ref) v_u_28, (copy) v_u_178
					v_u_28(p179)(v_u_178)
				end
				for _, v181 in ipairs(v_u_5:GetPlayers()) do
					v_u_28(v181)(v_u_178)
				end
				p_u_103._reskinPlayerAddedConn = v_u_5.PlayerAdded:Connect(v180)
				p_u_103._reskinPlayerRemovingConn = v_u_5.PlayerRemoving:Connect(function(p182)
					-- upvalues: (ref) v_u_62, (ref) v_u_34
					v_u_62.removePlayer(p182.UserId)
					v_u_34.removePlayer(p182.UserId)
				end)
				p_u_103._reskinBlockedStatusConn = v_u_32:GetBlockedStatusChangedEvent():Connect(function(p183, p184)
					-- upvalues: (ref) v_u_34
					local v185 = tonumber(p183)
					if v185 then
						v_u_34.patchPlayerRelationship(v185, {
							["isBlocked"] = p184
						})
					end
				end)
				p_u_103._reskinFriendStatusConn = v_u_5.LocalPlayer.FriendStatusChanged:Connect(function(p186, p187)
					-- upvalues: (ref) v_u_34, (ref) v_u_61
					v_u_34.patchPlayerRelationship(p186.UserId, {
						["friendStatus"] = p187
					})
					local v188 = v_u_61.getMenuData(false)
					if v188 ~= nil and v188.player == p186 then
						v_u_61.openContextMenu(p186, v188.anchorPosition, p187)
					end
				end)
				if v_u_47 then
					task.spawn(function()
						-- upvalues: (ref) v_u_6, (ref) p_u_103, (ref) v_u_5, (ref) v_u_28, (copy) v_u_178
						p_u_103._reskinProfileSettingsConn = v_u_6:WaitForChild("SendPlayerProfileSettings", (1 / 0)).OnClientEvent:Connect(function(p189)
							-- upvalues: (ref) v_u_5, (ref) v_u_28, (ref) v_u_178
							local v190 = v_u_5:GetPlayerByUserId((tonumber(p189)))
							if v190 then
								v_u_28(v190)(v_u_178)
							end
						end)
					end)
				end
			end
			v_u_111 = function() -- name: teardownPlayerInfoRequests
				-- upvalues: (copy) p_u_103, (ref) v_u_34
				if p_u_103._reskinPlayerAddedConn then
					p_u_103._reskinPlayerAddedConn:Disconnect()
					p_u_103._reskinPlayerAddedConn = nil
				end
				if p_u_103._reskinPlayerRemovingConn then
					p_u_103._reskinPlayerRemovingConn:Disconnect()
					p_u_103._reskinPlayerRemovingConn = nil
				end
				if p_u_103._reskinBlockedStatusConn then
					p_u_103._reskinBlockedStatusConn:Disconnect()
					p_u_103._reskinBlockedStatusConn = nil
				end
				if p_u_103._reskinFriendStatusConn then
					p_u_103._reskinFriendStatusConn:Disconnect()
					p_u_103._reskinFriendStatusConn = nil
				end
				if p_u_103._reskinProfileSettingsConn then
					p_u_103._reskinProfileSettingsConn:Disconnect()
					p_u_103._reskinProfileSettingsConn = nil
				end
				v_u_34.cleanUp()
			end
			v_u_112 = function() -- name: mountReskin
				-- upvalues: (ref) v_u_60, (ref) v_u_57, (ref) v_u_126, (copy) v_u_135, (ref) v_u_2, (copy) v_u_113, (copy) v_u_106, (copy) p_u_103, (copy) v_u_138, (copy) v_u_117, (copy) v_u_140
				local v191 = v_u_60.setShouldPersistVisibility
				local v192 = v_u_57 and not v_u_126
				if v192 then
					v192 = not v_u_135
				end
				v191(v192)
				local v193 = Instance.new("ScreenGui")
				v193.Name = "PlayerListReskin"
				v193.AutoLocalize = false
				v193.IgnoreGuiInset = true
				v193.DisplayOrder = _G.__TESTEZ_RUNNING_TEST__ == true and -1 or 1
				v193.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				v193.Parent = v_u_2
				local v194 = v_u_113.createRoot(v193)
				v194:render(v_u_106())
				p_u_103._reskinRoot = v194
				p_u_103._reskinScreenGui = v193
				if v_u_126 then
					local function v_u_196(p195) -- name: connectViewport
						-- upvalues: (ref) p_u_103, (ref) v_u_138, (ref) v_u_117
						if p_u_103._reskinViewportConn then
							p_u_103._reskinViewportConn:Disconnect()
							p_u_103._reskinViewportConn = nil
						end
						if p195 then
							p_u_103._reskinViewportConn = p195:GetPropertyChangedSignal("ViewportSize"):Connect(function()
								-- upvalues: (ref) v_u_138, (ref) v_u_117
								v_u_138(v_u_117())
							end)
							v_u_138(v_u_117())
						end
					end
					p_u_103._reskinCameraConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
						-- upvalues: (copy) v_u_196
						v_u_196(workspace.CurrentCamera)
					end)
					v_u_196(workspace.CurrentCamera)
				end
				v_u_140()
			end
			v_u_131 = function() -- name: unmountReskin
				-- upvalues: (ref) v_u_60, (copy) v_u_111, (copy) p_u_103
				v_u_60.setShouldPersistVisibility(false)
				v_u_111()
				if p_u_103._reskinCameraConn then
					p_u_103._reskinCameraConn:Disconnect()
					p_u_103._reskinCameraConn = nil
				end
				if p_u_103._reskinViewportConn then
					p_u_103._reskinViewportConn:Disconnect()
					p_u_103._reskinViewportConn = nil
				end
				if p_u_103._reskinRoot then
					p_u_103._reskinRoot:unmount()
					p_u_103._reskinRoot = nil
				end
				if p_u_103._reskinScreenGui then
					p_u_103._reskinScreenGui:Destroy()
					p_u_103._reskinScreenGui = nil
				end
				if p_u_103._reskinVisibilityEffect then
					p_u_103._reskinVisibilityEffect()
					p_u_103._reskinVisibilityEffect = nil
				end
				if p_u_103._reskinSetVisibleEffect then
					p_u_103._reskinSetVisibleEffect()
					p_u_103._reskinSetVisibleEffect = nil
				end
			end
			p_u_103.topBarEnabled = true
			p_u_103.coreGuiEnabled = v_u_4:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
			p_u_103._reskin = {
				["mountReskin"] = v_u_112,
				["unmountReskin"] = v_u_131,
				["setupVisibilityEffect"] = v_u_137
			}
			if p_u_103.coreGuiEnabled then
				v_u_59.createLeaderboardStoreInstance()
				v_u_137()
				v_u_112()
				p_u_103.mounted = true
			else
				p_u_103.mounted = false
			end
			if v_u_51 then
				v_u_136 = function(p197) -- name: onPreferredInputChanged
					-- upvalues: (ref) v_u_53, (ref) v_u_3, (ref) v_u_12, (ref) v_u_52, (ref) v_u_48, (ref) v_u_50, (ref) v_u_45, (ref) v_u_126, (ref) v_u_61, (ref) v_u_118, (copy) v_u_108, (copy) v_u_105, (copy) p_u_103, (copy) v_u_131, (copy) v_u_137, (copy) v_u_112, (ref) v_u_60, (ref) v_u_57, (copy) v_u_135, (copy) v_u_129
					local v198 = v_u_53
					if v198 then
						v198 = v_u_3.ViewportDisplaySize == Enum.DisplaySize.Small
					end
					local v199 = v_u_12:IsSmallTouchScreen()
					local v200, v201, v202, v203, v204, v205, v206, v207
					if v199 then
						if v199 ~= v_u_126 then
							if v_u_61.getMenuData(false) ~= nil then
								v_u_61.closeContextMenu()
							end
							v_u_126 = v199
							if v_u_52({
								["displaySize"] = v_u_3.ViewportDisplaySize,
								["preferredInput"] = p197
							}) then
								v200 = true
							elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
								v201 = p197 ~= Enum.PreferredInput.Touch and p197 ~= Enum.PreferredInput.Gamepad and v_u_48
								if v201 then
									v201 = p197 == Enum.PreferredInput.MicroGamepad
								end
								if v201 then
									v200 = v_u_50
								else
									v200 = false
								end
							else
								v200 = false
							end
							if v200 then
								v202 = v_u_108.Console
							else
								v202 = v_u_108.Unknown
							end
							v_u_118 = v202
							v203 = v_u_61.setOnDismiss
							if v_u_126 then
								v204 = v_u_105
							else
								v204 = nil
							end
							v203(v204)
							if p_u_103.mounted then
								v_u_131()
								v_u_137()
								v_u_112()
							end
							v205 = v_u_60.setShouldPersistVisibility
							v206 = v_u_57 and not v_u_126
							if v206 then
								v206 = not v_u_135
							end
							v205(v206)
							v207 = v_u_129(p197)
							v_u_60.setVisible(v207)
							v_u_60.setTempHideSnapshot(v207)
						end
					else
						if v_u_52({
							["displaySize"] = v_u_3.ViewportDisplaySize,
							["preferredInput"] = p197
						}) then
							v199 = true
						elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
							local v208 = p197 ~= Enum.PreferredInput.Touch and p197 ~= Enum.PreferredInput.Gamepad and v_u_48
							if v208 then
								v208 = p197 == Enum.PreferredInput.MicroGamepad
							end
							if v208 then
								v199 = v_u_50
							else
								v199 = false
							end
						else
							v199 = false
						end
						if v199 then
							if v199 ~= v_u_126 then
								if v_u_61.getMenuData(false) ~= nil then
									v_u_61.closeContextMenu()
								end
								v_u_126 = v199
								if v_u_52({
									["displaySize"] = v_u_3.ViewportDisplaySize,
									["preferredInput"] = p197
								}) then
									v200 = true
								elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
									v201 = p197 ~= Enum.PreferredInput.Touch and p197 ~= Enum.PreferredInput.Gamepad and v_u_48
									if v201 then
										v201 = p197 == Enum.PreferredInput.MicroGamepad
									end
									if v201 then
										v200 = v_u_50
									else
										v200 = false
									end
								else
									v200 = false
								end
								if v200 then
									v202 = v_u_108.Console
								else
									v202 = v_u_108.Unknown
								end
								v_u_118 = v202
								v203 = v_u_61.setOnDismiss
								if v_u_126 then
									v204 = v_u_105
								else
									v204 = nil
								end
								v203(v204)
								if p_u_103.mounted then
									v_u_131()
									v_u_137()
									v_u_112()
								end
								v205 = v_u_60.setShouldPersistVisibility
								v206 = v_u_57 and not v_u_126
								if v206 then
									v206 = not v_u_135
								end
								v205(v206)
								v207 = v_u_129(p197)
								v_u_60.setVisible(v207)
								v_u_60.setTempHideSnapshot(v207)
							end
						else
							if v198 then
								v199 = p197 ~= Enum.PreferredInput.Touch and p197 ~= Enum.PreferredInput.Gamepad and v_u_48
								if v199 then
									v199 = p197 == Enum.PreferredInput.MicroGamepad
								end
								if v199 then
									if v199 ~= v_u_126 then
										if v_u_61.getMenuData(false) ~= nil then
											v_u_61.closeContextMenu()
										end
										v_u_126 = v199
										if v_u_52({
											["displaySize"] = v_u_3.ViewportDisplaySize,
											["preferredInput"] = p197
										}) then
											v200 = true
										elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
											v201 = p197 ~= Enum.PreferredInput.Touch and p197 ~= Enum.PreferredInput.Gamepad and v_u_48
											if v201 then
												v201 = p197 == Enum.PreferredInput.MicroGamepad
											end
											if v201 then
												v200 = v_u_50
											else
												v200 = false
											end
										else
											v200 = false
										end
										if v200 then
											v202 = v_u_108.Console
										else
											v202 = v_u_108.Unknown
										end
										v_u_118 = v202
										v203 = v_u_61.setOnDismiss
										if v_u_126 then
											v204 = v_u_105
										else
											v204 = nil
										end
										v203(v204)
										if p_u_103.mounted then
											v_u_131()
											v_u_137()
											v_u_112()
										end
										v205 = v_u_60.setShouldPersistVisibility
										v206 = v_u_57 and not v_u_126
										if v206 then
											v206 = not v_u_135
										end
										v205(v206)
										v207 = v_u_129(p197)
										v_u_60.setVisible(v207)
										v_u_60.setTempHideSnapshot(v207)
									end
								end
								v199 = v_u_45 == "mobile"
							else
								v199 = v_u_45 == "mobile"
							end
							if v199 ~= v_u_126 then
								if v_u_61.getMenuData(false) ~= nil then
									v_u_61.closeContextMenu()
								end
								v_u_126 = v199
								if v_u_52({
									["displaySize"] = v_u_3.ViewportDisplaySize,
									["preferredInput"] = p197
								}) then
									v200 = true
								elseif v_u_3.ViewportDisplaySize == Enum.DisplaySize.Large then
									v201 = p197 ~= Enum.PreferredInput.Touch and p197 ~= Enum.PreferredInput.Gamepad and v_u_48
									if v201 then
										v201 = p197 == Enum.PreferredInput.MicroGamepad
									end
									if v201 then
										v200 = v_u_50
									else
										v200 = false
									end
								else
									v200 = false
								end
								if v200 then
									v202 = v_u_108.Console
								else
									v202 = v_u_108.Unknown
								end
								v_u_118 = v202
								v203 = v_u_61.setOnDismiss
								if v_u_126 then
									v204 = v_u_105
								else
									v204 = nil
								end
								v203(v204)
								if p_u_103.mounted then
									v_u_131()
									v_u_137()
									v_u_112()
								end
								v205 = v_u_60.setShouldPersistVisibility
								v206 = v_u_57 and not v_u_126
								if v206 then
									v206 = not v_u_135
								end
								v205(v206)
								v207 = v_u_129(p197)
								v_u_60.setVisible(v207)
								v_u_60.setTempHideSnapshot(v207)
							end
						end
					end
				end
				p_u_103._onPreferredInputChanged = v_u_136
				p_u_103._reskinPreferredInputConn = v_u_7:GetPropertyChangedSignal("PreferredInput"):Connect(function()
					-- upvalues: (copy) v_u_136, (ref) v_u_7
					v_u_136(v_u_7.PreferredInput)
				end)
			end
			p_u_103._reskinCoreGuiConn = v_u_4.CoreGuiChangedSignal:Connect(function(p209, p210)
				-- upvalues: (copy) p_u_103
				if p209 == Enum.CoreGuiType.All or p209 == Enum.CoreGuiType.PlayerList then
					p_u_103.coreGuiEnabled = p210
					p_u_103:SetTopBarEnabled(p_u_103.topBarEnabled)
				end
			end)
			v_u_8:BindCoreAction("RbxPlayerListToggle", function(_, p211, _)
				-- upvalues: (copy) p_u_103, (ref) v_u_126, (ref) v_u_3
				if not p_u_103.mounted then
					return Enum.ContextActionResult.Pass
				end
				if v_u_126 then
					return Enum.ContextActionResult.Pass
				end
				if v_u_3.MenuIsOpen then
					return Enum.ContextActionResult.Pass
				end
				if p211 ~= Enum.UserInputState.Begin then
					return Enum.ContextActionResult.Pass
				end
				p_u_103:SetVisibility(not p_u_103:GetVisibility())
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.Tab)
			if v_u_63 then
				p_u_103._reskinTopBarEffect = v_u_23.createEffect(function(p212)
					-- upvalues: (ref) v_u_24, (copy) p_u_103
					local v213 = v_u_24.Stores.GetTopBarStore
					if v213 then
						p_u_103:SetTopBarEnabled(v213(p212).getTopBarCoreGuiEnabled(p212))
					end
				end)
			end
			return p_u_103
		else
			v_u_132 = require(v_u_1.Packages.React)
			v_u_113 = require(v_u_1.Packages.ReactRoblox)
			v_u_107 = require(v_u_10.Modules.TopBar.Constants)
			v_u_133 = require(v_u_1.Packages.Foundation)
			v_u_114 = v_u_133.FoundationProvider
			v_u_115 = v_u_133.Enums.ColorMode
			v_u_108 = v_u_133.Enums.Device
			v_u_120 = require(v_u_1.Workspace.Packages.RobloxTranslator)
			v_u_121 = v_u_29.Presentation.PlayerListPanel
			v_u_122 = v_u_29.Presentation.PlayerContextualMenuView
			v_u_134 = v_u_29.Presentation.LeaderboardScrim
			v_u_123 = require(v_u_22.ContextMenuController)
			v_u_141 = "InGame.PlayerList.Leaderboard"
			v109, v142 = pcall(function()
				-- upvalues: (copy) v_u_120, (copy) v_u_141
				return v_u_120:FormatByKey(v_u_141)
			end)
			v_u_143 = (not v109 or (not v142 or v142 == "")) and "Leaderboard" or v142
			v110 = v_u_7.PreferredInput
			if v_u_52({
				["displaySize"] = v_u_3.ViewportDisplaySize,
				["preferredInput"] = v110
			}) or v_u_50 then
				v_u_135 = false
			else
				v_u_135 = v_u_11:IsEnabled()
			end
			v124 = v_u_53
			if v124 then
				v124 = v_u_3.ViewportDisplaySize == Enum.DisplaySize.Small
			end
			v_u_126 = v_u_12:IsSmallTouchScreen()
			if v_u_126 then
				v144 = 7
			else
				v144 = 6
			end
		end
	end
end
function v_u_66.GetVisibility(p214) -- name: GetVisibility
	-- upvalues: (copy) v_u_56, (copy) v_u_60
	if v_u_56 then
		return v_u_60.getEffectiveVisible(false)
	else
		return p214.store:getState().displayOptions.isVisible
	end
end
if v_u_44 then
	function v_u_66.GetVisibilityChangedEvent(p215) -- name: GetVisibilityChangedEvent
		return p215.VisibilityChangedEvent
	end
end
function v_u_66.GetSetVisible(p216) -- name: GetSetVisible
	-- upvalues: (copy) v_u_56, (copy) v_u_60
	if v_u_56 then
		return v_u_60.getVisible(false)
	else
		return p216.store:getState().displayOptions.setVisible
	end
end
function v_u_66.GetSetVisibleChangedEvent(p217) -- name: GetSetVisibleChangedEvent
	return p217.SetVisibleChangedEvent
end
function v_u_66.SetVisibility(p218, p219) -- name: SetVisibility
	-- upvalues: (copy) v_u_56, (copy) v_u_61, (copy) v_u_60, (copy) v_u_36
	if v_u_56 then
		if not p219 then
			v_u_61.closeContextMenu()
		end
		v_u_60.setVisible(p219)
	else
		p218.store:dispatch(v_u_36(p219))
	end
end
function v_u_66.HideTemp(p220, p221, p222) -- name: HideTemp
	-- upvalues: (copy) v_u_56, (copy) v_u_61, (copy) v_u_60, (copy) v_u_37
	if v_u_56 then
		if p222 and v_u_61.getMenuData(false) ~= nil then
			v_u_61.closeContextMenu()
		end
		v_u_60.setTempHide(p221, p222)
	else
		if p222 == false then
			p222 = nil
		end
		p220.store:dispatch(v_u_37(p221, p222))
	end
end
function v_u_66.SetTopBarEnabled(p223, p224) -- name: SetTopBarEnabled
	-- upvalues: (copy) v_u_56, (copy) v_u_59
	if v_u_56 then
		p223.topBarEnabled = p224
		local v225 = p223.coreGuiEnabled and p224
		if v225 and not p223.mounted then
			v_u_59.createLeaderboardStoreInstance()
			p223._reskin.setupVisibilityEffect()
			p223._reskin.mountReskin()
			p223.mounted = true
		elseif not v225 and p223.mounted then
			p223._reskin.unmountReskin()
			v_u_59.cleanUpInstance()
			p223.mounted = false
		end
	else
		p223.topBarEnabled = p224
		p223:_updateMounted()
		return
	end
end
function v_u_66.SetMinimized(p226, p227) -- name: SetMinimized
	-- upvalues: (copy) v_u_56, (copy) v_u_41
	if not v_u_56 then
		p226.store:dispatch(v_u_41(p227))
	end
end
return v_u_66