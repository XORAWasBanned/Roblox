-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.0.7.Motion.AnimatePresence.utils
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.React)
return {
	["getChildKey"] = function(p3) -- name: getChildKey
		if p3 == nil then
			return nil
		elseif type(p3) == "table" then
			if p3.key == nil then
				if p3.props and p3.props.key ~= nil then
					return p3.props.key
				else
					return nil
				end
			else
				return p3.key
			end
		else
			return nil
		end
	end,
	["onlyElements"] = function(p4) -- name: onlyElements
		-- upvalues: (copy) v_u_2
		local v_u_5 = {}
		v_u_2.Children.forEach(p4, function(p6)
			-- upvalues: (ref) v_u_2, (copy) v_u_5
			if v_u_2.isValidElement(p6) then
				local v7 = v_u_5
				table.insert(v7, p6)
			end
		end)
		return v_u_5
	end,
	["useIdFallback"] = function() -- name: useIdFallback
		local v8 = math.random
		local v9 = tostring(v8(1000000))
		if v9 == nil then
			return "id-" .. v9
		else
			return v9
		end
	end
}