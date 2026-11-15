-- Path: CorePackages.Packages._Index.React.React.ReactContext
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.Shared).console
local v4 = require(v1.Shared).ReactSymbols
local v_u_5 = v4.REACT_PROVIDER_TYPE
local v_u_6 = v4.REACT_CONTEXT_TYPE
return {
	["createContext"] = function(p7, p8)
		-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
		local v_u_9 = {
			["$$typeof"] = v_u_6,
			["_calculateChangedBits"] = p8,
			["_currentValue"] = p7,
			["_currentValue2"] = p7,
			["_threadCount"] = 0,
			["Provider"] = nil,
			["Consumer"] = nil,
			["displayName"] = nil,
			["_currentRenderer"] = nil,
			["_currentRenderer2"] = nil
		}
		v_u_9.Provider = {
			["$$typeof"] = v_u_5,
			["_context"] = v_u_9
		}
		local v_u_10 = false
		if v_u_2.__DEV__ then
			local v11 = {
				["$$typeof"] = v_u_6,
				["_context"] = v_u_9,
				["_calculateChangedBits"] = v_u_9._calculateChangedBits
			}
			local v15 = {
				["__index"] = function(_, p12) -- name: __index
					-- upvalues: (copy) v_u_9
					if p12 == "_currentValue" then
						return v_u_9._currentValue
					elseif p12 == "_currentValue2" then
						return v_u_9._currentValue2
					elseif p12 == "_threadCount" then
						return v_u_9._threadCount
					elseif p12 == "displayName" then
						return v_u_9.displayName
					else
						return nil
					end
				end,
				["__newindex"] = function(_, p13, p14) -- name: __newindex
					-- upvalues: (copy) v_u_9, (ref) v_u_10, (ref) v_u_3
					if p13 == "_currentValue" then
						v_u_9._currentValue = p14
						return
					elseif p13 == "_currentValue2" then
						v_u_9._currentValue2 = p14
						return
					elseif p13 == "_threadCount" then
						v_u_9._threadCount = p14
					elseif p13 == "displayName" and not v_u_10 then
						v_u_3.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. p14 .. ".")
						v_u_10 = true
					end
				end
			}
			setmetatable(v11, v15)
			v_u_9.Consumer = v11
		else
			v_u_9.Consumer = v_u_9
		end
		if v_u_2.__DEV__ then
			v_u_9._currentRenderer = nil
			v_u_9._currentRenderer2 = nil
		end
		return v_u_9
	end
}