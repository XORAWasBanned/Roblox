-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.showSaveAvatarTimeoutFeatureRestriction
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.AvatarExperienceCommon).Utils.showAvatarChangeFeatureRestriction
return function(p4) -- name: showSaveAvatarTimeoutFeatureRestriction
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	(p4 or v_u_1):SignalSaveAvatarPermissionDenied()
	v_u_3()
end