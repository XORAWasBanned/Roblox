-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.typeComparators
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
local v4 = require(v1.type.definition)
local v_u_5 = v4.isInterfaceType
local v_u_6 = v4.isObjectType
local v_u_7 = v4.isListType
local v_u_8 = v4.isNonNullType
local v_u_9 = v4.isAbstractType
local function v_u_12(p10, p11) -- name: isEqualType
	-- upvalues: (copy) v_u_8, (copy) v_u_12, (copy) v_u_7
	if p10 == p11 then
		return true
	elseif v_u_8(p10) and v_u_8(p11) then
		return v_u_12(p10.ofType, p11.ofType)
	elseif v_u_7(p10) and v_u_7(p11) then
		return v_u_12(p10.ofType, p11.ofType)
	else
		return false
	end
end
local function v_u_17(p13, p14, p15) -- name: isTypeSubTypeOf
	-- upvalues: (copy) v_u_8, (copy) v_u_17, (copy) v_u_7, (copy) v_u_9, (copy) v_u_5, (copy) v_u_6
	if p14 == p15 then
		return true
	elseif v_u_8(p15) then
		if v_u_8(p14) then
			return v_u_17(p13, p14.ofType, p15.ofType)
		else
			return false
		end
	elseif v_u_8(p14) then
		return v_u_17(p13, p14.ofType, p15)
	elseif v_u_7(p15) then
		if v_u_7(p14) then
			return v_u_17(p13, p14.ofType, p15.ofType)
		else
			return false
		end
	else
		if v_u_7(p14) then
			return false
		end
		local v16 = v_u_9(p15) and (v_u_5(p14) or v_u_6(p14))
		if v16 then
			v16 = p13:isSubType(p15, p14)
		end
		return v16
	end
end
return {
	["isEqualType"] = v_u_12,
	["isTypeSubTypeOf"] = v_u_17,
	["doTypesOverlap"] = function(p_u_18, p19, p_u_20) -- name: doTypesOverlap
		-- upvalues: (copy) v_u_9, (copy) v_u_3
		if p19 == p_u_20 then
			return true
		elseif v_u_9(p19) then
			if v_u_9(p_u_20) then
				return v_u_3.some(p_u_18:getPossibleTypes(p19), function(p21)
					-- upvalues: (copy) p_u_18, (copy) p_u_20
					return p_u_18:isSubType(p_u_20, p21)
				end)
			else
				return p_u_18:isSubType(p19, p_u_20)
			end
		elseif v_u_9(p_u_20) then
			return p_u_18:isSubType(p_u_20, p19)
		else
			return false
		end
	end
}