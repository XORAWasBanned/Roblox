-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.useFreeTrialNineDotActivityIndicator
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v2.Packages.SignalsReact)
local v_u_5 = require(v1.ChromeShared.Hooks.useNineDotActivityIndicator)
local v_u_6 = require(v2.Workspace.Packages.InExperienceShop.submitFreeTrialBlueDot)
return function() -- name: useFreeTrialNineDotActivityIndicator
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3
	local v_u_7 = v_u_4.useSignalState(v_u_6.isHamburgerBlueDotShowing)
	v_u_5("free_trial_blue_dot", v_u_7 == true)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_7, (ref) v_u_6
		if v_u_7 == true then
			v_u_6.reportMounted()
			v_u_6.reportViewed()
		end
	end, { v_u_7 })
end