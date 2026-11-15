-- Path: CorePackages.Packages._Index.mock-31ab8d40-1.1.0.mock.MagicMock
local v_u_1 = require(script.Parent.symbols)
local v_u_2 = require(script.Parent.Spy)
local v_u_3 = require(script.Parent.setReturnValue)
local v_u_4 = require(script.Parent.setSideEffect)
local v_u_5 = {
	["is"] = require(script.Parent.isAMagicMock)
}
local v_u_29 = {
	["__tostring"] = function(p6) -- name: __tostring
		-- upvalues: (copy) v_u_1
		local v7 = getmetatable(p6)
		local v8 = { "id=" .. v7[v_u_1.Address] }
		local v9 = v7[v_u_1.Name]
		if v9 ~= nil and v9 ~= "mock" then
			local v10 = "name=" .. v9
			table.insert(v8, v10)
		end
		return "<MagicMock " .. table.concat(v8, " ") .. ">"
	end,
	["__index"] = function(p11, p_u_12) -- name: __index
		-- upvalues: (copy) v_u_1, (copy) v_u_5
		local v13 = getmetatable(p11)
		local v_u_14 = v13[v_u_1.Spec]
		local v15
		if v_u_14 then
			local v16, v17 = pcall(function()
				-- upvalues: (copy) v_u_14, (copy) p_u_12
				return v_u_14[p_u_12]
			end)
			v15 = v16 and v17
		else
			v15 = true
		end
		if not v15 then
			error(string.format("MagicMock Error: Cannot index key %q since it is out of spec.", (tostring(p_u_12))))
		end
		local v18 = v13[v_u_1.Children][p_u_12]
		if v18 == nil then
			local v19 = v_u_5.new({
				["name"] = v13[v_u_1.Name] .. "." .. tostring(p_u_12)
			})
			v13[v_u_1.Children][p_u_12] = v19
			return v19
		elseif v18 == v_u_1.None then
			return nil
		else
			return v18
		end
	end,
	["__newindex"] = function(p20, p_u_21, p22) -- name: __newindex
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		local v23 = getmetatable(p20)
		local v_u_24 = v23[v_u_1.Spec]
		local v25
		if v_u_24 then
			local v26, v27 = pcall(function()
				-- upvalues: (copy) v_u_24, (copy) p_u_21
				return v_u_24[p_u_21]
			end)
			v25 = v26 and v27
		else
			v25 = true
		end
		if not v25 then
			error(string.format("MagicMock Error: Cannot write key %q since it is out of spec", (tostring(p_u_21))))
		end
		if type(p22) == "function" then
			local v28
			v28, p22 = v_u_2.new(p22)
		elseif p22 == nil then
			p22 = v_u_1.None
		end
		if p_u_21 == v_u_1.ReturnValue then
			v23[v_u_1.ReturnValue] = {
				p22,
				["n"] = 1
			}
		else
			v23[v_u_1.Children][p_u_21] = p22
		end
	end
}
local function v_u_38(p30, ...) -- name: getReturnValue
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_5
	if p30[v_u_1.ReturnValue] then
		return p30[v_u_1.ReturnValue]
	end
	local v31 = p30[v_u_1.SideEffect]
	if v31 then
		v31.calls = v31.calls + 1
		local v32 = v31.value
		if type(v32) == "function" or v_u_2.is(v31.value) then
			return { v31.value(...) }
		end
		local v33 = v31.value
		if type(v33) == "table" then
			local v34 = v31.calls
			local v35 = v31.value
			local v36
			if type(v35) == "table" and v35[v_u_1.isTuple] then
				v36 = not v_u_5.is(v35)
			else
				v36 = nil
			end
			local v37
			if v36 then
				v37 = v31.value.values[v34]
			else
				v37 = v31.value[v34]
			end
			if v37 then
				return { v37 }
			end
			error("MagicMock Error: SideEffect iteration reached")
		else
			error("MagicMock Error: Invalid SideEffect")
		end
	end
	return nil
