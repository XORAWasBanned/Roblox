-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.SegmentedControl.Segment
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v2.BuilderIcons)
local v_u_4 = require(v1.Components.Icon)
local v_u_5 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
require(v1.Enums.FillBehavior)
local v_u_7 = require(v1.Utility.Flags)
require(v1.Enums.IconSize)
require(v1.Enums.InputSize)
require(v1.Enums.SegmentedControlVariant)
local v_u_8 = require(v1.Utility.devAssert)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Utility.withCommonProps)
local v_u_11 = require(script.Parent.useSegmentedControlVariants)
return v_u_3.memo(v_u_3.forwardRef(function(p_u_12, p13) -- name: Segment
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_11, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6, (copy) v_u_10, (copy) v_u_4, (copy) v_u_5
	local v14
	if v_u_7.FoundationSegmentedControlBeta then
		v14 = p_u_12.variant
	else
		v14 = nil
	end
	local v15
	if v_u_7.FoundationSegmentedControlBeta then
		v15 = p_u_12.fillBehavior
	else
		v15 = nil
	end
	local v16 = v_u_9()
	local v17 = v_u_11
	local v18 = p_u_12.size
	if not v_u_7.FoundationSegmentedControlBeta then
		v14 = nil
	end
	if not v_u_7.FoundationSegmentedControlBeta then
		v15 = nil
	end
	local v19 = p_u_12.isCircular
	local v20
	if v_u_7.FoundationSegmentedControlBeta then
		v20 = p_u_12.isActive
	else
		v20 = nil
	end
	local v21 = v17(v16, v18, v14, v15, v19, v20)
	v_u_8(p_u_12.text == nil and true or p_u_12.icon == nil, "Segment: `text` and `icon` are mutually exclusive. Only one can be provided.")
	local v22 = p_u_12.icon ~= nil
	local v23 = nil
	local v24, v25
	if v22 then
		local v26 = p_u_12.icon
		if typeof(v26) == "table" then
			local v27 = p_u_12.icon
			v24 = v27.name
			v23 = v27.variant
		else
			v24 = p_u_12.icon
		end
		v25 = v21.icon
	else
		v24 = nil
		v25 = nil
	end
	local v28 = v_u_3.createElement
	local v29 = v_u_6
	local v30 = v_u_10(p_u_12, {
		["tag"] = v21.segment.tag,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) p_u_12
			p_u_12.onActivated(p_u_12.id)
		end,
		["ref"] = p13
	})
	local v31 = {}
	local v32
	if v22 then
		local v33 = v_u_3.createElement
		local v34 = v_u_4
		local v35 = {
			["name"] = v24,
			["variant"] = v23,
			["size"] = v25.size,
			["style"] = v25.style
		}
		local v36
		if v_u_7.FoundationSegmentedControlBeta then
			v36 = ("%*--icon"):format(p_u_12.testId)
		else
			v36 = nil
		end
		v35.testId = v36
		v32 = v33(v34, v35)
	else
		local v37 = v_u_3.createElement
		local v38 = v_u_5
		local v39 = {
			["tag"] = v21.text.tag,
			["Text"] = p_u_12.text
		}
		local v40
		if v_u_7.FoundationSegmentedControlBeta then
			v40 = v21.text.style
		else
			v40 = nil
		end
		v39.textStyle = v40
		local v41
		if v_u_7.FoundationSegmentedControlBeta then
			v41 = ("%*--text"):format(p_u_12.testId)
		else
			v41 = nil
		end
		v39.testId = v41
		v32 = v37(v38, v39)
	end
	v31.Text = v32
	return v28(v29, v30, v31)
end))