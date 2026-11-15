-- Path: CorePackages.Packages._Index.NetworkingUserSettings.NetworkingUserSettings.createRequestThunks
local v1 = script.Parent
local v2 = v1.networkRequests
local v_u_3 = require(v2.createGetUserSettings)
local v_u_4 = require(v2.createUpdateUserSettings)
local v_u_5 = require(v2.createGetUserSettingsMetadata)
require(v1.Types.networkRequestsTypes)
return function(p6)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	return {
		["GetUserSettings"] = v_u_3(p6),
		["UpdateUserSettings"] = v_u_4(p6),
		["GetUserSettingsMetadata"] = v_u_5(p6)
	}
end