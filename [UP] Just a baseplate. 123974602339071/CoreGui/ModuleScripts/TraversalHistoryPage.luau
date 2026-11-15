-- Path: CoreGui.RobloxGui.Modules.Settings.Components.Traversal.TraversalHistoryPage
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v1.Packages.Cryo)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = require(v1.Packages.React)
local v_u_7 = require(v1.Packages.SignalsReact)
local v8 = require(v1.Workspace.Packages.CoreScriptsRoactCommon)
local v9 = require(v1.Workspace.Packages.Responsive)
local v10 = require(v1.Workspace.Packages.SharedFlags)
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.ReactPageSignal)
local v_u_13 = require(script.Parent.TraversalLeaveConfirmation)
local v_u_14 = v5.Utility.getRbxThumb
local v_u_15 = v5.Enums.ThumbnailSize
local v_u_16 = v5.Enums.ThumbnailType
local v_u_17 = v5.View
local v18 = v8.Traversal
local v_u_19 = v18.LocalTraversalHistory.default
local v_u_20 = v9.GetInputModeStore
local v_u_21 = v9.Input
local v_u_22 = v18.Constants
local v_u_23 = v18.HistoryPage
local v_u_24 = v18.useHistoryItems
local v_u_25 = v18.Flags.FIntMaximumTraversalHistoryItemsFetch
local v_u_26 = v18.Flags.FFlagTraversalExpPagePaddingFixes
local v_u_27 = v10.FFlagIntegrateTraversalHistoryInSideSheet
return v_u_6.memo(v_u_6.forwardRef(function(_, p28) -- name: TraversalHistoryPage
	-- upvalues: (copy) v_u_6, (copy) v_u_25, (copy) v_u_24, (copy) v_u_22, (copy) v_u_7, (copy) v_u_12, (copy) v_u_3, (copy) v_u_20, (copy) v_u_21, (copy) v_u_2, (copy) v_u_4, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (copy) v_u_19, (copy) v_u_17, (copy) v_u_27, (copy) v_u_26, (copy) v_u_23, (copy) v_u_13
	local v_u_29 = v_u_6.useRef(nil)
	v_u_6.useImperativeHandle(p28, function()
		-- upvalues: (copy) v_u_29
		return v_u_29.current
	end, {})
	local v_u_30, v_u_31 = v_u_6.useState(v_u_25)
	local v_u_32 = v_u_24(v_u_30)
	local v33, v_u_34 = v_u_6.useState(v_u_22.NO_UNIVERSE_ID)
	local v_u_35 = v_u_7.useSignalState(v_u_12)
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_3, (ref) v_u_20, (ref) v_u_21, (copy) v_u_29, (ref) v_u_2
		local v36 = v_u_3:GetLastInputType()
		local v37 = v_u_20().getLastInputType()
		local v38
		if v37 == v_u_21.Directional then
			v38 = true
		elseif v37 == v_u_21.Pointer then
			v38 = v36 == Enum.UserInputType.Keyboard
		else
			v38 = false
		end
		if v38 and v_u_29.current then
			v_u_2.SelectedCoreObject = v_u_29.current
		end
	end, {})
	local v40 = v_u_6.useCallback(function(p39)
		-- upvalues: (copy) v_u_34
		v_u_34(p39)
	end, { v_u_34 })
	local v44 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_34, (ref) v_u_22, (ref) v_u_3, (ref) v_u_20, (ref) v_u_21, (copy) v_u_29, (ref) v_u_2
		v_u_34(v_u_22.NO_UNIVERSE_ID)
		local v41 = v_u_3:GetLastInputType()
		local v42 = v_u_20().getLastInputType()
		local v43
		if v42 == v_u_21.Directional then
			v43 = true
		elseif v42 == v_u_21.Pointer then
			v43 = v41 == Enum.UserInputType.Keyboard
		else
			v43 = false
		end
		if v43 and v_u_29.current then
			v_u_2.SelectedCoreObject = v_u_29.current
		end
	end, {})
	local v46 = v_u_6.useMemo(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_32, (ref) v_u_14, (ref) v_u_16, (ref) v_u_15
		return v_u_4.List.map(v_u_32, function(p45)
			-- upvalues: (ref) v_u_14, (ref) v_u_16, (ref) v_u_15
			return {
				["placeId"] = p45.placeId,
				["universeId"] = p45.universeId,
				["name"] = p45.name,
				["image"] = v_u_14(v_u_16.GameIcon, p45.universeId, v_u_15.Medium),
				["rating"] = p45.rating
			}
		end)
	end, { v_u_32 })
	local v48 = v_u_6.useCallback(function(p47)
		-- upvalues: (copy) v_u_30, (ref) v_u_19, (copy) v_u_31
		if v_u_30 < #v_u_19:getUniverseHistory() then
			v_u_31(v_u_30 + p47)
		end
	end, { v_u_30 })
	local v49
	if next(v46) == nil then
		v49 = false
	else
		local v50 = v_u_6.createElement
		local v51 = v_u_17
		local v52 = {
			["tag"] = "size-full " .. (v_u_27 and "" or (v_u_26 and "padding-top-medium" or "padding-large"))
		}
		local v53 = {
			["HistoryPage"] = v_u_6.createElement(v_u_23, {
				["historyItems"] = v46,
				["onHistoryClose"] = function() -- name: onHistoryClose
					-- upvalues: (copy) v_u_35
					v_u_35.setCurrentReactPage(nil)
				end,
				["onCardItemActivated"] = v40,
				["onLoadMoreHistory"] = v48,
				["ref"] = v_u_29
			})
		}
		local v54 = {
			["Dialog"] = v_u_6.createElement(v_u_13, {
				["isDialogOpen"] = nil,
				["onCancel"] = nil,
				["onClose"] = nil,
				["universeId"] = nil,
				["source"] = "history_landing_page",
				["isDialogOpen"] = v_u_22.NO_UNIVERSE_ID < v33,
				["onCancel"] = v44,
				["onClose"] = v44,
				["universeId"] = v33
			})
		}
		v49 = v50(v51, v52, v53, v54)
	end
	return v49
end))