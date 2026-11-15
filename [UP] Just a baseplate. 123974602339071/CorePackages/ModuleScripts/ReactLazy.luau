-- Path: CorePackages.Packages._Index.React.React.ReactLazy
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.Shared).console
local v_u_4 = require(v1.LuauPolyfill).util.inspect
require(v1.Shared)
local v_u_5 = require(v1.Shared).ReactSymbols.REACT_LAZY_TYPE
function lazyInitializer(p_u_6) -- name: lazyInitializer
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	if p_u_6._status == -1 then
		local v7 = p_u_6._result()
		p_u_6._status = 0
		p_u_6._result = v7
		v7:andThen(function(p8)
			-- upvalues: (copy) p_u_6, (ref) v_u_2, (ref) v_u_3, (ref) v_u_4
			if p_u_6._status == 0 then
				local v9 = p8.default
				if v_u_2.__DEV__ and v9 == nil then
					v_u_3.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", v_u_4(p8))
				end
				local v10 = p_u_6
				v10._status = 1
				v10._result = v9
			end
		end, function(p11)
			-- upvalues: (copy) p_u_6
			if p_u_6._status == 0 then
				local v12 = p_u_6
				v12._status = 2
				v12._result = p11
			end
		end)
	end
	if p_u_6._status == 1 then
		return p_u_6._result
	end
	error(p_u_6._result)
end
return {
	["lazy"] = function(p13)
		-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
		local v14 = {
			["$$typeof"] = v_u_5,
			["_payload"] = {
				["_status"] = -1,
				["_result"] = nil,
				["_result"] = p13
			},
			["_init"] = lazyInitializer
		}
		if v_u_2.__DEV__ then
			local v_u_15 = nil
			local v_u_16 = nil
			local v21 = {
				["__index"] = function(_, p17) -- name: __index
					-- upvalues: (ref) v_u_15, (ref) v_u_16
					if p17 == "defaultProps" then
						return v_u_15
					end
					if p17 == "propTypes" then
						return v_u_16
					end
				end,
				["__newindex"] = function(p18, p19, p20) -- name: __newindex
					-- upvalues: (ref) v_u_3, (ref) v_u_15, (ref) v_u_16
					if p19 == "defaultProps" then
						v_u_3.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						v_u_15 = p20
						setmetatable(p18, {
							["__index"] = function() -- name: __index end,
							["__newindex"] = function() -- name: __newindex end
						})
					end
					if p19 == "propTypes" then
						v_u_3.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						v_u_16 = p20
						setmetatable(p18, {
							["__index"] = function() -- name: __index end,
							["__newindex"] = function() -- name: __newindex end
						})
					end
				end
			}
			setmetatable(v14, v21)
		end
		return v14
	end
}