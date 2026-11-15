-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.AccountUpsell
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.AccountUpgrade)
local v4 = require(v2.Workspace.Packages.Chrome)
local v5 = require(v1.Service)
local v_u_6 = require(v2.Workspace.Packages.InExperienceSideSheet)
local v7 = require(v2.Workspace.Packages.PioneerUtils).isPioneerLaunch
local v_u_8 = require(v2.Packages.React)
local v_u_9 = v_u_3.AccountUpgradeFlow.Pioneer
local v_u_10 = nil
local function v_u_13() -- name: openAccountUpsell
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (ref) v_u_10
	local v12 = {
		["flow"] = v_u_9,
		["onComplete"] = function(p11) -- name: onComplete
			-- upvalues: (ref) v_u_10
			if p11.reason == "success" and v_u_10 then
				v_u_10.availability:unavailable()
			end
		end
	}
	if v_u_3.InExperienceController.mount(v12) == "already_mounted" then
		v_u_3.InExperienceController.unmount()
	end
end
local v15 = v7() and {
	["id"] = "AccountUpsell",
	["label"] = "CoreScripts.InGameMenu.UnlockMore.Title",
	["activated"] = nil,
	["sideSheetPlacement"] = nil,
	["components"] = nil,
	["activated"] = function() -- name: activated end,
	["sideSheetPlacement"] = v4.Enums.SideSheetPlacement.ScrollableContentBottom,
	["components"] = {
		["Widget"] = function(p14) -- name: AccountUpsellIntegration
			-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_13
			return v_u_8.createElement(v_u_6.AccountUpsell, {
				["layoutOrder"] = p14.layoutOrder,
				["placement"] = p14.placement,
				["onActivated"] = v_u_13
			})
		end
	}
} or nil
if v15 then
	v15.initialAvailability = v5.AvailabilitySignal.Unavailable
	local v_u_16 = v5:register(v15)
	v_u_10 = v_u_16
	task.spawn(function()
		-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_16
		if v_u_3.Eligibility.getAvailability(v_u_9).granted then
			v_u_16.availability:available()
		end
	end)
end
return v_u_10 or {}