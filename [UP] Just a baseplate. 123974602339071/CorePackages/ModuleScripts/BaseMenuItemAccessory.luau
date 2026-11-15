-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.BaseMenuItemAccessory
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Avatar)
local v_u_5 = require(v1.Components.Badge)
local v_u_6 = require(v1.Components.Icon)
local v_u_7 = require(v1.Components.Image)
local v_u_8 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_9 = require(v1.Components.View)
local v_u_10 = require(v1.Utility.Flags)
local v11 = require(v1.Utility.iconMigrationUtils)
local v_u_12 = v11.isBuilderOrMigratedIcon
local v_u_13 = v11.normalizeIconName
local v_u_14 = require(v1.Providers.Style.PresentationContext)
require(v1.Providers.Style.Tokens)
local v_u_15 = require(v1.Enums.AccessoryType)
local v16 = require(v1.Enums.ColorNamespace)
require(v1.Enums.InputSize)
local v_u_17 = {
	["colorNamespace"] = nil,
	["isIconSize"] = true,
	["colorNamespace"] = v16.Color
}
return function(p18) -- name: Accessory
	-- upvalues: (copy) v_u_15, (copy) v_u_3, (copy) v_u_9, (copy) v_u_14, (copy) v_u_17, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5, (copy) v_u_10, (copy) v_u_12, (copy) v_u_7, (copy) v_u_13, (copy) v_u_6
	local v19 = p18.accessory
	if v19 == nil then
		return nil
	end
	local v20 = ("align-x-center align-y-center %*"):format(p18.iconVariant.tag)
	if v19.type == v_u_15.Avatar then
		local v21 = v_u_3.createElement
		local v22 = v_u_9
		local v23 = {
			["LayoutOrder"] = p18.LayoutOrder,
			["tag"] = v20,
			["testId"] = p18.testId
		}
		local v24 = {
			["Avatar"] = v_u_3.createElement(v_u_14.Provider, {
				["value"] = v_u_17
			}, {
				["Avatar"] = v_u_3.createElement(v_u_4, {
					["userId"] = v19.userId,
					["backplateStyle"] = p18.tokens.Color.Shift.Shift_200,
					["size"] = p18.size
				})
			})
		}
		return v21(v22, v23, v24)
	end
	if v19.type == "Hint" then
		return v_u_3.createElement(v_u_9, {
			["LayoutOrder"] = nil,
			["tag"] = "row align-y-center auto-xy padding-x-xsmall radius-small bg-shift-200",
			["testId"] = nil,
			["LayoutOrder"] = p18.LayoutOrder,
			["testId"] = p18.testId
		}, {
			["Text"] = v_u_3.createElement(v_u_8, {
				["Text"] = nil,
				["tag"] = "auto-xy text-caption-medium content-muted",
				["Text"] = v19.text
			})
		})
	end
	if v19.type == "Badge" then
		return v_u_3.createElement(v_u_5, {
			["LayoutOrder"] = p18.LayoutOrder,
			["text"] = v19.text,
			["icon"] = v19.icon,
			["variant"] = v19.variant,
			["testId"] = p18.testId
		})
	end
	if v_u_10.FoundationBaseMenuAccessorySizing and not v_u_12(v19.iconName) then
		return v_u_3.createElement(v_u_9, {
			["LayoutOrder"] = p18.LayoutOrder,
			["tag"] = v20,
			["testId"] = p18.testId
		}, {
			["Media"] = v_u_3.createElement(v_u_7, {
				["Image"] = nil,
				["ScaleType"] = nil,
				["tag"] = "size-full-full radius-xsmall",
				["testId"] = nil,
				["Image"] = v19.iconName,
				["ScaleType"] = Enum.ScaleType.Crop,
				["testId"] = ("%*--media"):format(p18.testId)
			})
		})
	end
	local v25
	if v_u_10.FoundationBaseMenuAccessorySizing then
		v25 = v_u_13(v19.iconName)
	else
		v25 = nil
	end
	local v26 = v_u_3.createElement
	local v27 = v_u_9
	local v28 = {
		["LayoutOrder"] = p18.LayoutOrder,
		["tag"] = v20,
		["testId"] = p18.testId
	}
	local v29 = {}
	local v30 = v_u_3.createElement
	local v31 = v_u_6
	local v32 = {}
	local v33
	if v_u_10.FoundationBaseMenuAccessorySizing then
		v33 = v25.name
	else
		v33 = v19.iconName
	end
	v32.name = v33
	local v34
	if v_u_10.FoundationBaseMenuAccessorySizing then
		v34 = v25.variant or v19.iconVariant
	else
		v34 = v19.iconVariant
	end
	v32.variant = v34
	v32.style = p18.iconVariant.style
	v32.size = p18.iconVariant.size
	v29.Icon = v30(v31, v32)
	return v26(v27, v28, v29)
end