-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OptionSelectorGroup.Item.OptionSelectorGroupItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Motion).useMotion
local v5 = v1.Components
local v_u_6 = require(v5.Icon)
local v_u_7 = require(v5.Image)
local v_u_8 = require(v5.Text)
require(v5.Types)
local v_u_9 = require(v5.View)
local v_u_10 = require(v1.Constants)
local v_u_11 = require(v1.Utility.escapeRichText)
local v12 = require(v1.Utility.iconMigrationUtils)
local v_u_13 = v12.isBuilderOrMigratedIcon
local v_u_14 = v12.normalizeIconName
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
local v_u_18 = require(script.Parent.useOptionSelectorGroupItemMotionStates)
local v_u_19 = require(script.Parent.useOptionSelectorGroupItemVariants)
local v_u_20 = require(v1.Enums.FillBehavior)
require(v1.Enums.IconSize)
local v_u_21 = require(v1.Enums.InputSize)
local v_u_22 = require(v1.Enums.OptionSelectorGroupSize)
local v_u_23 = require(v1.Enums.Orientation)
local v_u_24 = require(script.Parent.Parent.useOptionSelectorGroup)
local function v_u_29(p25, p26, p_u_27) -- name: getTextStyle
	-- upvalues: (copy) v_u_3
	return v_u_3.joinBindings({ p25, p26 }):map(function(p28)
		-- upvalues: (copy) p_u_27
		return {
			["Color3"] = p_u_27,
			["Transparency"] = p28[2]
		}
	end)
end
local function v_u_36(p_u_30) -- name: renderIcon
	-- upvalues: (copy) v_u_13, (copy) v_u_3, (copy) v_u_7, (copy) v_u_14, (copy) v_u_6
	if not p_u_30.icon then
		return nil
	end
	if not v_u_13(p_u_30.icon) then
		local v31 = p_u_30.iconExtent
		return v_u_3.createElement(v_u_7, {
			["Image"] = p_u_30.icon,
			["Size"] = UDim2.fromOffset(v31, v31),
			["imageStyle"] = p_u_30.transparency:map(function(p32)
				-- upvalues: (copy) p_u_30
				return {
					["Color3"] = p_u_30.contentColor,
					["Transparency"] = p32
				}
			end),
			["LayoutOrder"] = p_u_30.layoutOrder,
			["testId"] = ("%*--icon"):format(p_u_30.testId)
		})
	end
	local v33 = v_u_14(p_u_30.icon)
	local v35 = {
		["name"] = v33.name,
		["size"] = p_u_30.iconSize,
		["style"] = p_u_30.transparency:map(function(p34)
			-- upvalues: (copy) p_u_30
			return {
				["Color3"] = p_u_30.contentColor,
				["Transparency"] = p34
			}
		end),
		["LayoutOrder"] = p_u_30.layoutOrder,
		["testId"] = ("%*--icon"):format(p_u_30.testId)
	}
	if v33.variant then
		v35.variant = v33.variant
	end
	return v_u_3.createElement(v_u_6, v35)
