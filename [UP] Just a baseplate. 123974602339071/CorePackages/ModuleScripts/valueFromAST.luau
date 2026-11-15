-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.valueFromAST
local v1 = script.Parent.Parent
require(v1.jsutils.ObjMap)
local v_u_2 = require(v1.jsutils.keyMap).keyMap
local v_u_3 = require(v1.jsutils.inspect).inspect
local v_u_4 = require(v1.jsutils.invariant).invariant
require(v1.language.ast)
local v_u_5 = require(v1.language.kinds).Kind
local v6 = require(v1.type.definition)
local v_u_7 = v6.isLeafType
local v_u_8 = v6.isInputObjectType
local v_u_9 = v6.isListType
local v_u_10 = v6.isNonNullType
local v_u_11 = require(v1.luaUtils.null)
local v_u_12 = nil
local function v_u_32(p_u_13, p_u_14, p_u_15) -- name: valueFromAST
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_10, (copy) v_u_32, (copy) v_u_9, (ref) v_u_12, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3
	if p_u_13 then
		if p_u_13.kind == v_u_5.VARIABLE then
			local v16 = p_u_13.name.value
			if p_u_15 ~= nil and p_u_15[v16] ~= nil then
				local v17 = p_u_15[v16]
				if v17 ~= v_u_11 or not v_u_10(p_u_14) then
					return v17
				end
			end
		elseif v_u_10(p_u_14) then
			if p_u_13.kind ~= v_u_5.NULL then
				return v_u_32(p_u_13, p_u_14.ofType, p_u_15)
			end
			return
		elseif p_u_13.kind == v_u_5.NULL then
			return v_u_11
		elseif v_u_9(p_u_14) then
			local v18 = p_u_14.ofType
			if p_u_13.kind == v_u_5.LIST then
				local v19 = {}
				for _, v20 in ipairs(p_u_13.values) do
					if v_u_12(v20, p_u_15) then
						if v_u_10(v18) then
							return
						end
						local v21 = v_u_11
						table.insert(v19, v21)
					else
						local v22 = v_u_32(v20, v18, p_u_15)
						if v22 == nil then
							return
						end
						table.insert(v19, v22)
					end
				end
				return v19
			end
			local v23 = v_u_32(p_u_13, v18, p_u_15)
			if v23 ~= nil then
				return { v23 }
			end
			return
		elseif v_u_8(p_u_14) then
			if p_u_13.kind == v_u_5.OBJECT then
				local v25 = v_u_2(p_u_13.fields, function(p24)
					return p24.name.value
				end)
				local v26 = {}
				for _, v27 in ipairs(p_u_14:getFields():values()) do
					local v28 = v25[v27.name]
					if v28 and not v_u_12(v28.value, p_u_15) then
						local v29 = v_u_32(v28.value, v27.type, p_u_15)
						if v29 == nil then
							return
						end
						v26[v27.name] = v29
					else
						if v27.defaultValue == nil then
							if not v_u_10(v27.type) then
								continue
							end
							return
						end
						v26[v27.name] = v27.defaultValue
					end
				end
				return v26
			end
			return
		elseif v_u_7(p_u_14) then
			local v_u_30 = nil
			local function v31()
				-- upvalues: (ref) v_u_30, (copy) p_u_14, (copy) p_u_13, (copy) p_u_15
				v_u_30 = p_u_14:parseLiteral(p_u_13, p_u_15)
			end
			if pcall(v31) then
				if v_u_30 ~= nil then
					return v_u_30
				end
			end
		else
			v_u_4(false, "Unexpected input type: " .. v_u_3(p_u_14))
			return
		end
	else
		return
	end
end
v_u_12 = function(p33, p34) -- name: isMissingVariable
	-- upvalues: (copy) v_u_5
	local v35
	if p33.kind == v_u_5.VARIABLE then
		v35 = p34 == nil and true or p34[p33.name.value] == nil
	else
		v35 = false
	end
	return v35
end
return {
	["valueFromAST"] = v_u_32
}