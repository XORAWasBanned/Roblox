-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getRbxThumb.getRbxThumb
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ThumbnailType)
local v_u_3 = require(v1.Enums.ThumbnailSize)
local v_u_4 = require(v1.Utility.getAssetIdAsNumeric)
local v_u_5 = {
	[v_u_2.Asset] = {
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420)
	},
	[v_u_2.Avatar] = {
		[v_u_3.Small] = Vector2.new(48, 48),
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420),
		[v_u_3.XLarge] = Vector2.new(720, 720)
	},
	[v_u_2.AvatarBust] = {
		[v_u_3.Small] = Vector2.new(50, 50),
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420)
	},
	[v_u_2.AvatarHeadShot] = {
		[v_u_3.Small] = Vector2.new(48, 48),
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420)
	},
	[v_u_2.BadgeIcon] = {
		[v_u_3.Medium] = Vector2.new(150, 150)
	},
	[v_u_2.BundleThumbnail] = {
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420)
	},
	[v_u_2.FontFamily] = {
		[v_u_3.Medium] = Vector2.new(1200, 80)
	},
	[v_u_2.GameIcon] = {
		[v_u_3.Small] = Vector2.new(50, 50),
		[v_u_3.Medium] = Vector2.new(150, 150)
	},
	[v_u_2.GamePass] = {
		[v_u_3.Medium] = Vector2.new(150, 150)
	},
	[v_u_2.GameThumbnail] = {
		[v_u_3.Small] = Vector2.new(256, 144),
		[v_u_3.Medium] = Vector2.new(384, 216),
		[v_u_3.Large] = Vector2.new(480, 270),
		[v_u_3.XLarge] = Vector2.new(768, 432)
	},
	[v_u_2.GroupIcon] = {
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420)
	},
	[v_u_2.Outfit] = {
		[v_u_3.Medium] = Vector2.new(150, 150),
		[v_u_3.Large] = Vector2.new(420, 420)
	}
}
return function(p6, p7, p8, p9)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v10 = v_u_5[p6][p8 or v_u_3.Medium]
	local v11 = v_u_4(p7)
	if not v10 then
		warn((("Unsupported size %* for media type: %*, defaulting to %*"):format(p8, p6, v_u_3.Medium)))
		v10 = v_u_5[p6][v_u_3.Medium]
	end
	local v12 = ("rbxthumb://type=%*&id=%*&w=%*&h=%*"):format(p6, v11, v10.X, v10.Y)
	if p6 == v_u_2.AvatarHeadShot and (p9 and p9.includeProfileFrame) then
		v12 = v12 .. "&includeprofileframe=true"
	end
	return v12
end