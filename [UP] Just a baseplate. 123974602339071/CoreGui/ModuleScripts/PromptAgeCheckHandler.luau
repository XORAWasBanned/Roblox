-- Path: CoreGui.RobloxGui.Modules.PromptAgeCheckHandler
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("CoreGui")
local v4 = require(v_u_2.Workspace.Packages.SharedFlags)
local v_u_5 = v4.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local v_u_6 = v4.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local v_u_7 = v4.FFlagPioneerLeaveOnInExpFaeDownAge
local v_u_8 = require(v_u_2.Workspace.Packages.AppCommonLib).Logging
local v_u_9 = require(v_u_2.Workspace.Packages.PioneerUtils.maybeLeavePioneerOnFaeDownAge)
local v10 = {}
local function v_u_32(p11) -- name: onPromptAgeCheckRequested
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_6
	local v_u_12 = v_u_1.LocalPlayer
	if p11 == v_u_12 then
		local v13 = require
		local v14 = v_u_2.Workspace.Packages.AmpUpsell
		local v15, v_u_16 = pcall(v13, v14)
		if v15 and (v_u_16 and v_u_16.InExpAmpWizardController) then
			local v17 = require
			local v18 = v_u_3.RobloxGui.Modules.ApolloClient
			local v19, v20 = pcall(v17, v18)
			if v19 and v20 then
				v_u_16.InExpAmpWizardController.OpenAmpWizardContainerInExp(v_u_5, function(p_u_21, p22)
					-- upvalues: (copy) v_u_12, (ref) v_u_8, (ref) v_u_7, (copy) v_u_16, (ref) v_u_9
					local function v26() -- name: notifyIfGranted
						-- upvalues: (copy) p_u_21, (ref) v_u_12, (ref) v_u_8
						if p_u_21 == "Granted" then
							local function v23()
								-- upvalues: (ref) v_u_12
								v_u_12:NotifyAgeCheckPassed()
							end
							local v24, v25 = pcall(v23)
							if not v24 then
								v_u_8.warn("PromptAgeCheckRequested: NotifyAgeCheckPassed failed: " .. tostring(v25))
							end
						end
					end
					if v_u_7 then
						local v27 = v_u_16.AmpEnums
						local v28
						if p22 == nil then
							v28 = false
						else
							v28 = p22[v27.ActionTypeEnum.AgeEstimation] == v27.ActionStatusEnum.Success
						end
						v_u_9(v28, v26)
					elseif p_u_21 == "Granted" then
						local function v29()
							-- upvalues: (ref) v_u_12
							v_u_12:NotifyAgeCheckPassed()
						end
						local v30, v31 = pcall(v29)
						if not v30 then
							v_u_8.warn("PromptAgeCheckRequested: NotifyAgeCheckPassed failed: " .. tostring(v31))
						end
					end
				end, nil, "PromptAgeCheckRequested", nil, v_u_6, v20)
			end
		else
			return
		end
	else
		return
	end
end
function v10.init() -- name: init
	-- upvalues: (copy) v_u_1, (copy) v_u_32
	v_u_1.PromptAgeCheckRequested:Connect(v_u_32)
end
return v10