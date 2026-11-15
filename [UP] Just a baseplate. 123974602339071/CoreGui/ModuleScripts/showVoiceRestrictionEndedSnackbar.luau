-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.showVoiceRestrictionEndedSnackbar
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v2.Packages.ReactRoblox)
local v_u_5 = require(v2.Packages.Foundation)
local v6 = require(v2.Packages.LuauPolyfill)
local v7 = require(v2.Packages.Signals)
local v_u_8 = require(v2.Packages.SignalsReact)
local v_u_9 = require(v2.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v_u_10 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_11 = require(script.Parent.useSnackbarSlideMotionFromBottom)
local v_u_12 = v6.setTimeout
local v_u_13 = v6.clearTimeout
local v_u_14 = game:DefineFastInt("VoiceRestrictionEndedSnackbarDismissSeconds", 4)
local v_u_15 = nil
local v_u_16 = nil
local v_u_17, v_u_18 = v7.createSignal(0)
local function v_u_20(p19) -- name: dismissSnackbar
	-- upvalues: (copy) v_u_17, (ref) v_u_16, (ref) v_u_15
	if v_u_17(false) == p19 then
		if v_u_16 then
			v_u_16:unmount()
			v_u_16 = nil
		end
		if v_u_15 then
			v_u_15:Destroy()
			v_u_15 = nil
		end
	end
end
local function v_u_27(p_u_21) -- name: VoiceRestrictionEndedSnackbar
	-- upvalues: (copy) v_u_8, (copy) v_u_17, (copy) v_u_11, (copy) v_u_3, (copy) v_u_12, (copy) v_u_14, (copy) v_u_13, (copy) v_u_5, (copy) v_u_10
	local v_u_22 = v_u_8.useSignalState(v_u_17)
	local v23 = v_u_11()
	local v_u_24 = v23.enter
	local v_u_25 = v23.exit
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_24, (ref) v_u_12, (copy) v_u_25, (copy) p_u_21, (copy) v_u_22, (ref) v_u_14, (ref) v_u_13
		v_u_24()
		local v_u_26 = v_u_12(function()
			-- upvalues: (ref) v_u_25, (ref) p_u_21, (ref) v_u_22
			v_u_25(function()
				-- upvalues: (ref) p_u_21, (ref) v_u_22
				p_u_21.onDismiss(v_u_22)
			end)
		end, v_u_14 * 1000)
		return function()
			-- upvalues: (ref) v_u_13, (copy) v_u_26
			v_u_13(v_u_26)
		end
	end, {
		v_u_22,
		v_u_24,
		v_u_25,
		p_u_21.onDismiss
	})
	return v_u_3.createElement(v_u_5.Snackbar, {
		["title"] = v_u_10:FormatByKey("Feature.InExperienceIntervention.Description.StartNewGameToTurnOnVoiceChat"),
		["AnchorPoint"] = v23.anchorPoint,
		["Position"] = v23.position
	})
end
return function() -- name: showVoiceRestrictionEndedSnackbar
	-- upvalues: (copy) v_u_18, (copy) v_u_17, (ref) v_u_16, (copy) v_u_1, (ref) v_u_15, (copy) v_u_4, (copy) v_u_3, (copy) v_u_9, (copy) v_u_27, (copy) v_u_20
	v_u_18(v_u_17(false) + 1)
	if not v_u_16 then
		local v28 = Instance.new("ScreenGui")
		v28.Name = "VoiceRestrictionEndedSnackbar"
		v28.DisplayOrder = 10
		v28.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		v28.ResetOnSpawn = false
		v28.ScreenInsets = Enum.ScreenInsets.None
		v28.ClipToDeviceSafeArea = false
		v28.Parent = v_u_1
		v_u_15 = v28
		local v29 = v_u_4.createRoot(v28)
		v_u_16 = v29
		local v30 = v_u_3.createElement
		local v31 = v_u_9
		local v32 = {}
		local v33 = {
			["onDismiss"] = v_u_20
		}
		v32.Snackbar = v_u_3.createElement(v_u_27, v33)
		v29:render(v30(v31, {}, v32))
	end
end