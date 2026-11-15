-- Path: CorePackages.Packages._Index.NetworkingContacts.NetworkingContacts.networkRequests.createUploadContactsByUser
local v1 = script.Parent.Parent
local v_u_2 = require(v1.API_URL)
require(v1.Types.networkRequestsTypes)
game:DefineFastString("ContactImporterUploadUrl", "contacts")
local v_u_3 = game:GetFastString("ContactImporterUploadUrl")
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return p4.roduxNetworking.POST({
		["Name"] = "UploadContactsByUser"
	}, function(p5, p6)
		-- upvalues: (ref) v_u_2, (ref) v_u_3
		return p5(v_u_2):path("contacts-api"):path("v1"):path(v_u_3):body({
			["countryCode"] = p6.countryCode,
			["contacts"] = p6.contacts
		})
	end)
end