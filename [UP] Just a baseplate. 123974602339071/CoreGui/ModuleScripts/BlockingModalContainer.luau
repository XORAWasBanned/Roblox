-- Path: CoreGui.RobloxGui.Modules.Settings.Components.Blocking.BlockingModalContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_5 = require(v1.Workspace.Packages.BlockingUtility)
local v_u_6 = require(v_u_2.isNewInGameMenuEnabled)
local v_u_7 = require(v1.Packages.UIBlox).App.Dialog.Toast
local v_u_8 = require(script.Parent.ActionModal)
return function(p9) -- name: BlockingModalContainer
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8
	local v_u_10 = p9.player
	local v_u_11 = p9.closeModal
	local v_u_12 = p9.blockingUtility or v_u_5
	local v_u_13 = p9.analytics
	local v_u_14 = p9.source
	local v_u_15 = p9.onBlockingSuccess
	local v16, v_u_17 = v_u_3.useState(Vector2.new(1000, 1000))
	local v18, v_u_19 = v_u_3.useState(false)
	local v_u_20 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_12, (copy) v_u_10, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_11, (copy) v_u_19
		if v_u_12:BlockPlayerAsync(v_u_10) then
			v_u_13:action("SettingsHub", "blockUser", {
				["blockeeUserId"] = v_u_10.UserId,
				["source"] = v_u_14
			})
			if v_u_15 then
				v_u_15()
			end
			v_u_11()
		else
			v_u_19(true)
		end
	end, {
		v_u_11,
		v_u_10,
		v_u_13,
		v_u_14,
		v_u_15
	})
	local v22 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_20, (copy) v_u_14, (ref) v_u_6, (ref) v_u_2, (copy) v_u_10
		v_u_20()
		local v21 = v_u_14 or "BlockingModal"
		if v_u_6() then
			require(v_u_2.InGameMenuInit).openReportDialog(v_u_10, v21)
		else
			require(v_u_2.Settings.Pages.ReportAbuseMenuContainerPage):ReportPlayer(v_u_10, v21)
		end
	end, { v_u_20, v_u_10, v_u_14 })
	local v23 = v_u_4({
		["titleKey"] = nil,
		["bodyKey"] = "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename",
		["cancelTextKey"] = "Feature.BlockingModal.Action.Cancel",
		["blockTextKey"] = "Feature.BlockingModal.Action.Block",
		["blockAndReportTextKey"] = "Feature.BlockingModal.Action.BlockAndReport",
		["blockingFailed"] = "Feature.Toast.NetworkingError.SomethingIsWrong",
		["titleKey"] = {
			"Feature.BlockingModal.Heading.BlockUser",
			["DisplayName"] = v_u_10.DisplayName
		}
	})
	if v18 then
		return v_u_3.createElement(v_u_7, {
			["duration"] = 3,
			["show"] = nil,
			["toastContent"] = nil,
			["show"] = v18,
			["toastContent"] = {
				["toastTitle"] = v23.blockingFailed,
				["onDismissed"] = v_u_11
			}
		})
	else
		return v_u_3.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 1, 0),
			["BackgroundTransparency"] = 1,
			["ZIndex"] = 2,
			[v_u_3.Change.AbsoluteSize] = function(p24)
				-- upvalues: (copy) v_u_17
				v_u_17(p24.AbsoluteSize)
			end
		}, {
			["BlockingModal"] = v_u_3.createElement(v_u_8, {
				["screenSize"] = v16,
				["title"] = v23.titleKey,
				["body"] = v23.bodyKey,
				["blockText"] = v23.blockTextKey,
				["blockAndReportText"] = v23.blockAndReportTextKey,
				["cancelText"] = v23.cancelTextKey,
				["cancel"] = v_u_11,
				["block"] = v_u_20,
				["blockAndReport"] = v22
			})
		})
	end
end