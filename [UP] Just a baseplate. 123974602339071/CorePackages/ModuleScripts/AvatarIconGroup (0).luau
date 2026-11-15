-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AvatarIconGroup.AvatarIconGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.AvatarIcon)
local v_u_5 = require(v1.Components.InternalAvatarGroup)
require(v1.Components.Types)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = require(v1.Enums.AvatarIconSize)
local v_u_10 = require(v1.Enums.AvatarGroupType)
local v_u_11 = require(v1.Components.AvatarIcon.useAvatarIconVariants)
local function v_u_15(p12, p13, p14) -- name: renderAvatarIcon
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return v_u_3.createElement(v_u_4, {
		["userId"] = p12,
		["key"] = p13.key,
		["backgroundStyle"] = p13.backgroundStyle,
		["backplateStyle"] = p13.backplateStyle,
		["size"] = p14,
		["LayoutOrder"] = p13.LayoutOrder,
		["Position"] = p13.Position,
		["ZIndex"] = p13.ZIndex,
		["testId"] = p13.testId
	})
end
local v_u_16 = {
	["type"] = nil,
	["max"] = (1 / 0),
	["size"] = nil,
	["testId"] = "--foundation-avatar-icon-group",
	["type"] = v_u_10.Spread,
	["size"] = v_u_9.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p17, p18) -- name: AvatarIconGroup
	-- upvalues: (copy) v_u_8, (copy) v_u_16, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_15
	local v_u_19 = v_u_8(p17, v_u_16)
	local v20 = v_u_6()
	local v21 = v_u_11(v20, v_u_19.size).container.size
	local v22 = v_u_19.size
	local v23
	if v_u_19.type == v_u_10.Spread then
		v23 = v20.Size.Size_200
	elseif v22 == v_u_9.Large or v22 == v_u_9.Medium then
		v23 = -v20.Size.Size_50
	else
		v23 = -v20.Size.Size_0
	end
	return v_u_3.createElement(v_u_5, v_u_7(v_u_19, {
		["ref"] = nil,
		["type"] = nil,
		["max"] = nil,
		["resolvedSize"] = nil,
		["gap"] = nil,
		["isEllipsedOverflow"] = true,
		["backplateStyle"] = nil,
		["avatars"] = nil,
		["renderAvatar"] = nil,
		["ref"] = p18,
		["type"] = v_u_19.type,
		["max"] = v_u_19.max,
		["resolvedSize"] = v21,
		["gap"] = v23,
		["backplateStyle"] = v_u_19.backplateStyle,
		["avatars"] = v_u_19.avatars,
		["renderAvatar"] = function(p24, p25) -- name: renderAvatar
			-- upvalues: (ref) v_u_15, (copy) v_u_19
			return v_u_15(p24, p25, v_u_19.size)
		end
	}))
end))