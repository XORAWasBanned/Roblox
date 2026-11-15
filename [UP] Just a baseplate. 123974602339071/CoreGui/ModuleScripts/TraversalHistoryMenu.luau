-- Path: CoreGui.RobloxGui.Modules.Settings.Components.Traversal.TraversalHistoryMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v4 = require(v1.Packages.Foundation)
local v_u_5 = require(v1.Packages.React)
local v_u_6 = require(v1.Packages.SignalsReact)
local v7 = require(v1.Workspace.Packages.CoreScriptsCommon)
local v8 = require(v1.Workspace.Packages.CoreScriptsRoactCommon)
local v9 = require(v1.Workspace.Packages.Responsive)
local v_u_10 = require(script.Parent.TraversalLeaveConfirmation)
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.EnumReactPage)
local v_u_13 = require(v11.ReactPageSignal)
local v_u_14 = require(v11.Utility)
local v_u_15 = v4.View
local v_u_16 = v4.Enums.ThumbnailType
local v_u_17 = v4.Enums.ThumbnailSize
local v_u_18 = v4.Utility.getRbxThumb
local v_u_19 = v7.SettingsShowSignal
local v20 = v8.Traversal
local v_u_21 = v20.LocalTraversalHistory.default
local v_u_22 = v9.GetInputModeStore
local v_u_23 = v9.Input
local v_u_24 = v20.Constants
local v_u_25 = v20.HistoryMenu
local v_u_26 = v20.useHistoryItems
local v_u_27 = v4.Hooks.useTokens
local v_u_28 = require(v11.Flags.FFlagAddTraversalHistoryReactMenuButtons)
local function v_u_33(p29) -- name: historyToMenuItems
	-- upvalues: (copy) v_u_18, (copy) v_u_16, (copy) v_u_17
	local v30 = {}
	for _, v31 in p29 do
		local v32 = {
			["universeId"] = v31.universeId,
			["text"] = v31.name,
			["icon"] = v_u_18(v_u_16.GameIcon, v31.universeId, v_u_17.Small)
		}
		table.insert(v30, v32)
	end
	return v30
