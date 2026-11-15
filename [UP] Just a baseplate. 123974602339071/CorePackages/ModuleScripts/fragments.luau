-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.graphql.fragments
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Boolean
local v_u_6 = v3.Object
local v7 = {}
require(v2.GraphQL)
local v_u_8 = require(v1.jsutils.invariant).invariant
local v_u_9 = v3.Error
function v7.getFragmentQueryDocument(p10, p11) -- name: getFragmentQueryDocument
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6
	local v_u_12 = {}
	v_u_4.forEach(p10.definitions, function(p13)
		-- upvalues: (ref) v_u_9, (ref) v_u_5, (copy) v_u_12
		if p13.kind == "OperationDefinition" then
			local v14 = error
			local v15 = v_u_9.new
			local v16 = "Found a %s operation%s. "
			local v17 = p13.operation
			local v18 = tostring(v17)
			local v19
			if v_u_5.toJSBoolean(p13.name) then
				local v20 = p13.name.value
				v19 = (" named \'%s\'"):format((tostring(v20)))
			else
				v19 = ""
			end
			v14(v15(v16:format(v18, v19) .. "No operations are allowed when using a fragment as a query. Only fragments are allowed."))
		end
		if p13.kind == "FragmentDefinition" then
			local v21 = v_u_12
			table.insert(v21, p13)
		end
	end)
	if typeof(p11) == "nil" then
		local v22 = v_u_8
		local v23 = #v_u_12 == 1
		local v24 = string.format
		local v25 = #v_u_12
		v22(v23, v24("Found %s fragments. `fragmentName` must be provided when there is not exactly 1 fragment.", (tostring(v25))))
		p11 = v_u_12[1].name.value
	end
	local v26 = v_u_6.assign
	local v27 = {}
	local v28 = {}
	local v29 = {
		["kind"] = "OperationDefinition",
		["operation"] = "query",
		["selectionSet"] = nil,
		["selectionSet"] = {
			["kind"] = "SelectionSet",
			["selections"] = nil,
			["selections"] = {
				{
					["kind"] = "FragmentSpread",
					["name"] = nil,
					["name"] = {
						["kind"] = "Name",
						["value"] = nil,
						["value"] = p11
					}
				}
			}
		}
	}
	__set_list(v28, 1, {v29})
	v27.definitions = v_u_4.concat({}, v28, p10.definitions)
	return v26({}, p10, v27)
end
function v7.createFragmentMap(p30) -- name: createFragmentMap
	-- upvalues: (copy) v_u_4
	local v31 = p30 == nil and {} or p30
	local v_u_32 = {}
	v_u_4.forEach(v31, function(p33)
		-- upvalues: (copy) v_u_32
		v_u_32[p33.name.value] = p33
	end)
	return v_u_32
end
function v7.getFragmentFromSelection(p34, p35) -- name: getFragmentFromSelection
	-- upvalues: (copy) v_u_8
	local v36 = p34.kind
	if v36 == "InlineFragment" then
		return p34
	end
	if v36 ~= "FragmentSpread" then
		return nil
	end
	if p35 then
		p35 = p35[p34.name.value]
	end
	v_u_8(p35, ("No fragment named %s."):format(p34.name.value))
	return p35
end
return v7