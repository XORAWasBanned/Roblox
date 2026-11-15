-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OverflowScrollContainer.Scrim
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.Otter)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
local v5 = require(v1.Providers.Style.BackgroundStyleContext)
local v_u_6 = require(v1.Components.Icon)
require(v1.Enums.InputSize)
local v7 = require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_8 = require(v1.Components.View)
local v_u_9 = v5.useBackgroundStyle
local v_u_10 = require(v1.Enums.StateLayerAffordance)
local v_u_11 = require(script.Parent.useScrimVariants)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = {
	["easingStyle"] = v7.defaultTokens.Ease.StandardOut,
	["duration"] = v7.defaultTokens.Time.Time_200
}
local function v_u_24(p15, p16, p17) -- name: lerpNumberSequence
	local v18 = p15.Keypoints
	local v19 = p16.Keypoints
	local v20 = {}
	for v21, v22 in v18 do
		local v23 = v19[v21]
		v20[v21] = NumberSequenceKeypoint.new(v22.Time + (v23.Time - v22.Time) * p17, v22.Value + (v23.Value - v22.Value) * p17)
	end
	return NumberSequence.new(v20)
end
return function(p_u_25) -- name: Scrim
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_11, (copy) v_u_4, (copy) v_u_3, (copy) v_u_14, (copy) v_u_24, (copy) v_u_8, (copy) v_u_13, (copy) v_u_10, (copy) v_u_6
	local v26 = v_u_12()
	local v27 = v_u_9()
	local v_u_28 = v_u_11(v26, p_u_25.alignment, p_u_25.preferredInput)
	local v_u_29 = p_u_25.alignment == Enum.HorizontalAlignment.Right
	local v_u_30 = p_u_25.preferredInput == Enum.PreferredInput.Touch and true or p_u_25.preferredInput == Enum.PreferredInput.Gamepad
	local v31, v_u_32 = v_u_4.useAnimatedBinding(p_u_25.isHovered and 1 or 0)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_32, (ref) v_u_4, (copy) p_u_25, (ref) v_u_14
		v_u_32(v_u_4.ease(p_u_25.isHovered and 1 or 0, v_u_14))
	end, { p_u_25.isHovered })
	local v35 = v31:map(function(p33)
		-- upvalues: (copy) v_u_30, (copy) v_u_29
		if v_u_30 then
			return UDim2.fromScale(0.5, 0.5)
		end
		local v34 = v_u_29 and 1 or -1
		return UDim2.fromScale(0.5 + v34 * (1 - p33), 0.5)
	end)
	local v37 = p_u_25.rowHeight:map(function(p36)
		-- upvalues: (copy) v_u_28
		return UDim2.new(0, p36 + v_u_28.fade, 1, 0)
	end)
	local v39 = v31:map(function(p38)
		-- upvalues: (copy) v_u_30, (copy) v_u_28, (ref) v_u_24
		if v_u_30 then
			return v_u_28.hoverGradient
		else
			return v_u_24(v_u_28.gradient, v_u_28.hoverGradient, p38)
		end
	end)
	local v40, v_u_41 = v_u_4.useAnimatedBinding(p_u_25.isVisible and 0 or 1)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_41, (ref) v_u_4, (copy) p_u_25, (ref) v_u_14
		v_u_41(v_u_4.ease(p_u_25.isVisible and 0 or 1, v_u_14))
	end, { p_u_25.isVisible })
	return v_u_3.createElement(v_u_8, v_u_13(p_u_25, {
		["Size"] = v37,
		["GroupTransparency"] = v40
	}), {
		["Scrim"] = v_u_3.createElement(v_u_8, {
			["tag"] = "size-full",
			["backgroundStyle"] = nil,
			["onActivated"] = nil,
			["stateLayer"] = nil,
			["onStateChanged"] = nil,
			["isDisabled"] = nil,
			["selection"] = nil,
			["testId"] = nil,
			["backgroundStyle"] = v27,
			["onActivated"] = p_u_25.onActivated,
			["stateLayer"] = {
				["affordance"] = v_u_10.None
			},
			["onStateChanged"] = p_u_25.onStateChanged,
			["isDisabled"] = not p_u_25.isVisible,
			["selection"] = {
				["Selectable"] = false
			},
			["testId"] = ("%*--button"):format(p_u_25.testId)
		}, {
			["Gradient"] = v_u_3.createElement("UIGradient", {
				["Transparency"] = v39
			}),
			["DirectionIcon"] = v_u_3.createElement(v_u_8, {
				["tag"] = nil,
				["Size"] = nil,
				["aspectRatio"] = nil,
				["ZIndex"] = 2,
				["tag"] = v_u_28.iconAlignmentTag,
				["Size"] = UDim2.fromScale(0, 1),
				["aspectRatio"] = {
					["AspectRatio"] = 1,
					["AspectType"] = nil,
					["DominantAxis"] = nil,
					["AspectType"] = Enum.AspectType.ScaleWithParentSize,
					["DominantAxis"] = Enum.DominantAxis.Height
				}
			}, {
				["Icon"] = v_u_3.createElement(v_u_6, {
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = v35,
					["size"] = p_u_25.size,
					["name"] = v_u_28.directionIcon,
					["testId"] = ("%*--direction-indicator"):format(p_u_25.testId)
				})
			})
		})
	})
end