end
return v_u_5.memo(v_u_5.forwardRef(function(p_u_34, _) -- name: TraversalHistoryMenu
	-- upvalues: (copy) v_u_5, (copy) v_u_28, (copy) v_u_26, (copy) v_u_33, (copy) v_u_24, (copy) v_u_27, (copy) v_u_6, (copy) v_u_13, (copy) v_u_19, (copy) v_u_2, (copy) v_u_3, (copy) v_u_22, (copy) v_u_23, (copy) v_u_14, (copy) v_u_12, (copy) v_u_21, (copy) v_u_15, (copy) v_u_25, (copy) v_u_10
	local v_u_35 = v_u_5.useRef(p_u_34.anchorParent)
	if v_u_28 and p_u_34.anchorRef then
		v_u_35 = p_u_34.anchorRef
	end
	local v_u_36 = v_u_26()
	local v37 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_33, (copy) v_u_36
		return v_u_33(v_u_36)
	end, { v_u_36 })
	local v_u_38
	if p_u_34.idleButtonStateIsDown == nil then
		v_u_38 = v_u_24.DEFAULT_CHEVRON_BUTTON_STATE
	else
		v_u_38 = p_u_34.idleButtonStateIsDown
	end
	local v_u_39, v_u_40 = v_u_5.useBinding(Enum.SelectionBehavior.Stop)
	local v44 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_38, (copy) v_u_39
		local v41 = {}
		local v42
		if v_u_38 then
			v42 = v_u_39
		else
			v42 = Enum.SelectionBehavior.Stop
		end
		v41.SelectionBehaviorUp = v42
		local v43
		if v_u_38 then
			v43 = Enum.SelectionBehavior.Stop
		else
			v43 = v_u_39
		end
		v41.SelectionBehaviorDown = v43
		return v41
	end, { v_u_38 })
	local v_u_45 = v_u_27()
	local v46, v_u_47 = v_u_5.useState(v_u_24.NO_UNIVERSE_ID)
	local v_u_48 = v_u_6.useSignalState(v_u_13)
	local v53 = v_u_5.useCallback(function(p_u_49)
		-- upvalues: (ref) v_u_19, (ref) v_u_28, (copy) p_u_34, (ref) v_u_2
		local v51 = {
			["onSettingsVisible"] = v_u_19:connect(function(p50)
				-- upvalues: (copy) p_u_49
				if not p50 then
					p_u_49()
				end
			end)
		}
		local v52
		if v_u_28 and not p_u_34.currentPageChangeSignal then
			v52 = nil
		else
			v52 = p_u_34.currentPageChangeSignal:connect(function()
				-- upvalues: (copy) p_u_49
				p_u_49()
			end)
		end
		v51.onPageChanged = v52
		v51.onNativeClose = v_u_2.NativeClose:Connect(function()
			-- upvalues: (copy) p_u_49
			p_u_49()
		end)
		return v51
	end, { p_u_34.currentPageChangeSignal, v_u_19, v_u_2.NativeClose })
	local v55 = v_u_5.useCallback(function(p54)
		-- upvalues: (copy) v_u_47, (copy) v_u_40
		v_u_47(p54)
		v_u_40(Enum.SelectionBehavior.Stop)
	end, { v_u_47 })
	local v59 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_47, (ref) v_u_24, (ref) v_u_3, (ref) v_u_22, (ref) v_u_23, (ref) v_u_35, (ref) v_u_2
		v_u_47(v_u_24.NO_UNIVERSE_ID)
		local v56 = v_u_3:GetLastInputType()
		local v57 = v_u_22().getLastInputType()
		local v58
		if v57 == v_u_23.Directional then
			v58 = true
		elseif v57 == v_u_23.Pointer then
			v58 = v56 == Enum.UserInputType.Keyboard
		else
			v58 = false
		end
		if v58 and v_u_35.current then
			v_u_2.SelectedCoreObject = v_u_35.current
		end
	end, {})
	local v61 = v_u_5.useCallback(function(p60)
		-- upvalues: (copy) v_u_40
		if p60 then
			v_u_40(Enum.SelectionBehavior.Escape)
		else
			v_u_40(Enum.SelectionBehavior.Stop)
		end
	end, {})
	local v62 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_28, (copy) p_u_34, (copy) v_u_45
		return not (v_u_28 and p_u_34.isDarkOnDarkMode) and {
			["Color3"] = nil,
			["Transparency"] = 0.33,
			["Color3"] = v_u_45.Color.Stroke.Default.Color3
		} or v_u_45.Color.Surface.Surface_0
	end, {})
	local v_u_63 = v_u_14:IsSmallTouchScreen()
	local v64 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_63
		return {
			["padding-small"] = v_u_63,
			["padding-medium"] = not v_u_63
		}
	end, { v_u_63 })
	local v65 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_48, (ref) v_u_12, (copy) v_u_40
		v_u_48.setCurrentReactPage(v_u_12.TraversalHistory)
		v_u_40(Enum.SelectionBehavior.Stop)
	end, { v_u_48 })
	local v66 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_21
		return #v_u_21:getUniverseHistory() > 0
	end, {})
	if v66 then
		local v67 = v_u_5.createElement
		local v68 = v_u_15
		local v69 = {
			["tag"] = "auto-xy row align-y-center size-0-full",
			["selectionGroup"] = nil,
			["ref"] = nil,
			["selectionGroup"] = v44
		}
		local v70
		if v_u_28 and not (p_u_34.anchorRef or p_u_34.anchorParent) then
			v70 = v_u_35
		else
			v70 = nil
		end
		v69.ref = v70
		local v71 = {
			["DividerLeft"] = v_u_5.createElement(v_u_15, {
				["Size"] = UDim2.new(0, v_u_45.Stroke.Thick, 1, 0),
				["backgroundStyle"] = v62
			}),
			["HistoryMenu"] = v_u_5.createElement(v_u_25, {
				["historyButtonTags"] = v64,
				["historyItems"] = v37,
				["onHistorySelected"] = v65,
				["onMenuItemSelected"] = v55,
				["onMenuToggled"] = v61,
				["closeMenuConn"] = v53,
				["menuSide"] = p_u_34.menuSide,
				["ref"] = v_u_35
			})
		}
		local v72 = {
			["Dialog"] = v_u_5.createElement(v_u_10, {
				["isDialogOpen"] = nil,
				["onCancel"] = nil,
				["onClose"] = nil,
				["universeId"] = nil,
				["source"] = "history_dropdown",
				["isDialogOpen"] = v_u_24.NO_UNIVERSE_ID < v46,
				["onCancel"] = v59,
				["onClose"] = v59,
				["universeId"] = v46
			})
		}
		v66 = v67(v68, v69, v71, v72)
	end
	return v66
end))