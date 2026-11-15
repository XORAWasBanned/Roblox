-- Path: CorePackages.Packages._Index.NetworkingContacts.NetworkingContacts.networkRequests.createGetContactEntitiesByContactId
local v1 = script.Parent.Parent
local v_u_2 = require(v1.API_URL)
require(v1.Types.networkRequestsTypes)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST({
		["Name"] = "GetContactEntitiesByContactId"
	}, function(p4, p5)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("contacts-api"):path("v1"):path("contacts"):path("entities"):body({
			["userContactIds"] = p5
		})
	end)
end