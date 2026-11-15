-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.getRestrictionType
local v1 = game:GetService("CorePackages")
require(v1.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local v_u_2 = require(script.Parent.Parent.Constants)
return function(p3) -- name: getRestrictionType
	-- upvalues: (copy) v_u_2
	return p3 and (p3.bannedUntil and (p3.banReason == v_u_2.BAN_REASON.NUDGE_V3 and "NudgeBan" or "TemporaryBan") or "PermanentBan") or "Nudge"
end