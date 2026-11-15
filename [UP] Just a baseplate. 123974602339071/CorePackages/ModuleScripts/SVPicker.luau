-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.SVPicker
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Enums.InputSize)
local v_u_5 = require(v1.Components.Knob)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Components.ColorPicker.colorUtils)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Utility.withCommonProps)
local v_u_10 = require(v1.Utility.withDefaults)
require(v1.Components.Types)
local v_u_11 = {
	["showSelectionKnob"] = true
}
return function(p12) -- name: SVPicker
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9, (copy) v_u_5, (copy) v_u_4
	local v13 = v_u_10(p12, v_u_11)
	local v14 = v13.hue
	local v15 = v13.saturation
	local v16 = v13.value
	local v_u_17 = v13.onChanged
	local v_u_18 = v13.onDragStarted
	local v19 = v13.onDragEnded
	local v20 = v_u_8()
	local v22 = v14:map(function(p21)
		return Color3.fromHSV(p21, 1, 1)
	end)
	local v_u_23 = v_u_3.useRef(nil)
	local v_u_28 = v_u_3.useCallback(function(p24)
		-- upvalues: (copy) v_u_23, (ref) v_u_7, (copy) v_u_17
		local v25 = v_u_23.current
		if v25 then
			local v26, v27 = v_u_7.calculateSVFromPosition(p24, v25.AbsolutePosition, v25.AbsoluteSize)
			v_u_17(v26, v27)
		end
	end, { v_u_17 })
	local v30 = v_u_3.useCallback(function(_, p29)
		-- upvalues: (copy) v_u_18, (copy) v_u_28
		if v_u_18 then
			v_u_18()
		end
		v_u_28(p29)
	end, { v_u_28, v_u_18 })
	local v32 = v_u_3.useCallback(function(_, p31)
		-- upvalues: (copy) v_u_28
		v_u_28(p31)
	end, { v_u_28 })
	local v33 = v_u_3.createElement
	local v34 = v_u_6
	local v35 = v_u_9(v13, {
		["tag"] = "size-full radius-small",
		["ref"] = nil,
		["ClipsDescendants"] = true,
		["ref"] = v_u_23
	})
	local v36 = {
		["DragDetector"] = v_u_3.createElement("UIDragDetector", {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.Scriptable,
			[v_u_3.Event.DragStart] = v30,
			[v_u_3.Event.DragContinue] = v32,
			[v_u_3.Event.DragEnd] = v19
		}),
		["Base"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["ZIndex"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundColor3"] = v20.Color.Extended.White.White_100.Color3
		}),
		["Saturation"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["ZIndex"] = 2,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundColor3"] = v22
		}, {
			["Gradient"] = v_u_3.createElement("UIGradient", {
				["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
			})
		}),
		["Value"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["ZIndex"] = 3,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundColor3"] = v20.Color.Extended.Black.Black_100.Color3
		}, {
			["Gradient"] = v_u_3.createElement("UIGradient", {
				["Rotation"] = 90,
				["Transparency"] = nil,
				["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
			})
		})
	}
	local v37
	if v13.showSelectionKnob then
		v37 = v_u_3.createElement(v_u_5, {
			["size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["style"] = nil,
			["stroke"] = nil,
			["hasShadow"] = true,
			["ZIndex"] = 4,
			["size"] = v_u_4.Medium,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = v_u_3.joinBindings({ v15, v16 }):map(function(p38)
				local v39 = p38[1]
				local v40 = p38[2]
				return UDim2.fromScale(v39, 1 - v40)
			end),
			["style"] = v_u_3.joinBindings({ v14, v15, v16 }):map(function(p41)
				local v42 = p41[1]
				local v43 = p41[2]
				local v44 = p41[3]
				return {
					["Color3"] = nil,
					["Transparency"] = 0,
					["Color3"] = Color3.fromHSV(v42, v43, v44)
				}
			end),
			["stroke"] = {
				["Color"] = v20.Color.System.Contrast.Color3,
				["Thickness"] = v20.Stroke.Thicker,
				["Transparency"] = v20.Color.System.Contrast.Transparency
			}
		})
	else
		v37 = nil
	end
	v36.Knob = v37
	return v33(v34, v35, v36)
end