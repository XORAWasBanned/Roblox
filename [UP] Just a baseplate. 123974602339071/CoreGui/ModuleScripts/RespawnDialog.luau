-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.RespawnDialog
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v_u_5 = require(script.Parent.IGMRespawnControllerBar)
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Localization.withLocalization)
local v_u_8 = require(v6.Actions.SetRespawning)
local v_u_9 = require(v6.Thunks.RespawnPlayer)
local v_u_10 = require(script.Parent.ConfirmationDialog)
local v_u_11 = require(v6.Utility.SendAnalytics)
local v_u_12 = require(v6.Resources.Constants)
return v4.UNSTABLE_connect2(function(p13, _)
	return {
		["isRespawning"] = p13.respawn.dialogOpen,
		["inputType"] = p13.displayOptions.inputType
	}
end, function(p_u_14)
	-- upvalues: (copy) v_u_8, (copy) v_u_11, (copy) v_u_12, (copy) v_u_9
	return {
		["onCancel"] = function() -- name: onCancel
			-- upvalues: (copy) p_u_14, (ref) v_u_8, (ref) v_u_11, (ref) v_u_12
			p_u_14(v_u_8(false))
			v_u_11(v_u_12.AnalyticsInGameMenuName, v_u_12.AnalyticsRespawnCharacterName, {
				["confirmed"] = v_u_12.AnalyticsCancelledName
			})
		end,
		["onConfirm"] = function() -- name: onConfirm
			-- upvalues: (copy) p_u_14, (ref) v_u_9
			p_u_14(v_u_9)
		end
	}
end)(function(p_u_15) -- name: RespawnDialog
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_10
	return v_u_7({
		["titleText"] = "CoreScripts.InGameMenu.RespawnCharacterDialogTitle",
		["bodyText"] = "CoreScripts.InGameMenu.RespawnCharacterDialogBody",
		["confirmText"] = "CoreScripts.InGameMenu.RespawnCharacterDialogConfirm",
		["cancelText"] = "CoreScripts.InGameMenu.Cancel"
	})(function(p16)
		-- upvalues: (ref) v_u_3, (copy) p_u_15, (ref) v_u_5, (ref) v_u_10
		local v17 = v_u_3.createFragment
		local v18 = {}
		local v19
		if p_u_15.isRespawning then
			v19 = v_u_3.createElement(v_u_5, {
				["inputType"] = p_u_15.inputType
			}) or nil
		else
			v19 = nil
		end
		v18.RespawnDialogControllerBar = v19
		v18.ConfirmationDialog = v_u_3.createElement(v_u_10, {
			["visible"] = nil,
			["titleText"] = nil,
			["bodyText"] = nil,
			["confirmText"] = nil,
			["cancelText"] = nil,
			["bindReturnToConfirm"] = true,
			["onCancel"] = nil,
			["onConfirm"] = nil,
			["inputType"] = nil,
			["visible"] = p_u_15.isRespawning,
			["titleText"] = p16.titleText,
			["bodyText"] = p16.bodyText,
			["confirmText"] = p16.confirmText,
			["cancelText"] = p16.cancelText,
			["onCancel"] = p_u_15.onCancel,
			["onConfirm"] = p_u_15.onConfirm,
			["inputType"] = p_u_15.inputType
		})
		return v17(v18)
	end)
end)