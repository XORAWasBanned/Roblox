-- Path: CorePackages.Packages._Index.NetworkingContacts.NetworkingContacts.createRequestThunks
local v1 = script.Parent
local v2 = v1.networkRequests
local v_u_3 = require(v2.createUploadContactsByUser)
local v_u_4 = require(v2.createFindContactFriends)
local v_u_5 = require(v2.createGetContactEntitiesByContactId)
require(v1.Types.networkRequestsTypes)
return function(p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	return {
		["UploadContactsByUser"] = v_u_3(p6),
		["FindContactFriends"] = v_u_4(p6),
		["GetContactEntitiesByContactId"] = v_u_5(p6)
	}
end