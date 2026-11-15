-- Path: CorePackages.Packages._Index.NetworkingUserSettings.NetworkingUserSettings.networkRequests.createUpdateUserSettings
local v1 = script.Parent.Parent
local v_u_2 = require(v1.API_URL)
require(v1.Types.networkRequestsTypes)
return function(p3)
	-- upvalues: (copy) v_u_2
	return p3.roduxNetworking.POST(script.Name, function(p4, p5)
		-- upvalues: (ref) v_u_2
		return p4(v_u_2):path("user-settings-api"):path("v1"):path("user-settings"):body(p5)
	end)
end