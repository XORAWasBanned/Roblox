-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Components.MusicThumbnailIcon
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = require(v2.Foundation)
local v_u_4 = require(v2.React)
local v_u_5 = v_u_3.Image
local v_u_6 = v_u_3.Skeleton
local v_u_7 = v_u_3.Utility.getRbxThumb
local v_u_8 = require(v1.Hooks.useImageLoadingState)
local v9 = require(v1.Enums.MusicThumbnailIconSize)
local v_u_10 = {
	[v9.Small] = 24,
	[v9.Large] = 40
}
local v_u_11 = {
	[v9.Small] = 2,
	[v9.Large] = 4
}
return function(p12)
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_8, (copy) v_u_10, (copy) v_u_4, (copy) v_u_5, (copy) v_u_11, (copy) v_u_6
	local v13 = v_u_7(v_u_3.Enums.ThumbnailType.Asset, p12.assetId)
	local v14 = v_u_8(v13)
	local v15 = v_u_10[p12.size]
	if v14 then
		return v_u_4.createElement(v_u_5, {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["cornerRadius"] = nil,
			["Image"] = nil,
			["LayoutOrder"] = 1,
			["Position"] = nil,
			["ScaleType"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["cornerRadius"] = UDim.new(0, v_u_11[p12.size]),
			["Image"] = v13,
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["ScaleType"] = Enum.ScaleType.Fit,
			["Size"] = UDim2.fromOffset(v15, v15)
		})
	else
		return v_u_4.createElement(v_u_6, {
			["AnchorPoint"] = nil,
			["LayoutOrder"] = 1,
			["Position"] = nil,
			["Size"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["Size"] = UDim2.fromOffset(v15, v15)
		})
	end
end