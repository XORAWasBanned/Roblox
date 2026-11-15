-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Hooks.useCaptureScreenshotV2
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Components.Constants)
require(v1.Components.Types)
local v_u_5 = require(v1.IXP.TnSIXPWrapper)
local v_u_6 = require(script.Parent.runScreenshotCaptureSequence)
return function() -- name: useCaptureScreenshotV2
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v_u_7 = v_u_3.useRef({
		["screenshotId"] = "",
		["identificationResults"] = nil,
		["identificationResults"] = v_u_4.InitialIdentificationResults
	})
	local v8, v_u_9 = v_u_3.useState(false)
	local v_u_10 = v_u_3.useRef("idle")
	local v11 = v_u_5.getReportAnythingAvatarEnabled() or v_u_5.getReportAnythingExperienceEnabled()
	local v_u_12 = v_u_3.useRef(v11)
	v_u_12.current = v11
	local v13 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_7, (ref) v_u_4, (copy) v_u_10, (copy) v_u_9
		v_u_7.current = {
			["screenshotId"] = "",
			["identificationResults"] = nil,
			["identificationResults"] = v_u_4.InitialIdentificationResults
		}
		v_u_10.current = "idle"
		v_u_9(false)
	end, {})
	local v14 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_10
		return v_u_10.current == "capturing"
	end, {})
	return {
		["captureIfApplicable"] = v_u_3.useCallback(function(p15)
			-- upvalues: (copy) v_u_12, (copy) v_u_10, (ref) v_u_6, (copy) v_u_9, (copy) v_u_7
			if v_u_12.current and v_u_10.current == "idle" then
				v_u_10.current = "capturing"
				v_u_6({
					["hide"] = p15.hide,
					["show"] = p15.show,
					["onScreenshotTaken"] = function() -- name: onScreenshotTaken
						-- upvalues: (ref) v_u_9
						v_u_9(true)
					end,
					["onScreenshotUploaded"] = function(p16) -- name: onScreenshotUploaded
						-- upvalues: (ref) v_u_7
						v_u_7.current = {
							["screenshotId"] = p16,
							["identificationResults"] = v_u_7.current.identificationResults
						}
					end,
					["onIdentificationCompleted"] = function(p17) -- name: onIdentificationCompleted
						-- upvalues: (ref) v_u_7
						v_u_7.current = {
							["screenshotId"] = v_u_7.current.screenshotId,
							["identificationResults"] = p17
						}
					end,
					["onCaptureEnd"] = function() -- name: onCaptureEnd
						-- upvalues: (ref) v_u_10
						v_u_10.current = "done"
					end
				})
			end
		end, {}),
		["reset"] = v13,
		["getIsCapturing"] = v14,
		["isCaptureApplicable"] = v11,
		["isScreenshotTaken"] = v8,
		["snapshotRef"] = v_u_7
	}
end