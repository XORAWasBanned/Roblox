-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.GetAssetNamesForIds
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("AvatarEditorService")
local v_u_3 = require(v1.Packages.Promise)
return function(p_u_4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	return v_u_3.new(function(p5, p6)
		-- upvalues: (ref) v_u_2, (copy) p_u_4
		local function v7()
			-- upvalues: (ref) v_u_2, (ref) p_u_4
			return v_u_2:GetBatchItemDetailsAsync(p_u_4, Enum.AvatarItemType.Asset)
		end
		local v8, v9 = pcall(v7)
		if v8 then
			local v10 = {}
			for _, v11 in ipairs(v9) do
				v10[v11.Id] = v11.Name
			end
			p5(v10)
		else
			p6()
		end
	end)
end