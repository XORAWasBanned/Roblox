-- Path: CorePackages.Packages._Index.FoundationImages.FoundationImages.Flags
local v1 = script:FindFirstAncestor("FoundationImages").Parent
return {
	["FoundationImagesWhitelistedIconAssets"] = require(v1.SafeFlags).createGetFString("FoundationImagesWhitelistedIconAssets", "")()
}