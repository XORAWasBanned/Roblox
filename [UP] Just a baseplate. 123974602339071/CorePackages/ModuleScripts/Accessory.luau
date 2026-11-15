-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Chip.Accessory
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.BuilderIcons).Migration.uiblox
local v_u_5 = require(v1.Components.Icon)
local v_u_6 = require(v1.Components.Image)
local v_u_7 = require(v1.Components.View)
local v8 = require(v1.Utility.iconMigrationUtils)
local v_u_9 = require(v1.Utility.useCumulativeBackground)
local v_u_10 = require(v1.Providers.Style.useTokens)
local v_u_11 = v8.isMigrated
local v_u_12 = v8.isBuilderOrMigratedIcon
local v_u_13 = require(v1.Components.AvatarGroup)
require(v1.Enums.AvatarGroupType)
local v_u_14 = require(v1.Providers.Style.BackgroundStyleContext).useBackgroundStyle
require(v1.Components.Types)
local v_u_15 = require(v1.Utility.Flags)
local v_u_16 = require(script.Parent.useAccessoryVariants)
require(v1.Enums.ChipSize)
local function v_u_20(p17) -- name: AvatarGroupWrapper
	-- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_3, (copy) v_u_13
	local v18 = v_u_14()
	local v19 = table.clone(p17.config.props)
	v19.size = p17.size
	v19.backplateStyle = v_u_9(v18, p17.chipBackgroundStyle)
	return v_u_3.createElement(v_u_13, v19)
end
return v_u_3.memo(function(p_u_21) -- name: Accessory
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_16, (copy) v_u_15, (copy) v_u_20, (copy) v_u_12, (copy) v_u_5, (copy) v_u_11, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	local v22 = v_u_10()
	local v24 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_21
		local v23 = p_u_21.config
		return type(v23) == "string" and {
			["iconName"] = nil,
			["isCircular"] = false,
			["iconName"] = p_u_21.config
		} or p_u_21.config
	end, { p_u_21.config })
	local v25 = v_u_16
	local v26 = p_u_21.size
	local v27 = p_u_21.isLeading
	local v28
	if v_u_15.FoundationFixChipAccessoryLayout then
		v28 = v24.type == "AvatarGroup"
	else
		v28 = v24.type == "AvatarGroup" and true or (v24.isCircular or false)
	end
	local v29 = v25(v22, v26, v27, v28, p_u_21.isIconOnly)
	local v30
	if v24.type == "AvatarGroup" then
		v30 = v_u_3.createElement(v_u_20, p_u_21)
	elseif v_u_12(v24.iconName) then
		local v31 = v_u_3.createElement
		local v32 = v_u_5
		local v33 = {}
		local v34
		if v_u_11(v24.iconName) then
			v34 = v_u_4[v24.iconName].name
		else
			v34 = v24.iconName
		end
		v33.name = v34
		local v35
		if v_u_11(v24.iconName) then
			v35 = v_u_4[v24.iconName].variant
		else
			v35 = v24.iconVariant
		end
		v33.variant = v35
		v33.size = v29.accessory.Size.Y.Offset
		v33.style = p_u_21.contentStyle
		v30 = v31(v32, v33)
	else
		v30 = v_u_3.createElement(v_u_6, {
			["Image"] = v24.iconName,
			["Size"] = v29.accessory.Size,
			["imageStyle"] = p_u_21.contentStyle
		})
	end
	return v_u_3.createElement(v_u_7, {
		["tag"] = "auto-xy",
		["padding"] = nil,
		["onActivated"] = nil,
		["isDisabled"] = nil,
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["padding"] = v29.accessory.padding,
		["onActivated"] = v24.onActivated,
		["isDisabled"] = p_u_21.isDisabled,
		["LayoutOrder"] = p_u_21.isLeading and 1 or 3,
		["testId"] = p_u_21.testId
	}, v30)
end)