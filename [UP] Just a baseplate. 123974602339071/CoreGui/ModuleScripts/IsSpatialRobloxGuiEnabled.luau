-- Path: CoreGui.RobloxGui.Modules.VR.IsSpatialRobloxGuiEnabled
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("CorePackages")
if require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled then
	return true
end
if not require(v1.Modules.Flags.FFlagEnableSpatialRobloxGui) then
	return false
end
local v3 = require(v2.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v4 = require(v1.Modules.Flags.FStringSpatialRobloxUIIXPLayerName)
local v5 = require(v1.Modules.Flags.FStringSpatialRobloxUIIXPUITypeVariableName)
return require(v1.Modules.Flags.FStringSpatialRobloxUIIXPSpatialUIVariantValue) == v3:GetLayerData(v4)[v5]