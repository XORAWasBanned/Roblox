-- Path: CorePackages.Packages._Index.FoundationCloudAssets-31ab8d40-0.6.0.FoundationCloudAssets.preloadAsset
local v1 = script.Parent
local v_u_2 = require(v1.Generated.ConsolidatedAssets)
local v_u_3 = game:GetService("ContentProvider")
return function(p4) -- name: preloadAsset
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_5 = Instance.new("ImageLabel")
	v_u_5.Image = v_u_2[p4].assetId
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_5
		v_u_3:PreloadAsync({ v_u_5 })
		v_u_5:Destroy()
	end)
end