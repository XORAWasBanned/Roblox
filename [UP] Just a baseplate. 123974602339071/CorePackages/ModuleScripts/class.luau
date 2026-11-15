-- Path: CorePackages.Packages._Index.Dash.Dash.class
local v_u_1 = script.Parent
require(v_u_1.Types)
local function v_u_2()
	return {}
end
local function v_u_30(p_u_3, p4) -- name: class
	-- upvalues: (copy) v_u_2, (copy) v_u_30, (copy) v_u_1
	local v_u_5 = p4 or v_u_2
	local v_u_29 = {
		["name"] = p_u_3,
		["new"] = function(...) -- name: new
			-- upvalues: (copy) v_u_5, (copy) v_u_29
			local v6 = v_u_5(...)
			local v7 = {
				["__index"] = v_u_29,
				["__tostring"] = v_u_29.toString,
				["__eq"] = v_u_29.equals,
				["__lt"] = v_u_29.__lt,
				["__le"] = v_u_29.__le,
				["__add"] = v_u_29.__add,
				["__sub"] = v_u_29.__sub,
				["__mul"] = v_u_29.__mul,
				["__div"] = v_u_29.__div,
				["__mod"] = v_u_29.__mod
			}
			setmetatable(v6, v7)
			v6.Class = v_u_29
			v6:_init(...)
			return v6
		end,
		["_init"] = function(_) -- name: _init end,
		["isInstance"] = function(p_u_8) -- name: isInstance
			-- upvalues: (copy) v_u_29
			local function v12()
				-- upvalues: (copy) p_u_8, (ref) v_u_29
				local v9 = p_u_8
				local v10 = getmetatable(v9)
				while v10 do
					if v10.__index == v_u_29 then
						return true
					end
					local v11 = v10.__index
					v10 = getmetatable(v11)
				end
				return false
			end
			local v13, v14 = pcall(v12)
			return v13 and v14
		end,
		["extend"] = function(p15, p16, p17) -- name: extend
			-- upvalues: (ref) v_u_30, (copy) v_u_29
			local v18 = v_u_30(p16, p17 or v_u_29.new)
			setmetatable(v18, {
				["__index"] = p15
			})
			return v18
		end,
		["toString"] = function(p19) -- name: toString
			return p19.name
		end,
		["equals"] = function(p20, p21) -- name: equals
			return rawequal(p20, p21)
		end,
		["__lt"] = function(_, _) -- name: __lt
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v22 = {
				["methodName"] = "__lt",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v22)
		end,
		["__le"] = function(_, _) -- name: __le
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v23 = {
				["methodName"] = "__le",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v23)
		end,
		["__add"] = function(_) -- name: __add
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v24 = {
				["methodName"] = "__add",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v24)
		end,
		["__sub"] = function(_) -- name: __sub
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v25 = {
				["methodName"] = "__sub",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v25)
		end,
		["__mul"] = function(_) -- name: __mul
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v26 = {
				["methodName"] = "__mul",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v26)
		end,
		["__div"] = function(_) -- name: __div
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v27 = {
				["methodName"] = "__div",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v27)
		end,
		["__mod"] = function(_) -- name: __mod
			-- upvalues: (copy) p_u_3, (ref) v_u_1
			local v28 = {
				["methodName"] = "__mod",
				["className"] = nil,
				["className"] = p_u_3
			}
			require(v_u_1.Error).new("NotImplemented", "The method \"{methodName}\" is not implemented on the class \"{className}\""):throw(v28)
		end
	}
	return v_u_29
end
return v_u_30