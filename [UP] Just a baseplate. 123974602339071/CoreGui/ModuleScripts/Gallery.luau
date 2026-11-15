-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.Pages.Gallery
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v3 = require(v1.Service)
local v_u_4 = require(v1.Integrations.CommonIcon)
local v5 = require(v2.Workspace.Packages.CapturesInExperience).CapturesPolicy
local v6 = require(v2.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local v7 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v8 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v9 = require(v2.Workspace.Packages.SharedFlags).FFlagFixSpatialUICaptures
local v_u_10 = game:DefineFastFlag("UpdateGalleryIcon", false)
local v_u_11 = require(script.Parent.InGameMenuIntegrationUtils)
local v12 = v5.PolicyImplementation.read()
local v13
if v12 then
	v13 = v5.Mapper(v12).eligibleForCapturesFeature()
else
	v13 = false
end
local v14 = v8 and v9
if v13 then
	v13 = not v14 and true or not v7()
end
if not v13 then
	return nil
end
local v_u_15 = v_u_11.createPageOpenSignal("CapturesPage")
local v16 = {
	["initialAvailability"] = nil,
	["id"] = "gallery",
	["label"] = "Feature.Captures.Title.Gallery",
	["sideSheetPlacement"] = nil,
	["activated"] = nil,
	["isActivated"] = nil,
	["components"] = nil
}
local v17
if v13 then
	v17 = v3.AvailabilitySignal.Available
else
	v17 = v3.AvailabilitySignal.Unavailable
end
v16.initialAvailability = v17
v16.sideSheetPlacement = v6.BelowFold
function v16.activated(_) -- name: activated
	-- upvalues: (copy) v_u_11, (copy) v_u_15
	v_u_11.toggleIGMPage("CapturesPage", v_u_15:get())
end
v16.isActivated = v_u_15
v16.components = {
	["Icon"] = function(_) -- name: Icon
		-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_15
		if v_u_10 then
			return v_u_4("Image", nil, v_u_15)
		else
			return v_u_4("icons/controls/cameraOff", "icons/controls/cameraOn", v_u_15)
		end
	end
}
return v3:register(v16)