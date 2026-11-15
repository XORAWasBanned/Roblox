-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.1.0.Motion.Utility.useInteraction
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.React)
return function(p_u_3) -- name: useInteraction
	-- upvalues: (copy) v_u_2
	local v_u_4, v_u_5 = v_u_2.useState(false)
	local v_u_6, v_u_7 = v_u_2.useState(false)
	return {
		["onInputBegan"] = function(_, p8) -- name: onInputBegan
			-- upvalues: (copy) v_u_5
			if p8.UserInputType == Enum.UserInputType.MouseButton1 then
				v_u_5(true)
			end
		end,
		["onInputEnded"] = function(_, p9) -- name: onInputEnded
			-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) p_u_3, (copy) v_u_5
			if p9.UserInputType == Enum.UserInputType.MouseButton1 then
				if v_u_4 and v_u_6 then
					p_u_3()
				end
				v_u_5(false)
			end
		end,
		["onMouseEnter"] = function() -- name: onMouseEnter
			-- upvalues: (copy) v_u_7
			v_u_7(true)
		end,
		["onMouseLeave"] = function() -- name: onMouseLeave
			-- upvalues: (copy) v_u_7, (copy) v_u_5
			v_u_7(false)
			v_u_5(false)
		end
	}, v_u_4, v_u_6
end