-- Path: CoreGui.RobloxGui.Modules.SelfieView.Hooks.useTrackerMode
local v1 = game:GetService("CorePackages").Packages
local v_u_2 = require(v1.React)
local v_u_3 = game:GetService("VideoCaptureService")
local v_u_4 = game:GetService("FaceAnimatorService")
local v_u_5 = require(script.Parent.Parent.Utils.FaceChatUtils)
local v6 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_7 = require(v6.Modules.SelfView.Analytics).new()
local v_u_8 = Enum.TrackerMode
local v9 = v_u_5.getTrackerMode()
local v_u_10 = v9 == v_u_8.Video and true or v9 == v_u_8.AudioVideo
local v_u_11 = v9 == v_u_8.Audio and true or v9 == v_u_8.AudioVideo
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_5, (ref) v_u_10, (copy) v_u_7, (ref) v_u_11, (copy) v_u_3, (copy) v_u_4
	local v12, v_u_13 = v_u_2.useState(v_u_8.None)
	local v_u_17 = v_u_2.useCallback(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_10, (ref) v_u_7, (ref) v_u_11, (copy) v_u_13
		local v14 = v_u_5.getTrackerMode()
		local v15 = v14 == v_u_8.Video and true or v14 == v_u_8.AudioVideo
		if v15 ~= v_u_10 then
			v_u_7:reportCamState(v15)
			v_u_10 = v15
		end
		local v16 = v14 == v_u_8.Audio and true or v14 == v_u_8.AudioVideo
		if v16 ~= v_u_11 then
			v_u_7:reportMicState(v16)
			v_u_11 = v16
		end
		v_u_13(v14)
	end)
	v_u_2.useEffect(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_17, (ref) v_u_4
		if not v_u_3 then
			return function() end
		end
		v_u_17()
		local v_u_18 = v_u_3.Started:Connect(v_u_17)
		local v_u_19 = v_u_3.Stopped:Connect(v_u_17)
		local v_u_20 = v_u_3.DevicesChanged:Connect(v_u_17)
		local v_u_21 = v_u_4:GetPropertyChangedSignal("VideoAnimationEnabled"):Connect(v_u_17)
		local v_u_22 = v_u_4:GetPropertyChangedSignal("AudioAnimationEnabled"):Connect(v_u_17)
		return function()
			-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22
			v_u_18:Disconnect()
			v_u_19:Disconnect()
			v_u_20:Disconnect()
			v_u_21:Disconnect()
			v_u_22:Disconnect()
		end
	end, {})
	return v12
end