-- Path: CorePackages.Packages._Index.FoundationImages.FoundationImages.DeprecatedIconImages
local v1 = script.Parent
local v2 = require(v1.Deprecated.GetDeprecatedIconImageSetData)
local v3 = require(v1.Deprecated.StaticFallbackImages)
local v4 = v2((require(v1.getResolutionScale)()))
local v5 = v1.Parent
local v6 = require(v5.BuilderIcons).Migration.uiblox
local v7 = require(v1.whitelistedIconAssets)
local v8 = {}
for v9, v10 in v4 do
	if not v6[v9] or v7[v9] ~= nil then
		continue
	end
	local v11 = {}
	for v12, v13 in v10 do
		if v12 == "ImageSet" then
			v11.Image = v3[v13]
		else
			v11[v12] = v13
		end
	end
	v8[v9] = v11
end
return v8