end
function v_u_29.__call(p39, ...) -- name: __call
	-- upvalues: (copy) v_u_38, (copy) v_u_5, (copy) v_u_1
	local v40 = getmetatable(p39)
	local v41 = {
		["args"] = table.pack(...),
		["result"] = v_u_38(v40, ...)
	}
	if v41.result == nil then
		v41.result = {
			v_u_5.new({
				["name"] = v40[v_u_1.Name] .. "()"
			}),
			["n"] = 1
		}
		v40[v_u_1.ReturnValue] = v41.result
	elseif v41.result == v_u_1.None then
		v41.result = {
			["n"] = 1
		}
	else
		local v42 = v41.result[1]
		local v43
		if type(v42) == "table" and v42[v_u_1.isTuple] then
			v43 = not v_u_5.is(v42)
		else
			v43 = nil
		end
		if v43 then
			v41.result = v41.result[1].values
		end
	end
	local v44 = v40[v_u_1.Calls]
	table.insert(v44, v41)
	local v45 = v41.result
	return table.unpack(v45)
end
local v_u_46 = "add"
function v_u_29.__add(p47, p48)
	-- upvalues: (copy) v_u_46, (copy) v_u_1, (copy) v_u_5
	local v49, v50
	if type(p47) == "string" or not getmetatable(p47) then
		v49 = getmetatable(p48)
		v50 = string.format("__r_%s()", v_u_46)
	else
		v49 = getmetatable(p47)
		v50 = string.format("__%s()", v_u_46)
	end
	local v51 = v49[v_u_1.Operations][v50]
	if v51 ~= nil then
		return v51
	end
	local v52 = v_u_5.new({
		["name"] = v49[v_u_1.Name] .. "." .. v50
	})
	v49[v_u_1.Operations][v50] = v52
	return v52
end
local v_u_53 = "sub"
function v_u_29.__sub(p54, p55)
	-- upvalues: (copy) v_u_53, (copy) v_u_1, (copy) v_u_5
	local v56, v57
	if type(p54) == "string" or not getmetatable(p54) then
		v56 = getmetatable(p55)
		v57 = string.format("__r_%s()", v_u_53)
	else
		v56 = getmetatable(p54)
		v57 = string.format("__%s()", v_u_53)
	end
	local v58 = v56[v_u_1.Operations][v57]
	if v58 ~= nil then
		return v58
	end
	local v59 = v_u_5.new({
		["name"] = v56[v_u_1.Name] .. "." .. v57
	})
	v56[v_u_1.Operations][v57] = v59
	return v59
end
local v_u_60 = "div"
function v_u_29.__div(p61, p62)
	-- upvalues: (copy) v_u_60, (copy) v_u_1, (copy) v_u_5
	local v63, v64
	if type(p61) == "string" or not getmetatable(p61) then
		v63 = getmetatable(p62)
		v64 = string.format("__r_%s()", v_u_60)
	else
		v63 = getmetatable(p61)
		v64 = string.format("__%s()", v_u_60)
	end
	local v65 = v63[v_u_1.Operations][v64]
	if v65 ~= nil then
		return v65
	end
	local v66 = v_u_5.new({
		["name"] = v63[v_u_1.Name] .. "." .. v64
	})
	v63[v_u_1.Operations][v64] = v66
	return v66
end
local v_u_67 = "mul"
function v_u_29.__mul(p68, p69)
	-- upvalues: (copy) v_u_67, (copy) v_u_1, (copy) v_u_5
	local v70, v71
	if type(p68) == "string" or not getmetatable(p68) then
		v70 = getmetatable(p69)
		v71 = string.format("__r_%s()", v_u_67)
	else
		v70 = getmetatable(p68)
		v71 = string.format("__%s()", v_u_67)
	end
	local v72 = v70[v_u_1.Operations][v71]
	if v72 ~= nil then
		return v72
	end
	local v73 = v_u_5.new({
		["name"] = v70[v_u_1.Name] .. "." .. v71
	})
	v70[v_u_1.Operations][v71] = v73
	return v73
