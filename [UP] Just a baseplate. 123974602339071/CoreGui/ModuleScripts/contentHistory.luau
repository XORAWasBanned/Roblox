-- Path: CoreGui.RobloxGui.Modules.Shell.XboxPrimaryNav.contentHistory
local v1 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local v_u_2 = require(v1.Flags.GetFFlagXboxFixPrimaryNavABEvents)
return (function() -- name: contentHistory
	-- upvalues: (copy) v_u_2
	local v3 = {}
	local v_u_4 = nil
	function v3.setLastSelectedContent(_, p5) -- name: setLastSelectedContent
		-- upvalues: (ref) v_u_4
		v_u_4 = p5
	end
	function v3.getLastContentName(_) -- name: getLastContentName
		-- upvalues: (ref) v_u_2, (ref) v_u_4
		local function v6()
			-- upvalues: (ref) v_u_2, (ref) v_u_4
			if v_u_2() then
				return v_u_4:GetId()
			else
				return v_u_4:GetName()
			end
		end
		local v7, v8 = pcall(v6)
		if v7 then
			return v8
		end
	end
	return v3
end)()