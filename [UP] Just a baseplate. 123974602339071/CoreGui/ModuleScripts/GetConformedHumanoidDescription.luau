-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.GetConformedHumanoidDescription
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Promise)
local v_u_4 = nil
local v_u_5 = nil
local function v_u_15(p6, p7, p8) -- name: removeDefaultClothing
	-- upvalues: (copy) v_u_1
	local v9 = v_u_1:GetAvatarRulesAsync()
	if v9.DefaultClothingAssetLists then
		local v10 = v9.DefaultClothingAssetLists.DefaultShirtAssetIds
		local v11 = v9.DefaultClothingAssetLists.DefaultPantAssetIds
		if v10 and v11 then
			local v12 = nil
			for _, v13 in ipairs(v10) do
				if v13 ~= p6.Shirt then
					continue
				end
				v12 = v12 or p6:Clone()
				v12.Shirt = 0
			end
			for _, v14 in ipairs(v11) do
				if v14 ~= p6.Pants then
					continue
				end
				v12 = v12 or p6:Clone()
				v12.Pants = 0
			end
			p7(v12 or p6)
		else
			p8("No default clothing ids in avatar rules")
		end
	else
		p8("No default clothing in avatar rules")
		return
	end
end
return function(p_u_16, p_u_17) -- name: GetConformedHumanoidDescription
	-- upvalues: (ref) v_u_4, (copy) v_u_3, (ref) v_u_5, (copy) v_u_15, (copy) v_u_1
	if p_u_16 == v_u_4 then
		if p_u_17 then
			return v_u_3.resolve(v_u_5)
		else
			return v_u_3.new(function(p18, p19)
				-- upvalues: (ref) v_u_15, (ref) v_u_5
				v_u_15(v_u_5, p18, p19)
			end)
		end
	else
		return v_u_3.new(function(p_u_20, p_u_21)
			-- upvalues: (ref) v_u_1, (copy) p_u_16, (ref) v_u_4, (ref) v_u_5, (copy) p_u_17, (ref) v_u_15
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_1, (ref) p_u_16, (ref) v_u_4, (ref) v_u_5, (ref) p_u_17, (copy) p_u_20, (ref) v_u_15, (copy) p_u_21
				local function v22()
					-- upvalues: (ref) v_u_1, (ref) p_u_16
					return v_u_1:ConformToAvatarRulesAsync(p_u_16)
				end
				local v23, v24 = pcall(v22)
				if v23 then
					v_u_4 = p_u_16
					v_u_5 = v24
					if p_u_17 then
						p_u_20(v24)
					else
						v_u_15(v24, p_u_20, p_u_21)
					end
				else
					p_u_21(v24)
					return
				end
			end)()
		end)
	end
end