-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.displayCameraDeniedToast
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Promise)
local v4 = v1:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Tracker.TrackerMenu)
local v_u_6 = require(v4.Modules.Tracker.TrackerPromptType)
return function()
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	v_u_5:showPrompt(v_u_6.None)
	v_u_3.delay(0.016666666666666666):andThen(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_6
		v_u_5:showPrompt(v_u_6.VideoNoPermission)
	end)
end