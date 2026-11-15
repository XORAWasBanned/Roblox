-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.LeaveGameDialog
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.RoactRodux
local v6 = v3.t
local v7 = script.Parent.Parent
local v_u_8 = require(v7.Localization.withLocalization)
local v_u_9 = require(v7.Actions.CancelLeavingGame)
local v_u_10 = require(v7.GlobalConfig)
local v_u_11 = require(script.Parent.ConfirmationDialog)
local v_u_12 = require(v7.Resources.Constants)
local v_u_13 = require(v7.Utility.SendAnalytics)
local v_u_14 = require(v2.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_15 = v6.strictInterface({
	["isLeavingGame"] = v6.boolean,
	["onCancel"] = v6.callback,
	["sendAnalytics"] = v6.callback
})
return v5.UNSTABLE_connect2(function(p16, _)
	return {
		["isLeavingGame"] = p16.leavingGame
	}
end, function(p_u_17)
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_12
	return {
		["onCancel"] = function() -- name: onCancel
			-- upvalues: (copy) p_u_17, (ref) v_u_9, (ref) v_u_13, (ref) v_u_12
			p_u_17(v_u_9())
			v_u_13(v_u_12.AnalyticsInGameMenuName, v_u_12.AnalyticsLeaveGameName, {
				["confirmed"] = v_u_12.AnalyticsCancelledName
			})
		end
	}
end)(function(p_u_18) -- name: LeaveGameDialog
	-- upvalues: (copy) v_u_10, (copy) v_u_15, (copy) v_u_8, (copy) v_u_4, (copy) v_u_11, (copy) v_u_13, (copy) v_u_12, (copy) v_u_1, (copy) v_u_14
	if v_u_10.propValidation then
		local v19 = v_u_15
		assert(v19(p_u_18))
	end
	return v_u_8({
		["bodyText"] = "CoreScripts.InGameMenu.ConfirmLeaveGame",
		["confirmText"] = "CoreScripts.InGameMenu.Leave",
		["titleText"] = "CoreScripts.InGameMenu.LeaveGameQuestion",
		["cancelText"] = "CoreScripts.InGameMenu.Cancel"
	})(function(p20)
		-- upvalues: (ref) v_u_4, (ref) v_u_11, (copy) p_u_18, (ref) v_u_13, (ref) v_u_12, (ref) v_u_1, (ref) v_u_14
		return v_u_4.createElement(v_u_11, {
			["bodyText"] = nil,
			["confirmText"] = nil,
			["titleText"] = nil,
			["cancelText"] = nil,
			["bindReturnToConfirm"] = true,
			["onCancel"] = nil,
			["onConfirm"] = nil,
			["blurBackground"] = true,
			["visible"] = nil,
			["bodyText"] = p20.bodyText,
			["confirmText"] = p20.confirmText,
			["titleText"] = p20.titleText,
			["cancelText"] = p20.cancelText,
			["onCancel"] = p_u_18.onCancel,
			["onConfirm"] = function() -- name: onConfirm
				-- upvalues: (ref) v_u_13, (ref) v_u_12, (ref) v_u_1, (ref) v_u_14
				v_u_13(v_u_12.AnalyticsInGameMenuName, v_u_12.AnalyticsLeaveGameName, {
					["confirmed"] = v_u_12.AnalyticsConfirmedName
				})
				v_u_1.Heartbeat:Wait()
				game:Shutdown()
				settings().Rendering.QualityLevel = v_u_14()
			end,
			["visible"] = p_u_18.isLeavingGame
		})
	end)
end)