-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.InExperienceShopFtuxTooltip
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.Service)
local v_u_4 = require(v1.ChromeShared.Unibar.Constants)
local v_u_5 = require(v2.Workspace.Packages.Chrome).Hooks.useMappedSignal
local v_u_6 = require(v1.Integrations.CommonFtuxTooltip)
local v_u_7 = game:DefineFastInt("InExperienceShopTooltipPriority", 3500)
local v_u_8 = game:DefineFastString("InExperienceShopTooltipStorageKey", "InExperienceShopTooltipStorageKey")
local v_u_9 = game:DefineFastInt("InExperienceShopTooltipShowDelay", 1000)
local v_u_10 = game:DefineFastInt("InExperienceShopTooltipDismissDelay", 7000)
return function(p11) -- name: InExperienceShopFtuxTooltip
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v12 = v_u_3:integrations()[v_u_4.IN_EXPERIENCE_SHOP_ID]
	local v13
	if v12 then
		v13 = v12.availability
	else
		v13 = nil
	end
	local v14 = v_u_5(v13) == v_u_3.AvailabilitySignal.Available
	if v14 then
		v14 = v_u_6({
			["id"] = "IN_EXPERIENCE_SHOP_TOOLTIP",
			["priority"] = nil,
			["isIconVisible"] = nil,
			["headerKey"] = "CoreScripts.FTUX.Heading.InExperienceShop",
			["bodyKey"] = "CoreScripts.FTUX.Label.InExperienceShopDescription",
			["localStorageKey"] = nil,
			["showDelay"] = nil,
			["dismissDelay"] = nil,
			["priority"] = v_u_7,
			["isIconVisible"] = p11.visible,
			["localStorageKey"] = v_u_8,
			["showDelay"] = v_u_9,
			["dismissDelay"] = v_u_10
		})
	end
	return v14
end