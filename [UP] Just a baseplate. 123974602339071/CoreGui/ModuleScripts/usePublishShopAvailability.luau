-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.usePublishShopAvailability
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v4 = require(v2.Workspace.Packages.InExperienceOffers)
local v_u_5 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
local v_u_6 = require(v1.Service)
local v_u_7 = require(v1.ChromeShared.Unibar.Constants)
local v_u_8 = v4.getOffersStore
return function() -- name: usePublishShopAvailability
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3, (copy) v_u_8
	local v9 = v_u_6:integrations()[v_u_7.IN_EXPERIENCE_SHOP_ID]
	local v10 = v_u_5
	local v11
	if v9 then
		v11 = v9.availability
	else
		v11 = nil
	end
	local v_u_12 = v10(v11) == v_u_6.AvailabilitySignal.Available
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_8, (copy) v_u_12
		v_u_8(false).setIsShopAvailable(v_u_12)
	end, { v_u_12 })
end