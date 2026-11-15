-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Card.Subcomponents.CardMedia
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Image)
require(v1.Components.Types)
return function(p5) -- name: CardMedia
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v6 = nil
	local v7 = nil
	local v8
	if p5.isEnd then
		v8 = UDim2.new(0, p5.width, p5.isFillHeight and 1 or 0, 0)
		v6 = {
			["MaxSize"] = Vector2.new(p5.width, (1 / 0))
		}
		v7 = {
			["FlexMode"] = Enum.UIFlexMode.Shrink,
			["ItemLineAlignment"] = Enum.ItemLineAlignment.Stretch
		}
	else
		v8 = UDim2.new(1, 0, 0, p5.bottomHeight)
	end
	return v_u_3.createElement(v_u_4, {
		["Image"] = nil,
		["ScaleType"] = nil,
		["tag"] = nil,
		["Size"] = nil,
		["sizeConstraint"] = nil,
		["flexItem"] = nil,
		["LayoutOrder"] = 2,
		["testId"] = nil,
		["Image"] = p5.image,
		["ScaleType"] = Enum.ScaleType.Crop,
		["tag"] = p5.tag,
		["Size"] = v8,
		["sizeConstraint"] = v6,
		["flexItem"] = v7,
		["testId"] = ("%*--image"):format(p5.testId)
	})
end