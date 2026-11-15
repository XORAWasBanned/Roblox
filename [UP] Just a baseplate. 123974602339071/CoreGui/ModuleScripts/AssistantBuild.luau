-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.AssistantBuild
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("VRService")
local v_u_4 = require(v2.Workspace.Packages.SharedFlags).FFlagBuildExperienceInGameShell
local v_u_5 = require(v2.Packages.React)
local v6 = require(v2.Packages.Foundation)
local v7
if v_u_4 then
	v7 = require(v2.Packages.Signals)
else
	v7 = nil
end
local v_u_8 = require(v2.Workspace.Packages.BuildExperience)
local v_u_9 = require(v2.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local v_u_10
if v_u_4 then
	v_u_10 = require(v2.Workspace.Packages.Display)
else
	v_u_10 = nil
end
local v11 = require(v1.Service)
local v_u_12 = v6.Enums.ButtonVariant
local v13 = {
	["id"] = "assistant_build",
	["label"] = "CommonUI.Features.NavBar.Build",
	["initialAvailability"] = nil,
	["activated"] = nil,
	["components"] = nil
}
local v14
if v_u_9:hasBuildMode() and not v_u_3.VREnabled then
	if v_u_4 then
		local v15 = v_u_10.GetDisplayStore(false).getDisplaySize(false)
		v14 = v15 == nil and true or v15 == Enum.DisplaySize.Small
	else
		v14 = true
	end
else
	v14 = false
end
local v16
if v14 then
	v16 = v11.AvailabilitySignal.Available
else
	v16 = v11.AvailabilitySignal.Unavailable
end
v13.initialAvailability = v16
function v13.activated(_) -- name: activated
	-- upvalues: (copy) v_u_8, (copy) v_u_4
	local v17 = v_u_8.GetAssistantBuildStore()
	if v_u_4 then
		v17.activate()
		return
	elseif v17.getIsDisabled() then
		v17.setIsDisabledTooltipOpen(not v17.getIsDisabledTooltipOpen())
	else
		v17.setIsDisabledTooltipOpen(false)
		v_u_8.GetPlayButtonStore().setIsActive(true)
	end
end
v13.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_12
		return v_u_5.createElement(v_u_8.AssistantBuild, {
			["variant"] = v_u_12.Utility
		})
	end
}
local v_u_18 = v11:register(v13)
if v_u_4 then
	v_u_18._disposeDisplaySizeEffect = v7.createEffect(function(p19)
		-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_10, (copy) v_u_18
		local v20
		if v_u_9:hasBuildMode() and not v_u_3.VREnabled then
			if v_u_4 then
				local v21 = v_u_10.GetDisplayStore(p19).getDisplaySize(p19)
				v20 = v21 == nil and true or v21 == Enum.DisplaySize.Small
			else
				v20 = true
			end
		else
			v20 = false
		end
		if v20 then
			v_u_18.availability:available()
		else
			v_u_18.availability:unavailable()
		end
	end)
end
return v_u_18