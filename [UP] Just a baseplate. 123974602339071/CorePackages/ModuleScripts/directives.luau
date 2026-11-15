-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.graphql.directives
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.LuauPolyfill).Array
local v_u_5 = require(v3.GraphQL).visit
local v_u_6 = require(v2.jsutils.invariant).invariant
local v_u_7 = nil
function v1.shouldInclude(p8, p_u_9) -- name: shouldInclude
	-- upvalues: (copy) v_u_4, (ref) v_u_7, (copy) v_u_6
	local v10 = p8.directives
	return (not v10 or #v10 == 0) and true or v_u_4.every(v_u_7(v10), function(p11)
		-- upvalues: (copy) p_u_9, (ref) v_u_6
		local v12 = p11.directive
		local v13 = p11.ifArgument
		local v14
		if v13.value.kind == "Variable" then
			if p_u_9 == nil then
				v14 = false
			else
				v14 = p_u_9[v13.value.name.value]
			end
			v_u_6(v14 ~= nil, ("Invalid variable referenced in @%s directive."):format(v12.name.value))
		else
			v14 = v13.value.value
		end
		if v12.name.value == "skip" then
			return not v14
		else
			return v14
		end
	end)
end
local function v_u_20(p15) -- name: getDirectiveNames
	-- upvalues: (copy) v_u_5
	local v_u_16 = {}
	v_u_5(p15, {
		["Directive"] = function(_, p17) -- name: Directive
			-- upvalues: (copy) v_u_16
			local v18 = v_u_16
			local v19 = p17.name.value
			table.insert(v18, v19)
		end
	})
	return v_u_16
end
v1.getDirectiveNames = v_u_20
function v1.hasDirectives(p_u_21, p22) -- name: hasDirectives
	-- upvalues: (copy) v_u_4, (copy) v_u_20
	return v_u_4.some(v_u_20(p22), function(p23)
		-- upvalues: (ref) v_u_4, (copy) p_u_21
		return v_u_4.indexOf(p_u_21, p23) > -1
	end)
end
function v1.hasClientExports(p24) -- name: hasClientExports
	-- upvalues: (copy) v_u_4, (copy) v_u_20
	local v25
	if p24 == nil then
		v25 = false
	else
		local v_u_26 = { "client" }
		v25 = v_u_4.some(v_u_20(p24), function(p27)
			-- upvalues: (ref) v_u_4, (copy) v_u_26
			return v_u_4.indexOf(v_u_26, p27) > -1
		end)
		if v25 then
			local v_u_28 = { "export" }
			v25 = v_u_4.some(v_u_20(p24), function(p29)
				-- upvalues: (ref) v_u_4, (copy) v_u_28
				return v_u_4.indexOf(v_u_28, p29) > -1
			end)
		end
	end
	return v25
end
v_u_7 = function(p30) -- name: getInclusionDirectives
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	local v_u_31 = {}
	if p30 and #p30 > 0 then
		v_u_4.forEach(p30, function(p32)
			-- upvalues: (ref) v_u_6, (copy) v_u_31
			local v33 = p32.name.value
			if v33 == "skip" and true or v33 == "include" then
				local v34 = p32.arguments
				local v35 = p32.name.value
				if not v34 or #v34 ~= 1 then
					v_u_6(false, ("Incorrect number of arguments for the @%s directive."):format(v35))
				end
				local v36 = v34[1]
				if not v36.name or v36.name.value ~= "if" then
					v_u_6(false, ("Invalid argument for the @%s directive."):format(v35))
				end
				local v37 = v36.value
				if not v37 or v37.kind ~= "Variable" and v37.kind ~= "BooleanValue" then
					v_u_6(false, ("Argument for the @%s directive must be a variable or a boolean value."):format(v35))
				end
				local v38 = v_u_31
				table.insert(v38, {
					["directive"] = p32,
					["ifArgument"] = v36
				})
			end
		end)
	end
	return v_u_31
end
v1.getInclusionDirectives = v_u_7
return v1