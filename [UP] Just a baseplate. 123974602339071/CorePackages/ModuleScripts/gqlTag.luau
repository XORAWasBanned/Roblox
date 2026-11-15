-- Path: CorePackages.Packages._Index.GraphqlTag.GraphqlTag.gqlTag
local v1 = script.Parent.Parent
local v_u_2 = require(v1.GraphQL).parse
local v3 = require(v1.LuauPolyfill)
local v4 = v3.Map
local v_u_5 = v3.Set
local v_u_6 = v3.String
local v_u_7 = v3.Object
local v_u_8 = v3.Array
local v_u_9 = v3.console
local v_u_10 = v4.new(nil)
local v_u_11 = v4.new(nil)
local v_u_12 = true
local v_u_13 = false
local function v_u_24(p14) -- name: processFragments
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_11, (ref) v_u_12, (copy) v_u_9, (copy) v_u_7
	local v15 = v_u_5.new(nil)
	local v16 = {}
	for v17 = 1, #p14.definitions do
		local v18 = p14.definitions[v17]
		if v18.kind == "FragmentDefinition" then
			local v19 = v18.name.value
			local v20 = v18.loc
			local v21 = v20.source.body:sub(v20.start, v20._end):gsub(",+%s+", " ")
			local v22 = v_u_6.trim(v21)
			local v23 = v_u_11:get(v19)
			if v23 and not v23:has(v22) then
				if v_u_12 then
					v_u_9.warn("Warning: fragment with name " .. v19 .. " already exists.\ngraphql-tag enforces all fragment names across your application to be unique; read more about\nthis in the docs: http://dev.apollodata.com/core/fragments.html#unique-names")
				end
			elseif not v23 then
				v23 = v_u_5.new()
				v_u_11:set(v19, v23)
			end
			v23:add(v22)
			if v15:has(v22) then
				continue
			end
			v15:add(v22)
			table.insert(v16, v18)
		else
			table.insert(v16, v18)
		end
	end
	return v_u_7.assign({}, p14, {
		["definitions"] = v16
	})
end
local function v_u_33(p25) -- name: stripLoc
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_8
	local v26 = v_u_5.new(nil)
	for v27 = 1, #v26 do
		local v28 = v26[v27]
		if v28.loc then
			v26:delete(v28.loc)
		end
		for v29 = 1, #v_u_7.keys(v28) do
			local v30 = v_u_7.keys(v28)[v29]
			local v31 = v28[tostring(v30)]
			if not v31 or (typeof(v31) ~= "table" or v_u_8.isArray(v31)) then
				continue
			end
			v26:add(v31)
		end
	end
	local v32 = p25.loc
	if v32 then
		v32.startToken = nil
		v32.endToken = nil
	end
	return p25
end
local function v_u_38(p34) -- name: parseDocument
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_2, (ref) v_u_13, (copy) v_u_33, (copy) v_u_24
	local v35 = p34:gsub(",+%s+", " ")
	local v36 = v_u_6.trim(v35)
	if not v_u_10:has(v36) then
		local v37 = v_u_2(p34, {
			["experimentalFragmentVariables"] = v_u_13
		})
		if not v37 or v37.kind ~= "Document" then
			error("Not a valid GraphQL document.")
		end
		v_u_10:set(v36, (v_u_33(v_u_24(v37))))
	end
	return v_u_10:get(v36)
end
local function v40(p39) -- name: gql
	-- upvalues: (copy) v_u_38
	if typeof(p39) == "string" then
		return v_u_38(p39)
	end
	if typeof(p39) == "table" and p39.kind == "Document" then
		return p39
	end
	error("graphql-tag-lua does not currently support non-strings or Fragments. Please file an issue or PR if you need this feature added.")
end
function resetCaches() -- name: resetCaches
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	v_u_10:clear()
	v_u_11:clear()
end
function disableFragmentWarnings() -- name: disableFragmentWarnings
	-- upvalues: (ref) v_u_12
	v_u_12 = false
end
function enableExperimentalFragmentVariables() -- name: enableExperimentalFragmentVariables
	-- upvalues: (ref) v_u_13
	v_u_13 = true
end
function disableExperimentalFragmentVariables() -- name: disableExperimentalFragmentVariables
	-- upvalues: (ref) v_u_13
	v_u_13 = false
end
local v41 = {
	["gql"] = v40,
	["resetCaches"] = resetCaches,
	["disableFragmentWarnings"] = disableFragmentWarnings,
	["enableExperimentalFragmentVariables"] = enableExperimentalFragmentVariables,
	["disableExperimentalFragmentVariables"] = disableExperimentalFragmentVariables
}
return {
	["default"] = v40,
	["gql"] = v40,
	["resetCaches"] = v41.resetCaches,
	["disableFragmentWarnings"] = v41.disableFragmentWarnings,
	["enableExperimentalFragmentVariables"] = v41.enableExperimentalFragmentVariables,
	["disableExperimentalFragmentVariables"] = v41.disableExperimentalFragmentVariables
}