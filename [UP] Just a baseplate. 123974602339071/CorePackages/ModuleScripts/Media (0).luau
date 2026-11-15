-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Media.Media
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Image)
local v5 = require(v1.Enums.MediaAspectRatio)
local v_u_6 = require(v1.Enums.MediaOrientation)
require(v1.Components.Types)
local v_u_7 = require(v1.Utility.withCommonProps)
local v_u_8 = require(v1.Utility.withDefaults)
local v_u_9 = {
	[v5.Ratio1x1] = 1,
	[v5.Ratio5x4] = 1.25,
	[v5.Ratio4x3] = 1.3333333333333333,
	[v5.Ratio3x2] = 1.5,
	[v5.Ratio16x9] = 1.7777777777777777,
	[v5.Ratio2x1] = 2
}
local v_u_10 = {
	["aspectRatio"] = nil,
	["orientation"] = nil,
	["testId"] = "--foundation-media",
	["aspectRatio"] = v5.Ratio1x1,
	["orientation"] = v_u_6.Landscape
}
return v_u_3.memo(function(p11) -- name: Media
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_3, (copy) v_u_9, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7
	local v_u_12 = v_u_8(p11, v_u_10)
	local v14 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_9, (copy) v_u_12, (ref) v_u_6
		local v13 = v_u_9[v_u_12.aspectRatio]
		if v_u_12.orientation == v_u_6.Portrait then
			v13 = 1 / v13
		end
		return {
			["AspectRatio"] = v13,
			["AspectType"] = Enum.AspectType.ScaleWithParentSize,
			["DominantAxis"] = Enum.DominantAxis.Width
		}
	end, { v_u_12.aspectRatio, v_u_12.orientation })
	local v15 = v_u_12.content
	local v16
	if v15 and v15.type == "Image" then
		v16 = v15.source
	else
		v16 = nil
	end
	return v_u_3.createElement(v_u_4, v_u_7(v_u_12, {
		["Image"] = v16,
		["ScaleType"] = Enum.ScaleType.Crop,
		["Size"] = UDim2.fromScale(1, 0),
		["aspectRatio"] = v14
	}))
end)