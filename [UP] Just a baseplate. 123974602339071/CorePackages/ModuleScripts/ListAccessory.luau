-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.List.Item.ListAccessory
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.BuilderIcons).Migration.uiblox
local v_u_5 = require(v1.Components.Icon)
local v_u_6 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v8 = require(v1.Utility.iconMigrationUtils)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = v8.isMigrated
local v_u_11 = v8.isBuilderOrMigratedIcon
local v_u_12 = require(v2.Foundation.Enums.StateLayerAffordance)
local v_u_13 = require(v1.Enums.AccessoryType)
local v_u_14 = require(v1.Components.Avatar)
local v_u_15 = require(script.Parent.useListAccessoryVariants)
require(v1.Enums.InputSize)
return v_u_3.memo(function(p_u_16) -- name: ListAccessory
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_13, (copy) v_u_11, (copy) v_u_15, (copy) v_u_14, (copy) v_u_5, (copy) v_u_10, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_12
	local v17 = v_u_9()
	local v19 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_16
		local v18 = p_u_16.config
		return type(v18) == "string" and {
			["iconName"] = p_u_16.config
		} or p_u_16.config
	end, { p_u_16.config })
	local v20
	if v19.type == v_u_13.Avatar then
		v20 = v_u_13.Avatar
	else
		local v21 = p_u_16.config
		if type(v21) == "string" or v_u_11(v19.iconName) then
			v20 = v_u_13.Icon
		else
			v20 = v_u_13.Media
		end
	end
	local v22 = v_u_15(v17, p_u_16.size, v20)
	local v23
	if v19.type == v_u_13.Avatar then
		v23 = v_u_3.createElement(v_u_14, {
			["userId"] = v19.userId,
			["backplateStyle"] = v17.Color.Shift.Shift_200,
			["size"] = p_u_16.size
		})
	elseif v_u_11(v19.iconName) then
		local v24 = v_u_3.createElement
		local v25 = v_u_5
		local v26 = {}
		local v27
		if v_u_10(v19.iconName) then
			v27 = v_u_4[v19.iconName].name
		else
			v27 = v19.iconName
		end
		v26.name = v27
		local v28
		if v_u_10(v19.iconName) then
			v28 = v_u_4[v19.iconName].variant
		else
			v28 = v19.iconVariant
		end
		v26.variant = v28
		v26.size = v22.accessory.Size.Y.Offset
		v23 = v24(v25, v26)
	else
		v23 = v_u_3.createElement(v_u_6, {
			["Image"] = v19.iconName,
			["Size"] = v22.accessory.Size,
			["cornerRadius"] = v22.accessory.cornerRadius
		})
	end
	return v_u_3.createElement(v_u_7, {
		["Size"] = nil,
		["tag"] = "align-x-center align-y-center",
		["stateLayer"] = nil,
		["isDisabled"] = nil,
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["Size"] = v22.container.Size,
		["stateLayer"] = {
			["affordance"] = v_u_12.None
		},
		["isDisabled"] = p_u_16.isDisabled,
		["LayoutOrder"] = p_u_16.LayoutOrder,
		["testId"] = p_u_16.testId
	}, v23)
end)