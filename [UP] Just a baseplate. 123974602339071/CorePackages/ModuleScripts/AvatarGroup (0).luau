-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AvatarGroup.AvatarGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Avatar)
local v_u_5 = require(v1.Enums.InputSize)
local v_u_6 = require(v1.Components.InternalAvatarGroup)
require(v1.Components.Types)
require(v1.Enums.UserPresence)
local v_u_7 = require(v1.Providers.Style.useTokens)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = require(v1.Enums.AvatarGroupType)
local v_u_11 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v_u_12 = require(v1.Components.Avatar.getAvatarSize)
local v_u_13 = {
	["type"] = nil,
	["max"] = (1 / 0),
	["size"] = nil,
	["testId"] = "--foundation-avatar-group",
	["type"] = v_u_10.Spread,
	["size"] = v_u_5.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p14, p15) -- name: AvatarGroup
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_11, (copy) v_u_7, (copy) v_u_10, (copy) v_u_5, (copy) v_u_12, (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8
	local v_u_16 = v_u_9(p14, v_u_13)
	local v17 = v_u_11()
	local v18 = v_u_7()
	local v19 = v_u_16.size
	local v20
	if v_u_16.type == v_u_10.Spread then
		v20 = v18.Size.Size_200
	elseif v17.isIconSize then
		if v19 == v_u_5.Large or v19 == v_u_5.Medium then
			v20 = -v18.Size.Size_50
		else
			v20 = -v18.Size.Size_0
		end
	elseif v19 == v_u_5.XSmall then
		v20 = -v18.Size.Size_50
	else
		v20 = -v18.Size.Size_100
	end
	local v21 = v_u_12(v18, v19, v17.isIconSize)
	local v22 = v_u_16.backplateStyle or v18.Color.Surface.Surface_0
	local v26 = v_u_3.useCallback(function(p23, p24)
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) v_u_16
		local v25
		if typeof(p23) == "table" then
			v25 = p23.userPresence
			p23 = p23.userId
		else
			v25 = nil
		end
		return v_u_3.createElement(v_u_4, {
			["userId"] = p23,
			["key"] = p24.key,
			["backgroundStyle"] = p24.backgroundStyle,
			["backplateStyle"] = p24.backplateStyle,
			["size"] = v_u_16.size,
			["userPresence"] = v25,
			["LayoutOrder"] = p24.LayoutOrder,
			["Position"] = p24.Position,
			["ZIndex"] = p24.ZIndex,
			["testId"] = p24.testId
		})
	end, { v_u_16.size })
	local v27 = v_u_3.createElement
	local v28 = v_u_6
	local v29 = v_u_8
	local v30 = {
		["ref"] = p15,
		["type"] = v_u_16.type,
		["max"] = v_u_16.max,
		["resolvedSize"] = v21
	}
	local v31 = v19 ~= v_u_5.XSmall and v17.isIconSize
	if v31 then
		v31 = v19 == v_u_5.Small
	end
	v30.isEllipsedOverflow = v31
	v30.gap = v20
	v30.backplateStyle = v22
	v30.avatars = v_u_16.avatars
	v30.renderAvatar = v26
	return v27(v28, v29(v_u_16, v30))
end))