-- Path: CorePackages.Packages._Index.Dash.Dash.pretty
local v1 = script.Parent
require(v1.Types)
local v_u_2 = require(v1.append)
local v_u_3 = require(v1.assign)
local v_u_4 = require(v1.cycles)
local v_u_5 = require(v1.includes)
local v_u_6 = require(v1.join)
local v_u_7 = require(v1.map)
local v_u_8 = require(v1.keys)
local v_u_9 = require(v1.slice)
local v_u_10 = table.concat
local v_u_11 = table.insert
local v_u_12 = table.sort
local function v_u_16(p13, p_u_14) -- name: indentLines
	-- upvalues: (copy) v_u_7
	return v_u_7(p13, function(p15)
		-- upvalues: (copy) p_u_14
		return p_u_14 .. p15
	end)
end
local function v_u_23(p17, p18) -- name: constructValueOptions
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v19 = v_u_3
	local v20 = {
		["visited"] = nil,
		["indent"] = "\t",
		["depth"] = 2,
		["visited"] = {}
	}
	local v21 = {}
	local v22
	if p17.depth then
		v22 = p17.depth - 1 or nil
	else
		v22 = nil
	end
	v21.depth = v22
	v21.cycles = p17.cycles or v_u_4(p18, p17.depth, {
		["visited"] = nil,
		["refs"] = nil,
		["nextRef"] = 0,
		["depth"] = nil,
		["omit"] = nil,
		["visited"] = {},
		["refs"] = {},
		["depth"] = p17.depth,
		["omit"] = p17.omit or {}
	})
	return v19(v20, p17, v21)
end
local v_u_24 = nil
local function v_u_51(p25, p26) -- name: prettyLines
	-- upvalues: (copy) v_u_23, (copy) v_u_6, (copy) v_u_8, (copy) v_u_12, (copy) v_u_5, (copy) v_u_2, (copy) v_u_16, (copy) v_u_51, (copy) v_u_7, (copy) v_u_9, (ref) v_u_24, (copy) v_u_11
	local v27 = p26 or {}
	if type(p25) == "table" then
		local v28 = v_u_23(v27, p25)
		if v28.depth == -1 then
			return { "..." }
		elseif v28.visited[p25] then
			return { "&" .. v28.cycles.refs[p25] }
		else
			v28.visited[p25] = true
			local v29 = v28.multiline
			local v30 = v29 and "," or ", "
			local v31 = v28.cycles.refs[p25]
			local v32 = { (v31 and ("<%s>"):format(v31) or "") .. "{" }
			local v33 = v_u_6(v28, {
				["noQuotes"] = true,
				["multiline"] = false
			})
			local v34 = 0
			local v35 = true
			local v36 = v_u_8(p25)
			v_u_12(v36, function(p37, p38)
				if type(p37) == "number" and type(p38) == "number" then
					return p37 < p38
				else
					return tostring(p37) < tostring(p38)
				end
			end)
			if #p25 > 0 and v28.arrayLength then
				v32[1] = ("#%d %s"):format(#p25, v32[1])
			end
			for _, v39 in ipairs(v36) do
				if type(v39) == "number" then
					if v39 == v34 + 1 then
						v34 = v39
					end
				end
				if v28.omit and v_u_5(v28.omit, v39) then
					continue
				end
				local v40 = p25[v39]
				local v41
				if type(v39) == "number" and v39 >= 1 then
					v41 = v39 <= v34
				else
					v41 = false
				end
				if v35 then
					v35 = false
				else
					v32[#v32] = v32[#v32] .. v30
				end
				if v29 then
					if v41 then
						v_u_2(v32, v_u_16(v_u_51(v40, v28), v28.indent))
					else
						local v42 = v_u_51(v39, v33)
						local v_u_43 = v28.indent
						local v45 = v_u_7(v42, function(p44)
							-- upvalues: (copy) v_u_43
							return v_u_43 .. p44
						end)
						local v46 = v_u_51(v40, v28)
						local v47 = v_u_9(v46, 2)
						local v_u_48 = v28.indent
						local v50 = v_u_7(v47, function(p49)
							-- upvalues: (copy) v_u_48
							return v_u_48 .. p49
						end)
						v45[#v45] = ("%s = %s"):format(v45[#v45], v46[1])
						v_u_2(v32, v45)
						v_u_2(v32, v50)
					end
				elseif v41 then
					v32[#v32] = v32[#v32] .. v_u_24(v40, v28)
				else
					v32[#v32] = v32[#v32] .. v_u_24(v39, v33) .. " = " .. v_u_24(v40, v28)
				end
			end
			if v29 then
				if v35 then
					v32[#v32] = v32[#v32] .. "}"
					return v32
				else
					v_u_11(v32, "}")
					return v32
				end
			else
				v32[#v32] = ("%s}"):format(v32[#v32])
				return v32
			end
		end
	else
		return type(p25) == "string" and (v27 and not v27.noQuotes) and { ("\"%s\""):format(p25) } or { (tostring(p25)) }
	end
end
v_u_24 = function(p52, p53)
	-- upvalues: (copy) v_u_10, (copy) v_u_51
	return v_u_10(v_u_51(p52, p53), "\n")
end
return v_u_24