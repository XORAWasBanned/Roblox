-- Path: CorePackages.Packages._Index.NetworkingBlocking.NetworkingBlocking.createRequestThunks
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGetBlockedUsers)
local v_u_3 = require(v1.createBlockUserById)
local v_u_4 = require(v1.createUnblockUserById)
return function(p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	return {
		["GetBlockedUsers"] = v_u_2(p5),
		["BlockUserById"] = v_u_3(p5),
		["UnblockUserById"] = v_u_4(p5)
	}
end