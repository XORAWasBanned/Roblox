-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.AvatarEditorPromptsPolicy
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.PolicyProvider)
local v3 = v2.GetPolicyImplementations.MemStorageService("app-policy")
local v4 = v2.withGetPolicyImplementation(v3)
function v4.Mapper(p_u_5)
	return {
		["getCustomOutfitNames"] = function() -- name: getCustomOutfitNames
			-- upvalues: (copy) p_u_5
			return p_u_5.CustomCostumeNames == nil and true or p_u_5.CustomCostumeNames
		end
	}
end
return v4