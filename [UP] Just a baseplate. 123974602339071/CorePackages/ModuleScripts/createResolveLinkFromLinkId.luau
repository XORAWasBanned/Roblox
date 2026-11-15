-- Path: CorePackages.Packages._Index.NetworkingShareLinks.NetworkingShareLinks.networkRequests.createResolveLinkFromLinkId
local v_u_1 = require(script.Parent.Parent.SHARELINKS_URL)
require(script.Parent.Parent.networkingShareLinkTypes)
return function(p2)
	-- upvalues: (copy) v_u_1
	local v5 = p2.roduxNetworking.POST({
		["Name"] = "resolve-link"
	}, function(p3, p4)
		-- upvalues: (ref) v_u_1
		return p3(v_u_1):path("v1"):path("resolve-link"):body({
			["linkType"] = p4.linkType,
			["linkId"] = p4.linkId
		})
	end)
	if p2.useMockedResponse then
		v5.Mock.clear()
		v5.Mock.reply(function()
			local v6 = {
				["responseBody"] = {
					["experienceInviteData"] = {
						["instanceId"] = "ABCDEF",
						["inviterId"] = 46430379,
						["placeId"] = 1818,
						["status"] = "Valid",
						["universeId"] = 13058
					}
				}
			}
			return v6
		end)
	end
	return v5
end