-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.SignalDeleteOutfitPermissionDenied
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.CloseOpenPrompt)
return function(p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	v_u_1:SignalDeleteOutfitPermissionDenied()
	p4:dispatch(v_u_3())
end