-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuItem
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.BuilderIcons)
local v_u_4 = require(v1.Utility.Logger)
local v_u_5 = require(v2.React)
local v_u_6 = require(v1.Constants)
local v_u_7 = require(v1.Components.Icon)
local v_u_8 = require(v1.Components.Popover)
local v_u_9 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Providers.Style.useTokens)
local v_u_12 = require(v1.Utility.useBindable)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = require(v2.ReactUtils).useComposedRef
require(v1.Enums.InputSize)
local v_u_16 = require(v1.Enums.PopoverAlign)
local v_u_17 = require(v1.Enums.PopoverSide)
local v_u_18 = require(v1.Enums.Radius)
local v_u_19 = require(v1.Utility.Flags)
local v_u_20 = require(script.Parent.BaseMenuItemAccessory)
local v_u_21 = require(script.Parent.BaseMenuContext)
local v_u_22 = require(script.Parent.BaseMenuScrollContainer)
local v_u_23 = require(script.Parent.useBaseMenuItemVariants)
local v_u_24 = require(script.Parent.useMenuItemHover)
local v_u_25 = {
	["isChecked"] = false
}
local v_u_32 = (function() -- name: getInputSinkAll
	-- upvalues: (copy) v_u_19
	if v_u_19.FoundationGuiObjectInputSinkProperty then
		local v26 = game.GetEngineFeature
		local v27 = game
		local v28, v29 = pcall(v26, v27, "GuiObjectInputSink")
		if v28 and v29 then
			local v30, v31 = pcall(function()
				return Enum.InputSink.All
			end)
			if v30 then
				return v31
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end)()
local function v_u_36(p33, p34) -- name: getContainerPadding
	local v35
	if p34 then
		v35 = p33.paddingLeftWithCheck
	else
		v35 = p33.paddingLeftWithoutCheck
	end
	return {
		["left"] = UDim.new(0, v35 or 0),
		["right"] = UDim.new(0, p33.paddingRight or 0)
	}
