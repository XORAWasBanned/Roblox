-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.__testUtils__.dedent
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.String
function dedent(p5, ...) -- name: dedent
	-- upvalues: (copy) v_u_3
	local v6 = { ... }
	local v7 = ""
	if v_u_3.isArray(p5) then
		for v8 = 1, #p5 do
			v7 = v7 .. p5[v8]
			if v8 > #v6 then
				continue
			end
			v7 = v7 .. v6[v8]
		end
	else
		v7 = p5
	end
	local v9 = removeTrailingSpacesAndTabs(removeLeadingNewLines(v7))
	local v10 = ""
	for v11 = 1, string.len(v9) do
		local v12 = string.sub(v9, v11, v11)
		if v12 ~= " " and v12 ~= "\t" then
			break
		end
		v10 = v10 .. v12
	end
	return removeCommonIndent(v9, v10)
end
function removeLeadingNewLines(p13) -- name: removeLeadingNewLines
	-- upvalues: (copy) v_u_4
	local v14 = v_u_4.findOr(p13, { "\n*" })
	if v14 ~= nil and v14.index == 1 then
		local v15 = v14.match
		local v16 = string.len(v15) + 1
		p13 = string.sub(p13, v16)
	end
	return p13
end
function removeTrailingSpacesAndTabs(p17) -- name: removeTrailingSpacesAndTabs
	-- upvalues: (copy) v_u_4
	local v18 = 1
	local v19 = nil
	local v20 = v_u_4.findOr(p17, { " +", "\t+" }, v18)
	if v20 ~= nil then
		if v19 == nil then
			v19 = v20
		else
			local v21 = v19.index
			local v22 = v19.match
			v19 = v21 + string.len(v22) == v20.index and {
				["index"] = v19.index,
				["match"] = v19.match .. v20.match
			} or v20
		end
		local v23 = v20.index
		local v24 = v20.match
		v18 = v23 + string.len(v24)
	end
	if v20 ~= nil and string.len(p17) >= v18 then
		continue
	end
	if v19 ~= nil then
		local v25 = v19.index
		local v26 = v19.match
		if v25 + string.len(v26) == string.len(p17) + 1 then
			local v27 = v19.index - 1
			return string.sub(p17, 1, v27)
		end
	end
	return p17
end
function removeCommonIndent(p28, p29) -- name: removeCommonIndent
	local v30 = string.gsub(p28, p29, "", 1)
	return string.gsub(v30, "\n" .. p29, "\n")
end
return {
	["dedent"] = dedent
}