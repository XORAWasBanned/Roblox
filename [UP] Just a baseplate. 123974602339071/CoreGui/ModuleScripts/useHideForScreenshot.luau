-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Hooks.useHideForScreenshot
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v2.Packages.React)
local v_u_5 = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local v_u_6 = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local v_u_7 = require(v2.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local v_u_8 = UserSettings():GetService("UserGameSettings")
return function(p_u_9, p_u_10, p_u_11, p_u_12, p_u_13, p_u_14)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_3, (copy) v_u_1, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6
	local v_u_15, v_u_16 = v_u_4.useState(false)
	local v_u_17
	if v_u_7 then
		v_u_17 = v_u_4.useRef(nil)
	else
		v_u_17 = nil
	end
	v_u_4.useEffect(function()
		-- upvalues: (copy) p_u_10, (copy) v_u_15, (ref) v_u_7, (copy) v_u_17, (ref) v_u_3, (copy) v_u_16, (copy) p_u_9, (copy) p_u_11, (ref) v_u_1, (copy) p_u_13, (ref) v_u_8, (ref) v_u_5, (ref) v_u_6, (copy) p_u_12, (copy) p_u_14
		if p_u_10 then
			if v_u_15 then
				if v_u_7 and (v_u_17.current and v_u_17.current:IsDescendantOf(game)) then
					v_u_3.SelectedCoreObject = v_u_17.current
					v_u_17.current = nil
				end
				v_u_16(false)
				return
			end
			if p_u_9 then
				if v_u_7 then
					v_u_17.current = v_u_3.SelectedCoreObject
				end
				v_u_16(true)
				p_u_11()
				local v_u_18 = nil
				local v_u_19 = 0
				local v_u_20 = 0
				local v_u_21 = nil
				local v_u_22 = os.clock()
				v_u_18 = v_u_1.Heartbeat:Connect(function()
					-- upvalues: (ref) v_u_19, (ref) p_u_13, (ref) v_u_18
					if v_u_19 == 1 then
						p_u_13()
						v_u_18:Disconnect()
					else
						v_u_19 = v_u_19 + 1
					end
				end)
				v_u_21 = v_u_1.Heartbeat:Connect(function()
					-- upvalues: (copy) v_u_22, (ref) v_u_8, (ref) v_u_5, (ref) v_u_6, (ref) v_u_20, (ref) v_u_21, (ref) p_u_12
					local v23 = os.clock() - v_u_22
					local v24
					if v_u_8.ReducedMotion then
						v24 = v_u_5 / 60
					else
						v24 = v_u_6 / 60
					end
					if v24 <= v23 then
						local v25 = v_u_20
						local v26
						if v_u_8.ReducedMotion then
							v26 = v_u_5
						else
							v26 = v_u_6
						end
						if v26 <= v25 then
							v_u_21:Disconnect()
							p_u_12()
							return
						end
					end
					v_u_20 = v_u_20 + 1
				end)
				return
			end
		elseif not v_u_15 then
			p_u_14()
		end
	end, { p_u_10 })
end