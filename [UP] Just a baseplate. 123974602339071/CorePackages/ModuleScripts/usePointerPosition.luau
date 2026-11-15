-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.usePointerPosition
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v4 = require(v1.Utility.Wrappers)
local v_u_5 = v4.Signal
local v_u_6 = v4.Connection
return function(p_u_7) -- name: usePointerPosition
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	local v8, v_u_9 = v_u_3.useBinding(Vector2.zero)
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_7, (copy) v_u_9, (ref) v_u_5, (ref) v_u_6
		if p_u_7 then
			local function v11(p10) -- name: setPositionFromInput
				-- upvalues: (ref) v_u_9
				if p10.Position.X > 0 or p10.Position.Y > 0 then
					v_u_9(Vector2.new(p10.Position.X, p10.Position.Y))
				end
			end
			local v_u_12 = { v_u_5.Connect(p_u_7.InputBegan, v11), v_u_5.Connect(p_u_7.InputChanged, v11), v_u_5.Connect(p_u_7.InputEnded, v11) }
			return function()
				-- upvalues: (copy) v_u_12, (ref) v_u_6
				for _, v13 in v_u_12 do
					v_u_6.Disconnect(v13)
				end
			end
		end
	end, { p_u_7 })
	return v8
end