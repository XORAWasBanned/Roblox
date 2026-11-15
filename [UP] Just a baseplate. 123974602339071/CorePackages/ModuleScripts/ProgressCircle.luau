-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Progress.ProgressCircle
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.constants)
local v_u_5 = require(v1.Components.Image)
local v_u_6 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Utility.mapBindable)
local v_u_9 = require(v1.Providers.Preferences.usePreferences)
local v_u_10 = require(script.Parent.useProgressBinding)
local v_u_11 = require(script.Parent.useProgressVariants)
local v_u_12 = require(v1.Utility.usePulseBinding)
local v_u_13 = require(v1.Utility.useRotation)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Utility.withCommonProps)
local v_u_16 = require(v1.Utility.withDefaults)
require(v1.Enums.ProgressShape)
local v_u_17 = {
	["size"] = require(v1.Enums.ProgressSize).Medium
}
local function v_u_20(p18) -- name: getLabelFromProgress
	if p18 == nil then
		return "0%"
	end
	local v19 = p18 * 100
	return ("%*%%"):format((math.floor(v19)))
end
local function v_u_22(p21) -- name: getCapAngleFromProgress
	return math.clamp(p21 or 0, 0, 1) * 360
end
local function v_u_24(p23) -- name: hasVisibleArc
	return (p23 or 0) > 0
end
local function v_u_31(p25) -- name: ArcCap
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_7
	local v26 = v_u_14()
	local v27 = v_u_3.createElement
	local v28 = v_u_7
	local v29 = {
		["Size"] = nil,
		["Rotation"] = nil,
		["Visible"] = nil,
		["ZIndex"] = 2,
		["testId"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Rotation"] = p25.angle,
		["Visible"] = p25.isVisible,
		["testId"] = p25.testId
	}
	local v30 = {
		["Cap"] = v_u_3.createElement(v_u_7, {
			["Position"] = nil,
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["tag"] = "anchor-center-center radius-circle",
			["ZIndex"] = 2,
			["Position"] = UDim2.fromScale(0.5, 0.04310344827586207),
			["Size"] = UDim2.fromScale(0.08620689655172414, 0.08620689655172414),
			["backgroundStyle"] = v26.Color.Content.Emphasis
		})
	}
	return v27(v28, v29, v30)
end
local function v_u_37(p32) -- name: ArcCaps
	-- upvalues: (copy) v_u_8, (copy) v_u_24, (copy) v_u_3, (copy) v_u_31, (copy) v_u_22
	local v33 = v_u_8(p32.progress, v_u_24)
	local v34 = v_u_3.createElement
	local v35 = v_u_3.Fragment
	local v36 = {
		["StartCap"] = v_u_3.createElement(v_u_31, {
			["angle"] = 0,
			["isVisible"] = nil,
			["testId"] = nil,
			["isVisible"] = v33,
			["testId"] = ("%*--start-cap"):format(p32.testId)
		}),
		["EndCap"] = v_u_3.createElement(v_u_31, {
			["angle"] = v_u_8(p32.progress, v_u_22),
			["isVisible"] = v33,
			["testId"] = ("%*--end-cap"):format(p32.testId)
		})
	}
	return v34(v35, {}, v36)
end
local function v_u_59(p38) -- name: ProgressGradient
	-- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_3, (copy) v_u_8
	local v_u_39 = p38.side
	local v_u_40 = p38.isIndeterminate
	local v41 = p38.progress
	local v42 = p38.pulse
	local v_u_43 = v_u_14()
	local v44 = v_u_9()
	local v47 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_43, (copy) v_u_40
		local v45 = v_u_43.Color.Content.Emphasis.Transparency
		local v46 = v_u_40 and 1 or v_u_43.Color.Shift.Shift_200.Transparency
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, v45),
			NumberSequenceKeypoint.new(0.4999, v45),
			NumberSequenceKeypoint.new(0.5, v46),
			NumberSequenceKeypoint.new(1, v46)
		})
	end, { v_u_43, v_u_40 })
	local v48 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_43
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0, v_u_43.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.4999, v_u_43.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.5, v_u_43.Color.Shift.Shift_200.Color3),
			ColorSequenceKeypoint.new(1, v_u_43.Color.Shift.Shift_200.Color3)
		})
	end, { v_u_43 })
	if v_u_40 and (v44.reducedMotion and v42) then
		return v_u_3.createElement("UIGradient", {
			["Transparency"] = v42:map(function(p49)
				-- upvalues: (copy) v_u_43
				local v50 = NumberSequence.new
				local v51 = v_u_43.Color.Content.Emphasis.Transparency
				local v52 = v_u_43.Color.Shift.Shift_200.Transparency
				return v50((math.lerp(v51, v52, p49)))
			end),
			["Color"] = v42:map(function(p53)
				-- upvalues: (copy) v_u_43
				return ColorSequence.new(v_u_43.Color.Content.Emphasis.Color3:Lerp(v_u_43.Color.Shift.Shift_200.Color3, p53))
			end),
			["Rotation"] = v_u_39 == Enum.HorizontalAlignment.Left and 0 or 180
		})
	else
		return v_u_3.createElement("UIGradient", {
			["Transparency"] = v47,
			["Color"] = v48,
			["Rotation"] = v_u_8(v41, function(p54)
				-- upvalues: (copy) v_u_39
				local v55 = v_u_39
				local v56 = v55 == Enum.HorizontalAlignment.Left and 180 or 0
				local v57 = v55 == Enum.HorizontalAlignment.Left and 360 or 180
				if p54 == nil then
					return 0
				end
				local v58 = p54 * 360
				return math.clamp(v58, v56, v57)
			end)
		})
	end
