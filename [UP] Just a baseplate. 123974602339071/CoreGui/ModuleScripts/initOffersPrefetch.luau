-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceOffers.initOffersPrefetch
local v_u_1 = game:GetService("CorePackages")
task.spawn(function()
	-- upvalues: (copy) v_u_1
	require(v_u_1.Workspace.Packages.InExperienceOffers.prefetchOffersOnGameJoin)()
end)
return true