-- Path: CorePackages.Packages._Index.NetworkingContacts.NetworkingContacts.networkRequests.createFindContactFriends
local v1 = script.Parent.Parent
local v_u_2 = require(v1.API_URL)
require(v1.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterFindFriendsUrl", "contacts")
local v_u_3 = game:GetFastString("ContactImporterFindFriendsUrl")
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return p4.roduxNetworking.GET({
		["Name"] = "FindContactFriends"
	}, function(p5)
		-- upvalues: (ref) v_u_2, (ref) v_u_3
		return p5(v_u_2):path("contacts-api"):path("v1"):path(v_u_3)
	end)
end