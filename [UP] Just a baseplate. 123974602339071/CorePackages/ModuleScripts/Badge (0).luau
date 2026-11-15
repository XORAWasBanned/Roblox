-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Badge.Badge
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v2.BuilderIcons)
local v_u_5 = v4.Migration.uiblox
local v_u_6 = v4.IconVariant
local v_u_7 = require(v1.Components.Icon)
local v_u_8 = require(v1.Components.Image)
local v_u_9 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Utility.getIconScale)
local v12 = require(v1.Utility.iconMigrationUtils)
local v_u_13 = require(script.Parent.useBadgeVariants)
local v_u_14 = require(v1.Utility.useIconSize)
local v_u_15 = require(v1.Providers.Style.useTokens)
local v_u_16 = require(v1.Utility.withCommonProps)
local v_u_17 = require(v1.Utility.withDefaults)
local v_u_18 = v12.isMigrated
local v_u_19 = v12.isBuilderOrMigratedIcon
local v_u_20 = require(v1.Utility.Flags)
local v_u_21 = require(v1.Utility.useScaledValue)
local v22 = require(v1.Enums.BadgeVariant)
local v23 = require(v1.Enums.BadgeShape)
local v24 = require(v1.Enums.BadgeSize)
local v_u_25 = require(v1.Enums.IconSize)
local v_u_26 = require(v1.Enums.IconPosition)
local v_u_27 = {
	["variant"] = nil,
	["shape"] = nil,
	["size"] = nil,
	["testId"] = "--foundation-badge",
	["variant"] = v22.Contrast,
	["shape"] = v23.Pill,
	["size"] = v24.Small
}
local v_u_28 = {
	[v22.Primary] = v22.Contrast
}
local v29 = v22.Secondary
local v30
if v_u_20.FoundationBadgeBetaUpdate then
	v30 = v22.Standard
else
	v30 = v22.Neutral
end
v_u_28[v29] = v30
local v31 = v22.Neutral
local v32
if v_u_20.FoundationBadgeBetaUpdate then
	v32 = v22.Standard
else
	v32 = nil
end
v_u_28[v31] = v32
return v_u_3.memo(v_u_3.forwardRef(function(p33, p34) -- name: Badge
	-- upvalues: (copy) v_u_17, (copy) v_u_27, (copy) v_u_28, (copy) v_u_21, (copy) v_u_15, (copy) v_u_3, (copy) v_u_26, (copy) v_u_13, (copy) v_u_20, (copy) v_u_25, (copy) v_u_14, (copy) v_u_19, (copy) v_u_7, (copy) v_u_18, (copy) v_u_5, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_16, (copy) v_u_9
	local v_u_35 = v_u_17(p33, v_u_27)
	local v36 = v_u_28[v_u_35.variant] or v_u_35.variant
	local v37 = v_u_21(200)
	local v38 = v_u_15()
	local v40 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_35, (ref) v_u_26
		local v39 = v_u_35.icon
		return typeof(v39) == "string" and {
			["name"] = v_u_35.icon,
			["position"] = v_u_26.Left
		} or v_u_35.icon
	end, { v_u_35.icon })
	local v41
	if v_u_35.text == nil then
		v41 = false
	else
		v41 = #v_u_35.text > 0
	end
	local v42 = not v41
	local v43 = v_u_13
	local v44 = v_u_35.shape
	local v45
	if v_u_20.FoundationBadgeBetaUpdate then
		v45 = v_u_35.size
	else
		v45 = nil
	end
	local v46
	if v_u_20.FoundationBadgeBetaUpdate and v40 then
		v46 = v40.position
	else
		v46 = nil
	end
	if v_u_20.FoundationBadgeBetaUpdate then
		v42 = nil
	end
	local v47 = v43(v38, v36, v44, v45, v46, v42)
	local v48
	if v_u_20.FoundationBadgeBetaUpdate then
		v48 = v47.icon.size
	else
		v48 = v_u_25.XSmall
	end
	local v49 = v_u_14(v48, true)
	local v50 = nil
	if v40 ~= nil then
		local v51 = v40.position == v_u_26.Left and 1 or 3
		if v_u_19(v40.name) then
			local v52 = v_u_3.createElement
			local v53 = v_u_7
			local v54 = {}
			local v55
			if v_u_18(v40.name) then
				v55 = v_u_5[v40.name].name
			else
				v55 = v40.name
			end
			v54.name = v55
			local v56
			if v_u_18(v40.name) then
				v56 = v_u_5[v40.name].variant
			elseif v_u_20.FoundationBadgeBetaUpdate then
				v56 = v40.variant or v_u_6.Filled
			else
				v56 = v40.variant
			end
			v54.variant = v56
			v54.size = v48
			local v57
			if v_u_20.FoundationBadgeBetaUpdate then
				v57 = v47.icon.style
			else
				v57 = v47.content.style
			end
			v54.style = v57
			v54.LayoutOrder = v51
			v54.testId = ("%*--icon"):format(v_u_35.testId)
			v50 = v52(v53, v54)
		else
			local v58, v59 = v_u_11(v40.name, v48)
			if v58 then
				local v60 = v_u_3.createElement
				local v61 = v_u_10
				local v62 = {
					["Size"] = v49
				}
				local v63 = v_u_3.createElement
				local v64 = v_u_8
				local v65 = {
					["Image"] = v40.name,
					["Size"] = UDim2.fromOffset(v58.X, v58.Y)
				}
				local v66
				if v_u_20.FoundationBadgeBetaUpdate then
					v66 = v47.icon.style
				else
					v66 = v47.content.style
				end
				v65.imageStyle = v66
				v65.scale = v59
				v65.AnchorPoint = Vector2.new(0.5, 0.5)
				v65.Position = UDim2.fromScale(0.5, 0.5)
				v65.LayoutOrder = v51
				v65.testId = ("%*--icon"):format(v_u_35.testId)
				v50 = v60(v61, v62, v63(v64, v65))
			end
		end
	end
	local v67 = v_u_3.createElement
	local v68 = v_u_10
	local v69 = v_u_16(v_u_35, {
		["backgroundStyle"] = v47.container.backgroundStyle,
		["stroke"] = v47.container.stroke,
		["tag"] = v47.container.tag,
		["ref"] = p34
	})
	local v70 = {
		["Icon"] = v50
	}
	local v71
	if v41 then
		v71 = v_u_3.createElement(v_u_9, {
			["Text"] = nil,
			["textStyle"] = nil,
			["RichText"] = true,
			["LayoutOrder"] = 2,
			["tag"] = nil,
			["testId"] = nil,
			["sizeConstraint"] = nil,
			["Text"] = v_u_35.text,
			["textStyle"] = v47.content.style,
			["tag"] = v47.text.tag,
			["testId"] = ("%*--text"):format(v_u_35.testId),
			["sizeConstraint"] = v_u_20.FoundationBadgeBetaUpdate and {
				["MaxSize"] = Vector2.new(v37, (1 / 0))
			} or nil
		})
	else
		v71 = nil
	end
	v70.Text = v71
	return v67(v68, v69, v70)
end))