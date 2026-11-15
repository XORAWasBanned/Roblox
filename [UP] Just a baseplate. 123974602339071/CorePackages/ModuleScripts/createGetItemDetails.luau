-- Path: CorePackages.Packages._Index.NetworkingCurrentlyWearing.NetworkingCurrentlyWearing.networkRequests.createGetItemDetails
local v1 = script:FindFirstAncestor("NetworkingCurrentlyWearing").Parent
local v_u_2 = require(v1.Dash)
local v_u_3 = require(script.Parent.Parent.CATALOG_URL)
return function(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return p4.roduxNetworking.POST({
		["Name"] = "GetItemDetails"
	}, function(p5, p6)
		-- upvalues: (ref) v_u_3, (ref) v_u_2
		return p5(v_u_3):path("v1"):path("catalog"):path("items"):path("details"):body({
			["items"] = v_u_2.map(p6, function(p7)
				return {
					["itemType"] = "Asset",
					["id"] = nil,
					["id"] = p7
				}
			end)
		})
	end)
end