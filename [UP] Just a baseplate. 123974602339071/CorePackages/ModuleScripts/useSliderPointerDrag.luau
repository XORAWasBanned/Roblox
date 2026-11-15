-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalSlider.useSliderPointerDrag
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Input.InputMode)
local v_u_5 = require(v1.Utility.Input.getInputMode)
local v_u_6 = require(v1.Utility.Wrappers.Services).UserInputService
local v_u_7 = require(v1.Components.Slider.calculateSliderFraction)
local v_u_8 = require(v1.Components.Slider.getGuiInputPosition)
require(script.Parent.useSliderThumbs)
local function v_u_18(p9, p10) -- name: getNearestThumbIndex
	local v11 = p10[1] - p9
	local v12 = math.abs(v11)
	local v13 = 1
	for v14 = 2, #p10 do
		local v15 = p10[v14] - p9
		local v16 = math.abs(v15)
		local v17
		if p10[v14] == p10[v13] then
			v17 = p10[v14] < p9
		else
			v17 = false
		end
		if v16 >= v12 and not v17 then
			continue
		end
		v12 = v16
		v13 = v14
	end
	return v13
end
return function(p_u_19) -- name: useSliderPointerDrag
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_18
	local v20, v_u_21 = v_u_3.useState(nil)
	local v_u_22 = v_u_3.useRef(nil)
	local v_u_24 = v_u_3.useCallback(function(p23)
		-- upvalues: (copy) v_u_21, (copy) p_u_19
		v_u_21(p23)
		p_u_19.setActiveIndex(p23)
		if p_u_19.onDragStarted then
			p_u_19.onDragStarted()
		end
	end, { p_u_19.setActiveIndex, p_u_19.onDragStarted })
	local v_u_25 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_21, (copy) p_u_19
		v_u_21(nil)
		if p_u_19.onDragEnded then
			p_u_19.onDragEnded()
		end
	end, { p_u_19.onDragEnded })
	local v_u_28 = v_u_3.useCallback(function(p26)
		-- upvalues: (copy) p_u_19, (ref) v_u_7, (ref) v_u_8
		local v27 = p_u_19.rootRef.current
		if v27 then
			return v_u_7(v_u_8(p26, v27), v27, p_u_19.isVertical)
		else
			return nil
		end
	end, { p_u_19.isVertical, p_u_19.rootRef })
	return {
		["draggedIndex"] = v20,
		["onThumbDragStarted"] = v_u_24,
		["onThumbDragEnded"] = v_u_25,
		["onTrackDragStarted"] = v_u_3.useCallback(function(_, p29)
			-- upvalues: (copy) v_u_28, (ref) v_u_5, (ref) v_u_6, (ref) v_u_4, (copy) p_u_19, (ref) v_u_18, (copy) v_u_22, (copy) v_u_24
			local v30 = v_u_28(p29)
			if v_u_5(v_u_6:GetLastInputType()) ~= v_u_4.Directional and v30 ~= nil then
				local v31 = {}
				for v32, v33 in p_u_19.thumbs do
					v31[v32] = p_u_19.toFraction(v33.value:getValue())
				end
				local v34 = v_u_18(v30, v31)
				v_u_22.current = v34
				v_u_24(v34)
				p_u_19.seekThumb(v34, v30)
			end
		end, {
			v_u_28,
			p_u_19.thumbs,
			p_u_19.toFraction,
			v_u_24,
			p_u_19.seekThumb
		}),
		["onTrackDrag"] = v_u_3.useCallback(function(_, p35)
			-- upvalues: (copy) v_u_22, (copy) v_u_28, (copy) p_u_19
			local v36 = v_u_22.current
			local v37 = v_u_28(p35)
			if v36 ~= nil and v37 ~= nil then
				p_u_19.seekThumb(v36, v37)
			end
		end, { v_u_28, p_u_19.seekThumb }),
		["onTrackDragEnded"] = v_u_3.useCallback(function()
			-- upvalues: (copy) v_u_22, (copy) v_u_25
			if v_u_22.current ~= nil then
				v_u_22.current = nil
				v_u_25()
			end
		end, { v_u_25 })
	}
end