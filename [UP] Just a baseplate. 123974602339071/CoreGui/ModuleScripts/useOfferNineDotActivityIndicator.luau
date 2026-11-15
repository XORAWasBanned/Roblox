-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.useOfferNineDotActivityIndicator
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.SignalsReact)
local v4 = require(v2.Workspace.Packages.InExperienceOffers)
local v_u_5 = require(v1.ChromeShared.Hooks.useNineDotActivityIndicator)
local v_u_6 = v4.getOffersStore
local v_u_7 = v4.NotificationLocation
return function() -- name: useOfferNineDotActivityIndicator
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	v_u_5("in_experience_offers", v_u_3.useSignalState(v_u_6(false).getOfferNotificationShownWithEnum) == v_u_7.Hamburger)
end