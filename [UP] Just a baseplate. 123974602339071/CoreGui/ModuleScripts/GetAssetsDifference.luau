-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.GetAssetsDifference
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
require(v1.Packages.Promise)
local v_u_3 = require(script.Parent.GetCurrentHumanoidDescription)
local v_u_4 = require(script.Parent.GetAssetIdsFromDescription)
local v_u_5 = require(script.Parent.GetAssetNamesForIds)
return function(p_u_6)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local function v_u_13(p7, p8) -- name: getAddedAndRemovedIds
		-- upvalues: (ref) v_u_2
		local v_u_9 = v_u_2.List.toSet(p7)
		local v_u_10 = v_u_2.List.toSet(p8)
		return v_u_2.List.filter(p8, function(p11)
			-- upvalues: (copy) v_u_9
			return v_u_9[p11] == nil
		end), v_u_2.List.filter(p7, function(p12)
			-- upvalues: (copy) v_u_10
			return v_u_10[p12] == nil
		end)
	end
	return v_u_3():andThen(function(p14)
		-- upvalues: (ref) v_u_4, (copy) p_u_6, (copy) v_u_13, (ref) v_u_2, (ref) v_u_5
		local v_u_15, v_u_16 = v_u_13(v_u_4(p14), (v_u_4(p_u_6)))
		return v_u_5((v_u_2.List.join(v_u_15, v_u_16))):andThen(function(p17)
			-- upvalues: (copy) v_u_15, (copy) v_u_16
			local v18 = {}
			for _, v19 in ipairs(v_u_15) do
				local v20 = p17[v19]
				table.insert(v18, v20)
			end
			local v21 = {}
			for _, v22 in ipairs(v_u_16) do
				local v23 = p17[v22]
				table.insert(v21, v23)
			end
			return {
				["addedNames"] = v18,
				["removedNames"] = v21,
				["addedAssetIds"] = v_u_15,
				["removedAssetIds"] = v_u_16
			}
		end)
	end)
end