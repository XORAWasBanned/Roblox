-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.useSliderDirectionalInput
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Wrappers.Services)
local v_u_5 = require(script.Parent.SliderStepDirection)
local v_u_6 = require(script.Parent.SliderStepSize)
local v_u_7 = require(v1.Utility.Flags)
local v_u_8 = require(script.Parent.calculateAdjacentStepValue)
local v_u_9 = require(script.Parent.calculateDirectionalStepValue)
local v_u_10 = require(script.Parent.constants)
local function v_u_14(p11, p12) -- name: getStepForKeyCode
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_6
	if not v_u_7.FoundationSliderCapture then
		if table.find(v_u_10.coarseIncrement, p11) then
			return {
				["sign"] = 1,
				["size"] = nil,
				["size"] = v_u_6.Page
			}
		end
		if table.find(v_u_10.coarseDecrement, p11) then
			return {
				["sign"] = -1,
				["size"] = nil,
				["size"] = v_u_6.Page
			}
		end
	end
	local v13 = p12 and "vertical" or "horizontal"
	return table.find(v_u_10.stepIncrement[v13], p11) and {
		["sign"] = 1,
		["size"] = nil,
		["size"] = v_u_6.Step
	} or (table.find(v_u_10.stepDecrement[v13], p11) and {
		["sign"] = -1,
		["size"] = nil,
		["size"] = v_u_6.Step
	} or nil)
end
return function(p_u_15, p16, p17, p_u_18, p19) -- name: useSliderDirectionalInput
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_14, (copy) v_u_4
	local v_u_20 = v_u_3.useRef({
		["step"] = p16,
		["range"] = p17,
		["handlers"] = p19
	})
	v_u_20.current = {
		["step"] = p16,
		["range"] = p17,
		["handlers"] = p19
	}
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_15, (ref) v_u_6, (copy) v_u_20, (ref) v_u_5, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (ref) v_u_14, (copy) p_u_18, (ref) v_u_4
		if p_u_15 then
			local v_u_21 = nil
			local v_u_22 = 0
			local v_u_23 = v_u_6.Step
			local v_u_24 = nil
			local v_u_25 = 0
			local v_u_26 = 0
			local function v_u_33(p27, p28) -- name: performStep
				-- upvalues: (ref) v_u_20, (ref) v_u_5, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9
				local v29 = v_u_20.current
				local v30
				if p27 > 0 then
					v30 = v_u_5.Increment
				else
					v30 = v_u_5.Decrement
				end
				local v31 = v29.handlers.onStep
				local v32
				if v_u_7.FoundationSliderCapture then
					v32 = v_u_8(v29.handlers.getValue(), v30, v29.range, v29.step, p28)
				else
					v32 = v_u_9(v29.handlers.getValue(), v30, v29.range, v29.step, p28)
				end
				v31(v32)
			end
			local function v_u_40(p_u_34, p_u_35, p_u_36) -- name: startStepping
				-- upvalues: (ref) v_u_21, (ref) v_u_22, (ref) v_u_23, (ref) v_u_24, (copy) v_u_33, (ref) v_u_20, (ref) v_u_7
				if p_u_34 ~= v_u_21 or (p_u_35 ~= v_u_22 or p_u_36 ~= v_u_23) then
					v_u_21 = nil
					v_u_22 = 0
					if v_u_24 then
						task.cancel(v_u_24)
						v_u_24 = nil
					end
					v_u_21 = p_u_34
					v_u_22 = p_u_35
					v_u_23 = p_u_36
					v_u_33(p_u_35, p_u_36)
					v_u_24 = task.spawn(function()
						-- upvalues: (ref) v_u_21, (copy) p_u_34, (ref) v_u_22, (copy) p_u_35, (ref) v_u_23, (copy) p_u_36, (ref) v_u_33, (ref) v_u_20, (ref) v_u_7
						task.wait(0.4)
						local v37 = 0
						while v_u_21 == p_u_34 and (v_u_22 == p_u_35 and v_u_23 == p_u_36) do
							v_u_33(p_u_35, p_u_36)
							v37 = v37 + 1
							local v38 = task.wait
							local v39 = v_u_20.current.step
							v38(v_u_7.FoundationSliderCapture and (v39 == nil or v39 <= 0) and (v37 >= 15 and 0.03 or (v37 >= 5 and 0.06 or 0.1)) or 0.1)
						end
					end)
				end
			end
			local function v48(p41) -- name: evaluateInput
				-- upvalues: (ref) v_u_7, (ref) v_u_10, (ref) v_u_20, (ref) v_u_14, (ref) p_u_18, (copy) v_u_40, (ref) v_u_25, (ref) v_u_26, (ref) v_u_21, (ref) v_u_22, (ref) v_u_24, (ref) v_u_6
				if v_u_7.FoundationSliderCapture then
					local v42 = p41.KeyCode
					if table.find(v_u_10.exit, v42) ~= nil then
						local v43 = v_u_20.current.handlers.onExit
						if v43 then
							v43()
						end
						return
					end
				end
				local v44 = v_u_14(p41.KeyCode, p_u_18)
				if v44 then
					v_u_40(p41, v44.sign, v44.size)
				elseif table.find(v_u_10.analogStep, p41.KeyCode) then
					local v45
					if p_u_18 then
						v45 = p41.Position.Y
					else
						v45 = p41.Position.X
					end
					if math.abs(v45) >= v_u_10.thumbstickDeadzone then
						local v46 = v45 > 0 and 1 or -1
						local v47
						if v_u_25 == 0 then
							v47 = false
						else
							v47 = v46 ~= v_u_25
						end
						v_u_26 = not v47 and 0 or v_u_26 + 1
						if not v_u_7.FoundationSliderCapture or (not v47 or v_u_26 >= 3) then
							v_u_25 = v46
							v_u_40(p41, v46, v_u_6.Step)
							return
						end
						if p41 ~= nil and p41 ~= v_u_21 then
							return
						end
						v_u_21 = nil
						v_u_22 = 0
						if v_u_24 then
							task.cancel(v_u_24)
							v_u_24 = nil
							return
						end
					else
						v_u_25 = 0
						v_u_26 = 0
						if p41 ~= nil and p41 ~= v_u_21 then
							return
						end
						v_u_21 = nil
						v_u_22 = 0
						if v_u_24 then
							task.cancel(v_u_24)
							v_u_24 = nil
						end
					end
				end
			end
			local function v50(p49) -- name: handleInputEnded
				-- upvalues: (ref) v_u_10, (ref) v_u_25, (ref) v_u_26, (ref) v_u_21, (ref) v_u_22, (ref) v_u_24
				if table.find(v_u_10.analogStep, p49.KeyCode) then
					v_u_25 = 0
					v_u_26 = 0
				end
				if p49 == nil or p49 == v_u_21 then
					v_u_21 = nil
					v_u_22 = 0
					if v_u_24 then
						task.cancel(v_u_24)
						v_u_24 = nil
					end
				end
			end
			local v_u_51 = { v_u_4.UserInputService.InputBegan:Connect(v48), v_u_4.UserInputService.InputChanged:Connect(v48), v_u_4.UserInputService.InputEnded:Connect(v50) }
			return function()
				-- upvalues: (ref) v_u_21, (ref) v_u_22, (ref) v_u_24, (copy) v_u_51
				v_u_21 = nil
				v_u_22 = 0
				if v_u_24 then
					task.cancel(v_u_24)
					v_u_24 = nil
				end
				for _, v52 in v_u_51 do
					v52:Disconnect()
				end
			end
		end
	end, { p_u_15, p_u_18 })
end