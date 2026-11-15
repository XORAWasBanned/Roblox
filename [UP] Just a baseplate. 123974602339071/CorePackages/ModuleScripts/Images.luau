-- Path: CorePackages.Packages._Index.FoundationImages.FoundationImages.Images
local v1 = script.Parent
local v2 = require(v1.Generated.GetImageSetData)
local v3 = require(v1.Generated.FallbackImages)
require(v1.ImagesTypes)
local v4 = require(v1.getResolutionScale)
local v5 = game:GetService("CorePackages")
local v6, v7 = v2((v4()))
local v8 = v1.Parent
local v_u_9 = require(v8.BuilderIcons).Migration.uiblox
local v10 = require(v1.whitelistedIconAssets)
local v11 = v5 ~= nil and "LuaPackages/Packages/_Index/FoundationImages/FoundationImages" or nil
local v12 = {}
for v13, v14 in v6 do
	if v10[v13] == nil and v_u_9[v13] then
		continue
	end
	local v15 = typeof(v14) == "table"
	local v16 = "invalid sourceData from GetImageSetData for scale " .. tostring(v7)
	assert(v15, v16)
	local v17 = {}
	for v18, v19 in v14 do
		if v18 == "ImageSet" then
			local v20
			if v11 == nil then
				v20 = v3[v19]
			else
				v20 = string.format("rbxasset://%s/SpriteSheets/%s.png", v11, v19)
			end
			v17.Image = v20
		else
			v17[v18] = v19
		end
	end
	v12[v13] = v17
end
setmetatable(v12, {
	["__index"] = function(p21, p22) -- name: __index
		-- upvalues: (copy) v_u_9
		if v_u_9[p22] then
			local v23 = {
				["ImageRectOffset"] = Vector2.new(0, 0),
				["ImageRectSize"] = Vector2.new(0, 0),
				["Image"] = p22
			}
			p21[p22] = v23
			return v23
		end
		error(("%q is not a valid member of Images"):format((tostring(p22))), 2)
	end
})
return v12