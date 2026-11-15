-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tile.BaseTileMedia
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.AspectRatio)
local v_u_5 = require(v1.Components.CornerRadius)
local v6 = require(v1.Enums.TileAspectRatio)
require(v1.Components.Types)
local v_u_7 = require(v1.Utility.getTestIdTag)
local v_u_8 = require(v1.Utility.mapBindable)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = {
	[v6.Ratio1x1] = 1,
	[v6.Ratio16x9] = 1.7777777777777777,
	[v6.Ratio2x3] = 0.6666666666666666
}
local v_u_11 = UDim2.fromScale(1, 1)
local v_u_12 = UDim.new(0, 0)
return v_u_3.memo(function(p13) -- name: BaseTileMedia
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_4
	local v14 = v_u_9()
	local v15 = v_u_10[p13.aspectRatio]
	local v16 = p13.tileSize
	local v17
	if typeof(v16) == "UDim2" then
		v17 = p13.tileSize
	else
		v17 = nil
	end
	local v18
	if v17 == nil or v17.X.Scale ~= 0 then
		v18 = nil
	else
		v18 = v17.X.Offset
	end
	local v_u_19
	if v18 == nil then
		v_u_19 = v_u_11
	else
		v_u_19 = UDim2.fromOffset(v18, v18 / v15)
	end
	if p13.maxHeight ~= nil then
		v_u_19 = p13.maxHeight:map(function(p20)
			-- upvalues: (copy) v_u_19
			if p20 == nil then
				return v_u_19
			else
				return UDim2.new(1, 0, 0, p20)
			end
		end)
	end
	local v21 = UDim.new(0, v14.Radius.Medium)
	local v22
	if p13.isContained then
		v22 = v_u_12
	else
		v22 = v21
	end
	local v23 = v_u_3.createElement
	local v24 = p13.content == nil and "Frame" or "CanvasGroup"
	local v27 = {
		["BackgroundColor3"] = v_u_8(p13.backgroundStyle, function(p25)
			return p25.Color3
		end),
		["BackgroundTransparency"] = v_u_8(p13.backgroundStyle, function(p26)
			return p26.Transparency
		end),
		["BorderSizePixel"] = 0,
		["ClipsDescendants"] = true,
		["LayoutOrder"] = p13.LayoutOrder,
		["Size"] = v_u_19,
		[v_u_3.Tag] = v_u_7(p13.testId)
	}
	local v28 = {
		["Corner"] = v_u_3.createElement(v_u_5, {
			["testId"] = ("%*--corner"):format(p13.testId),
			["value"] = {
				["topLeft"] = v21,
				["topRight"] = v21,
				["bottomLeft"] = v22,
				["bottomRight"] = v22
			}
		})
	}
	local v29
	if v18 == nil or p13.maxHeight ~= nil then
		v29 = v_u_3.createElement(v_u_4, {
			["value"] = {
				["AspectRatio"] = v15,
				["AspectType"] = Enum.AspectType.FitWithinMaxSize,
				["DominantAxis"] = Enum.DominantAxis.Width
			}
		})
	else
		v29 = nil
	end
	v28.AspectRatio = v29
	v28.Content = p13.content
	return v23(v24, v27, v28)
end)