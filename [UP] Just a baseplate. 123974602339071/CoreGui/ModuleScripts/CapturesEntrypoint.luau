-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Captures.CapturesEntrypoint
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CoreGui")
local v3 = game:GetService("CorePackages")
local v4 = game:GetService("StarterGui")
local v5 = v2:WaitForChild("RobloxGui")
local v6 = require(v3.Workspace.Packages.SharedFlags)
local v_u_7 = require(v5.Modules.Captures.CapturesApp)
local v8 = require(v3.Workspace.Packages.CapturesInExperience).CapturesPolicy
local v9 = require(v1.Service)
local v10 = require(v1.ChromeShared.Service.ChromeUtils)
local v_u_11 = require(v1.Integrations.CommonIcon)
local v12 = v10.MappedSignal
local v13 = v6.FFlagEnableConsoleExpControls
local v14 = require(v3.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local _ = v9.AvailabilitySignal.Available
local v15
if v4:GetCoreGuiEnabled(Enum.CoreGuiType.All) or v4:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then
	v15 = v9.AvailabilitySignal.Available
else
	v15 = v9.AvailabilitySignal.Unavailable
end
local v_u_16 = v12.new(v_u_7.onIsActiveChanged, function()
	-- upvalues: (copy) v_u_7
	return v_u_7.getIsActive()
end)
local v17 = v9:register({
	["initialAvailability"] = nil,
	["id"] = "camera_entrypoint",
	["label"] = "Feature.SettingsHub.Label.Captures",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil,
	["initialAvailability"] = v15,
	["sideSheetPlacement"] = v14.BelowFold,
	["activated"] = function(_) -- name: activated
		-- upvalues: (copy) v_u_7
		v_u_7.onToggleActivationFromChrome()
	end,
	["isActivated"] = v_u_16,
	["components"] = {
		["Icon"] = function(_) -- name: Icon
			-- upvalues: (copy) v_u_11, (copy) v_u_16
			return v_u_11("icons/controls/cameraOff", "icons/controls/cameraOn", v_u_16)
		end
	}
})
v10.setCoreGuiAvailability(v17, Enum.CoreGuiType.Captures)
if v13 then
	local v18 = v8.PolicyImplementation.read()
	local v19
	if v18 then
		v19 = v8.Mapper(v18).eligibleForCapturesFeature()
	else
		v19 = false
	end
	if not v19 then
		v17.availability:forceUnavailable()
	end
end
return v17