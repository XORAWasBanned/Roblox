-- Path: CorePackages.Packages._Index.React.React.ReactMemo
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v3 = require(v1.Shared)
local v_u_4 = v3.console
local v5 = require(v1.LuauPolyfill)
local v_u_6 = v5.Array
local v_u_7 = v5.Object
local v_u_8 = v5.util.inspect
local v9 = v3.ReactSymbols
local v_u_10 = v9.REACT_MEMO_TYPE
local v_u_11 = v9.REACT_ELEMENT_TYPE
local v_u_12 = v3.isValidElementType
local v_u_13 = v3.getComponentName
return {
	["memo"] = function(p_u_14, p15)
		-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_7, (copy) v_u_6, (copy) v_u_11, (copy) v_u_13, (copy) v_u_8, (copy) v_u_4, (copy) v_u_10
		if v_u_2.__DEV__ and not v_u_12(p_u_14) then
			local v16 = ""
			if p_u_14 == nil or typeof(p_u_14) == "table" and #v_u_7.keys(p_u_14) == 0 then
				v16 = v16 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
			end
			local v17
			if p_u_14 == nil then
				v17 = "nil"
			elseif v_u_6.isArray(p_u_14) then
				v17 = "array"
			elseif p_u_14 == nil or (typeof(p_u_14) ~= "table" or p_u_14["$$typeof"] ~= v_u_11) then
				v17 = typeof(p_u_14)
				if p_u_14 ~= nil then
					v16 = "\n" .. v_u_8(p_u_14)
				end
			else
				v17 = string.format("<%s />", v_u_13(p_u_14.type) or "UNKNOWN")
				v16 = " Did you accidentally export a JSX literal or Element instead of a component?"
			end
			v_u_4.error("memo: The first argument must be a component. Instead received: `%s`.%s", v17, v16)
		end
		local v18 = {
			["$$typeof"] = v_u_10,
			["type"] = p_u_14,
			["compare"] = p15 or nil
		}
		if v_u_2.__DEV__ then
			local v_u_19 = nil
			local v26 = {
				["__index"] = function(p20, p21) -- name: __index
					-- upvalues: (ref) v_u_19
					if p21 == "displayName" then
						return v_u_19
					else
						return rawget(p20, p21)
					end
				end,
				["__newindex"] = function(p22, p23, p24) -- name: __newindex
					-- upvalues: (ref) v_u_19, (copy) p_u_14
					if p23 == "displayName" then
						v_u_19 = p24
						local v25 = p_u_14
						if typeof(v25) == "table" and p_u_14.displayName == nil then
							p_u_14.displayName = v_u_19
							return
						end
					else
						rawset(p22, p23, p24)
					end
				end
			}
			setmetatable(v18, v26)
		end
		return v18
	end
}