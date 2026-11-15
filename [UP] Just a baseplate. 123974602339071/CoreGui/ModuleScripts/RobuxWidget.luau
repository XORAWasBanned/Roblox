-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.RobuxWidget
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v1.Service)
local v_u_5 = require(v1.ChromeShared.Unibar.Constants)
local v6 = require(v2.Workspace.Packages.Chrome)
local v_u_7 = require(v2.Workspace.Packages.InExperienceShop)
local v_u_8 = require(v2.Workspace.Packages.InExperienceSideSheet)
local v9 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v10 = require(v1.Flags.FFlagEnableSideSheetRobuxWidget)
local v_u_11 = require(v2.Workspace.Packages.SharedFlags).FFlagHideHeaderForBuyRobuxInExperienceShop
local function v_u_12() -- name: openShop
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_11, (copy) v_u_7
	if v_u_4:isIntegrationValid(v_u_5.IN_EXPERIENCE_SHOP_ID) or v_u_11 then
		if v_u_11 then
			v_u_7.setOpenedFromBuyRobux(true)
		end
		if not v_u_4:isWindowOpen(v_u_5.IN_EXPERIENCE_SHOP_ID) then
			v_u_7.requestOpenToRobuxTab()
		end
		v_u_4:activate(v_u_5.IN_EXPERIENCE_SHOP_ID)
	end
end
local function v14(p13) -- name: RobuxWidgetIntegration
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_12
	return v_u_3.createElement(v_u_8.RobuxWidget, {
		["layoutOrder"] = p13.layoutOrder,
		["placement"] = p13.placement,
		["onBuyActivated"] = v_u_12,
		["firstIntegrationToFocusCallback"] = p13.firstIntegrationToFocusCallback
	})
end
local v15
if v10 and v9 then
	v15 = v_u_4:register({
		["id"] = "RobuxWidget",
		["label"] = "Feature.Catalog.Label.BuyRobux",
		["activated"] = nil,
		["initialAvailability"] = nil,
		["sideSheetPlacement"] = nil,
		["components"] = nil,
		["activated"] = function() -- name: activated end,
		["initialAvailability"] = v_u_4.AvailabilitySignal.Available,
		["sideSheetPlacement"] = v6.Enums.SideSheetPlacement.ScrollableContentTop,
		["components"] = {
			["Widget"] = v14
		}
	})
else
	v15 = nil
end
return v15 or {}