-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Flags.GetFFlagUploadMakeupSupport
game:DefineFastFlag("UploadMakeupSupport", false)
local v_u_1 = require(script.Parent.GetFFlagSingleUploadMakeupSupport)
return function()
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1()
	if v2 then
		v2 = game:GetFastFlag("UploadMakeupSupport")
	end
	return v2
end