-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler
require(script.ReactInternalTypes)
require(script.ReactRootTags)
require(script.ReactFiberHostConfig)
require(script["ReactFiberHotReloading.new"])
return function(p1) -- name: initialize
	local v2 = require(script.ReactFiberHostConfig)
	for v3, v4 in p1 do
		v2[v3] = v4
	end
	return require(script.ReactFiberReconciler)
end