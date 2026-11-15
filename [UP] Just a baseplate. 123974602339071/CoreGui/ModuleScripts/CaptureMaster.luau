-- Path: CoreGui.RobloxGui.Modules.CaptureMaster
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Roact)
local v4 = v_u_1:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.CaptureNotification)
local v_u_6 = require(v4.Modules.shouldSaveScreenshotToAlbum)
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new() -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	local v8 = {}
	local v9 = v_u_7
	setmetatable(v8, v9)
	v8.init = false
	v8.captureEvent = Instance.new("BindableEvent")
	v8.permissionEvent = Instance.new("BindableEvent")
	if v_u_6() then
		v8.captureNotification = v_u_3.createElement(v_u_5, {
			["permissionEvent"] = v8.permissionEvent
		})
	end
	return v8
end
function v_u_7.Start(p10) -- name: Start
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_1
	if not p10.init then
		p10.init = true
		if v_u_6() then
			p10.captureNotificationInstance = v_u_3.mount(p10.captureNotification, v_u_1, "RobloxCaptureNotificationGui")
		end
	end
end
local v_u_11 = v_u_7.new()
function v_u_7.DismissNotification(p_u_12) -- name: DismissNotification
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	if p_u_12.init then
		if v_u_6() then
			local v13 = v_u_3.update
			local v14 = p_u_12.captureNotificationInstance
			local v15 = v_u_3.createElement
			local v16 = v_u_5
			local v17 = {
				["permissionEvent"] = p_u_12.permissionEvent,
				["forceDismissToast"] = {
					["onDismissed"] = function() -- name: onDismissed
						-- upvalues: (ref) v_u_3, (copy) p_u_12, (ref) v_u_5
						v_u_3.update(p_u_12.captureNotificationInstance, v_u_3.createElement(v_u_5, {
							["permissionEvent"] = nil,
							["forceDismissToast"] = nil,
							["permissionEvent"] = p_u_12.permissionEvent
						}))
					end
				}
			}
			v13(v14, v15(v16, v17))
		end
	else
		v_u_11:Start()
	end
end
function v_u_7.ShowPermissionToast(p18) -- name: ShowPermissionToast
	-- upvalues: (copy) v_u_11
	if not p18.init then
		v_u_11:Start()
	end
	p18.permissionEvent:Fire()
end
function v_u_7.Capture(p19) -- name: Capture
	p19:DismissNotification()
	p19.captureEvent:Fire()
end
return v_u_11