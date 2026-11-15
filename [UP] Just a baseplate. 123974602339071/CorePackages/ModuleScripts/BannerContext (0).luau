-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BannerContext.BannerContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Enums.BannerContextPresentation)
local v5 = require(v1.Enums.BannerContextVariant)
local v_u_6 = require(v1.Components.InternalNotice)
require(v1.Components.Types)
local v_u_7 = require(v1.Providers.Style.useTokens)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = require(script.Parent.useBannerContextVariants)
local v_u_11 = {
	["variant"] = nil,
	["presentation"] = nil,
	["testId"] = "--foundation-banner-context",
	["variant"] = v5.Standard,
	["presentation"] = v4.Inline
}
return v_u_3.memo(v_u_3.forwardRef(function(p12, p13) -- name: BannerContext
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_7, (copy) v_u_10, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8
	local v14 = v_u_9(p12, v_u_11)
	local v15 = v_u_10(v_u_7(), v14.presentation, v14.variant)
	return v_u_3.createElement(v_u_6, v_u_8(v14, {
		["text"] = nil,
		["icon"] = nil,
		["link"] = nil,
		["onClose"] = nil,
		["truncation"] = true,
		["variantProps"] = nil,
		["ref"] = nil,
		["text"] = v14.text,
		["icon"] = v14.icon,
		["link"] = v14.link,
		["onClose"] = v14.onClose,
		["variantProps"] = v15,
		["ref"] = p13
	}))
end))