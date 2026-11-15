-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Breadcrumb.Breadcrumb
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = v3.Icon
local v_u_6 = require(v1.Enums.ButtonVariant)
local v7 = require(v1.Enums.InputSize)
local v_u_8 = require(v1.Enums.LinkVariant)
local v_u_9 = require(v1.Components.Icon)
local v_u_10 = require(v1.Components.IconButton)
local v_u_11 = require(v1.Components.Link)
local v_u_12 = require(v1.Components.Menu)
local v_u_13 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_14 = require(v1.Components.View)
local v_u_15 = require(v1.Utility.withCommonProps)
local v_u_16 = require(v1.Utility.withDefaults)
local v_u_17 = require(script.Parent.BreadcrumbAccessory)
local v_u_18 = require(script.Parent.useBreadcrumbVariants)
local v_u_19 = require(v1.Providers.Style.useTokens)
local v_u_20 = {
	["size"] = nil,
	["testId"] = "--foundation-breadcrumb",
	["size"] = v7.Medium
}
local function v_u_41(p21) -- name: BreadcrumbItem
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_11, (copy) v_u_8, (copy) v_u_14, (copy) v_u_17, (copy) v_u_9, (copy) v_u_5
	local v22 = p21.item
	local v23 = p21.variantProps
	local v24 = p21.testId
	local v25
	if p21.isCurrent or v22.onActivated == nil then
		local v26 = v_u_4.createElement
		local v27 = v_u_13
		local v28 = {
			["Text"] = nil,
			["tag"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["Text"] = v22.text
		}
		local v29
		if p21.isCurrent then
			v29 = v23.current.tag
		else
			v29 = v23.label.tag
		end
		v28.tag = v29
		v28.testId = ("%*--text"):format(v24)
		v25 = v26(v27, v28)
	else
		v25 = v_u_4.createElement(v_u_11, {
			["text"] = nil,
			["onActivated"] = nil,
			["variant"] = nil,
			["size"] = nil,
			["hasUnderline"] = false,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["text"] = v22.text,
			["onActivated"] = v22.onActivated,
			["variant"] = v_u_8.Standard,
			["size"] = p21.size,
			["testId"] = ("%*--link"):format(v24)
		})
	end
	local v30 = v_u_4.createElement
	local v31 = v_u_14
	local v32 = {
		["tag"] = v23.item.tag,
		["ref"] = v22.ref
	}
	local v33
	if p21.hasDropdown then
		v33 = p21.onDropdownActivated
	else
		v33 = nil
	end
	v32.onActivated = v33
	v32.LayoutOrder = p21.LayoutOrder
	v32.testId = v24
	local v34 = {}
	local v35
	if v22.leading == nil then
		v35 = nil
	else
		v35 = v_u_4.createElement(v_u_17, {
			["config"] = nil,
			["variant"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["config"] = v22.leading,
			["variant"] = v23.accessory,
			["testId"] = ("%*--leading"):format(v24)
		})
	end
	v34.Leading = v35
	local v36 = v_u_4.createElement
	local v37 = v_u_14
	local v38 = {
		["tag"] = nil,
		["LayoutOrder"] = 2,
		["tag"] = v23.itemText.tag
	}
	local v39 = {
		["Text"] = v25
	}
	local v40
	if p21.hasDropdown then
		v40 = v_u_4.createElement(v_u_9, {
			["name"] = nil,
			["size"] = nil,
			["style"] = nil,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["name"] = v_u_5.ChevronLargeDown,
			["size"] = v23.accessory.iconSize,
			["style"] = v23.accessory.style,
			["testId"] = ("%*--chevron"):format(v24)
		})
	else
		v40 = nil
	end
	v39.Chevron = v40
	v34.ItemText = v36(v37, v38, v39)
	return v30(v31, v32, v34)
end
return v_u_4.memo(v_u_4.forwardRef(function(p42, p43) -- name: Breadcrumb
	-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_19, (copy) v_u_18, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_41, (copy) v_u_14, (copy) v_u_13, (copy) v_u_12, (copy) v_u_15
	local v_u_44 = v_u_16(p42, v_u_20)
	local v45 = v_u_18(v_u_19(), v_u_44.size)
	local v_u_46 = #v_u_44.items
	local v_u_47 = v_u_46 > 4
	local v48 = v_u_4.useRef(nil)
	local v49, v_u_50 = v_u_4.useState(false)
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_47, (copy) v_u_50
		if not v_u_47 then
			v_u_50(false)
		end
	end, { v_u_47 })
	local v52 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_50
		v_u_50(function(p51)
			return not p51
		end)
	end, {})
	local v53 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_50
		v_u_50(false)
	end, {})
	local v56 = v_u_4.useCallback(function(p54)
		-- upvalues: (copy) v_u_50, (copy) v_u_44
		v_u_50(false)
		local v55 = v_u_44.items[p54]
		if v55 and v55.onActivated then
			v55.onActivated()
		end
	end, { v_u_44.items })
	local v60 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_47, (copy) v_u_44, (copy) v_u_46
		if v_u_47 then
			return {
				{
					["item"] = nil,
					["index"] = 1,
					["item"] = v_u_44.items[1]
				},
				{
					["overflow"] = true
				},
				{
					["item"] = v_u_44.items[v_u_46],
					["index"] = v_u_46
				}
			}
		end
		local v57 = {}
		for v58, v59 in v_u_44.items do
			table.insert(v57, {
				["item"] = v59,
				["index"] = v58
			})
		end
		return v57
	end, { v_u_44.items, v_u_46, v_u_47 })
	local v65 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_47, (copy) v_u_46, (copy) v_u_44
		local v61 = {}
		if v_u_47 then
			for v62 = 2, v_u_46 - 1 do
				local v63 = v_u_44.items[v62]
				local v64 = {
					["id"] = v62,
					["text"] = v63.text,
					["isDisabled"] = v63.onActivated == nil
				}
				table.insert(v61, v64)
			end
		end
		return v61
	end, { v_u_44.items, v_u_46, v_u_47 })
	local v66 = {}
	for v67, v68 in v60 do
		if v68.overflow then
			v66.Overflow = v_u_4.createElement(v_u_10, {
				["icon"] = v_u_5.ThreeDotsHorizontal,
				["onActivated"] = v52,
				["ref"] = v48,
				["size"] = v45.overflow.size,
				["variant"] = v_u_6.Standard,
				["LayoutOrder"] = 2 * v67 - 1,
				["testId"] = ("%*--overflow"):format(v_u_44.testId)
			})
		else
			local v69 = v68.item
			local v70 = v68.index
			local v71 = v70 == v_u_46
			local v72 = ("Item%*"):format(v70)
			local v73 = v_u_4.createElement
			local v74 = v_u_41
			local v75 = {
				["item"] = v69,
				["isCurrent"] = v71
			}
			local v76
			if v71 then
				v76 = v_u_44.onDropdownActivated ~= nil
			else
				v76 = v71
			end
			v75.hasDropdown = v76
			local v77
			if v71 then
				v77 = v_u_44.onDropdownActivated
			else
				v77 = nil
			end
			v75.onDropdownActivated = v77
			v75.size = v_u_44.size
			v75.variantProps = v45
			v75.LayoutOrder = 2 * v67 - 1
			v75.testId = v69.testId or ("%*--item-%*"):format(v_u_44.testId, v70)
			v66[v72] = v73(v74, v75)
		end
		if v67 == #v60 then
			continue
		end
		local v78 = v68.overflow and "overflow" or v68.index
		v66[("Separator%*"):format(v78)] = v_u_4.createElement(v_u_14, {
			["tag"] = v45.separator.tag,
			["LayoutOrder"] = 2 * v67,
			["testId"] = ("%*--separator-%*"):format(v_u_44.testId, v78)
		}, {
			["Slash"] = v_u_4.createElement(v_u_13, {
				["Text"] = "/",
				["tag"] = nil,
				["LayoutOrder"] = 1,
				["testId"] = nil,
				["tag"] = v45.separator.textTag,
				["testId"] = ("%*--separator-%*--text"):format(v_u_44.testId, v78)
			})
		})
	end
	if v_u_47 then
		v66.OverflowMenu = v_u_4.createElement(v_u_12, {
			["isOpen"] = v49,
			["items"] = v65,
			["size"] = v_u_44.size,
			["anchorRef"] = v48,
			["onActivated"] = v56,
			["onPressedOutside"] = v53,
			["LayoutOrder"] = #v60 * 2,
			["testId"] = ("%*--overflow-menu"):format(v_u_44.testId)
		})
	end
	return v_u_4.createElement(v_u_14, v_u_15(v_u_44, {
		["tag"] = v45.container.tag,
		["ref"] = p43
	}), v66)
end))