-- Path: CoreGui.RobloxGui.Modules.InGameMenu.InGameMenuPolicy
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies).PolicyProvider
local v3 = v1.Workspace.Packages.SharedFlags
local v_u_4 = require(v3).GetFFlagGateEducationalPopupVisibilityViaGUAC
local v5 = v2.GetPolicyImplementations.MemStorageService("app-policy")
local v6 = v2.withGetPolicyImplementation(v5)
local v_u_7 = require(script.Parent.Parent.Flags.GetFIntEducationalPopupDisplayMaxCount)
local v_u_8 = require(v1.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
function v6.Mapper(p_u_9)
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_7
	return {
		["enableInGameHomeIcon"] = function() -- name: enableInGameHomeIcon
			-- upvalues: (ref) v_u_8
			return v_u_8()
		end,
		["enableEducationalPopup"] = function() -- name: enableEducationalPopup
			-- upvalues: (ref) v_u_8, (ref) v_u_4, (copy) p_u_9
			local v10 = game:GetEngineFeature("NativeCloseIntercept")
			if v_u_8() and v10 then
				return not v_u_4() and true or (p_u_9.InExperienceCanViewEducationalPopup == nil and true or p_u_9.InExperienceCanViewEducationalPopup)
			else
				return false
			end
		end,
		["educationalPopupMaxDisplayCount"] = function() -- name: educationalPopupMaxDisplayCount
			-- upvalues: (ref) v_u_8, (ref) v_u_7
			return v_u_8() and v_u_7() or 0
		end,
		["getGameInfoShowChatFeatures"] = function() -- name: getGameInfoShowChatFeatures
			return false
		end,
		["enableFullscreenTitleBar"] = function() -- name: enableFullscreenTitleBar
			-- upvalues: (copy) p_u_9
			return p_u_9.FullscreenTitleBarEnabled or false
		end,
		["getDisplayCheckboxInVoiceConsent"] = function() -- name: getDisplayCheckboxInVoiceConsent
			-- upvalues: (copy) p_u_9
			return p_u_9.DisplayCheckboxInVoiceConsent == nil and true or p_u_9.DisplayCheckboxInVoiceConsent
		end
	}
end
return v6