end
local function v_u_74(p60) -- name: ProgressRing
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_59, (copy) v_u_37
	local v61 = v_u_3.createElement
	local v62 = v_u_3.Fragment
	local v63 = {}
	local v64 = {}
	local v65 = v_u_3.createElement
	local v66 = v_u_7
	local v67 = {
		["Size"] = nil,
		["tag"] = "position-top-left clip",
		["testId"] = nil,
		["Size"] = UDim2.fromScale(0.5, 1),
		["testId"] = ("%*--left-gradient"):format(p60.testId)
	}
	local v68 = {
		["Image"] = v_u_3.createElement(v_u_5, {
			["Image"] = "rbxasset://textures/ui/Controls/RadialFill.png",
			["Size"] = nil,
			["tag"] = "position-top-left content-emphasis",
			["Size"] = UDim2.fromScale(2, 1)
		}, {
			["Gradient"] = v_u_3.createElement(v_u_59, {
				["side"] = Enum.HorizontalAlignment.Left,
				["isIndeterminate"] = p60.isIndeterminate,
				["progress"] = p60.progress,
				["pulse"] = p60.pulse
			})
		})
	}
	v64.LeftGradient = v65(v66, v67, v68)
	local v69 = v_u_3.createElement
	local v70 = v_u_7
	local v71 = {
		["Size"] = nil,
		["tag"] = "position-top-center clip",
		["testId"] = nil,
		["Size"] = UDim2.fromScale(0.5, 1),
		["testId"] = ("%*--right-gradient"):format(p60.testId)
	}
	local v72 = {
		["Image"] = v_u_3.createElement(v_u_5, {
			["Image"] = "rbxasset://textures/ui/Controls/RadialFill.png",
			["Size"] = nil,
			["Position"] = nil,
			["tag"] = "content-emphasis",
			["Size"] = UDim2.fromScale(2, 1),
			["Position"] = UDim2.fromScale(-1, 0)
		}, {
			["Gradient"] = v_u_3.createElement(v_u_59, {
				["side"] = Enum.HorizontalAlignment.Right,
				["isIndeterminate"] = p60.isIndeterminate,
				["progress"] = p60.progress,
				["pulse"] = p60.pulse
			})
		})
	}
	v64.RightGradient = v69(v70, v71, v72)
	local v73
	if p60.hasCaps then
		v73 = v_u_3.createElement(v_u_37, {
			["progress"] = p60.progress,
			["testId"] = p60.testId
		})
	else
		v73 = nil
	end
	v64.Caps = v73
	return v61(v62, v63, v64)
end
local function v_u_80(p75) -- name: SpinningRing
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_74
	local v76 = v_u_3.createElement
	local v77 = v_u_7
	local v78 = {
		["Size"] = p75.size,
		["Rotation"] = p75.rotation,
		["testId"] = ("%*--indeterminate-container"):format(p75.testId)
	}
	local v79 = {
		["Ring"] = v_u_3.createElement(v_u_74, {
			["progress"] = 0.8,
			["isIndeterminate"] = true,
			["hasCaps"] = nil,
			["testId"] = nil,
			["hasCaps"] = p75.hasCaps,
			["testId"] = p75.testId
		})
	}
	return v76(v77, v78, v79)
end
return function(p81) -- name: ProgressCircle
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_14, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_15, (copy) v_u_80, (copy) v_u_74, (copy) v_u_6, (copy) v_u_8, (copy) v_u_20
	local v82 = v_u_16(p81, v_u_17)
	local v83 = v_u_14()
	local v84 = v_u_9()
	local v85 = v_u_11(v83, v82.size)
	local v86, v87 = v_u_10(v82.value)
	local v88 = v_u_13(1)
	local v89 = v_u_12(1 / v_u_4.INDETERMINATE_SHIMMER_SPEED)
	local v90 = UDim2.fromOffset(v85.circle.size, v85.circle.size)
	if v87 and not v84.reducedMotion then
		return v_u_3.createElement(v_u_7, v_u_15(v82, {
			["tag"] = "auto-xy",
			["ref"] = nil,
			["ref"] = v82.ref
		}), {
			["IndeterminateContainer"] = v_u_3.createElement(v_u_80, {
				["size"] = nil,
				["rotation"] = nil,
				["hasCaps"] = true,
				["testId"] = nil,
				["size"] = v90,
				["rotation"] = v88,
				["testId"] = v82.testId
			})
		})
	end
	local v91 = v_u_3.createElement
	local v92 = v_u_7
	local v93 = v_u_15(v82, {
		["Size"] = v90,
		["ref"] = v82.ref
	})
	local v94 = {
		["Ring"] = v_u_3.createElement(v_u_74, {
			["progress"] = v86,
			["isIndeterminate"] = v87,
			["pulse"] = v89,
			["hasCaps"] = not v87,
			["testId"] = v82.testId
		})
	}
	local v95
	if v85.circle.labelFont and not v87 then
		v95 = v_u_3.createElement(v_u_6, {
			["Text"] = nil,
			["fontStyle"] = nil,
			["tag"] = "position-center-center anchor-center-center",
			["testId"] = nil,
			["Text"] = v_u_8(v86, v_u_20),
			["fontStyle"] = v85.circle.labelFont,
			["testId"] = ("%*--label"):format(v82.testId)
		})
	else
		v95 = nil
	end
	v94.ProgressLabel = v95
	return v91(v92, v93, v94)
end