-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.printLocation
local v1 = script.Parent
local v2 = v1.Parent.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.String
local v_u_6 = require(v1.location).getLocation
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local function v12(p11) -- name: printLocation
	-- upvalues: (ref) v_u_9, (copy) v_u_6
	return v_u_9(p11.source, v_u_6(p11.source, p11.start))
end
v_u_9 = function(p13, p14) -- name: printSourceLocation
	-- upvalues: (ref) v_u_7, (copy) v_u_5, (ref) v_u_10, (copy) v_u_4
	local v15 = p13.locationOffset.column - 1
	local v16 = v_u_7(v15) .. p13.body
	local v17 = p14.line - 1 + 1
	local v18 = p13.locationOffset.line - 1
	local v19 = p14.line + v18
	local v20 = p14.line == 1 and v15 and v15 or 0
	local v21 = p14.column + v20
	local v22 = p13.name .. ":" .. v19 .. ":" .. v21 .. "\n"
	local v23 = v_u_5.split(v16, { "\r\n", "\n", "\r" })
	local v24 = v23[v17]
	if string.len(v24) <= 120 then
		return v22 .. v_u_10({
			{ v19 - 1, v23[v17 - 1] },
			{ v19, v24 },
			{ "", v_u_7(v21 - 1) .. "^" },
			{ v19 + 1, v23[v17 + 1] }
		})
	end
	local v25 = v21 / 80
	local v26 = math.floor(v25) + 1
	local v27 = v21 % 80
	local v28 = {}
	for v29 = 1, string.len(v24), 80 do
		local v30 = v_u_5.slice
		local v31 = v29 + 80
		table.insert(v28, v30(v24, v29, v31))
	end
	return v22 .. v_u_10(v_u_4.concat({
		{ tostring(v19), v28[1] }
	}, v_u_4.map(v_u_4.slice(v28, 2, v26 + 1), function(p32)
		return { "", p32 }
	end), {
		{ " ", v_u_7(v27 - 1) .. "^" }
	}, {
		{ "", v28[v26 + 1] }
	}))
end
v_u_10 = function(p33) -- name: printPrefixedLines
	-- upvalues: (copy) v_u_4, (ref) v_u_8
	local v35 = v_u_4.filter(p33, function(p34)
		return p34[2] ~= nil
	end)
	local v36 = v_u_4.map
	local v37 = table.unpack
	local v_u_40 = math.max(v37(v36(v35, function(p38)
		local v39 = p38[1]
		return string.len(v39)
	end)))
	return v_u_4.join(v_u_4.map(v35, function(p41)
		-- upvalues: (ref) v_u_8, (copy) v_u_40
		local v42 = p41[1]
		local v43 = p41[2]
		return v_u_8(v_u_40, v42) .. (v43 and v43 ~= "" and (" | " .. v43 or " |") or " |")
	end), "\n")
end
v_u_7 = function(p44) -- name: whitespace
	return string.rep(" ", p44)
end
v_u_8 = function(p45, p46) -- name: leftPad
	-- upvalues: (ref) v_u_7
	return v_u_7(p45 - string.len(p46)) .. p46
end
return {
	["printSourceLocation"] = v_u_9,
	["printLocation"] = v12
}