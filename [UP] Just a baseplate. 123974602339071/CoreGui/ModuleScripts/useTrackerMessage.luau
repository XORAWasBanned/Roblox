-- Path: CoreGui.RobloxGui.Modules.SelfieView.Hooks.useTrackerMessage
local v1 = game:GetService("CorePackages")
local v2 = v1.Packages
local v_u_3 = require(v2.React)
local v4 = require(v2.LuauPolyfill)
local v_u_5 = v4.setTimeout
local v_u_6 = v4.clearTimeout
local v_u_7 = require(script.Parent.useTrackerMode)
local v_u_8 = require(script.Parent.Parent.Utils.FaceChatUtils)
local v_u_9 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_10 = Enum.TrackerMode
return function()
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_5
	local v_u_11 = v_u_3.useRef(v_u_8.getTrackerMode())
	local v_u_12 = v_u_7()
	local v_u_13 = v_u_9({
		["controlMessageSound"] = "CoreScripts.TopBar.ControlMessageSound",
		["controlMessageMotion"] = "CoreScripts.TopBar.ControlMessageMotion",
		["controlMessageOn"] = "CoreScripts.TopBar.ControlMessageOn",
		["controlMessageOff"] = "CoreScripts.TopBar.ControlMessageOff"
	})
	local v_u_14, v_u_15 = v_u_3.useState({
		["visible"] = false,
		["text"] = nil,
		["status"] = nil,
		["text"] = v_u_13.controlMessageMotion,
		["status"] = v_u_13.controlMessageOff
	})
	local v_u_16 = v_u_3.useRef(nil)
	local function v_u_19()
		-- upvalues: (copy) v_u_13, (copy) v_u_12, (ref) v_u_10, (copy) v_u_11
		local _ = v_u_13.controlMessageMotion
		local _ = v_u_13.controlMessageOff
		local v17, v18
		if v_u_12 == v_u_10.None then
			v17 = v_u_13.controlMessageOff
			if v_u_11.current == v_u_10.Audio then
				v18 = v_u_13.controlMessageSound
			else
				v18 = v_u_13.controlMessageMotion
			end
		else
			v17 = v_u_13.controlMessageOn
			if v_u_12 == v_u_10.AudioVideo or v_u_12 == v_u_10.Video then
				v18 = v_u_13.controlMessageMotion
			else
				v18 = v_u_13.controlMessageSound
			end
		end
		v_u_11.current = v_u_12
		return {
			["visible"] = true,
			["text"] = nil,
			["status"] = nil,
			["text"] = v18,
			["status"] = v17
		}
	end
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_6, (copy) v_u_15, (copy) v_u_19, (ref) v_u_5, (copy) v_u_14
		if v_u_16.current then
			v_u_6(v_u_16.current)
		end
		v_u_15((v_u_19()))
		v_u_16.current = v_u_5(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_14
			v_u_15({
				["visible"] = false,
				["text"] = nil,
				["status"] = nil,
				["text"] = v_u_14.text,
				["status"] = v_u_14.status
			})
		end, 2000)
	end, { v_u_12 })
	return v_u_14
end