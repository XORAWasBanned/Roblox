-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.List.Item.ListItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v5 = v1.Components
local v_u_6 = require(v5.Checkbox)
local v_u_7 = require(v5.Divider)
local v_u_8 = require(v1.Utility.Flags)
local v_u_9 = require(v5.Icon)
local v_u_10 = require(v1.Enums.InputSize)
local v_u_11 = require(v1.Enums.ListItemInputType)
local v_u_12 = require(v5.RadioGroup)
local v_u_13 = require(v5.Text)
local v_u_14 = require(v5.Toggle)
require(v1.Components.Types)
local v_u_15 = require(v5.View)
local v_u_16 = require(v1.Utility.devAssert)
local v_u_17 = require(v1.Utility.escapeRichText)
local v_u_18 = require(v1.Providers.Style.useTokens)
local v_u_19 = require(v1.Utility.withDefaults)
local v_u_20 = require(script.Parent.useListItemVariants)
local v_u_21 = require(script.Parent.ListAccessory)
local v_u_22 = require(script.Parent.useListAccessoryVariants)
local v_u_23 = require(script.Parent.Parent.useList)
local v_u_24 = {
	[v_u_10.XSmall] = "gap-xxsmall",
	[v_u_10.Small] = "gap-xxsmall",
	[v_u_10.Medium] = "gap-xsmall",
	[v_u_10.Large] = "gap-xsmall"
}
local v_u_25 = {}
return v_u_4.memo(v_u_4.forwardRef(function(p26, p27) -- name: ListItem
	-- upvalues: (copy) v_u_19, (copy) v_u_25, (copy) v_u_8, (copy) v_u_16, (copy) v_u_23, (copy) v_u_10, (copy) v_u_18, (copy) v_u_20, (copy) v_u_22, (copy) v_u_24, (copy) v_u_4, (copy) v_u_11, (copy) v_u_15, (copy) v_u_21, (copy) v_u_13, (copy) v_u_17, (copy) v_u_9, (copy) v_u_3, (copy) v_u_12, (copy) v_u_6, (copy) v_u_14, (copy) v_u_7
	local v_u_28 = v_u_19(p26, v_u_25)
	if v_u_8.FoundationListItemDecoupledInput then
		local v29 = v_u_28.onActivated ~= nil
		local v30 = v_u_28.input
		local v31
		if typeof(v30) == "table" then
			v31 = v_u_28.input.onActivated ~= nil
		else
			v31 = false
		end
		v_u_16(not (v29 and v31), "ListItem: set `onActivated` on the item or on `input`, not both.")
	end
	local v32 = v_u_23()
	local v33 = v32.size or v_u_10.Medium
	local v34 = v_u_18()
	local v35 = v_u_20(v34, v33)
	local v36 = v_u_22(v34, v33, "Icon")
	local v37 = v_u_24[v33]
	local v38 = v_u_28.onActivated
	local v_u_39
	if typeof(v38) == "table" then
		v_u_39 = v_u_28.onActivated.onActivated ~= nil
	else
		v_u_39 = false
	end
	local v_u_40 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_28
		if v_u_39 then
			return v_u_28.onActivated.onActivated
		elseif v_u_28.onActivated == nil then
			return nil
		else
			return v_u_28.onActivated
		end
	end, { v_u_28.onActivated, v_u_39 })
	local v_u_44 = v_u_4.useMemo(function()
		-- upvalues: (ref) v_u_8, (copy) v_u_28, (copy) v_u_39, (ref) v_u_11
		if not v_u_8.FoundationListItemDecoupledInput then
			return nil
		end
		if v_u_28.input == nil then
			if not v_u_39 then
				return v_u_28.onActivated ~= nil and {
					["type"] = v_u_11.Chevron
				} or nil
			end
			local v41 = v_u_28.onActivated
			return {
				["type"] = v41.inputType or v_u_11.Chevron,
				["isChecked"] = v41.isChecked
			}
		end
		local v42 = v_u_28.input
		if typeof(v42) ~= "table" then
			return {
				["type"] = v_u_28.input
			}
		end
		local v43 = v_u_28.input
		return {
			["type"] = v43.type,
			["isChecked"] = v43.isChecked,
			["onActivated"] = v43.onActivated
		}
	end, { v_u_28.onActivated, v_u_28.input, v_u_39 })
	local v45 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_28
		if v_u_39 then
			return v_u_28.onActivated.inputType
		else
			return nil
		end
	end, { v_u_28.onActivated, v_u_39 })
	local v46 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_39, (copy) v_u_28
		if v_u_39 then
			return v_u_28.onActivated.isChecked
		else
			return nil
		end
	end, { v_u_28.onActivated, v_u_39 })
	local v_u_49 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_28
		local v47 = v_u_28.title
		if typeof(v47) == "string" then
			return v_u_28.title
		else
			local v48 = v_u_28.title
			if typeof(v48) == "table" then
				return v_u_28.title.title
			else
				return nil
			end
		end
	end, { v_u_28.title })
	local v51 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_28
		local v50 = v_u_28.title
		if typeof(v50) == "table" then
			if v_u_28.title.title == nil then
				return nil
			else
				return v_u_28.title.metadata
			end
		else
			return nil
		end
	end, { v_u_28.title })
	local v52 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_49
		return v_u_49 and string.gsub(v_u_49, "%s+", "-") or ""
	end, { v_u_49 })
	local v53
	if v_u_28.testId then
		v53 = v_u_28.testId
	else
		v53 = ("%*--item-%*"):format(v32.testId, v52)
	end
	v_u_28.testId = v53
	local v54
	if v_u_8.FoundationListItemDecoupledInput then
		if v_u_44 == nil then
			v54 = false
		else
			v54 = v_u_44.type ~= v_u_11.None
		end
	else
		v54 = v_u_28.onActivated ~= nil
	end
	if v_u_8.FoundationListItemDecoupledInput then
		if v_u_44 then
			v45 = v_u_44.type
		else
			v45 = nil
		end
	end
	if v_u_8.FoundationListItemDecoupledInput then
		if v_u_44 then
			v46 = v_u_44.isChecked
		else
			v46 = nil
		end
	end
	local v_u_56 = v_u_4.useCallback(function(p55)
		-- upvalues: (ref) v_u_8, (copy) v_u_44, (copy) v_u_40
		if v_u_8.FoundationListItemDecoupledInput and (v_u_44 and v_u_44.onActivated) then
			v_u_44.onActivated(p55)
		elseif v_u_40 then
			v_u_40()
		end
	end, { v_u_44, v_u_40 })
	local v58 = v_u_4.useCallback(function(p57)
		-- upvalues: (copy) v_u_56
		v_u_56(p57 == "radio")
	end, { v_u_56 })
	local v59 = v_u_4.createElement
	local v60 = v_u_15
	local v61 = {
		["tag"] = "col size-full-0 auto-y",
		["LayoutOrder"] = nil,
		["ref"] = nil,
		["LayoutOrder"] = v_u_28.LayoutOrder,
		["ref"] = p27
	}
	local v62 = {}
	local v63 = v_u_4.createElement
	local v64 = v_u_15
	local v65 = {
		["padding"] = nil,
		["tag"] = "size-full-0 auto-y padding-y-xsmall",
		["LayoutOrder"] = 1
	}
	local v66
	if v32.isContained then
		v66 = v34.Padding.Small
	else
		v66 = {}
		local v67 = UDim.new
		local v68 = 0
		local v69
		if v32.hasMargin then
			v69 = v34.Padding.Small
		else
			v69 = -v34.Padding.Small
		end
		v66.left = v67(v68, v69)
		local v70 = UDim.new
		local v71 = 0
		local v72
		if v32.hasMargin then
			v72 = v34.Padding.Small
		else
			v72 = -v34.Padding.Small
		end
		v66.right = v70(v71, v72)
	end
	v65.padding = v66
	local v73 = {}
	local v74 = v_u_4.createElement
	local v75 = v_u_15
	local v76 = {
		["onActivated"] = v_u_40,
		["onSecondaryActivated"] = v_u_28.onSecondaryActivated,
		["tag"] = {
			["size-full-0 auto-y radius-medium"] = true,
			["margin-x-small"] = v32.hasMargin,
			["padding-x-small"] = not v32.hasMargin
		}
	}
	local v77 = {}
	local v78 = v_u_4.createElement
	local v79 = v_u_15
	local v80 = {
		["testId"] = nil,
		["tag"] = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
		["testId"] = v_u_28.testId
	}
	local v81 = {}
	local v82
	if v_u_28.leading then
		v82 = v_u_4.createElement(v_u_21, {
			["config"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["LayoutOrder"] = 0,
			["config"] = v_u_28.leading,
			["size"] = v33,
			["testId"] = ("%*--leading-accessory"):format(v_u_28.testId)
		})
	else
		v82 = nil
	end
	v81.LeadingContainer = v82
	local v83 = v_u_4.createElement
	local v84 = v_u_15
	local v85 = {
		["tag"] = "row flex-between align-x-center align-y-center fill gap-medium auto-y",
		["LayoutOrder"] = 1
	}
	local v86 = {}
	local v87 = v_u_4.createElement
	local v88 = v_u_15
	local v89 = {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = {
			["col fill auto-y padding-y-xsmall"] = true,
			[v37] = true
		}
	}
	local v90 = {}
	local v91
	if v_u_49 then
		local v92 = v_u_4.createElement
		local v93 = v_u_15
		local v94 = {
			["tag"] = nil,
			["LayoutOrder"] = 0,
			["tag"] = {
				["col auto-xy"] = true,
				["gap-xsmall"] = false
			}
		}
		local v95 = {}
		local v96
		if v_u_49 then
			v96 = v_u_4.createElement(v_u_13, {
				["Text"] = nil,
				["RichText"] = true,
				["tag"] = nil,
				["LayoutOrder"] = 0,
				["Text"] = v_u_17(v_u_49),
				["tag"] = v35.title.tag
			})
		else
			v96 = nil
		end
		v95.Title = v96
		local v97
		if v51 then
			v97 = v_u_4.createElement(v_u_13, {
				["Text"] = nil,
				["RichText"] = true,
				["tag"] = nil,
				["LayoutOrder"] = 1,
				["Text"] = v51,
				["tag"] = v35.metadata.tag
			})
		else
			v97 = nil
		end
		v95.Metadata = v97
		v91 = v92(v93, v94, v95)
	else
		v91 = nil
	end
	v90.TitleContainer = v91
	local v98 = v_u_28.description
	if v98 then
		v98 = v_u_4.createElement(v_u_13, {
			["Text"] = nil,
			["RichText"] = true,
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["Text"] = v_u_28.description,
			["tag"] = v35.description.tag
		})
	end
	v90.Description = v98
	v86.TextContainer = v87(v88, v89, v90)
	local v99
	if v_u_28.trailing then
		v99 = v_u_4.createElement(v_u_15, {
			["tag"] = "align-x-center align-y-center auto-xy",
			["LayoutOrder"] = 2
		}, v_u_28.trailing)
	else
		v99 = nil
	end
	v86.TrailingContainer = v99
	local v100
	if v54 then
		local v101 = v_u_4.createElement
		local v102 = v_u_15
		local v103 = {
			["tag"] = "align-x-center align-y-center auto-xy",
			["LayoutOrder"] = 3
		}
		local v104 = {}
		local v105
		if v45 == nil or v_u_8.FoundationListItemDecoupledInput and v45 == v_u_11.Chevron then
			v105 = v_u_4.createElement(v_u_9, {
				["name"] = v_u_3.Icon.ChevronLargeRight,
				["size"] = v35.icon.size,
				["testId"] = ("%*--activated-icon"):format(v_u_28.testId)
			})
		elseif v45 == v_u_11.Radio then
			v105 = v_u_4.createElement(v_u_12.Root, {
				["value"] = nil,
				["onValueChanged"] = nil,
				["Selectable"] = false,
				["value"] = v46 and "radio" or "",
				["onValueChanged"] = v58
			}, v_u_4.createElement(v_u_12.Item, {
				["value"] = "radio",
				["label"] = "",
				["size"] = nil,
				["size"] = v33
			}))
		else
			local v106 = v_u_4.createElement
			local v107
			if v45 == v_u_11.Checkbox then
				v107 = v_u_6
			else
				v107 = v_u_14
			end
			v105 = v106(v107, {
				["label"] = "",
				["onActivated"] = nil,
				["isChecked"] = nil,
				["size"] = nil,
				["Selectable"] = false,
				["onActivated"] = v_u_56,
				["isChecked"] = v46,
				["size"] = v33
			})
		end
		v104.ActivatedIcon = v105
		v100 = v101(v102, v103, v104)
	else
		v100 = nil
	end
	v86.ActivatedIconContainer = v100
	v81.Content = v83(v84, v85, v86)
	v77.ListItem = v78(v79, v80, v81)
	v73.ListItemContainer = v74(v75, v76, v77)
	v62.HoverWrapper = v63(v64, v65, v73)
	local v108
	if v32.hasDivider and v_u_28.LayoutOrder ~= v32.lastLayoutOrder then
		if v32.isInset then
			local v109 = v_u_4.createElement
			local v110 = v_u_15
			local v111 = {
				["LeadingSpacer"] = v_u_4.createElement(v_u_15, {
					["Size"] = nil,
					["LayoutOrder"] = 0,
					["Size"] = UDim2.fromOffset((not v32.hasMargin and 0 or v34.Padding.Small + v34.Margin.Small) + (not v_u_28.leading and 0 or v36.container.Size.X.Offset + v34.Gap.Medium), 0)
				}),
				["DividerLine"] = v_u_4.createElement(v_u_15, {
					["tag"] = "fill auto-y",
					["LayoutOrder"] = 1
				}, v_u_4.createElement(v_u_7))
			}
			v108 = v109(v110, {
				["tag"] = "row size-full-0 auto-y",
				["LayoutOrder"] = 2
			}, v111)
		else
			v108 = v_u_4.createElement(v_u_7, {
				["LayoutOrder"] = 2
			})
		end
	else
		v108 = nil
	end
	v62.Divider = v108
	return v59(v60, v61, v62)
end))