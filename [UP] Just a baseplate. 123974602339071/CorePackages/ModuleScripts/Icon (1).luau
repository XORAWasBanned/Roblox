-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Icon.Icon
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v2.BuilderIcons)
local v_u_5 = v4.Font
local v6 = v4.IconVariant
local v7 = require(v1.Enums.IconSize)
local v_u_8 = require(v1.Components.Image)
local v_u_9 = require(v1.Components.Text)
local v_u_10 = require(v1.Utility.Flags)
local v_u_11 = require(v1.Utility.Logger)
local v_u_12 = require(v1.Utility.devAssert)
local v_u_13 = require(v1.Utility.isBuilderIcon)
local v_u_14 = require(script.Parent.migrateFontSize)
local v_u_15 = require(script.Parent.migrateIconName)
local v_u_16 = require(v1.Utility.useIconSize)
local v_u_17 = require(v1.Providers.Style.useTextSizeOffset)
local v_u_18 = require(v1.Providers.Style.useTokens)
local v_u_19 = require(v1.Utility.withCommonProps)
local v_u_20 = require(v1.Utility.withDefaults)
require(v1.Components.Types)
local v_u_21 = {
	["size"] = nil,
	["variant"] = nil,
	["testId"] = "--foundation-icon",
	["size"] = v7.Medium,
	["variant"] = v6.Regular
}
return v_u_3.memo(v_u_3.forwardRef(function(p22, p23) -- name: Icon
	-- upvalues: (copy) v_u_20, (copy) v_u_21, (copy) v_u_18, (copy) v_u_17, (copy) v_u_15, (copy) v_u_16, (copy) v_u_13, (copy) v_u_10, (copy) v_u_12, (copy) v_u_14, (copy) v_u_11, (copy) v_u_3, (copy) v_u_8, (copy) v_u_19, (copy) v_u_9, (copy) v_u_5
	local v24 = v_u_20(p22, v_u_21)
	local v25 = v_u_18()
	local v26 = v_u_17()
	local v27 = v_u_15(v24.name)
	local v28 = v_u_16(v24.size, v_u_13(v24.name))
	local v29 = v24.variant
	local v30 = v24.name
	local v31
	if typeof(v28) == "table" then
		v31 = nil
	else
		v31 = v28.Y.Offset
	end
	local v32 = false
	if not v_u_13(v30) and v27 then
		if typeof(v28) == "table" then
			if v_u_10.FoundationDevOnlyPropAsserts then
				v_u_12(false, "Binding size isn\'t supported when migrating a UIBlox icon, use Builder Icons directly")
			else
				error("Binding size isn\'t supported when migrating a UIBlox icon, use Builder Icons directly")
			end
		else
			v29 = v27.variant or v29
			v30 = v27.name
			v31 = v_u_14(v31, v25)
			v32 = true
		end
	end
	local v33 = v24.style or v25.Color.Content.Default
	if not (v_u_13(v30) or v32) then
		if p22.variant ~= nil then
			v_u_11:warning("variant is not supported when using FoundationImages, consider using BuilderIcons")
		end
		return v_u_3.createElement(v_u_8, v_u_19(v24, {
			["imageStyle"] = v33,
			["Image"] = v30,
			["Size"] = v28,
			["ref"] = p23,
			["Rotation"] = v24.Rotation
		}), v24.children)
	end
	local v34 = v_u_3.createElement
	local v35 = v_u_9
	local v36 = v_u_19(v24, {
		["textStyle"] = v33,
		["Text"] = v30,
		["fontStyle"] = {
			["Font"] = v_u_5[v29],
			["FontSize"] = v31
		},
		["TextScaled"] = typeof(v28) == "table",
		["Size"] = v28,
		["ref"] = p23,
		["Rotation"] = v24.Rotation
	})
	local v37 = {}
	local v38
	if v26 > 0 and v31 then
		v38 = v_u_3.createElement("UITextSizeConstraint", {
			["MaxTextSize"] = v31
		})
	else
		v38 = nil
	end
	v37.UITextSizeConstraint = v38
	v37.Children = v_u_3.createElement(v_u_3.Fragment, nil, v24.children)
	return v34(v35, v36, v37)
end))