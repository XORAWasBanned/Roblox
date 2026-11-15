-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.HeroMedia.DialogHeroMedia
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Constants)
local v_u_5 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
require(v1.Enums.DialogSize)
local v_u_7 = require(script.Parent.Parent.useDialog)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = require(script.Parent.Parent.useDialogVariants).useDialogVariants
local v_u_10 = {
	["height"] = UDim.new(1, 0)
}
return function(p11) -- name: DialogHeroMedia
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_9, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v12 = v_u_8(p11, v_u_10)
	local v_u_13 = v_u_7()
	local v14 = v_u_9()
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_13
		v_u_13.setHasHeroMedia(true)
		return function()
			-- upvalues: (ref) v_u_13
			v_u_13.setHasHeroMedia(false)
		end
	end, {})
	local v15 = v14.heroMedia.offsetX
	local v16 = v_u_3.createElement
	local v17 = v_u_6
	local v18 = {
		["tag"] = v14.heroMediaWrapper.tag,
		["LayoutOrder"] = v_u_4.MIN_LAYOUT_ORDER,
		["testId"] = ("%*--hero-media"):format(v_u_13.testId)
	}
	local v19 = {
		["Image"] = v_u_3.createElement(v_u_5, {
			["Image"] = v12.media,
			["imageStyle"] = v12.mediaStyle,
			["backgroundStyle"] = v12.backgroundStyle,
			["tag"] = v14.heroMedia.tag,
			["aspectRatio"] = v12.aspectRatio,
			["ScaleType"] = v12.scaleType,
			["testId"] = ("%*--hero-media-image"):format(v_u_13.testId),
			["Position"] = UDim2.fromOffset(-v15, 0),
			["Size"] = UDim2.new(1, v15 * 2, v12.height.Scale, v12.height.Offset)
		})
	}
	return v16(v17, v18, v19)
end