end
local v_u_74 = "mod"
function v_u_29.__mod(p75, p76)
	-- upvalues: (copy) v_u_74, (copy) v_u_1, (copy) v_u_5
	local v77, v78
	if type(p75) == "string" or not getmetatable(p75) then
		v77 = getmetatable(p76)
		v78 = string.format("__r_%s()", v_u_74)
	else
		v77 = getmetatable(p75)
		v78 = string.format("__%s()", v_u_74)
	end
	local v79 = v77[v_u_1.Operations][v78]
	if v79 ~= nil then
		return v79
	end
	local v80 = v_u_5.new({
		["name"] = v77[v_u_1.Name] .. "." .. v78
	})
	v77[v_u_1.Operations][v78] = v80
	return v80
end
local v_u_81 = "pow"
function v_u_29.__pow(p82, p83)
	-- upvalues: (copy) v_u_81, (copy) v_u_1, (copy) v_u_5
	local v84, v85
	if type(p82) == "string" or not getmetatable(p82) then
		v84 = getmetatable(p83)
		v85 = string.format("__r_%s()", v_u_81)
	else
		v84 = getmetatable(p82)
		v85 = string.format("__%s()", v_u_81)
	end
	local v86 = v84[v_u_1.Operations][v85]
	if v86 ~= nil then
		return v86
	end
	local v87 = v_u_5.new({
		["name"] = v84[v_u_1.Name] .. "." .. v85
	})
	v84[v_u_1.Operations][v85] = v87
	return v87
end
local v_u_88 = "neg"
function v_u_29.__unm(p89, p90)
	-- upvalues: (copy) v_u_88, (copy) v_u_1, (copy) v_u_5
	local v91, v92
	if type(p89) == "string" or not getmetatable(p89) then
		v91 = getmetatable(p90)
		v92 = string.format("__r_%s()", v_u_88)
	else
		v91 = getmetatable(p89)
		v92 = string.format("__%s()", v_u_88)
	end
	local v93 = v91[v_u_1.Operations][v92]
	if v93 ~= nil then
		return v93
	end
	local v94 = v_u_5.new({
		["name"] = v91[v_u_1.Name] .. "." .. v92
	})
	v91[v_u_1.Operations][v92] = v94
	return v94
end
local v_u_95 = "concat"
function v_u_29.__concat(p96, p97)
	-- upvalues: (copy) v_u_95, (copy) v_u_1, (copy) v_u_5
	local v98, v99
	if type(p96) == "string" or not getmetatable(p96) then
		v98 = getmetatable(p97)
		v99 = string.format("__r_%s()", v_u_95)
	else
		v98 = getmetatable(p96)
		v99 = string.format("__%s()", v_u_95)
	end
	local v100 = v98[v_u_1.Operations][v99]
	if v100 ~= nil then
		return v100
	end
	local v101 = v_u_5.new({
		["name"] = v98[v_u_1.Name] .. "." .. v99
	})
	v98[v_u_1.Operations][v99] = v101
	return v101
end
function v_u_5.new(p102) -- name: new
	-- upvalues: (copy) v_u_1, (copy) v_u_29, (copy) v_u_3, (copy) v_u_4
	local v103 = p102 or {}
	local v104 = {}
	local v105 = {
		[v_u_1.isMagicMock] = true,
		[v_u_1.Address] = tostring(v104)
	}
	local v106 = v_u_1.Name
	local v107
	if v103.name then
		v107 = v103.name
	elseif v103.spec then
		local v108 = v103.spec
		v107 = tostring(v108)
	else
		v107 = "mock"
	end
	v105[v106] = v107
	v105[v_u_1.Operations] = {}
	v105[v_u_1.Calls] = {}
	v105[v_u_1.Children] = {}
	v105[v_u_1.Spec] = v103.spec or nil
	v105[v_u_1.ReturnValue] = nil
	v105[v_u_1.SideEffect] = nil
	local v109 = v103
	for v110, v111 in pairs(v_u_29) do
		v105[v110] = v111
	end
	local v112 = setmetatable(v104, v105)
	if v109.returnValue then
		v_u_3(v112, v109.returnValue)
	end
	if v109.sideEffect then
		v_u_4(v112, v109.sideEffect)
	end
	return v112
end
function v_u_5.is(p113) -- name: is
	-- upvalues: (copy) v_u_1
	local v114 = getmetatable(p113)
	if v114 then
		return v114[v_u_1.isMagicMock] ~= nil
	else
		return false
	end
end
return v_u_5