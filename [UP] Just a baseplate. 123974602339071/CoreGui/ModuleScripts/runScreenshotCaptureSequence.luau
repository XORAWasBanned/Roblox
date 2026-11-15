-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Hooks.runScreenshotCaptureSequence
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("RunService")
require(v1.Components.Types)
local v_u_5 = require(v2.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local v6 = require(v2.Workspace.Packages.TnSAvatarIdentification)
local v7 = require(v2.Workspace.Packages.TnSAdIdentification)
local v_u_8 = require(v2.Workspace.Packages.TnSScreenshot).ScreenshotManager
local v_u_9 = v6.AvatarIdentification
local v_u_10 = v7.AdIdentification
local v_u_11 = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local v_u_12 = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local v_u_13 = UserSettings():GetService("UserGameSettings")
local function v_u_14() -- name: defaultGetWaitFrames
	-- upvalues: (copy) v_u_13, (copy) v_u_11, (copy) v_u_12
	if v_u_13.ReducedMotion then
		return v_u_11
	else
		return v_u_12
	end
end
local function v_u_16() -- name: defaultGetWaitTime
	-- upvalues: (copy) v_u_13, (copy) v_u_11, (copy) v_u_12
	local v15
	if v_u_13.ReducedMotion then
		v15 = v_u_11
	else
		v15 = v_u_12
	end
	return v15 / 60
end
local function v_u_18() -- name: defaultDeps
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_4, (copy) v_u_14, (copy) v_u_16
	return {
		["takeScreenshot"] = function(p17) -- name: takeScreenshot
			-- upvalues: (ref) v_u_8
			return v_u_8:TakeScreenshotWithCallback(p17)
		end,
		["getVisibleAvatars"] = function() -- name: getVisibleAvatars
			-- upvalues: (ref) v_u_9
			return v_u_9.getVisibleAvatars()
		end,
		["getVisibleAds"] = function() -- name: getVisibleAds
			-- upvalues: (ref) v_u_10
			return v_u_10.getVisibleAds()
		end,
		["runService"] = v_u_4,
		["getWaitFrames"] = v_u_14,
		["getWaitTime"] = v_u_16
	}
end
return function(p_u_19, p20) -- name: runScreenshotCaptureSequence
	-- upvalues: (copy) v_u_18, (copy) v_u_5, (copy) v_u_3
	local v_u_21 = p20 or v_u_18()
	local v_u_22
	if v_u_5 then
		v_u_22 = v_u_3.SelectedCoreObject
	else
		v_u_22 = nil
	end
	p_u_19.hide()
	local v_u_23 = 0
	local v_u_24 = os.clock()
	local v_u_25 = false
	local v_u_26 = nil
	v_u_26 = v_u_21.runService.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_25, (ref) v_u_23, (copy) v_u_21, (copy) p_u_19, (copy) v_u_24, (ref) v_u_26, (ref) v_u_5, (ref) v_u_22, (ref) v_u_3
		if not v_u_25 and v_u_23 >= 1 then
			v_u_25 = true
			v_u_21.takeScreenshot(p_u_19.onScreenshotUploaded)
			p_u_19.onScreenshotTaken()
			local v27 = p_u_19.onIdentificationCompleted
			local v28 = v_u_21
			local v29, v30 = v28.getVisibleAvatars()
			local v31, v32 = v28.getVisibleAds()
			v27({
				["identifiedAvatars"] = v29,
				["identifiedAds"] = v31,
				["avatarIDStats"] = v30,
				["adIDStats"] = v32
			})
		end
		if v_u_25 and (v_u_23 >= v_u_21.getWaitFrames() and os.clock() - v_u_24 >= v_u_21.getWaitTime()) then
			v_u_26:Disconnect()
			p_u_19.show()
			if v_u_5 and (v_u_22 and v_u_22:IsDescendantOf(game)) then
				v_u_3.SelectedCoreObject = v_u_22
			end
			p_u_19.onCaptureEnd()
		else
			v_u_23 = v_u_23 + 1
		end
	end)
end