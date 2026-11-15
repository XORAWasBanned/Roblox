-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.useSnackbarSlideMotionFromBottom
local v1 = game:GetService("CorePackages")
local v_u_2 = UserSettings():GetService("UserGameSettings")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.Foundation)
local v_u_5 = require(v1.Packages.Motion)
local v_u_6 = require(v1.Workspace.Packages.Responsive)
return function(p7) -- name: useSnackbarSlideMotionFromBottom
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_2, (copy) v_u_5
	local v_u_8 = v_u_4.Hooks.useTokens()
	local v9 = v_u_6.useDeviceInsets()
	local v_u_10 = v_u_3.useRef(v_u_2.ReducedMotion).current
	local v11 = p7 or v_u_8.Padding.XLarge
	local v12 = v9.bottom
	local v_u_13 = math.max(v11, v12)
	local v_u_17 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_10, (copy) v_u_8
		local v14 = v_u_5.createState
		local v15 = {
			["anchorPoint"] = Vector2.new(0.5, 0),
			["position"] = UDim2.fromScale(0.5, 1)
		}
		local v16 = {
			["default"] = {
				["duration"] = v_u_10 and 0 or 0.15,
				["easingStyle"] = v_u_8.Ease.StandardIn
			}
		}
		return v14(v15, v16)
	end, { v_u_8, v_u_10 })
	local v_u_21 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_5, (copy) v_u_13, (copy) v_u_10, (copy) v_u_8
		local v18 = v_u_5.createState
		local v19 = {
			["anchorPoint"] = Vector2.new(0.5, 1),
			["position"] = UDim2.new(0.5, 0, 1, -v_u_13)
		}
		local v20 = {
			["default"] = {
				["duration"] = v_u_10 and 0 or v_u_8.Time.Time_200,
				["easingStyle"] = v_u_8.Ease.StandardOut
			}
		}
		return v18(v19, v20)
	end, { v_u_8, v_u_10, v_u_13 })
	local v22 = v_u_5.useMotion
	local v23
	if v_u_10 then
		v23 = v_u_21
	else
		v23 = v_u_17
	end
	local v24, v25 = v22(v23)
	local v_u_26 = v_u_3.useRef(v25)
	v_u_26.current = v25
	local v_u_27 = v_u_3.useRef(false)
	local v_u_28 = v_u_3.useRef(v_u_21)
	v_u_28.current = v_u_21
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_26, (copy) v_u_21
		if not v_u_27.current then
			v_u_26.current(v_u_21)
		end
	end, { v_u_21 })
	local v31 = v_u_3.useCallback(function(p_u_29)
		-- upvalues: (copy) v_u_27, (copy) v_u_26, (copy) v_u_17
		v_u_27.current = true
		v_u_26.current(v_u_17, {
			["onAnimationComplete"] = function(p30) -- name: onAnimationComplete
				-- upvalues: (copy) p_u_29
				if p30 == true then
					p_u_29()
				end
			end
		})
	end, { v_u_17 })
	local v32 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_27, (copy) v_u_26, (copy) v_u_28
		if v_u_27.current then
			v_u_27.current = false
			v_u_26.current(v_u_28.current)
		end
	end, {})
	return {
		["anchorPoint"] = v24.anchorPoint,
		["position"] = v24.position,
		["enter"] = v32,
		["exit"] = v31
	}
end