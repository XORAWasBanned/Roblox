-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AvatarIcon.AvatarIcon
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Utility.mapBindable)
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = require(v1.Enums.ThumbnailSize)
local v_u_10 = require(v1.Enums.ThumbnailType)
local v_u_11 = require(v1.Utility.getRbxThumb)
local v12 = require(v1.Enums.AvatarIconSize)
local v_u_13 = require(script.Parent.useAvatarIconVariants)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = {
	["size"] = nil,
	["testId"] = "--foundation-avatar-icon",
	["size"] = v12.Medium
}
return v_u_3.memo(v_u_3.forwardRef(function(p16, p17) -- name: AvatarIcon
	-- upvalues: (copy) v_u_8, (copy) v_u_15, (copy) v_u_14, (copy) v_u_13, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9
	local v18 = v_u_8(p16, v_u_15)
	local v19 = v_u_13(v_u_14(), v18.size, v18.backplateStyle)
	local v20 = v_u_3.createElement
	local v21 = v_u_5
	local v22 = v_u_7(v18, {
		["tag"] = v19.container.tag,
		["ref"] = p17,
		["stroke"] = v19.container.stroke,
		["backgroundStyle"] = v18.backplateStyle,
		["Size"] = UDim2.fromOffset(v19.container.size, v19.container.size)
	})
	local v24 = {
		["Image"] = v_u_3.createElement(v_u_4, {
			["Image"] = v_u_6(v18.userId, function(p23)
				-- upvalues: (ref) v_u_11, (ref) v_u_10, (ref) v_u_9
				return v_u_11(v_u_10.AvatarHeadShot, p23, v_u_9.Medium)
			end),
			["tag"] = v19.avatar.tag,
			["backgroundStyle"] = v18.backgroundStyle
		})
	}
	return v20(v21, v22, v24)
end))