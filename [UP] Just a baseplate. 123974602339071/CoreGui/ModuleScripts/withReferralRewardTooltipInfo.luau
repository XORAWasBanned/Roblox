-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.withReferralRewardTooltipInfo
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.HttpRequest)
local v4 = require(v1.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry
local v5 = v_u_3.config
local v9 = {
	["requestFunction"] = function(p6, p7, p8) -- name: requestFunction
		-- upvalues: (copy) v_u_3
		return v_u_3.requestFunctions.HttpRbxApi(p6, p7, p8)
	end
}
local v10
if v4 then
	v10 = game:DefineFastInt("WithReferralRewardTooltipInfoHttpRetryCount", 4)
else
	v10 = nil
end
v9.maxRetryCount = v10
local v_u_11 = v5(v9)
local v_u_12 = require(v1.Workspace.Packages.Http).Url
local v_u_13 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_14 = require(v1.Packages.Cryo)
function GetReferralRewardTooltipInfo() -- name: GetReferralRewardTooltipInfo
	-- upvalues: (copy) v_u_12, (copy) v_u_11
	local v15 = v_u_12:makeQueryString({
		["UniverseId"] = game.GameId
	})
	return v_u_11(string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", v_u_12.APIS_URL, v15), "GET")
end
function withReferralRewardTooltipInfo(p_u_16) -- name: withReferralRewardTooltipInfo
	-- upvalues: (copy) v_u_14, (copy) v_u_2, (copy) v_u_13
	return function(p17)
		-- upvalues: (ref) v_u_14, (ref) v_u_2, (ref) v_u_13, (copy) p_u_16
		local v18 = v_u_14.Dictionary.join(p17, {
			["referralRewardTooltipText"] = ""
		})
		local v19, v_u_20 = v_u_2.useState("")
		v_u_2.useEffect(function()
			-- upvalues: (copy) v_u_20
			GetReferralRewardTooltipInfo():andThen(function(p21)
				-- upvalues: (ref) v_u_20
				if p21 and (p21.responseBody and p21.responseBody.name) then
					v_u_20(p21.responseBody.name)
					task.delay(4, function()
						-- upvalues: (ref) v_u_20
						v_u_20("")
					end)
				end
			end):catch(function(p22)
				warn(p22)
			end)
		end, {})
		local v23 = {
			["referralRewardTooltipText"] = {
				"CoreScripts.TopBar.RobloxMenuReferralRewardTooltip",
				["referralRewardName"] = v19
			}
		}
		local v24 = v_u_13(v23)
		if v19 ~= "" then
			v18 = v_u_14.Dictionary.join(v18, {
				["referralRewardTooltipText"] = v24.referralRewardTooltipText
			})
		end
		return v_u_2.createElement(p_u_16, v18)
	end
end
return withReferralRewardTooltipInfo