-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.StatusIndicator.StatusIndicator
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactIs)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.devAssert)
local v_u_10 = require(script.Parent.useStatusIndicatorVariants)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(v1.Utility.withCommonProps)
local v_u_13 = require(v1.Utility.withDefaults)
local v14 = require(v1.Enums.StatusIndicatorSize)
local v15 = require(v1.Enums.StatusIndicatorVariant)
local v_u_16 = require(v1.Enums.StatusIndicatorShape)
local v_u_17 = require(script.Parent.ValidNumericVariants)
local v_u_18 = {
	["variant"] = nil,
	["shape"] = nil,
	["size"] = nil,
	["max"] = (1 / 0),
	["testId"] = "--foundation-status-indicator",
	["variant"] = v15.Standard,
	["shape"] = v_u_16.Circle,
	["size"] = v14.Small
}
return v_u_4.memo(v_u_4.forwardRef(function(p19, p20) -- name: StatusIndicator
	-- upvalues: (copy) v_u_13, (copy) v_u_18, (copy) v_u_16, (copy) v_u_9, (copy) v_u_17, (copy) v_u_3, (copy) v_u_11, (copy) v_u_10, (copy) v_u_4, (copy) v_u_8, (copy) v_u_12, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	local v_u_21 = v_u_13(p19, v_u_18)
	local v22
	if v_u_21.value then
		v22 = v_u_16.Circle
	else
		v22 = v_u_21.shape
	end
	if v_u_21.value ~= nil then
		v_u_9(v_u_17[v_u_21.variant], (("%* is not a supported numeric variant. The following are valid numeric variants: %*"):format(v_u_21.variant, (table.concat(v_u_3.filter(v_u_3.keys(v_u_17), function(p23, _)
			-- upvalues: (ref) v_u_17
			return v_u_17[p23] == true
		end), ",")))))
	end
	local v24 = v_u_11()
	local v25 = v_u_21.value ~= nil
	local v26 = v_u_10(v24, v_u_21.variant, v25, v22, v_u_21.size, v_u_21.mask)
	local v28 = v_u_4.useCallback(function(p27)
		-- upvalues: (copy) v_u_21
		if v_u_21.max and v_u_21.max < p27 then
			return ("%*+"):format(v_u_21.max)
		else
			return tostring(p27)
		end
	end, { v_u_21.max })
	local v29 = v_u_4.createElement
	local v30 = v_u_8
	local v31 = v_u_12
	local v32 = {
		["tag"] = v26.container.tag
	}
	local v33
	if v26.container.backgroundStyle then
		v33 = v26.container.backgroundStyle
	else
		v33 = nil
	end
	v32.backgroundStyle = v33
	local v34
	if v_u_21.mask then
		v34 = v26.stroke
	else
		v34 = nil
	end
	v32.stroke = v34
	v32.ref = p20
	v32.Size = v26.container.size
	local v35 = v31(v_u_21, v32)
	local v36 = {}
	local v37
	if v25 and v26.content.style then
		local v38 = v_u_4.createElement
		local v39 = v_u_7
		local v40 = {}
		local v41
		if v_u_5.isBinding(v_u_21.value) then
			v41 = v_u_21.value:map(v28)
		else
			v41 = v28(v_u_21.value)
		end
		v40.Text = v41
		v40.textStyle = v26.content.style
		local v42
		if v_u_6.FoundationStatusIndicatorDesignUpdate then
			v42 = {
				["Font"] = v26.content.font,
				["FontSize"] = v26.content.typography.FontSize,
				["LineHeight"] = v26.content.typography.LineHeight
			}
		else
			v42 = {
				["Font"] = v26.content.font,
				["FontSize"] = v24.Typography.LabelSmall.FontSize,
				["LineHeight"] = v24.Typography.LabelSmall.LineHeight
			}
		end
		v40.fontStyle = v42
		v40.tag = v26.content.tag
		v40.testId = ("%*--text"):format(v_u_21.testId)
		v37 = v38(v39, v40)
	else
		v37 = nil
	end
	v36.Text = v37
	local v43
	if v22 == v_u_16.Ring and v26.ring then
		v43 = v_u_4.createElement(v_u_8, {
			["tag"] = v26.ring.tag,
			["Size"] = v26.ring.size,
			["testId"] = ("%*--ring"):format(v_u_21.testId)
		})
	else
		v43 = nil
	end
	v36.InnerRing = v43
	return v29(v30, v35, v36)
end))