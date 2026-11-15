-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Knob.Knob
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.BuilderIcons)
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactIs)
local v6 = v1.Components
local v_u_7 = require(v1.Constants)
local v_u_8 = require(v6.Icon)
require(v6.Types)
local v_u_9 = require(v6.View)
local v_u_10 = require(v1.Utility.blendTransparencies)
local v_u_11 = require(v1.Utility.mapBindable)
local v_u_12 = require(v1.Utility.useBindable)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = require(script.Parent.useKnobVariants)
local v_u_16 = require(v1.Providers.Style.useTokens)
local v_u_17 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v_u_18 = require(v1.Enums.ColorNamespace)
local v_u_19 = {
	["size"] = nil,
	["hasShadow"] = true,
	["isDisabled"] = false,
	["testId"] = "--foundation-knob",
	["size"] = require(v1.Enums.InputSize).Medium
}
return v_u_4.memo(function(p20) -- name: Knob
	-- upvalues: (copy) v_u_14, (copy) v_u_19, (copy) v_u_16, (copy) v_u_17, (copy) v_u_15, (copy) v_u_18, (copy) v_u_11, (copy) v_u_12, (copy) v_u_4, (copy) v_u_5, (copy) v_u_9, (copy) v_u_13, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_3
	local v_u_21 = v_u_14(p20, v_u_19)
	local v22 = v_u_16()
	local v23 = v_u_17()
	local v24 = v_u_15
	local v25 = v_u_21.size
	if v23 then
		v23 = v23.colorNamespace == v_u_18.Inverse
	end
	local v_u_26 = v24(v22, v25, v23)
	local v27 = v_u_21.style or v_u_26.knob.style
	local v29 = v_u_11(v27, function(p28)
		return p28.Transparency or 0
	end)
	local v30 = v_u_12
	local v31
	if v_u_21.stroke then
		v31 = v_u_21.stroke.Transparency
	else
		v31 = nil
	end
	local v32 = v30(v31)
	local v33 = v_u_12(v27)
	local v34 = v_u_12(v_u_26.knob.style)
	local v38 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_26, (copy) v_u_21, (ref) v_u_5
		local v_u_35 = v_u_26.knob.size
		if v_u_21.stroke and v_u_21.stroke.Thickness then
			if v_u_5.isBinding(v_u_21.stroke.Thickness) then
				return v_u_21.stroke.Thickness:map(function(p36)
					-- upvalues: (ref) v_u_35
					return v_u_35 - UDim2.fromOffset(p36 * 2, p36 * 2)
				end)
			end
			local v37 = v_u_21.stroke.Thickness
			v_u_35 = v_u_35 - UDim2.fromOffset(v37 * 2, v37 * 2)
		end
		return v_u_35
	end, { v_u_26, v_u_21.stroke })
	local v39 = v_u_4.createElement
	local v40 = v_u_9
	local v41 = v_u_13(v_u_21, {
		["Size"] = v_u_26.knob.size,
		["isDisabled"] = v_u_21.isDisabled
	})
	local v42 = {}
	local v43
	if v_u_21.icon then
		local v44 = v_u_4.createElement
		local v45 = v_u_9
		local v46 = {
			["tag"] = nil,
			["Size"] = nil,
			["ZIndex"] = 4,
			["backgroundStyle"] = nil,
			["tag"] = v_u_26.knob.tag,
			["Size"] = v38,
			["backgroundStyle"] = v_u_26.iconContainer.backgroundStyle
		}
		local v47 = v_u_4.createElement
		local v48 = v_u_8
		local v49 = {
			["name"] = v_u_21.icon.name,
			["variant"] = v_u_21.icon.variant
		}
		local v50
		if v_u_21.isDisabled then
			v50 = v34:map(function(p51)
				-- upvalues: (ref) v_u_10, (ref) v_u_7
				return {
					["Color3"] = p51.Color3,
					["Transparency"] = v_u_10(p51.Transparency, v_u_7.DISABLED_TRANSPARENCY)
				}
			end)
		else
			v50 = v_u_26.knob.style
		end
		v49.style = v50
		v49.size = v_u_26.knob.iconSize
		v49.testId = ("%*--icon"):format(v_u_21.testId)
		v43 = v44(v45, v46, v47(v48, v49))
	else
		local v52 = v_u_4.createElement
		local v53 = v_u_9
		local v54 = {
			["tag"] = nil,
			["backgroundStyle"] = nil,
			["Size"] = nil,
			["stroke"] = nil,
			["ZIndex"] = 4,
			["testId"] = nil,
			["tag"] = v_u_26.knob.tag
		}
		if v_u_21.isDisabled then
			v27 = v33:map(function(p55)
				-- upvalues: (ref) v_u_10, (ref) v_u_7
				return {
					["Color3"] = p55.Color3,
					["Transparency"] = v_u_10(p55.Transparency, v_u_7.DISABLED_TRANSPARENCY)
				}
			end)
		end
		v54.backgroundStyle = v27
		v54.Size = v38
		v54.stroke = v32:map(function(p56)
			-- upvalues: (copy) v_u_21, (ref) v_u_3, (ref) v_u_10, (ref) v_u_7
			local v57 = v_u_21.stroke
			if v_u_21.stroke and (p56 ~= nil and v_u_21.isDisabled) then
				v57 = v_u_3.join(v57, {
					["Transparency"] = v_u_10(p56, v_u_7.DISABLED_TRANSPARENCY)
				})
			end
			return v57
		end):getValue()
		v54.testId = ("%*--circle"):format(v_u_21.testId)
		v43 = v52(v53, v54)
	end
	v42.Icon = v43
	local v58
	if v_u_21.hasShadow and not v_u_21.isDisabled then
		v58 = v_u_4.createElement(v_u_9, {
			["tag"] = "position-center-center anchor-center-center radius-circle shadow-raised-100",
			["GroupTransparency"] = nil,
			["Size"] = nil,
			["Visible"] = nil,
			["ZIndex"] = 3,
			["testId"] = nil,
			["GroupTransparency"] = v29,
			["Size"] = v38,
			["Visible"] = v_u_11(v29, function(p59)
				return p59 < 1
			end),
			["testId"] = ("%*--shadow"):format(v_u_21.testId)
		})
	else
		v58 = nil
	end
	v42.Shadow = v58
	return v39(v40, v41, v42)
end)