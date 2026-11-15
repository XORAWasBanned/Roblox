-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.ViewportUtil
local v1 = script:FindFirstAncestor("ChromeShared")
local v_u_2 = game:GetService("Workspace")
local v_u_3 = game:GetService("UserInputService")
local v4 = require(v1.Service.ChromeUtils).ObservableValue
local v_u_5 = v4.new(Vector2.new(0, 0))
local v_u_6 = v4.new(false)
local v_u_7 = nil
function createViewportInfo(p8) -- name: createViewportInfo
	-- upvalues: (copy) v_u_3
	local v9 = p8.Y > p8.X
	local v10 = v_u_3:GetPlatform()
	local v11 = v10 == Enum.Platform.IOS and true or v10 == Enum.Platform.Android
	local v12 = {
		["size"] = p8,
		["portraitOrientation"] = v9
	}
	if v11 then
		if v9 then
			v9 = p8.X < 360
		end
	else
		v9 = v11
	end
	v12.tinyPortrait = v9
	v12.isMobileDevice = v11
	return v12
end
local v_u_13 = v4.new(createViewportInfo(Vector2.zero))
function updateViewportSize(p14) -- name: updateViewportSize
	-- upvalues: (copy) v_u_5, (copy) v_u_13
	local v15 = Vector2.new(p14.X, p14.Y)
	v_u_5:set(v15)
	v_u_13:set(createViewportInfo(v15))
end
function setCurrentCamera(p_u_16) -- name: setCurrentCamera
	-- upvalues: (ref) v_u_7, (copy) v_u_3, (copy) v_u_6
	if v_u_7 then
		local function v17()
			-- upvalues: (ref) v_u_7
			v_u_7:Disconnect()
		end
		pcall(v17)
		v_u_7 = nil
	end
	if p_u_16 then
		local v18 = v_u_3:GetPlatform()
		v_u_6:set(v18 == Enum.Platform.IOS and true or v18 == Enum.Platform.Android)
		v_u_7 = p_u_16:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: (copy) p_u_16
			updateViewportSize(p_u_16.ViewportSize)
		end)
		updateViewportSize(p_u_16.ViewportSize)
	end
end
v_u_2:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (copy) v_u_2
	setCurrentCamera(v_u_2.CurrentCamera)
end)
setCurrentCamera(v_u_2.CurrentCamera)
return {
	["screenSize"] = v_u_5,
	["mobileDevice"] = v_u_6,
	["viewport"] = v_u_13,
	["isSmallTouchScreen"] = function() -- name: isSmallTouchScreen
		-- upvalues: (copy) v_u_5, (copy) v_u_3
		local v19 = v_u_5:get()
		local v20 = v_u_3.TouchEnabled
		if v20 then
			v20 = v19.Y < 500 and true or v19.X < 700
		end
		return v20
	end
}