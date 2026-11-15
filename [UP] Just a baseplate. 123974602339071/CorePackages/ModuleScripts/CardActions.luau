-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Card.Subcomponents.CardActions
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.ButtonVariant)
local v6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Components.IconButton)
local v_u_8 = require(v1.Components.View)
require(script.Parent.Parent.useCardVariants)
local v_u_9 = v3.Icon
local v_u_10 = v6.Small
return function(p11) -- name: CardActions
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_5, (copy) v_u_10
	local v12 = p11.variantProps
	local v13 = v_u_4.createElement
	local v14 = v_u_8
	local v15 = {
		["tag"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = 2,
		["testId"] = nil,
		["tag"] = v12.actions.tag
	}
	local v16
	if p11.isInline then
		v16 = nil
	else
		v16 = Vector2.new(1, 0)
	end
	v15.AnchorPoint = v16
	local v17
	if p11.isInline then
		v17 = nil
	else
		v17 = UDim2.fromScale(1, 0)
	end
	v15.Position = v17
	v15.LayoutOrder = p11.isInline and 2 or nil
	v15.testId = ("%*--actions"):format(p11.testId)
	local v18 = {}
	local v19
	if p11.onOverflow then
		local v20 = v_u_4.createElement
		local v21 = v_u_7
		local v22 = {
			["onActivated"] = nil,
			["icon"] = nil,
			["variant"] = nil,
			["size"] = nil,
			["isCircular"] = true,
			["ref"] = nil,
			["LayoutOrder"] = 1,
			["testId"] = nil,
			["onActivated"] = p11.onOverflow,
			["icon"] = v_u_9.ThreeDotsHorizontal
		}
		local v23
		if p11.isOverMedia then
			v23 = v_u_5.OverMedia
		else
			v23 = v_u_5.Utility
		end
		v22.variant = v23
		v22.size = v_u_10
		v22.ref = p11.overflowRef
		v22.testId = ("%*--overflow"):format(p11.testId)
		v19 = v20(v21, v22)
	else
		v19 = nil
	end
	v18.Overflow = v19
	local v24
	if p11.onClose then
		local v25 = v_u_4.createElement
		local v26 = v_u_7
		local v27 = {
			["onActivated"] = nil,
			["icon"] = nil,
			["variant"] = nil,
			["size"] = nil,
			["isCircular"] = true,
			["LayoutOrder"] = 2,
			["testId"] = nil,
			["onActivated"] = p11.onClose,
			["icon"] = v_u_9.X
		}
		local v28
		if p11.isOverMedia then
			v28 = v_u_5.OverMedia
		else
			v28 = v_u_5.Utility
		end
		v27.variant = v28
		v27.size = v_u_10
		v27.testId = ("%*--close"):format(p11.testId)
		v24 = v25(v26, v27)
	else
		v24 = nil
	end
	v18.Close = v24
	return v13(v14, v15, v18)
end