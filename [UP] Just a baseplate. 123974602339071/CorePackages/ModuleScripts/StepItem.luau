-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Stepper.StepItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.FillBehavior)
local v_u_6 = require(v1.Components.Icon)
require(v1.Enums.InputSize)
local v_u_7 = require(v1.Enums.StepperStepState)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = require(script.Parent.useStepperVariants)
local v_u_12 = v3.Icon
local v_u_13 = v3.IconVariant
return v_u_4.memo(v_u_4.forwardRef(function(p14, p15) -- name: StepItem
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_11, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_12, (copy) v_u_13, (copy) v_u_8
	local v16 = v_u_10()
	local v17 = p14.fillBehavior == v_u_5.Fill
	local v18 = v_u_11(v16, p14.size, p14.stepState, v17)
	local v19 = v_u_4.createElement
	local v20 = v_u_9
	local v21 = {
		["tag"] = v18.container.tag,
		["testId"] = p14.testId,
		["LayoutOrder"] = p14.LayoutOrder
	}
	local v22 = {
		["Measure"] = v_u_4.createElement(v_u_9, {
			["LayoutOrder"] = 1,
			["tag"] = "size-full",
			["ref"] = nil,
			["ref"] = p15
		})
	}
	local v23 = v_u_4.createElement
	local v24 = v_u_9
	local v25 = {
		["LayoutOrder"] = 2,
		["tag"] = nil,
		["padding"] = nil,
		["testId"] = nil,
		["tag"] = v18.content.tag,
		["padding"] = v18.content.padding,
		["testId"] = ("%*--content"):format(p14.testId)
	}
	local v26 = {}
	local v27 = v_u_4.createElement
	local v28 = v_u_9
	local v29 = {
		["LayoutOrder"] = 1,
		["tag"] = nil,
		["testId"] = nil,
		["tag"] = v18.indicatorOuter.tag,
		["testId"] = ("%*--indicator-outer"):format(p14.testId)
	}
	local v30 = {}
	local v31 = v_u_4.createElement
	local v32 = v_u_9
	local v33 = {
		["tag"] = v18.indicatorInner.tag,
		["testId"] = ("%*--indicator"):format(p14.testId)
	}
	local v34 = {}
	local v35
	if p14.stepState == v_u_7.Complete then
		v35 = v_u_4.createElement(v_u_6, {
			["name"] = v_u_12.Check,
			["style"] = v16.Inverse.Content.Emphasis,
			["size"] = v18.icon.size,
			["variant"] = v_u_13.Filled,
			["testId"] = ("%*--check"):format(p14.testId)
		})
	else
		local v36 = v_u_4.createElement
		local v37 = v_u_8
		local v38 = {}
		local v39 = p14.index
		v38.Text = tostring(v39)
		v38.tag = v18.index.tag
		v38.testId = ("%*--index"):format(p14.testId)
		v35 = v36(v37, v38)
	end
	v34.StepIndex = v35
	v30.Indicator = v31(v32, v33, v34)
	v26.IndicatorOuter = v27(v28, v29, v30)
	local v40 = v_u_4.createElement
	local v41 = v_u_9
	local v42 = {
		["LayoutOrder"] = 2,
		["tag"] = nil,
		["padding"] = nil,
		["testId"] = nil,
		["tag"] = v18.textColumn.tag,
		["padding"] = v18.textColumn.padding,
		["testId"] = ("%*--text-column"):format(p14.testId)
	}
	local v43 = {
		["Label"] = v_u_4.createElement(v_u_8, {
			["LayoutOrder"] = 1,
			["Text"] = nil,
			["tag"] = nil,
			["testId"] = nil,
			["Text"] = p14.step.label,
			["tag"] = v18.label.tag,
			["testId"] = ("%*--label"):format(p14.testId)
		})
	}
	local v44
	if p14.step.description then
		v44 = v_u_4.createElement(v_u_8, {
			["LayoutOrder"] = 2,
			["Text"] = nil,
			["tag"] = nil,
			["testId"] = nil,
			["Text"] = p14.step.description,
			["tag"] = v18.description.tag,
			["testId"] = ("%*--description"):format(p14.testId)
		})
	else
		v44 = nil
	end
	v43.Description = v44
	v26.TextColumn = v40(v41, v42, v43)
	v22.Content = v23(v24, v25, v26)
	return v19(v20, v21, v22)
end))