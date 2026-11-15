-- Path: CorePackages.Packages._Index.NetworkingUsers.NetworkingUsers.createRequestThunks
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetSkinnyUsersFromUserIds)
local v_u_3 = require(v1.createGetUsernameHistoryFromUserId)
local v_u_4 = require(v1.createGetUserV2FromUserId)
local v_u_5 = require(v1.createGetDisplayNameValidation)
local v_u_6 = require(v1.createSetDisplayName)
local v_u_7 = require(v1.createSetDescription)
return function(p8)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	return {
		["GetSkinnyUsersFromUserIds"] = v_u_2(p8),
		["GetUsernameHistoryFromUserId"] = v_u_3(p8),
		["GetUserV2FromUserId"] = v_u_4(p8),
		["GetDisplayNameValidation"] = v_u_5(p8),
		["SetDisplayName"] = v_u_6(p8),
		["SetDescription"] = v_u_7(p8)
	}
end