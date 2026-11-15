-- Path: CoreGui.RobloxGui.Modules.VR.NotifierHint3D
local v1 = {}
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("CorePackages")
local v_u_5 = v2:WaitForChild("RobloxGui")
local v_u_6 = require(v4.Workspace.Packages.AppCommonLib).Create("ImageLabel")({
	["Name"] = "NotificationObject",
	["Position"] = nil,
	["Size"] = nil,
	["BackgroundTransparency"] = 1,
	["Image"] = "rbxasset://textures/ui/VR/notifier_glow.png",
	["ImageTransparency"] = 0,
	["BorderSizePixel"] = 0,
	["Position"] = UDim2.new(0.5, -860, 1, -301),
	["Size"] = UDim2.new(0, 1700, 0, 1000)
})
v1.DEFAULT_DURATION = 5
local v_u_14 = (function() -- name: CreateNotificationEffect
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5
	local v7 = {}
	local v_u_8 = nil
	function v7.Init(p_u_9, p10) -- name: Init
		-- upvalues: (ref) v_u_8, (ref) v_u_3, (ref) v_u_6, (ref) v_u_5
		local v_u_11 = tick()
		local v_u_12 = v_u_11 + p10
		if v_u_8 then
			v_u_8:disconnect()
			v_u_8 = nil
		end
		v_u_8 = v_u_3.RenderStepped:connect(function()
			-- upvalues: (copy) v_u_12, (copy) p_u_9, (ref) v_u_6, (ref) v_u_5, (copy) v_u_11
			if v_u_12 <= tick() then
				p_u_9:Cancel()
			else
				v_u_6.Parent = v_u_5
				local v13 = (tick() - v_u_11) * 2.5 + 1.5707963267948966
				v_u_6.ImageTransparency = (math.sin(v13) + 1) / 2 * 0.5 + 0.5
			end
		end)
	end
	function v7.Cancel(_) -- name: Cancel
		-- upvalues: (ref) v_u_8, (ref) v_u_6
		if v_u_8 then
			v_u_8:disconnect()
			v_u_8 = nil
		end
		v_u_6.Parent = nil
	end
	return v7
end)()
function v1.BeginNotification(p15, p16) -- name: BeginNotification
	-- upvalues: (copy) v_u_14
	p15:CancelNotification()
	v_u_14:Init(p16 or p15.DEFAULT_DURATION)
end
function v1.CancelNotification(_) -- name: CancelNotification
	-- upvalues: (copy) v_u_14
	v_u_14:Cancel()
end
return v1