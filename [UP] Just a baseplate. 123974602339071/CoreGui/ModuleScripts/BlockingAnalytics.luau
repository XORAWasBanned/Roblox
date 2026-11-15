-- Path: CoreGui.RobloxGui.Modules.Settings.Analytics.BlockingAnalytics
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("Players")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v_u_4 = require(v1.Packages.Cryo)
local v_u_5 = {}
v_u_5.__index = v_u_5
local v_u_6 = v2.LocalPlayer
while not v_u_6 do
	v2:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_6 = v2.LocalPlayer
end
function v_u_5.new(p7, p8) -- name: new
	-- upvalues: (ref) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v9 = p7 or v_u_6.UserId
	assert(v9, "BlockingAnalytics must be passed the ID of the local user")
	local v10 = {
		["_eventStreamImpl"] = p8 and p8.EventStream or v_u_3,
		["localUserId"] = v9
	}
	local v11 = v_u_5
	setmetatable(v10, v11)
	return v10
end
function v_u_5.action(p12, p13, p14, p15) -- name: action
	-- upvalues: (copy) v_u_4
	local v16 = v_u_4.Dictionary.join(p15 or {}, {
		["blockerUserId"] = p12.localUserId
	})
	p12._eventStreamImpl:SendEventDeferred("AccountSettingsApi", p13, p14, v16)
end
return v_u_5