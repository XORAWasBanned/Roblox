-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Image.CloudAsset.isCloudAsset
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.FoundationCloudAssets).Assets
return function(p3)
	-- upvalues: (copy) v_u_2
	return v_u_2[p3] ~= nil
end