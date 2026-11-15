-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.initializeShopMenuController
return function(p_u_1, p2) -- name: initializeShopMenuController
	p2:connect(function(p3)
		-- upvalues: (copy) p_u_1
		p_u_1:SetMenuIsOpen(p3, "in_experience_shop")
	end)
end