end
local v_u_37 = {
	["isDisabled"] = false,
	["size"] = nil,
	["width"] = nil,
	["size"] = v_u_21.Medium,
	["width"] = UDim.new(0, 0)
}
return v_u_3.memo(v_u_3.forwardRef(function(p38, p39) -- name: OptionSelectorGroupItem
	-- upvalues: (copy) v_u_17, (copy) v_u_37, (copy) v_u_24, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_20, (copy) v_u_15, (copy) v_u_19, (copy) v_u_18, (copy) v_u_10, (copy) v_u_4, (copy) v_u_3, (copy) v_u_36, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11, (copy) v_u_29, (copy) v_u_16
	local v_u_40 = v_u_17(p38, v_u_37)
	local v_u_41 = v_u_24()
	local v42 = v_u_41.value == v_u_40.value
	local v43
	if v_u_41.size == nil then
		if v_u_40.size == v_u_21.Large then
			v43 = v_u_22.Medium
		else
			v43 = v_u_40.size
		end
	else
		v43 = v_u_41.size
	end
	local v44
	if v_u_41.orientation == v_u_23.Vertical then
		v44 = v_u_23.Horizontal
	else
		v44 = v_u_23.Vertical
	end
	local v45
	if v_u_41.fillBehavior == nil then
		v45 = v_u_40.fillBehavior
	else
		v45 = v_u_41.fillBehavior
	end
	local v46
	if v44 == v_u_23.Horizontal then
		v46 = v_u_20.Fill
	else
		v46 = v45 or v_u_20.Fit
	end
	local v47
	if v44 == v_u_23.Vertical then
		v47 = v46 == v_u_20.Fit
	else
		v47 = false
	end
	local v48
	if v47 then
		v48 = nil
	else
		v48 = UDim2.fromScale(1, 0)
	end
	local v_u_49 = v_u_15()
	local v_u_50 = v_u_19(v_u_49, v43, v44, v46, v42)
	local v51 = v_u_50.content.Color3
	local v52
	if v_u_50.supportingContent then
		v52 = v_u_50.supportingContent.Color3
	else
		v52 = v51
	end
	local v53 = v_u_50.container.stroke
	local v_u_54 = v_u_18(0, v_u_10.DISABLED_TRANSPARENCY)
	local v55, v_u_56 = v_u_4(v_u_54.Default)
	local v57, _ = v_u_4(v_u_54.Default)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_40, (copy) v_u_56, (copy) v_u_54
		if v_u_40.isDisabled then
			v_u_56(v_u_54.Disabled)
		else
			v_u_56(v_u_54.Default)
		end
	end, { v_u_40.isDisabled })
	local v60 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_41, (copy) v_u_40
		local v58 = v_u_41.onValueChanged
		local v59
		if v_u_41.value == v_u_40.value then
			v59 = nil
		else
			v59 = v_u_40.value
		end
		v58(v59)
	end, {
		v_u_40.isDisabled,
		v_u_40.value,
		v_u_41.onValueChanged,
		v_u_41.value
	})
	v_u_40.testId = ("%*--item-%*"):format(v_u_41.testId, v_u_40.value)
	local v61 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_50, (copy) v_u_49
		return {
			["radius"] = UDim.new(0, v_u_50.container.radius),
			["offset"] = v_u_49.Size.Size_200,
			["borderWidth"] = v_u_49.Stroke.Thicker
		}
	end, { v_u_49, v_u_50.container.radius })
	local v62 = {
		["Icon"] = v_u_36({
			["icon"] = nil,
			["iconExtent"] = nil,
			["iconSize"] = nil,
			["contentColor"] = nil,
			["transparency"] = nil,
			["layoutOrder"] = 1,
			["testId"] = nil,
			["icon"] = v_u_40.icon,
			["iconExtent"] = v_u_50.icon.extent,
			["iconSize"] = v_u_50.icon.size,
			["contentColor"] = v51,
			["transparency"] = v55.transparency,
			["testId"] = v_u_40.testId
		})
	}
	local v63 = v_u_3.createElement
	local v64 = v_u_9
	local v65 = {
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["tag"] = v_u_50.textContainer.tag,
		["testId"] = ("%*--body"):format(v_u_40.testId)
	}
	local v66 = {
		["Label"] = v_u_3.createElement(v_u_8, {
			["Text"] = nil,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["textStyle"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v_u_11(v_u_40.label or v_u_40.value),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["tag"] = v_u_50.label.tag,
			["textStyle"] = v_u_29(v57.textTransparency, v55.transparency, v51),
			["testId"] = ("%*--label"):format(v_u_40.testId)
		})
	}
	local v67
	if v_u_40.metadata then
		v67 = v_u_3.createElement(v_u_8, {
			["Text"] = nil,
			["TextTruncate"] = nil,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["textStyle"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["Text"] = v_u_11(v_u_40.metadata),
			["TextTruncate"] = Enum.TextTruncate.None,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["tag"] = v_u_50.metadata.tag,
			["textStyle"] = v_u_29(v57.textTransparency, v55.transparency, v52),
			["testId"] = ("%*--metadata"):format(v_u_40.testId)
		})
	else
		v67 = nil
	end
	v66.Metadata = v67
	local v68
	if v_u_40.description then
		v68 = v_u_3.createElement(v_u_8, {
			["Text"] = nil,
			["TextWrapped"] = true,
			["TextXAlignment"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["textStyle"] = nil,
			["LayoutOrder"] = 3,
			["testId"] = nil,
			["Text"] = v_u_11(v_u_40.description),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["tag"] = v_u_50.description.tag,
			["textStyle"] = v_u_29(v57.textTransparency, v55.transparency, v52),
			["testId"] = ("%*--description"):format(v_u_40.testId)
		})
	else
		v68 = nil
	end
	v66.Description = v68
	v62.Text = v63(v64, v65, v66)
	local v69 = v_u_3.createElement
	local v70 = v_u_9
	local v71 = v_u_16
	local v72 = {}
	local v73 = {
		["Color"] = v53.Color3
	}
	local v_u_74 = v53.Transparency
	v73.Transparency = v55.transparency:map(function(p75)
		-- upvalues: (copy) v_u_74
		if v_u_74 == nil then
			return p75
		else
			return v_u_74 + (1 - v_u_74) * p75
		end
	end)
	v72.stroke = v73
	v72.Size = v48
	v72.padding = v_u_50.container.padding
	local v76 = {}
	local v77
	if v_u_40.isDisabled then
		v77 = false
	else
		v77 = v_u_41.Selectable
	end
	v76.Selectable = v77
	v72.selection = v76
	v72.cursor = v61
	v72.onActivated = v60
	v72.isDisabled = v_u_40.isDisabled
	v72.tag = v_u_50.container.tag
	v72.ref = p39
	return v69(v70, v71(v_u_40, v72), {
		["ItemInner"] = v_u_3.createElement(v_u_9, {
			["tag"] = v_u_50.itemInner.tag,
			["Size"] = v48,
			["testId"] = ("%*--content"):format(v_u_40.testId)
		}, v62)
	})
end))