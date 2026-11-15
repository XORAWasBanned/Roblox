-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalSlider.useSliderDirectionalInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Wrappers.Services)
local v_u_5 = require(v1.Components.Slider.SliderStepDirection)
local v_u_6 = require(v1.Components.Slider.calculateAdjacentStepValue)
local v_u_7 = require(v1.Components.Slider.constants)
return function(p_u_8, p9, p10, p_u_11, p12) -- name: useSliderDirectionalInput
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_4
	local v_u_13 = v_u_3.useRef({
		["step"] = p9,
		["range"] = p10,
		["handlers"] = p12
	})
	v_u_13.current = {
		["step"] = p9,
		["range"] = p10,
		["handlers"] = p12
	}
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_8, (copy) v_u_13, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (copy) p_u_11, (ref) v_u_4
		if p_u_8 then
			local v_u_14 = nil
			local v_u_15 = 0
			local v_u_16 = nil
			local v_u_17 = 0
			local v_u_18 = 0
			local function v_u_29(p_u_19, p_u_20) -- name: startStepping
				-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_16, (ref) v_u_13, (ref) v_u_5, (ref) v_u_6
				if p_u_19 ~= v_u_14 or p_u_20 ~= v_u_15 then
					v_u_14 = nil
					v_u_15 = 0
					if v_u_16 then
						task.cancel(v_u_16)
						v_u_16 = nil
					end
					v_u_14 = p_u_19
					v_u_15 = p_u_20
					local v21 = v_u_13.current
					local v22
					if p_u_20 > 0 then
						v22 = v_u_5.Increment
					else
						v22 = v_u_5.Decrement
					end
					v21.handlers.onStep(v_u_6(v21.handlers.getValue(), v22, v21.range, v21.step))
					v_u_16 = task.spawn(function()
						-- upvalues: (ref) v_u_14, (copy) p_u_19, (ref) v_u_15, (copy) p_u_20, (ref) v_u_13, (ref) v_u_5, (ref) v_u_6
						task.wait(0.4)
						local v23 = 0
						while v_u_14 == p_u_19 and v_u_15 == p_u_20 do
							local v24 = p_u_20
							local v25 = v_u_13.current
							local v26
							if v24 > 0 then
								v26 = v_u_5.Increment
							else
								v26 = v_u_5.Decrement
							end
							v25.handlers.onStep(v_u_6(v25.handlers.getValue(), v26, v25.range, v25.step))
							v23 = v23 + 1
							local v27 = task.wait
							local v28 = v_u_13.current.step
							v27((v28 == nil or v28 <= 0) and (v23 >= 15 and 0.03 or (v23 >= 5 and 0.06 or 0.1)) or 0.1)
						end
					end)
				end
			end
			local function v38(p30) -- name: evaluateInput
				-- upvalues: (ref) v_u_7, (ref) v_u_13, (ref) p_u_11, (copy) v_u_29, (ref) v_u_17, (ref) v_u_18, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16
				local v31 = p30.KeyCode
				if table.find(v_u_7.exit, v31) ~= nil then
					v_u_13.current.handlers.onExit()
					return
				else
					local v32 = p30.KeyCode
					local v33 = p_u_11 and "vertical" or "horizontal"
					local v34 = table.find(v_u_7.stepIncrement[v33], v32) and 1 or (table.find(v_u_7.stepDecrement[v33], v32) and -1 or nil)
					if v34 then
						v_u_29(p30, v34)
					elseif table.find(v_u_7.analogStep, p30.KeyCode) then
						local v35
						if p_u_11 then
							v35 = p30.Position.Y
						else
							v35 = p30.Position.X
						end
						if math.abs(v35) >= v_u_7.thumbstickDeadzone then
							local v36 = v35 > 0 and 1 or -1
							local v37
							if v_u_17 == 0 then
								v37 = false
							else
								v37 = v36 ~= v_u_17
							end
							v_u_18 = not v37 and 0 or v_u_18 + 1
							if not v37 or v_u_18 >= 3 then
								v_u_17 = v36
								v_u_29(p30, v36)
								return
							end
							if p30 ~= nil and p30 ~= v_u_14 then
								return
							end
							v_u_14 = nil
							v_u_15 = 0
							if v_u_16 then
								task.cancel(v_u_16)
								v_u_16 = nil
								return
							end
						else
							v_u_17 = 0
							v_u_18 = 0
							if p30 ~= nil and p30 ~= v_u_14 then
								return
							end
							v_u_14 = nil
							v_u_15 = 0
							if v_u_16 then
								task.cancel(v_u_16)
								v_u_16 = nil
							end
						end
					end
				end
			end
			local function v40(p39) -- name: handleInputEnded
				-- upvalues: (ref) v_u_7, (ref) v_u_17, (ref) v_u_18, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16
				if table.find(v_u_7.analogStep, p39.KeyCode) then
					v_u_17 = 0
					v_u_18 = 0
				end
				if p39 == nil or p39 == v_u_14 then
					v_u_14 = nil
					v_u_15 = 0
					if v_u_16 then
						task.cancel(v_u_16)
						v_u_16 = nil
					end
				end
			end
			local v_u_41 = { v_u_4.UserInputService.InputBegan:Connect(v38), v_u_4.UserInputService.InputChanged:Connect(v38), v_u_4.UserInputService.InputEnded:Connect(v40) }
			return function()
				-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_16, (copy) v_u_41
				v_u_14 = nil
				v_u_15 = 0
				if v_u_16 then
					task.cancel(v_u_16)
					v_u_16 = nil
				end
				for _, v42 in v_u_41 do
					v42:Disconnect()
				end
			end
		end
	end, { p_u_8, p_u_11 })
end