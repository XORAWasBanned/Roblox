-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Progress.ProgressBar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.constants)
local v_u_5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Utility.getTestIdTag)
local v_u_9 = require(v1.Utility.mapBindable)
local v_u_10 = require(v1.Providers.Preferences.usePreferences)
local v_u_11 = require(script.Parent.useProgressBinding)
local v_u_12 = require(script.Parent.useProgressVariants)
local v_u_13 = require(v1.Utility.usePulseBinding)
local v_u_14 = require(v1.Utility.useRotation)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
require(v1.Enums.ProgressShape)
local v_u_18 = require(v1.Enums.ProgressSize)
local function v_u_27(p19) -- name: getBarSequenceFromProgress
	local v20 = p19 or 0
	if v20 == 0 then
		return NumberSequence.new(1)
	end
	if v20 == 1 then
		return NumberSequence.new(0)
	end
	local v21 = {}
	local v22 = NumberSequenceKeypoint.new(0, 0)
	local v23 = NumberSequenceKeypoint.new(v20, 0)
	local v24 = NumberSequenceKeypoint.new
	local v25 = v20 + 0.001
	__set_list(v21, 1, {v22, v23, v24(math.min(v25, 1), 1)})
	if v20 < 0.999 then
		local v26 = NumberSequenceKeypoint.new
		table.insert(v21, v26(1, 1))
	end
	return NumberSequence.new(v21)
end
local function v_u_29(p28) -- name: getFillSizeFromProgress
	return UDim2.fromScale(p28 or 0, 1)
