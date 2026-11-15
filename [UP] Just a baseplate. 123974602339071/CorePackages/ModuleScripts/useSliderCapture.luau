-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalSlider.useSliderCapture
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Utility.Wrappers.Services)
local v_u_5 = v4.GuiService
local v_u_6 = v4.RunService
local v_u_7 = require(v1.Enums.ControlState)
local v_u_8 = require(v1.Components.Slider.getSelectionEntryDirection)
local v_u_9 = require(v1.Components.Slider.useSliderCaptureKeys)
local v_u_10 = require(script.Parent.useSliderDirectionalInput)
require(script.Parent.useSliderThumbs)
return function(p_u_11) -- name: useSliderCapture
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_5, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8
	local v_u_12 = #p_u_11.thumbs
	local v13, v_u_14 = v_u_3.useState(v_u_7.Initialize)
	local v_u_15, v_u_16 = v_u_3.useState(false)
	local v17, v_u_18 = v_u_3.useState(1)
	local v_u_19 = math.min(v17, v_u_12)
	local v_u_20 = v_u_3.useRef(nil)
	local v_u_21 = v_u_3.useRef(nil)
	local v_u_22 = v_u_3.useRef(false)
	local v23 = v_u_15 or (v13 == v_u_7.Selected and true or v13 == v_u_7.SelectedPressed)
	local v24 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_15, (copy) v_u_16, (copy) v_u_12, (copy) v_u_18, (copy) v_u_19
		if v_u_15 then
			if v_u_12 > 1 then
				v_u_18(v_u_19 % v_u_12 + 1)
			end
		else
			v_u_16(true)
		end
	end, { v_u_15, v_u_12, v_u_19 })
	local v25 = v_u_9
	local v26
	if v23 then
		v26 = not p_u_11.isDisabled
	else
		v26 = v23
	end
	v25(v26, v24)
	local v_u_27 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_5, (copy) v_u_20
		v_u_16(false)
		v_u_5.SelectedObject = v_u_20.current
	end, {})
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_11, (copy) v_u_16
		if p_u_11.isDisabled then
			v_u_16(false)
		end
	end, { p_u_11.isDisabled })
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_5, (copy) p_u_11, (copy) v_u_20, (copy) v_u_21
		local function v30() -- name: redirectDragSelection
			-- upvalues: (ref) v_u_5, (ref) p_u_11, (ref) v_u_20, (ref) v_u_21
			local v28 = v_u_5.SelectedObject
			local v29 = v28 ~= p_u_11.rootRef.current and (v28 ~= nil and (p_u_11.rootRef.current ~= nil and v28:IsDescendantOf(p_u_11.rootRef.current)))
			if v29 then
				if v28 == v_u_20.current then
					v29 = false
				else
					v29 = v28 ~= v_u_21.current
				end
			end
			if v29 then
				v_u_5.SelectedObject = v_u_20.current
			end
		end
		local v31 = v_u_5.SelectedObject
		local v32 = v31 ~= p_u_11.rootRef.current and (v31 ~= nil and p_u_11.rootRef.current ~= nil and v31:IsDescendantOf(p_u_11.rootRef.current))
		if v32 then
			if v31 == v_u_20.current then
				v32 = false
			else
				v32 = v31 ~= v_u_21.current
			end
		end
		if v32 then
			v_u_5.SelectedObject = v_u_20.current
		end
		local v_u_33 = v_u_5:GetPropertyChangedSignal("SelectedObject"):Connect(v30)
		return function()
			-- upvalues: (copy) v_u_33
			v_u_33:Disconnect()
		end
	end, { p_u_11.rootRef })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_15, (copy) v_u_21, (ref) v_u_5, (ref) v_u_6, (copy) v_u_16, (copy) v_u_20
		if v_u_15 then
			local v_u_34 = v_u_21.current
			v_u_5.SelectedObject = v_u_34
			local v_u_35 = nil
			if v_u_5.SelectedObject ~= v_u_34 then
				local v_u_36 = 0
				local v37 = v_u_6.Heartbeat:Connect(function()
					-- upvalues: (ref) v_u_36, (ref) v_u_5, (copy) v_u_34, (ref) v_u_35
					v_u_36 = v_u_36 + 1
					v_u_5.SelectedObject = v_u_34
					if (v_u_5.SelectedObject == v_u_34 or v_u_36 >= 10) and v_u_35 then
						v_u_35:Disconnect()
						v_u_35 = nil
					end
				end)
				v_u_35 = v37
			end
			local v_u_38 = v_u_5:GetPropertyChangedSignal("SelectedObject"):Connect(function()
				-- upvalues: (ref) v_u_5, (ref) v_u_21, (ref) v_u_35, (ref) v_u_16
				if v_u_5.SelectedObject ~= v_u_21.current and v_u_35 == nil then
					v_u_16(false)
				end
			end)
			return function()
				-- upvalues: (copy) v_u_38, (ref) v_u_35, (copy) v_u_34, (ref) v_u_5, (ref) v_u_20
				v_u_38:Disconnect()
				if v_u_35 then
					v_u_35:Disconnect()
				end
				if v_u_34 ~= nil and v_u_5.SelectedObject == v_u_34 then
					v_u_5.SelectedObject = v_u_20.current
				end
			end
		end
	end, { v_u_15 })
	local v40 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_11, (copy) v_u_19, (copy) v_u_27
		return {
			["getValue"] = function() -- name: getValue
				-- upvalues: (ref) p_u_11, (ref) v_u_19
				return p_u_11.thumbs[v_u_19].value:getValue()
			end,
			["onStep"] = function(p39) -- name: onStep
				-- upvalues: (ref) p_u_11, (ref) v_u_19
				p_u_11.updateThumbValue(v_u_19, p_u_11.clampToNeighbors(v_u_19, p39))
			end,
			["onExit"] = v_u_27
		}
	end, {
		p_u_11.thumbs,
		v_u_19,
		p_u_11.updateThumbValue,
		p_u_11.clampToNeighbors,
		v_u_27
	})
	local v41 = v_u_10
	local v42
	if v_u_15 then
		v42 = not p_u_11.isDisabled
	else
		v42 = v_u_15
	end
	v41(v42, p_u_11.step, p_u_11.range, p_u_11.isVertical, v40)
	return {
		["controlState"] = v13,
		["isCaptured"] = v_u_15,
		["isSelected"] = v23,
		["activeThumbIndex"] = v_u_19,
		["setActiveIndex"] = v_u_18,
		["onStateChanged"] = v_u_3.useCallback(function(p43)
			-- upvalues: (copy) v_u_14, (ref) v_u_7, (copy) v_u_12, (copy) v_u_22, (copy) v_u_18, (ref) v_u_8, (copy) p_u_11
			v_u_14(p43)
			local v44 = p43 == v_u_7.Selected and true or p43 == v_u_7.SelectedPressed
			if v_u_12 > 1 and (v44 and not v_u_22.current) then
				v_u_18(v_u_8(p_u_11.isVertical) >= 0 and 1 or v_u_12)
			end
			v_u_22.current = v44
		end, { v_u_12, p_u_11.isVertical }),
		["focusTargetRef"] = v_u_20,
		["captureTargetRef"] = v_u_21
	}
end