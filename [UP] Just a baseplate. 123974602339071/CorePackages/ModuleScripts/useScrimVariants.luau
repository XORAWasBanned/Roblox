-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OverflowScrollContainer.useScrimVariants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons).Icon
local v_u_4 = require(v1.Utility.getBuilderIconForKeycode)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local v_u_6 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.25, 0), NumberSequenceKeypoint.new(1, 1) })
local v_u_7 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.4, 0), NumberSequenceKeypoint.new(1, 1) })
local v_u_8 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.75, 0), NumberSequenceKeypoint.new(1, 0) })
local v_u_9 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.6, 0), NumberSequenceKeypoint.new(1, 0) })
local function v_u_16(p10) -- name: variantsFactory
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v11 = p10.Size.Size_1000
	local v12 = {}
	local v13 = {
		[true] = v_u_9,
		[false] = v_u_8
	}
	v12[Enum.HorizontalAlignment.Right] = v13
	local v14 = {
		[true] = v_u_7,
		[false] = v_u_6
	}
	v12[Enum.HorizontalAlignment.Left] = v14
	local v15 = {
		[Enum.HorizontalAlignment.Right] = {
			[Enum.PreferredInput.Gamepad] = v_u_4(Enum.KeyCode.ButtonR1) or v_u_3.ChevronSmallRight,
			[Enum.PreferredInput.KeyboardAndMouse] = v_u_3.ChevronSmallRight,
			[Enum.PreferredInput.Touch] = v_u_3.ChevronSmallRight
		},
		[Enum.HorizontalAlignment.Left] = {
			[Enum.PreferredInput.Gamepad] = v_u_4(Enum.KeyCode.ButtonL1) or v_u_3.ChevronSmallLeft,
			[Enum.PreferredInput.KeyboardAndMouse] = v_u_3.ChevronSmallLeft,
			[Enum.PreferredInput.Touch] = v_u_3.ChevronSmallLeft
		}
	}
	return {
		["fade"] = v11,
		["directionIcon"] = v15,
		["gradient"] = v12,
		["iconAlignmentTag"] = {
			[Enum.HorizontalAlignment.Right] = "anchor-center-right position-center-right",
			[Enum.HorizontalAlignment.Left] = "anchor-center-left position-center-left"
		}
	}
end
return function(p17, p18, p19)
	-- upvalues: (copy) v_u_5, (copy) v_u_16
	local v20 = v_u_5.useVariants("OverflowScrollContainerScrim", v_u_16, p17)
	return {
		["fade"] = v20.fade,
		["gradient"] = v20.gradient[p18][false],
		["hoverGradient"] = v20.gradient[p18][true],
		["directionIcon"] = v20.directionIcon[p18][p19],
		["iconAlignmentTag"] = v20.iconAlignmentTag[p18]
	}
end