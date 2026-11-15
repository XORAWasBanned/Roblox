-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.stringifyForDisplay
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.String
local v_u_6 = game:GetService("HttpService")
local v_u_7 = require(script.Parent.makeUniqueId).makeUniqueId
function replaceUndefined(p8, p9) -- name: replaceUndefined
	-- upvalues: (copy) v_u_4
	if not v_u_4.isArray(p8) then
		return p8
	end
	local v10 = {}
	for v11 = 1, #p8 do
		if p8[v11] == nil then
			table.insert(v10, p9)
		else
			local v12 = p8[v11]
			table.insert(v10, v12)
		end
	end
	return v10
end
function v1.stringifyForDisplay(p13) -- name: stringifyForDisplay
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v14 = v_u_7("stringifyForDisplay")
	return v_u_4.join(v_u_5.split(v_u_6:JSONEncode(replaceUndefined(p13, v14)), v_u_6:JSONEncode(v14)), "<undefined>")
end
return v1