-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Breadcrumb.BreadcrumbAccessory
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.BuilderIcons).Migration.uiblox
local v_u_5 = require(v1.Components.AvatarIcon)
local v_u_6 = require(v1.Components.Icon)
local v_u_7 = require(v1.Components.Image)
require(v1.Components.Types)
local v8 = require(v1.Utility.iconMigrationUtils)
local v_u_9 = v8.isMigrated
local v_u_10 = v8.isBuilderOrMigratedIcon
local v_u_11 = require(v1.Enums.AccessoryType)
require(v1.Enums.AvatarIconSize)
require(v1.Enums.IconSize)
return v_u_3.memo(function(p12) -- name: BreadcrumbAccessory
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_5, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7
	local v13 = p12.variant
	local v14 = p12.config
	local v15
	if type(v14) == "string" then
		v15 = {
			["iconName"] = p12.config
		}
	else
		v15 = p12.config
	end
	if v15.type == v_u_11.Avatar then
		return v_u_3.createElement(v_u_5, {
			["userId"] = v15.userId,
			["size"] = v13.avatarSize,
			["LayoutOrder"] = p12.LayoutOrder,
			["testId"] = p12.testId
		})
	end
	local v16 = v15.iconName
	if not v_u_10(v16) then
		return v_u_3.createElement(v_u_7, {
			["Image"] = v16,
			["tag"] = v13.tag,
			["LayoutOrder"] = p12.LayoutOrder,
			["testId"] = p12.testId
		})
	end
	local v17 = v_u_3.createElement
	local v18 = v_u_6
	local v19 = {}
	local v20
	if v_u_9(v16) then
		v20 = v_u_4[v16].name
	else
		v20 = v16
	end
	v19.name = v20
	local v21
	if v_u_9(v16) then
		v21 = v_u_4[v16].variant
	else
		v21 = v15.iconVariant
	end
	v19.variant = v21
	v19.size = v13.iconSize
	v19.style = v13.style
	v19.LayoutOrder = p12.LayoutOrder
	v19.testId = p12.testId
	return v17(v18, v19)
end)