-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.rewriteURIForGET
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Boolean
local v_u_6 = v3.Object
local v_u_7 = require(v1.luaUtils.encodeURIComponent)
local v8 = {}
local v_u_9 = require(script.Parent.serializeFetchParameter).serializeFetchParameter
require(script.Parent.selectHttpOptionsAndBody)
function v8.rewriteURIForGET(p10, p_u_11) -- name: rewriteURIForGET
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_9
	local v12 = {}
	if v_u_4.indexOf(v_u_6.keys(p_u_11), "query") ~= -1 then
		local v13 = v_u_7
		local v14 = p_u_11.query
		table.insert(v12, ("%s=%s"):format("query", v13(v14)))
	end
	if v_u_5.toJSBoolean(p_u_11.operationName) then
		local v15 = v_u_7
		local v16 = p_u_11.operationName
		table.insert(v12, ("%s=%s"):format("operationName", v15(v16)))
	end
	if v_u_5.toJSBoolean(p_u_11.variables) then
		local v_u_17 = nil
		local function v18()
			-- upvalues: (ref) v_u_17, (ref) v_u_9, (copy) p_u_11
			v_u_17 = v_u_9(p_u_11.variables, "Variables map", true)
		end
		local v19, v20 = pcall(v18)
		if not v19 then
			return {
				["parseError"] = v20
			}
		end
		local v21 = v_u_17
		local v22 = v_u_7
		table.insert(v12, ("%s=%s"):format("variables", v22(v21)))
	end
	if v_u_5.toJSBoolean(p_u_11.extensions) then
		local v_u_23 = nil
		local function v24()
			-- upvalues: (ref) v_u_23, (ref) v_u_9, (copy) p_u_11
			v_u_23 = v_u_9(p_u_11.extensions, "Extensions map")
		end
		local v25, v26 = pcall(v24)
		if not v25 then
			return {
				["parseError"] = v26
			}
		end
		local v27 = v_u_23
		local v28 = v_u_7
		table.insert(v12, ("%s=%s"):format("extensions", v28(v27)))
	end
	local v29 = string.find(p10, "#")
	local v30
	if v29 == nil then
		v30 = ""
	else
		v30 = string.sub(p10, v29)
		local v31 = v29 - 1
		p10 = string.sub(p10, 1, v31)
	end
	return {
		["newURI"] = p10 .. (string.find(p10, "?") == nil and "?" or "&") .. v_u_4.join(v12, "&") .. v30
	}
end
return v8