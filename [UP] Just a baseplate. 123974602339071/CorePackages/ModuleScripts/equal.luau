-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.jsutils.equal
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Object
local function v_u_10(p5, p6) -- name: equal
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_10
	if typeof(p5) ~= typeof(p6) then
		return false
	end
	if p5 == p6 then
		return true
	end
	if typeof(p5) == "table" then
		if v_u_3.isArray(p5) and not v_u_3.isArray(p6) then
			return false
		end
		if #p5 ~= #p6 or #v_u_4.keys(p5) ~= #v_u_4.keys(p6) then
			return false
		end
		if v_u_3.isArray(p5) then
			for v7, _ in ipairs(p5) do
				if v_u_10(p5[v7], p6[v7]) then
					continue
				end
				return false
			end
		else
			for v8 in pairs(p5) do
				if v_u_10(p5[tostring(v8)], p6[tostring(v8)]) then
					continue
				end
				return false
			end
		end
		return true
	end
	if typeof(p5) == "string" or (typeof(p5) == "number" or typeof(p5) == "boolean") then
		return p5 == p6
	end
	if typeof(p5) == "function" then
		local v9
		if debug.info(p5, "n") == debug.info(p6, "n") and (debug.info(p5, "s") == debug.info(p6, "s") and debug.info(p5, "l") == debug.info(p6, "l")) then
			v9 = debug.info(p5, "a") == debug.info(p6, "a")
		else
			v9 = false
		end
		return v9
	end
	if typeof(p5) == "thread" then
		error("unhandled equality check for type \'thread\'")
	elseif typeof(p5) == "userdata" then
		error("unhandled equality check for type \'userdata\'")
	end
	error("unhandled equality check for type " .. typeof(p5))
end
return v_u_10