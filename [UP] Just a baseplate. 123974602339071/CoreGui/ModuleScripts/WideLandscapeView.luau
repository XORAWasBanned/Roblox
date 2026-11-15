-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.WideLandscapeView
local v1 = require(script.Parent.Colors)
local v_u_2 = require(script.Parent.Parent.TopBar.Constants)
local v5 = {
	["ContainerBackgroundTransparency"] = 0,
	["ContainerBackgroundColor"] = nil,
	["UseContainerAspectRatio"] = false,
	["ContainerAspectRatio"] = nil,
	["MaxAssetCardsPerRow"] = 4,
	["ContainerSize"] = nil,
	["ContainerAnchorPoint"] = nil,
	["ContainerPosition"] = nil,
	["AvatarHeadShotSize"] = 48,
	["TopSizeY"] = 50,
	["PlayerViewportSize"] = nil,
	["AssetListSize"] = nil,
	["AssetListPosition"] = nil,
	["CloseButtonPosition"] = nil,
	["DetailsThumbnailFrameSize"] = nil,
	["DetailsThumbnailFramePosition"] = nil,
	["DetailsThumbnailAnchorPoint"] = nil,
	["DetailsThumbnailPosition"] = nil,
	["DetailsThumbnailARDominantAxis"] = nil,
	["DetailsFramePosition"] = nil,
	["DetailsFrameSize"] = nil,
	["AssetCardMaxSizeX"] = 190,
	["AssetCardMaxSizeY"] = 279,
	["DefaultCameraOffset"] = nil,
	["ToolOffset"] = nil,
	["TryOnPosition"] = nil,
	["TryOnSize"] = nil,
	["BorderPaddingSize"] = 20,
	["AssetTextMaxSize"] = 14,
	["ContainerBackgroundColor"] = v1.Carbon,
	["ContainerSize"] = function(p3) -- name: ContainerSize
		-- upvalues: (copy) v_u_2
		return UDim2.new(1, 0, 1, -v_u_2.TopBarHeight * p3)
	end,
	["ContainerAnchorPoint"] = Vector2.new(0.5, 0),
	["ContainerPosition"] = function(p4) -- name: ContainerPosition
		-- upvalues: (copy) v_u_2
		return UDim2.new(0.5, 0, 0, v_u_2.TopBarHeight * p4)
	end,
	["PlayerViewportSize"] = UDim2.new(0.33, 0, 1, -42),
	["AssetListSize"] = UDim2.new(0.67, 0, 1, -42),
	["AssetListPosition"] = UDim2.new(0.33, 0, 0, 42),
	["CloseButtonPosition"] = UDim2.new(0, 6, 0, -20),
	["DetailsThumbnailFrameSize"] = UDim2.new(0.4, 0, 1, -30),
	["DetailsThumbnailFramePosition"] = UDim2.new(0, 25, 0, 30),
	["DetailsThumbnailAnchorPoint"] = Vector2.new(0.5, 0),
	["DetailsThumbnailPosition"] = UDim2.new(0.5, 0, 0, 0),
	["DetailsThumbnailARDominantAxis"] = Enum.DominantAxis.Width,
	["DetailsFramePosition"] = UDim2.new(0.4, 30, 0, 30),
	["DetailsFrameSize"] = UDim2.new(0.6, -30, 1, -30),
	["DefaultCameraOffset"] = CFrame.new(0, 2, -5),
	["ToolOffset"] = CFrame.new(0, 2, -8),
	["TryOnPosition"] = UDim2.new(0, 25, 0, 30),
	["TryOnSize"] = UDim2.new(0.4, 0, 1, -30)
}
setmetatable(v5, {
	["__newindex"] = function(_, _, _) -- name: __newindex end,
	["__index"] = function(_, p6) -- name: __index
		error("WideLandscapeView table has no value: " .. tostring(p6))
	end
})
return v5