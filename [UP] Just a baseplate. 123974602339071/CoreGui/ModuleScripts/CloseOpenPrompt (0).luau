-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Thunks.CloseOpenPrompt
local v_u_1 = game:GetService("AvatarEditorService")
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Actions.CloseOpenPrompt)
local v_u_4 = require(v2.PromptType)
return function(p5)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	local v6 = p5:getState().promptInfo.promptType
	if v6 == v_u_4.AllowInventoryReadAccess then
		v_u_1:SetAllowInventoryReadAccess(false)
	elseif v6 == v_u_4.SaveAvatar then
		v_u_1:SignalSaveAvatarPermissionDenied()
	elseif v6 == v_u_4.CreateOutfit then
		v_u_1:SignalCreateOutfitPermissionDenied()
	elseif v6 == v_u_4.EnterOutfitName then
		v_u_1:SignalCreateOutfitPermissionDenied()
	elseif v6 == v_u_4.SetFavorite then
		v_u_1:SignalSetFavoritePermissionDenied()
	elseif v6 == v_u_4.DeleteOutfit then
		v_u_1:SignalDeleteOutfitPermissionDenied()
	elseif v6 == v_u_4.RenameOutfit then
		v_u_1:SignalRenameOutfitPermissionDenied()
	elseif v6 == v_u_4.UpdateOutfit then
		v_u_1:SignalUpdateOutfitPermissionDenied()
	elseif v6 == v_u_4.SaveAvatarTimeout then
		v_u_1:SignalSaveAvatarPermissionDenied()
	elseif v6 ~= nil then
		error("CloseOpenPrompt for unhandled prompt type " .. tostring(v6))
	end
	p5:dispatch(v_u_3())
end