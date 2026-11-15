-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ColorPicker.ColorSlider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Providers.Style.useTokens)
local v_u_5 = require(v1.Components.Image)
local v_u_6 = require(v1.Components.Knob)
local v_u_7 = require(v1.Components.Slider)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Enums.ColorSliderType)
local v_u_10 = require(v1.Enums.InputSize)
local v_u_11 = require(v1.Enums.SliderVariant)
local v_u_12 = require(v1.Enums.Visibility)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)),
	ColorSequenceKeypoint.new(0.16666666666666666, Color3.new(1, 1, 0)),
	ColorSequenceKeypoint.new(0.3333333333333333, Color3.new(0, 1, 0)),
	ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 1)),
	ColorSequenceKeypoint.new(0.6666666666666666, Color3.new(0, 0, 1)),
	ColorSequenceKeypoint.new(0.8333333333333334, Color3.new(1, 0, 1)),
	ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
})
local function v_u_17(p16) -- name: createAlphaGradient
	return ColorSequence.new({ ColorSequenceKeypoint.new(0, p16), ColorSequenceKeypoint.new(1, p16) })
end
local v_u_18 = {
	["sliderType"] = v_u_9.Hue,
	["baseColor"] = v_u_3.createBinding(Color3.new(1, 1, 1))
}
return function(p19) -- name: ColorSlider
	-- upvalues: (copy) v_u_14, (copy) v_u_18, (copy) v_u_4, (copy) v_u_9, (copy) v_u_15, (copy) v_u_17, (copy) v_u_3, (copy) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_6, (copy) v_u_8, (copy) v_u_13, (copy) v_u_5
	local v20 = v_u_14(p19, v_u_18)
	local v21 = v_u_4()
	local v22 = v20.sliderType
	local v23 = v20.value
	local v24 = v20.onValueChanged
	local v25
	if v22 == v_u_9.Hue then
		v25 = v_u_15
	else
		v25 = v20.baseColor:map(v_u_17)
	end
	local v26 = nil
	local v27 = nil
	if v22 == v_u_9.Hue then
		v26 = v23:map(function(p28)
			return {
				["Color3"] = nil,
				["Transparency"] = 0,
				["Color3"] = Color3.fromHSV(p28, 1, 1)
			}
		end)
	elseif v22 == v_u_9.Alpha then
		v27 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
		v26 = v_u_3.joinBindings({
			["baseColor"] = v20.baseColor,
			["value"] = v23
		}):map(function(p29)
			return {
				["Color3"] = p29.baseColor,
				["Transparency"] = 1 - p29.value
			}
		end)
	end
	local v30 = v22 == v_u_9.Alpha
	local v31 = v_u_3.createElement(v_u_7, {
		["value"] = nil,
		["onValueChanged"] = nil,
		["onDragStarted"] = nil,
		["onDragEnded"] = nil,
		["size"] = nil,
		["variant"] = nil,
		["isContained"] = true,
		["width"] = nil,
		["knobVisibility"] = nil,
		["knob"] = nil,
		["value"] = v23,
		["onValueChanged"] = v24,
		["onDragStarted"] = v20.onDragStarted,
		["onDragEnded"] = v20.onDragEnded,
		["size"] = v_u_10.Medium,
		["variant"] = v_u_11.Utility,
		["width"] = UDim.new(1, 0),
		["knobVisibility"] = v_u_12.Always,
		["knob"] = v_u_3.createElement(v_u_6, {
			["size"] = nil,
			["style"] = nil,
			["stroke"] = nil,
			["hasShadow"] = true,
			["size"] = v_u_10.Small,
			["style"] = v26,
			["stroke"] = {
				["Color"] = v21.Color.System.Contrast.Color3,
				["Thickness"] = v21.Stroke.Thicker,
				["Transparency"] = v21.Color.System.Contrast.Transparency
			}
		})
	})
	if not v30 then
		return v_u_3.createElement(v_u_8, v_u_13(v20, {
			["tag"] = "row align-y-center size-full-300 stroke-standard stroke-emphasis radius-circle",
			["backgroundStyle"] = nil,
			["backgroundStyle"] = v21.Color.Extended.White.White_100
		}), {
			["Gradient"] = v_u_3.createElement("UIGradient", {
				["Color"] = v25
			}),
			["Slider"] = v31
		})
	end
	local v32 = v_u_3.createElement
	local v33 = v_u_8
	local v34 = v_u_13(v20, {
		["tag"] = "size-full-300"
	})
	local v35 = {
		["Background"] = v_u_3.createElement(v_u_8, {
			["tag"] = "size-full stroke-standard stroke-emphasis radius-circle",
			["ClipsDescendants"] = true,
			["ZIndex"] = 1
		}, {
			["Checkerboard"] = v_u_3.createElement(v_u_5, {
				["Image"] = "component_assets/checkerboard_12",
				["ScaleType"] = nil,
				["TileSize"] = nil,
				["cornerRadius"] = nil,
				["tag"] = "size-full",
				["ZIndex"] = 1,
				["ScaleType"] = Enum.ScaleType.Tile,
				["TileSize"] = UDim2.fromOffset(v21.Size.Size_300, v21.Size.Size_300),
				["cornerRadius"] = UDim.new(1, 0)
			}),
			["GradientOverlay"] = v_u_3.createElement(v_u_8, {
				["tag"] = "size-full",
				["backgroundStyle"] = nil,
				["cornerRadius"] = nil,
				["ZIndex"] = 2,
				["backgroundStyle"] = {
					["Color3"] = nil,
					["Transparency"] = 0,
					["Color3"] = Color3.new(1, 1, 1)
				},
				["cornerRadius"] = UDim.new(1, 0)
			}, {
				["Gradient"] = v_u_3.createElement("UIGradient", {
					["Color"] = v25,
					["Transparency"] = v27
				})
			})
		}),
		["SliderContainer"] = v_u_3.createElement(v_u_8, {
			["tag"] = "row align-y-center size-full",
			["ZIndex"] = 2
		}, {
			["Slider"] = v31
		})
	}
	return v32(v33, v34, v35)
end