-- Path: CorePackages.Packages._Index.NetworkingShareLinks.NetworkingShareLinks.createRequestThunks
require(script.Parent.networkingShareLinkTypes)
local v1 = script.Parent.networkRequests
local v_u_2 = require(v1.createGenerateLink)
local v_u_3 = require(v1.createGetOrGenerateLink)
local v_u_4 = require(v1.createResolveLinkFromLinkId)
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	return {
		["ResolveLinkFromLinkId"] = v_u_4(p5),
		["GenerateLink"] = v_u_2(p5),
		["GetOrGenerateLink"] = v_u_3(p5)
	}
end