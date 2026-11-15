-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Avatar.Avatar
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Image)
local v_u_5 = require(v1.Components.StatusIndicator)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Utility.mapBindable)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = require(v1.Enums.ThumbnailSize)
local v_u_11 = require(v1.Enums.ThumbnailType)
local v_u_12 = require(v1.Utility.getRbxThumb)
local v_u_13 = require(script.Parent.useAvatarVariants)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v16 = require(v1.Enums.AvatarSize)
local v17 = require(v1.Enums.UserPresence)
local v_u_18 = require(script.Parent.getAvatarSize)
local v_u_19 = {
	["size"] = nil,
	["userPresence"] = nil,
	["testId"] = "--foundation-avatar",
	["size"] = v16.Medium,
	["userPresence"] = v17.None
}
return v_u_3.memo(v_u_3.forwardRef(function(p20, p21) -- name: Avatar
	-- upvalues: (copy) v_u_9, (copy) v_u_19, (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_18, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_4, (copy) v_u_7, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_5
	local v_u_22 = v_u_9(p20, v_u_19)
	local v23 = v_u_14()
	local v24 = v_u_15()
	local v25 = v_u_13(v23, v_u_22.size, v_u_22.userPresence, v_u_22.backplateStyle, v24.isIconSize)
	local v26 = v_u_18(v23, v_u_22.size, v24.isIconSize)
	local v27 = v_u_3.createElement
	local v28 = v_u_6
	local v29 = v_u_8(v_u_22, {
		["tag"] = v25.container.tag,
		["ref"] = p21,
		["backgroundStyle"] = v25.container.backgroundStyle,
		["stroke"] = v25.container.stroke,
		["Size"] = UDim2.fromOffset(v26, v26)
	})
	local v31 = {
		["Image"] = v_u_3.createElement(v_u_4, {
			["Image"] = v_u_7(v_u_22.userId, function(p30)
				-- upvalues: (ref) v_u_12, (ref) v_u_11, (ref) v_u_10, (copy) v_u_22
				return v_u_12(v_u_11.AvatarHeadShot, p30, v_u_10.Medium, {
					["includeProfileFrame"] = v_u_22.includeProfileFrame
				})
			end),
			["tag"] = v25.avatar.tag,
			["backgroundStyle"] = v_u_22.backgroundStyle,
			["testId"] = ("%*--image"):format(v_u_22.testId)
		})
	}
	local v32
	if v25.statusIndicator.isVisible then
		v32 = v_u_3.createElement(v_u_5, {
			["testId"] = ("%*--status-indicator"):format(v_u_22.testId),
			["variant"] = v25.statusIndicator.variant,
			["shape"] = v25.statusIndicator.shape,
			["size"] = v25.statusIndicator.size,
			["mask"] = v25.statusIndicatorMask.mask,
			["ZIndex"] = v25.statusIndicatorMask.ZIndex,
			["AnchorPoint"] = v25.statusIndicatorMask.AnchorPoint,
			["Position"] = v25.statusIndicatorMask.Position
		})
	else
		v32 = nil
	end
	v31.Indicator = v32
	return v27(v28, v29, v31)
end))