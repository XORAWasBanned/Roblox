-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Reducers.FavoriteBundles
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v_u_3 = require(v1.Packages.Cryo)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.SetFavoriteBundle)
return v2.createReducer({}, {
	[v5.name] = function(p6, p7)
		-- upvalues: (copy) v_u_3
		local v8 = {
			[p7.id] = p7.isFavorite
		}
		return v_u_3.Dictionary.join(p6, v8)
	end
})