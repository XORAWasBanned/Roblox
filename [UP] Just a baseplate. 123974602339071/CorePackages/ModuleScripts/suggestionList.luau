-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.suggestionList
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Object
local v_u_3 = require(script.Parent.naturalCompare).naturalCompare
local v_u_4 = {}
local v_u_5 = nil
v_u_4.__index = v_u_4
function v_u_4.new(p6) -- name: new
	-- upvalues: (copy) v_u_4, (ref) v_u_5
	local v7 = v_u_4
	local v8 = setmetatable({}, v7)
	v8._input = p6
	v8._inputLowerCase = p6:lower()
	v8._inputArray = v_u_5(v8._inputLowerCase)
	local v9 = p6:len()
	v8._rows = { table.create(v9 + 1, 0), table.create(v9 + 1, 0), table.create(v9 + 1, 0) }
	return v8
end
function v_u_4.measure(p10, p11, p12) -- name: measure
	-- upvalues: (ref) v_u_5
	if p10._input == p11 then
		return 0
	else
		local v13 = p11:lower()
		if p10._inputLowerCase == v13 then
			return 1
		else
			local v14 = v_u_5(v13)
			local v15 = p10._inputArray
			if #v14 >= #v15 then
				local v16 = v14
				v14 = v15
				v15 = v16
			end
			local v17 = #v15
			local v18 = #v14
			if p12 < v17 - v18 then
				return nil
			else
				local v19 = p10._rows
				for v20 = 0, v18 do
					v19[1][v20 + 1] = v20
				end
				for v21 = 1, v17 do
					local v22 = v19[(v21 - 1) % 3 + 1]
					local v23 = v19[v21 % 3 + 1]
					v23[1] = v21
					local v24 = v21
					for v25 = 1, v18 do
						local v26 = v15[v21] == v14[v25] and 0 or 1
						local v27 = v22[v25 + 1] + 1
						local v28 = v23[v25] + 1
						local v29 = v22[v25] + v26
						local v30 = math.min(v27, v28, v29)
						if v21 > 1 and (v25 > 1 and (v15[v21] == v14[v25 - 1] and v15[v21 - 1] == v14[v25])) then
							local v31 = v19[(v21 - 2) % 3 + 1][v25 - 1] + 1
							v30 = math.min(v30, v31)
						end
						if v30 < v24 then
							v24 = v30
						end
						v23[v25 + 1] = v30
					end
					if p12 >= v24 then
						break
					end
					return nil
				end
				local v32 = v19[v17 % 3 + 1][v18 + 1]
				if v32 <= p12 then
					return v32
				else
					return nil
				end
			end
		end
	end
end
v_u_5 = function(p33) -- name: stringToArray
	local v34 = {}
	for v35 = 1, p33:len() do
		v34[v35] = p33:byte(v35)
	end
	return v34
end
return {
	["suggestionList"] = function(p36, p37) -- name: suggestionList
		-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
		local v38 = v_u_4.new(p36)
		local v39 = p36:len() * 0.4
		local v40 = math.floor(v39) + 1
		local v_u_41 = {}
		for v42 = 1, #p37 do
			local v43 = p37[v42]
			local v44 = v38:measure(v43, v40)
			if v44 == nil then
				continue
			end
			v_u_41[v43] = v44
		end
		local v45 = v_u_2.keys(v_u_41)
		table.sort(v45, function(p46, p47)
			-- upvalues: (copy) v_u_41, (ref) v_u_3
			local v48 = v_u_41[p46] - v_u_41[p47]
			if v48 == 0 then
				return v_u_3(p46, p47) < 0
			else
				return v48 < 0
			end
		end)
		return v45
	end
}