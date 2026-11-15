-- Path: CorePackages.Packages._Index.React.React.ReactForwardRef
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.Shared).console
local v4 = require(v1.Shared).ReactSymbols
require(v1.Shared)
local v_u_5 = v4.REACT_FORWARD_REF_TYPE
local v_u_6 = v4.REACT_MEMO_TYPE
return {
	["forwardRef"] = function(p7)
		-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
		if v_u_2.__DEV__ then
			if typeof(p7) == "table" and p7["$$typeof"] == v_u_6 then
				v_u_3.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
			elseif typeof(p7) == "function" then
				local v8, _ = debug.info(p7, "a")
				if v8 ~= 0 and v8 ~= 2 then
					v_u_3.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v8 == 1 and "Did you forget to use the ref parameter?" or "Any additional parameter will be undefined.")
				end
			else
				v_u_3.error("forwardRef requires a render function but was given %s.", (typeof(p7)))
			end
		end
		local v9 = {
			["$$typeof"] = v_u_5,
			["render"] = p7
		}
		if v_u_2.__DEV__ then
			local v_u_10 = nil
			local v16 = {
				["__index"] = function(p11, p12) -- name: __index
					-- upvalues: (ref) v_u_10
					if p12 == "displayName" then
						return v_u_10
					else
						return rawget(p11, p12)
					end
				end,
				["__newindex"] = function(p13, p14, p15) -- name: __newindex
					-- upvalues: (ref) v_u_10
					if p14 == "displayName" then
						v_u_10 = p15
					else
						rawset(p13, p14, p15)
					end
				end
			}
			setmetatable(v9, v16)
		end
		return v9
	end
}