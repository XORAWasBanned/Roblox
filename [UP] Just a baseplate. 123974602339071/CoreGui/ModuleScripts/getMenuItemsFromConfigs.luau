-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.MenuConfigs.getMenuItemsFromConfigs
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Foundation)
local v_u_4 = require(v2.Packages.React)
local v_u_5 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_6 = require(v1.Components.MenuItems.DropdownReportMenuItem)
local v_u_7 = require(v1.Components.MenuItems.ButtonReportMenuItem)
local v_u_8 = require(v1.Components.MenuItems.FreeCommentsMenuItem)
local v_u_9 = require(v1.Components.MenuItems.ModalBasedSelectorMenuItem)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.Constants)
local v_u_11 = v_u_3.Enums.ButtonVariant
local v_u_12 = require(v1.Flags.FFlagHideShortcutsOnReportDropdown)
local v_u_13 = require(v1.Flags.FFlagReportFocusNavIEMButtons)
return function(p_u_14, p_u_15, p_u_16, p17, p18) -- name: getMenuItemsFromConfigs
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_12, (copy) v_u_4, (copy) v_u_13, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_11, (copy) v_u_6, (copy) v_u_9
	local v19 = {}
	local v20 = v_u_5(v_u_10.localizationKeys)
	local v21
	if v_u_12 then
		v21 = v_u_4.useCallback(function(p22)
			-- upvalues: (copy) p_u_16
			if p_u_16.onDropdownMenuOpenChange then
				p_u_16.onDropdownMenuOpenChange(p22)
			end
		end, { p_u_16.onDropdownMenuOpenChange })
	else
		v21 = nil
	end
	local v_u_23
	if v_u_13 then
		v_u_23 = v_u_4.useRef(nil)
	else
		v_u_23 = nil
	end
	if v_u_13 then
		v_u_4.useEffect(function()
			-- upvalues: (copy) p_u_16, (copy) v_u_23
			if p_u_16.setLastSelectableObjects and v_u_23.current then
				p_u_16.setLastSelectableObjects({ v_u_23.current })
			end
		end, { v_u_23, p_u_16.setLastSelectableObjects })
	end
	if v_u_13 then
		p17 = {}
		for _, v24 in p17 do
			if not v24.getIsVisible(p_u_14) then
				continue
			end
			table.insert(p17, v24)
		end
	end
	for v25, v_u_26 in p17 do
		if not (v_u_13 or v_u_26.getIsVisible(p_u_14)) then
			continue
		end
		local v27 = v_u_26.componentType
		local v28 = v_u_26.componentName
		if v27 == "generic" then
			continue
		end
		if v27 == "freeComments" then
			local v29 = v_u_4.createElement
			local v30 = v_u_8
			local v32 = {
				["layoutOrder"] = v25,
				["comment"] = p_u_14.comment,
				["placeholderText"] = v20.ReportCommentPlaceholder,
				["menuContainerWidth"] = p_u_16.menuWidth,
				["isSmallPortraitViewport"] = p18,
				["onUpdate"] = function(p31) -- name: onUpdate
					-- upvalues: (copy) v_u_26, (copy) p_u_14, (copy) p_u_15, (copy) p_u_16
					v_u_26.onUpdate(p31, p_u_14, p_u_15, p_u_16)
				end
			}
			local v33
			if v_u_13 and v25 == #p17 then
				v33 = v_u_23
			else
				v33 = nil
			end
			v32.ref = v33
			v19[v28] = v29(v30, v32)
		elseif v27 == "button" then
			local v34 = v_u_26.getIconSrc(p_u_16)
			local v35 = v_u_4.createElement
			local v36 = v_u_7
			local v37 = {}
			local v38
			if v_u_26.fieldLabel == "" then
				v38 = v_u_26.fieldLabel
			else
				v38 = v20[v_u_26.fieldLabel]
			end
			v37.label = v38
			local v39 = v_u_4.createElement
			local v40 = v_u_3.Button
			local v41 = {}
			local v42
			if v_u_26.variant == "primary" then
				v42 = v_u_11.SubEmphasis
			else
				v42 = v_u_11.Subtle
			end
			v41.variant = v42
			v41.text = v20[v_u_26.getButtonLabel(p_u_16)]
			if v34 == "" then
				v34 = nil
			end
			v41.icon = v34
			v41.width = UDim.new(1, 0)
			local v43
			if v_u_26.getIsDisabled == nil then
				v43 = false
			else
				v43 = v_u_26.getIsDisabled(p_u_14, p_u_16)
			end
			v41.isDisabled = v43
			function v41.onActivated() -- name: onActivated
				-- upvalues: (copy) v_u_26, (copy) p_u_14, (copy) p_u_15, (copy) p_u_16
				v_u_26.onClick(p_u_14, p_u_15, p_u_16)
			end
			local v44
			if v_u_13 and v25 == #p17 then
				v44 = v_u_23
			else
				v44 = nil
			end
			v41.ref = v44
			v37.button = v39(v40, v41)
			v37.menuContainerWidth = p_u_16.menuWidth
			v37.layoutOrder = v25
			v37.isSmallPortraitViewport = p18
			v19[v28] = v35(v36, v37)
		elseif v27 == "dropdown" then
			local v45 = v_u_4.createElement
			local v46 = v_u_6
			local v48 = {
				["label"] = v20[v_u_26.fieldLabel],
				["placeholderText"] = v20.ChooseOne,
				["layoutOrder"] = v25,
				["onSelect"] = function(p47) -- name: onSelect
					-- upvalues: (copy) v_u_26, (copy) p_u_14, (copy) p_u_15, (copy) p_u_16
					v_u_26.onUpdateSelectedOption(p47, p_u_14, p_u_15, p_u_16)
				end,
				["onMenuOpenChange"] = v21,
				["menuContainerWidth"] = p_u_16.menuWidth,
				["readonlyValue"] = v20[v_u_26.readonlyValue],
				["selections"] = v_u_26.getMenuItems(p_u_14),
				["isSmallPortraitViewport"] = p18,
				["minHeight"] = p18 and 0 or v_u_10.MenuItemHeight
			}
			local v49
			if v_u_13 and v25 == #p17 then
				v49 = v_u_23
			else
				v49 = nil
			end
			v48.ref = v49
			v19[v28] = v45(v46, v48)
		else
			if v27 ~= "modalSelector" then
				continue
			end
			local v50 = v_u_4.createElement
			local v51 = v_u_9
			local v55 = {
				["label"] = v20[v_u_26.fieldLabel],
				["layoutOrder"] = v25,
				["onSelect"] = function(p52, p53, p54) -- name: onSelect
					-- upvalues: (copy) v_u_26, (copy) p_u_14, (copy) p_u_15, (copy) p_u_16
					v_u_26.onUpdateSelectedOption({
						["label"] = p52,
						["subLabel"] = p53,
						["identifier"] = p54
					}, p_u_14, p_u_15, p_u_16)
				end,
				["onMenuOpenChange"] = v21,
				["menuContainerWidth"] = p_u_16.menuWidth,
				["selectorHeight"] = v_u_10.MenuItemHeight,
				["selectedValue"] = not v_u_26.getSelectedValue or v20[v_u_26.getSelectedValue(p_u_14)] or (v_u_26.getSelectedValue(p_u_14) or nil),
				["selections"] = v_u_26.getMenuItems(p_u_14, v20),
				["viewportHeight"] = p_u_16.viewportDimension.height,
				["viewportWidth"] = p_u_16.viewportDimension.width,
				["isSmallPortraitViewport"] = p18,
				["placeholderText"] = v20.ChooseOne
			}
			local v56
			if v_u_13 and v25 == #p17 then
				v56 = v_u_23
			else
				v56 = nil
			end
			v55.ref = v56
			v19[v28] = v50(v51, v55)
		end
	end
	return v19
end