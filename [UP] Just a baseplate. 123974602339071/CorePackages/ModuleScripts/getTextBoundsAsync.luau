-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getTextBoundsAsync
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Utility.normalizeFontFace)
local v_u_3 = require(v1.Utility.Wrappers.Services).TextService
return function(p4, p5, p6, p7) -- name: getTextBoundsAsync
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v8 = v_u_2(p5)
	if typeof(v8) == "Font" then
		local v_u_9 = Instance.new("GetTextBoundsParams")
		v_u_9.Text = p4
		v_u_9.Font = v8
		v_u_9.Size = p6
		v_u_9.Width = p7 or (1 / 0)
		local function v10()
			-- upvalues: (ref) v_u_3, (copy) v_u_9
			return v_u_3:GetTextBoundsAsync(v_u_9)
		end
		local v11, v12 = pcall(v10)
		v_u_9:Destroy()
		if v11 then
			return v12
		else
			return nil
		end
	else
		return nil
	end
end