end
return v_u_5.memo(v_u_5.forwardRef(function(p37, p38) -- name: BaseMenuItem
	-- upvalues: (copy) v_u_14, (copy) v_u_25, (copy) v_u_5, (copy) v_u_21, (copy) v_u_11, (copy) v_u_23, (copy) v_u_24, (copy) v_u_4, (copy) v_u_12, (copy) v_u_15, (copy) v_u_36, (copy) v_u_10, (copy) v_u_7, (copy) v_u_3, (copy) v_u_20, (copy) v_u_9, (copy) v_u_13, (copy) v_u_6, (copy) v_u_22, (copy) v_u_32, (copy) v_u_8, (copy) v_u_17, (copy) v_u_16, (copy) v_u_18
	local v_u_39 = v_u_14(p37, v_u_25)
	local v_u_40 = v_u_5.useContext(v_u_21)
	local v41
	if v_u_39.menuHasLeading == nil then
		v41 = v_u_40.hasLeading == true
	else
		v41 = v_u_39.menuHasLeading
	end
	local v42
	if v_u_39.menuHasCheck == nil then
		v42 = v_u_39.isChecked == true
	else
		v42 = v_u_39.menuHasCheck
	end
	local v_u_43 = v_u_11()
	local v_u_44 = v_u_39.size or v_u_40.size
	local v_u_45 = v_u_40.depth
	local v_u_46 = v_u_39.children ~= nil
	local v_u_47
	if v_u_46 then
		v_u_47 = v_u_40.hoverOpenPath[v_u_45] == v_u_39.id
	else
		v_u_47 = v_u_46
	end
	local v48 = v_u_39.leading or v_u_39.icon
	local v49
	if v48 == nil then
		v49 = nil
	else
		v49 = type(v48) == "string" and {
			["iconName"] = v48
		} or v48
	end
	local v50 = v_u_39.trailing
	local v51
	if v50 == nil then
		v51 = nil
	else
		v51 = type(v50) == "string" and {
			["iconName"] = v50
		} or v50
	end
	local v52 = v_u_40.maxHeight ~= nil
	local v53 = v_u_23(v_u_43, v_u_44, v52)
	local v54 = v_u_5.useRef(nil)
	local v55
	if v_u_39.isChecked == true then
		v55 = not v_u_46
	else
		v55 = false
	end
	local v_u_56, v_u_57 = v_u_5.useState(false)
	local v_u_58 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_57
		v_u_57(true)
	end, {})
	local v_u_59 = v49 ~= nil
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_59, (copy) v_u_40
		if v_u_59 and v_u_40.setHasLeading then
			v_u_40.setHasLeading()
		end
	end, { v_u_59, v_u_40.setHasLeading })
	v_u_24({
		["itemRef"] = v54,
		["id"] = v_u_39.id,
		["depth"] = v_u_45,
		["isSubmenu"] = v_u_46,
		["isDisabled"] = v_u_39.isDisabled,
		["hoverOpenAtDepth"] = v_u_40.hoverOpenAtDepth,
		["hoverCloseAtDepth"] = v_u_40.hoverCloseAtDepth
	})
	local v61 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_46, (copy) v_u_39, (copy) v_u_40, (copy) v_u_47, (copy) v_u_45, (ref) v_u_4
		if v_u_46 then
			if v_u_39.isDisabled then
				return
			end
			if v_u_40.hoverOpenAtDepth and not v_u_47 then
				v_u_40.hoverOpenAtDepth(v_u_45, v_u_39.id, true)
				return
			end
		else
			if v_u_40.hoverReset then
				v_u_40.hoverReset()
			end
			local v60
			if v_u_39.onActivated then
				v60 = v_u_39.onActivated
			else
				v60 = v_u_40.onActivated
			end
			if v60 then
				v60(v_u_39.id)
			else
				v_u_4:warning("Menu should have either onActivated on itself or on all of its children")
			end
			if v_u_45 > 1 and v_u_40.onNestedLeafActivated then
				v_u_40.onNestedLeafActivated()
			end
		end
	end, {
		v_u_46,
		v_u_39.isDisabled,
		v_u_47,
		v_u_45,
		v_u_39.id,
		v_u_39.onActivated,
		v_u_40.onActivated,
		v_u_40.onNestedLeafActivated,
		v_u_40.hoverOpenAtDepth,
		v_u_40.hoverReset
	})
	local v62 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_40
		if v_u_40.hoverReset then
			v_u_40.hoverReset()
		end
	end, { v_u_40.hoverReset })
	local v63 = v_u_12(v_u_40.maxHeight)
	local v64 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_43
		return {
			["radius"] = UDim.new(0, v_u_43.Radius.Small),
			["offset"] = v_u_43.Size.Size_200,
			["borderWidth"] = v_u_43.Stroke.Thicker
		}
	end, { v_u_43 })
	local v65 = v_u_15(v54, p38)
	local v66 = v_u_36(v53.container, v42)
	local v67 = {
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["Padding"] = UDim.new(0, 0),
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	}
	local v68 = v53.wrapper and (v53.wrapper.gap or 0) or 0
	local v69
	if v42 then
		local v70 = v_u_5.createElement
		local v71 = v_u_10
		local v72 = {
			["LayoutOrder"] = 1,
			["tag"] = nil,
			["testId"] = nil,
			["tag"] = ("%* %*"):format(v53.slotAlign.tag, v53.check.tag),
			["testId"] = ("%*--check-column"):format(v_u_39.testId)
		}
		local v73 = {}
		local v74
		if v55 then
			v74 = v_u_5.createElement(v_u_7, {
				["name"] = v_u_3.Icon.Check,
				["style"] = v53.check.style,
				["size"] = v53.check.size,
				["testId"] = ("%*--checkmark"):format(v_u_39.testId)
			})
		else
			v74 = nil
		end
		v73.Check = v74
		v69 = v70(v71, v72, v73)
	else
		v69 = nil
	end
	local v75 = nil
	if v49 == nil then
		if v41 then
			v75 = v_u_5.createElement(v_u_10, {
				["LayoutOrder"] = 1,
				["tag"] = nil,
				["tag"] = ("%* %*"):format(v53.slotAlign.tag, v53.icon.tag)
			})
		end
	else
		v75 = v_u_5.createElement(v_u_20, {
			["LayoutOrder"] = 1,
			["accessory"] = nil,
			["iconVariant"] = nil,
			["size"] = nil,
			["tokens"] = nil,
			["testId"] = nil,
			["accessory"] = v49,
			["iconVariant"] = v53.icon,
			["size"] = v_u_44,
			["tokens"] = v_u_43,
			["testId"] = ("%*--leading"):format(v_u_39.testId)
		})
	end
	local v76 = v_u_5.createElement(v_u_9, {
		["LayoutOrder"] = 2,
		["Text"] = nil,
		["tag"] = nil,
		["Text"] = v_u_39.text,
		["tag"] = v53.text.tag
	})
	local v77 = nil
	if v_u_46 then
		v77 = v_u_5.createElement(v_u_7, {
			["LayoutOrder"] = 3,
			["name"] = nil,
			["style"] = nil,
			["size"] = nil,
			["testId"] = nil,
			["name"] = v_u_3.Icon.ChevronSmallRight,
			["style"] = v53.check.style,
			["size"] = v53.chevron.size,
			["testId"] = ("%*--chevron"):format(v_u_39.testId)
		})
	elseif v51 ~= nil then
		v77 = v_u_5.createElement(v_u_20, {
			["LayoutOrder"] = 3,
			["accessory"] = nil,
			["iconVariant"] = nil,
			["size"] = nil,
			["tokens"] = nil,
			["testId"] = nil,
			["accessory"] = v51,
			["iconVariant"] = v53.icon,
			["size"] = v_u_44,
			["tokens"] = v_u_43,
			["testId"] = ("%*--trailing"):format(v_u_39.testId)
		})
	end
	local v78 = v_u_5.createElement
	local v79 = v_u_10
	local v80 = v_u_13
	local v81 = {}
	local v82
	if v_u_39.isDisabled then
		v82 = v_u_6.DISABLED_TRANSPARENCY
	else
		v82 = nil
	end
	v81.GroupTransparency = v82
	v81.isDisabled = v_u_39.isDisabled
	v81.onActivated = v61
	v81.selection = {
		["Selectable"] = not v_u_39.isDisabled
	}
	v81.cursor = v64
	v81.tag = v53.container.tag
	v81.padding = v66
	v81.layout = v67
	v81.ref = v65
	local v83 = v78(v79, v80(v_u_39, v81), {
		["Check"] = v69,
		["Wrapper"] = v_u_5.createElement(v_u_10, {
			["LayoutOrder"] = 2,
			["tag"] = "auto-xy",
			["flexItem"] = nil,
			["layout"] = nil,
			["flexItem"] = {
				["FlexMode"] = Enum.UIFlexMode.Fill
			},
			["layout"] = {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceBetween,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, v68),
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}
		}, {
			["Leading"] = v75,
			["Title"] = v76,
			["Trailing"] = v77
		})
	})
	local v84 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_40, (copy) v_u_44, (copy) v_u_56, (copy) v_u_58, (copy) v_u_45
		return {
			["onActivated"] = v_u_40.onActivated,
			["onNestedLeafActivated"] = v_u_40.onNestedLeafActivated,
			["size"] = v_u_44,
			["hasLeading"] = v_u_56,
			["setHasLeading"] = v_u_58,
			["hoverOpenPath"] = v_u_40.hoverOpenPath,
			["hoverOpenAtDepth"] = v_u_40.hoverOpenAtDepth,
			["hoverCloseAtDepth"] = v_u_40.hoverCloseAtDepth,
			["hoverReset"] = v_u_40.hoverReset,
			["depth"] = v_u_45 + 1,
			["maxHeight"] = v_u_40.maxHeight
		}
	end, {
		v_u_40.onActivated,
		v_u_40.onNestedLeafActivated,
		v_u_44,
		v_u_56,
		v_u_40.hoverOpenPath,
		v_u_40.hoverOpenAtDepth,
		v_u_40.hoverCloseAtDepth,
		v_u_40.hoverReset,
		v_u_45,
		v_u_40.maxHeight
	})
	if not v_u_46 then
		return v83
	end
	local v85 = v_u_43.Stroke.Standard
	local v86 = v53.groupPadding.size
	local v87 = v_u_5.createElement(v_u_21.Provider, {
		["value"] = v84
	}, v_u_39.children)
	local v88
	if v52 then
		v88 = v_u_5.createElement(v_u_22, {
			["maxHeight"] = v63,
			["scrollViewProps"] = {
				["tag"] = v53.submenuContent.tag,
				["InputSink"] = v_u_32
			}
		}, v87)
	else
		v88 = v_u_5.createElement(v_u_10, {
			["tag"] = v53.submenuContent.tag,
			["InputSink"] = v_u_32
		}, v87)
	end
	return v_u_5.createElement(v_u_5.Fragment, nil, {
		["Item"] = v83,
		["Submenu"] = v_u_5.createElement(v_u_8.Root, {
			["isOpen"] = v_u_47,
			["testId"] = ("%*--submenu"):format(v_u_39.testId)
		}, {
			["Anchor"] = v_u_5.createElement(v_u_8.Anchor, {
				["anchorRef"] = v54
			}),
			["Content"] = v_u_5.createElement(v_u_8.Content, {
				["side"] = nil,
				["align"] = nil,
				["hasArrow"] = false,
				["onPressedOutside"] = nil,
				["backgroundStyle"] = nil,
				["radius"] = nil,
				["side"] = {
					["position"] = v_u_17.Right,
					["offset"] = v86 / 2 + v85
				},
				["align"] = {
					["position"] = v_u_16.Start,
					["offset"] = -v86
				},
				["onPressedOutside"] = v62,
				["backgroundStyle"] = v_u_43.Color.Surface.Surface_200,
				["radius"] = v_u_18.Medium
			}, v88)
		})
	})
end))