end
local function v_u_33(p30, p31, p32) -- name: getIndeterminateShimmerTransparency
	if p31 then
		return NumberSequence.new(p30)
	else
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(0.2, 1),
			NumberSequenceKeypoint.new(0.5, p32),
			NumberSequenceKeypoint.new(0.8, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	end
end
local function v_u_36(p34, p35) -- name: getIndeterminateShimmerOffset
	-- upvalues: (copy) v_u_4
	if p35 then
		return Vector2.new(0, 0)
	else
		return Vector2.new(p34 * v_u_4.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
	end
end
local function v_u_42(p_u_37) -- name: ProgressBarIndeterminateGradient
	-- upvalues: (copy) v_u_14, (copy) v_u_13, (copy) v_u_4, (copy) v_u_3, (copy) v_u_33, (copy) v_u_36, (copy) v_u_8
	local v38 = v_u_14(1)
	local v39 = v_u_13(1 / v_u_4.INDETERMINATE_SHIMMER_SPEED)
	return v_u_3.createElement("UIGradient", {
		["Color"] = ColorSequence.new(p_u_37.emphasisColor3),
		["Transparency"] = v39:map(function(p40)
			-- upvalues: (ref) v_u_33, (copy) p_u_37
			return v_u_33(p40, p_u_37.reducedMotion, p_u_37.emphasisTransparency)
		end),
		["Offset"] = v38:map(function(p41)
			-- upvalues: (ref) v_u_36, (copy) p_u_37
			return v_u_36(p41, p_u_37.reducedMotion)
		end),
		[v_u_3.Tag] = v_u_8(p_u_37.testId)
	})
end
local v_u_43 = {
	["size"] = nil,
	["width"] = nil,
	["showLabel"] = false,
	["minValueLabel"] = "0",
	["maxValueLabel"] = "100",
	["size"] = v_u_18.Medium,
	["width"] = UDim.new(1, 0)
}
return function(p44) -- name: ProgressBar
	-- upvalues: (copy) v_u_17, (copy) v_u_43, (copy) v_u_15, (copy) v_u_10, (copy) v_u_12, (copy) v_u_5, (copy) v_u_18, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13, (copy) v_u_4, (copy) v_u_9, (copy) v_u_27, (copy) v_u_3, (copy) v_u_7, (copy) v_u_16, (copy) v_u_29, (copy) v_u_42, (copy) v_u_6
	local v45 = v_u_17(p44, v_u_43)
	local v_u_46 = v_u_15()
	local v_u_47 = v_u_10()
	local v48 = v_u_12
	local v49
	if v_u_5.FoundationProgressBarBetaUpdate then
		if v45.size == v_u_18.Small then
			v49 = v_u_18.Small
		else
			v49 = v_u_18.Medium
		end
	else
		v49 = v45.size
	end
	local v50 = v48(v_u_46, v49)
	local v51, v52 = v_u_11(v45.value)
	local v53 = v_u_14(1)
	local v54 = v_u_13(1 / v_u_4.INDETERMINATE_SHIMMER_SPEED)
	local v55 = v_u_9(v51, v_u_27)
	local v56 = v_u_3.createElement
	local v57 = v_u_7
	local v58 = v_u_16
	local v59 = {
		["tag"] = v_u_5.FoundationProgressBarBetaUpdate and "col gap-xsmall size-full-0 auto-y" or "radius-small bg-shift-400"
	}
	local v60
	if v_u_5.FoundationProgressBarBetaUpdate then
		v60 = UDim2.new(v45.width, UDim.new(0, 0))
	else
		v60 = UDim2.new(v45.width, UDim.new(0, v50.bar.height))
	end
	v59.Size = v60
	v59.ref = v45.ref
	local v61 = v58(v45, v59)
	local v62
	if v_u_5.FoundationProgressBarBetaUpdate then
		v62 = {}
		local v63 = v_u_3.createElement
		local v64 = v_u_7
		local v65 = {
			["Size"] = nil,
			["cornerRadius"] = nil,
			["tag"] = "size-full-0 clip bg-shift-400",
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Size"] = UDim2.new(UDim.new(1, 0), UDim.new(0, v50.bar.height)),
			["cornerRadius"] = UDim.new(0, v_u_46.Radius.Circle),
			["testId"] = ("%*--track"):format(v45.testId)
		}
		local v66 = {}
		local v67 = v_u_3.createElement
		local v68 = v_u_7
		local v69 = {
			["backgroundStyle"] = v_u_46.Color.Content.Emphasis,
			["cornerRadius"] = UDim.new(0, v_u_46.Radius.Circle)
		}
		local v70
		if v52 then
			v70 = UDim2.fromScale(1, 1)
		else
			v70 = v_u_9(v51, v_u_29)
		end
		v69.Size = v70
		v69.tag = v52 and "size-full" or nil
		v69.testId = ("%*--fill"):format(v45.testId)
		v66.Fill = v67(v68, v69, v52 and {
			["Gradient"] = v_u_3.createElement(v_u_42, {
				["emphasisColor3"] = v_u_46.Color.Content.Emphasis.Color3,
				["emphasisTransparency"] = v_u_46.Color.Content.Emphasis.Transparency,
				["reducedMotion"] = v_u_47.reducedMotion,
				["testId"] = ("%*--fill--gradient"):format(v45.testId)
			})
		} or nil)
		v62.Track = v63(v64, v65, v66)
		local v71
		if v45.showLabel and not v52 then
			v71 = v_u_3.createElement(v_u_7, {
				["tag"] = "row size-full-0 auto-y",
				["LayoutOrder"] = 2,
				["testId"] = nil,
				["testId"] = ("%*--labels"):format(v45.testId)
			}, {
				["MinValue"] = v_u_3.createElement(v_u_6, {
					["Text"] = nil,
					["tag"] = "fill auto-xy text-label-medium text-align-x-left content-default",
					["LayoutOrder"] = 1,
					["testId"] = nil,
					["Text"] = v45.minValueLabel,
					["testId"] = ("%*--label-min"):format(v45.testId)
				}),
				["MaxValue"] = v_u_3.createElement(v_u_6, {
					["Text"] = nil,
					["tag"] = "fill auto-xy text-label-medium text-align-x-right content-default",
					["LayoutOrder"] = 2,
					["testId"] = nil,
					["Text"] = v45.maxValueLabel,
					["testId"] = ("%*--label-max"):format(v45.testId)
				})
			})
		else
			v71 = nil
		end
		v62.Labels = v71
	else
		v62 = {}
		local v72 = v_u_3.createElement
		local v73 = v_u_7
		local v74 = {
			["backgroundStyle"] = nil,
			["tag"] = "size-full radius-small",
			["ref"] = nil,
			["testId"] = nil,
			["backgroundStyle"] = v_u_46.Color.Content.Emphasis,
			["ref"] = v45.ref,
			["testId"] = ("%*--fill"):format(v45.testId)
		}
		local v75 = {}
		local v76 = v_u_3.createElement
		local v77 = "UIGradient"
		local v78 = {
			["Color"] = ColorSequence.new(v_u_46.Color.Content.Emphasis.Color3)
		}
		if v52 then
			v55 = v54:map(function(p79)
				-- upvalues: (copy) v_u_47, (copy) v_u_46
				if v_u_47.reducedMotion then
					return NumberSequence.new(p79)
				else
					return NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.2, 1),
						NumberSequenceKeypoint.new(0.5, v_u_46.Color.Content.Emphasis.Transparency),
						NumberSequenceKeypoint.new(0.8, 1),
						NumberSequenceKeypoint.new(1, 1)
					})
				end
			end)
		end
		v78.Transparency = v55
		local v80
		if v52 then
			v80 = v53:map(function(p81)
				-- upvalues: (copy) v_u_47, (ref) v_u_4
				if v_u_47.reducedMotion then
					return Vector2.new(0, 0)
				else
					return Vector2.new(p81 * v_u_4.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
				end
			end)
		else
			v80 = nil
		end
		v78.Offset = v80
		v75.Gradient = v76(v77, v78)
		v62.Fill = v72(v73, v74, v75)
	end
	return v56(v57, v61, v62)
end