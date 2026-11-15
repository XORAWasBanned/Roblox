-- Path: CorePackages.Packages._Index.Otter-31ab8d40-1.3.7.Otter.AnimationStepSignal
local v_u_1 = game:GetService("RunService")
local v_u_2 = {}
local v_u_6 = {
	["Connect"] = function(_, p_u_3) -- name: Connect
		-- upvalues: (copy) v_u_2
		v_u_2[p_u_3] = true
		return {
			["Disconnect"] = function() -- name: Disconnect
				-- upvalues: (ref) v_u_2, (copy) p_u_3
				v_u_2[p_u_3] = nil
			end
		}
	end,
	["Fire"] = function(_, p4) -- name: Fire
		-- upvalues: (copy) v_u_2
		for v5, _ in v_u_2 do
			v5(p4)
		end
	end
}
return {
	["Connect"] = function(_, p7) -- name: Connect
		-- upvalues: (copy) v_u_6, (copy) v_u_1
		if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then
			return v_u_6:Connect(p7)
		else
			return v_u_1.RenderStepped:Connect(p7)
		end
	end,
	["Fire"] = function(_, p8) -- name: Fire
		-- upvalues: (copy) v_u_6
		if _G.__OTTER_MOCK_ANIMATION_STEP_SIGNAL__ then
			v_u_6:Fire(p8 or 0.016666666666666666)
		else
			error("Cannot manually fire real animation step signal")
		end
	end
}