-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.HardwareSafeAreaInsets
local v1 = game:GetService("Players")
local v2 = script:FindFirstAncestor("MomentsCommon")
local v3 = require(v2.Utils.Signal)
local v_u_4 = v1.LocalPlayer
local v_u_5 = false
local v_u_6 = v3.new()
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = {
	["left"] = 0,
	["top"] = 0,
	["right"] = 0,
	["bottom"] = 0
}
function diffInsets(p10, p11) -- name: diffInsets
	return (p10.top ~= p11.top or (p10.bottom ~= p11.bottom or p10.left ~= p11.left)) and true or p10.right ~= p11.right
end
function getHardwareSafeAreaInsets() -- name: getHardwareSafeAreaInsets
	-- upvalues: (ref) v_u_7, (ref) v_u_8
	local v12 = v_u_7.AbsolutePosition
	local v13 = v_u_8.AbsolutePosition
	local v14 = v13 - v12
	local v15 = v12 + v_u_7.AbsoluteSize - (v13 + v_u_8.AbsoluteSize)
	local v16 = {}
	local v17 = v14.X
	v16.left = math.round(v17)
	local v18 = v14.Y
	v16.top = math.round(v18)
	local v19 = v15.X
	v16.right = math.round(v19)
	local v20 = v15.Y
	v16.bottom = math.round(v20)
	return v16
end
local v_u_21 = nil
function handleSizeChange() -- name: handleSizeChange
	-- upvalues: (ref) v_u_9, (ref) v_u_21, (copy) v_u_6
	local v_u_22 = getHardwareSafeAreaInsets()
	if diffInsets(v_u_22, v_u_9) then
		v_u_9 = v_u_22
		if v_u_21 then
			task.cancel(v_u_21)
		end
		v_u_21 = task.defer(function()
			-- upvalues: (ref) v_u_21, (ref) v_u_6, (copy) v_u_22
			v_u_21 = nil
			v_u_6:fire(v_u_22)
		end)
	end
end
function init() -- name: init
	-- upvalues: (ref) v_u_5, (ref) v_u_7, (copy) v_u_4, (ref) v_u_8
	if not v_u_5 then
		if not v_u_7 then
			v_u_7 = Instance.new("ScreenGui")
			v_u_7.Name = "_FullscreenTestGui"
			v_u_7.Parent = v_u_4.PlayerGui
			v_u_7.ScreenInsets = Enum.ScreenInsets.None
			v_u_7:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
			v_u_7:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
		end
		if not v_u_8 then
			v_u_8 = Instance.new("ScreenGui")
			v_u_8.Name = "_DeviceTestGui"
			v_u_8.Parent = v_u_4.PlayerGui
			v_u_8.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
			v_u_8:GetPropertyChangedSignal("AbsoluteSize"):Connect(handleSizeChange)
			v_u_8:GetPropertyChangedSignal("AbsolutePosition"):Connect(handleSizeChange)
		end
		handleSizeChange()
		v_u_5 = true
	end
end
return {
	["connect"] = function(_, p23) -- name: connect
		-- upvalues: (copy) v_u_6
		init()
		return v_u_6:connect(p23)
	end,
	["deviceInsets"] = function() -- name: deviceInsets
		-- upvalues: (ref) v_u_9
		init()
		return v_u_9
	end,
	["diffInsets"] = diffInsets,
	["fullscreenGui"] = function() -- name: fullscreenGui
		-- upvalues: (ref) v_u_7
		init()
		return v_u_7
	end
}