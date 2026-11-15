-- Path: CorePackages.Packages._Index.NetworkingShareLinks.NetworkingShareLinks.networkRequests.createGenerateLink
local v_u_1 = require(script.Parent.Parent.SHARELINKS_URL)
require(script.Parent.Parent.networkingShareLinkTypes)
local v2 = script:FindFirstAncestor("Packages")
local v_u_3 = require(v2.tutils)
local v_u_4 = game:GetService("HttpService")
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_4
	local v12 = p5.roduxNetworking.POST({
		["Name"] = "create-link"
	}, function(p6, p7)
		-- upvalues: (ref) v_u_3, (ref) v_u_1, (ref) v_u_4
		local v8 = v_u_3.deepCopy(p7)
		v8.linkType = nil
		local v9 = p6(v_u_1):path("v1"):path("create-link")
		local v10 = {
			["linkType"] = p7.linkType
		}
		local v11
		if next(v8) == nil then
			v11 = nil
		else
			v11 = v_u_4:JSONEncode(v8)
		end
		v10.data = v11
		return v9:body(v10)
	end)
	if p5.useMockedResponse then
		v12.Mock.clear()
		v12.Mock.reply(function()
			return {
				["responseBody"] = {
					["linkId"] = "42685"
				}
			}
		end)
	end
	return v12
end