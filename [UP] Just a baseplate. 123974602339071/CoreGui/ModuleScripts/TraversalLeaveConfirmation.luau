-- Path: CoreGui.RobloxGui.Modules.Settings.Components.Traversal.TraversalLeaveConfirmation
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("UserInputService")
local v5 = require(v1.Packages.Foundation)
local v_u_6 = require(v1.Packages.React)
local v_u_7 = require(v1.Packages.Signals)
local v_u_8 = require(v1.Packages.SignalsReact)
local v9 = require(v1.Workspace.Packages.DataHydration)
local v10 = require(v1.Workspace.Packages.CoreScriptsRoactCommon)
local v11 = require(v1.Workspace.Packages.Localization)
local v12 = require(v1.Workspace.Packages.Responsive)
local v_u_13 = v5.View
local v_u_14 = v9.Game.getGameInfoStore
local v15 = v10.Traversal
local v_u_16 = v15.Constants
local v_u_17 = v15.TeleportLeaveConfirmation
local v_u_18 = v11.Hooks.useLocalization
local v_u_19 = v12.GetInputModeStore
local v_u_20 = v12.Input
return v_u_6.memo(function(p_u_21) -- name: TraversalLeaveConfirmation
	-- upvalues: (copy) v_u_6, (copy) v_u_18, (copy) v_u_8, (copy) v_u_14, (copy) v_u_7, (copy) v_u_4, (copy) v_u_19, (copy) v_u_20, (copy) v_u_16, (copy) v_u_2, (copy) v_u_3, (copy) v_u_13, (copy) v_u_17
	local v_u_22 = v_u_6.useRef(nil)
	local v23 = v_u_18({
		["previous"] = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local v24 = v_u_8.useSignalState
	local v25 = v_u_14(false).getAndFetchGameInfo
	local v26 = p_u_21.universeId
	local v27 = v24(v25((tostring(v26))).data)
	local v_u_28 = nil
	local v29
	if typeof(v27) == "table" then
		v29 = v27.name
		local v30 = v27.rootPlaceId
		v_u_28 = tonumber(v30)
	else
		v29 = v23.previous
	end
	local v_u_32 = v_u_6.useCallback(function(_, p31)
		-- upvalues: (copy) p_u_21
		if p31 ~= Enum.UserInputState.End then
			return Enum.ContextActionResult.Pass
		end
		p_u_21.onCancel()
		return Enum.ContextActionResult.Sink
	end, { p_u_21.onCancel })
	local v33 = { v_u_28 }
	v_u_6.useEffect(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_4, (ref) v_u_19, (ref) v_u_20, (ref) v_u_28, (ref) v_u_16, (ref) v_u_2, (copy) v_u_32, (ref) v_u_3, (copy) v_u_22
		local v_u_38 = v_u_7.createEffect(function(p34)
			-- upvalues: (ref) v_u_4, (ref) v_u_19, (ref) v_u_20, (ref) v_u_28, (ref) v_u_16, (ref) v_u_2, (ref) v_u_32, (ref) v_u_3, (ref) v_u_22
			local v35 = v_u_4:GetLastInputType()
			local v36 = v_u_19(p34).getLastInputType(p34)
			local v37
			if v36 == v_u_20.Directional then
				v37 = true
			elseif v36 == v_u_20.Pointer then
				v37 = v35 == Enum.UserInputType.Keyboard
			else
				v37 = false
			end
			if v_u_28 == nil or v_u_28 <= v_u_16.NO_PLACE_ID then
				if v37 then
					v_u_2:UnbindCoreAction("FREEZE_CONTROLLER")
					v_u_2:UnbindCoreAction("EXIT_DIALOG")
				end
			elseif v37 then
				v_u_2:BindCoreAction("FREEZE_CONTROLLER", function() end, false, Enum.UserInputType.Gamepad1)
				v_u_2:BindCoreAction("EXIT_DIALOG", v_u_32, false, Enum.KeyCode.ButtonB)
				v_u_3.SelectedCoreObject = v_u_22.current
				return
			end
		end)
		return function()
			-- upvalues: (copy) v_u_38
			v_u_38()
		end
	end, v33)
	local v39 = p_u_21.isDialogOpen and v_u_28
	if v39 then
		local v40 = v_u_6.createElement
		local v41 = {
			["DisplayOrder"] = 10,
			["IgnoreGuiInset"] = true,
			["ZIndexBehavior"] = nil,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}
		local v42 = {}
		local v43 = v_u_6.createElement
		local v44 = v_u_13
		local v45 = {
			["tag"] = "auto-xy size-full",
			["selectionGroup"] = nil,
			["selectionGroup"] = {
				["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
				["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop,
				["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
				["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop
			}
		}
		local v46 = {
			["Dialog"] = v_u_6.createElement(v_u_17, {
				["onCancel"] = p_u_21.onCancel,
				["onClose"] = p_u_21.onClose,
				["placeId"] = v_u_28,
				["teleportName"] = v29,
				["source"] = p_u_21.source,
				["ref"] = v_u_22
			})
		}
		v42.NoEscapeZone = v43(v44, v45, v46)
		v39 = v40("ScreenGui", v41, v42)
	end
	return v39
end)