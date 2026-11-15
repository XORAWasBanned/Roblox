-- Path: CorePackages.Packages._Index.FoundationImages.FoundationImages.whitelistedIconAssets
local v1 = script.Parent
local v2 = require(v1.Flags)
local v3 = {}
for _, v4 in string.split(v2.FoundationImagesWhitelistedIconAssets, ",") do
	v3[v4] = true
end
return v3