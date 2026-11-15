-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.LayoutProvider
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = v2.Settings.Pages.ShareGame
local v_u_7 = require(v6.Constants)
local v_u_8 = require(v1.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local v_u_9 = require(v6.Actions.SetIsSmallTouchScreen)
local v_u_10 = require(v6.Actions.SetDeviceLayout)
local v11 = v_u_4.Component:extend("LayoutProvider")
function v11.didMount(p_u_12) -- name: didMount
	if workspace.CurrentCamera then
		p_u_12:setObservedCamera(workspace.CurrentCamera)
	end
	p_u_12.cameraChangedListener = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: (copy) p_u_12
		if workspace.CurrentCamera then
			p_u_12:setObservedCamera(workspace.CurrentCamera)
		end
	end)
end
function v11.willUnmount(p13) -- name: willUnmount
	if p13.cameraChangedListener then
		p13.cameraChangedListener:Disconnect()
	end
	if p13.viewportSizeListener then
		p13.viewportSizeListener:Disconnect()
	end
end
function v11.setObservedCamera(p_u_14, p_u_15) -- name: setObservedCamera
	if p_u_14.viewportSizeListener then
		p_u_14.viewportSizeListener:Disconnect()
	end
	p_u_14:checkAllDeviceInfo(p_u_15.ViewportSize)
	p_u_14.viewportSizeListener = p_u_15:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		-- upvalues: (copy) p_u_15, (copy) p_u_14
		local v16 = p_u_15.ViewportSize
		if v16.X > 1 and v16.Y > 1 then
			p_u_14:checkAllDeviceInfo(v16)
		end
	end)
end
function v11.checkDeviceOrientation(p17, p18) -- name: checkDeviceOrientation
	-- upvalues: (copy) v_u_7
	local v19 = p18.X > p18.Y and v_u_7.DeviceOrientation.LANDSCAPE or v_u_7.DeviceOrientation.PORTRAIT
	if p17._deviceOrientation ~= v19 then
		p17._deviceOrientation = v19
		p17.props.setDeviceOrientation(v19)
	end
end
function v11.checkDeviceIsSmallTouchScreen(p20, p21) -- name: checkDeviceIsSmallTouchScreen
	-- upvalues: (copy) v_u_3
	local v22 = v_u_3.TouchEnabled
	if v22 then
		v22 = p21.X < 700 and true or p21.Y < 500
	end
	if p20._isSmallTouchScreen ~= v22 then
		p20._isSmallTouchScreen = v22
		p20.props.setIsSmallTouchScreen(p20._isSmallTouchScreen)
	end
end
function v11.checkDeviceLayout(p23) -- name: checkDeviceLayout
	-- upvalues: (copy) v_u_7, (copy) v_u_3
	local v24
	if p23._isSmallTouchScreen then
		if p23._deviceOrientation == v_u_7.DeviceOrientation.LANDSCAPE then
			v24 = v_u_7.DeviceLayout.PHONE_LANDSCAPE
		else
			v24 = v_u_7.DeviceLayout.PHONE_PORTRAIT
		end
	elseif v_u_3.TouchEnabled then
		if p23._deviceOrientation == v_u_7.DeviceOrientation.LANDSCAPE then
			v24 = v_u_7.DeviceLayout.TABLET_LANDSCAPE
		else
			v24 = v_u_7.DeviceLayout.TABLET_PORTRAIT
		end
	else
		v24 = v_u_7.DeviceLayout.DESKTOP
	end
	if p23._deviceLayout ~= v24 then
		p23._deviceLayout = v24
		p23.props.setDeviceLayout(p23._deviceLayout)
	end
end
function v11.checkAllDeviceInfo(p25, p26) -- name: checkAllDeviceInfo
	p25:checkDeviceOrientation(p26)
	p25:checkDeviceIsSmallTouchScreen(p26)
	p25:checkDeviceLayout()
end
function v11.render(p27) -- name: render
	-- upvalues: (copy) v_u_4
	return v_u_4.oneChild(p27.props[v_u_4.Children])
end
return v5.UNSTABLE_connect2(nil, function(p_u_28)
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	return {
		["setDeviceOrientation"] = function(p29) -- name: setDeviceOrientation
			-- upvalues: (copy) p_u_28, (ref) v_u_8
			return p_u_28(v_u_8(p29))
		end,
		["setIsSmallTouchScreen"] = function(p30) -- name: setIsSmallTouchScreen
			-- upvalues: (copy) p_u_28, (ref) v_u_9
			return p_u_28(v_u_9(p30))
		end,
		["setDeviceLayout"] = function(p31) -- name: setDeviceLayout
			-- upvalues: (copy) p_u_28, (ref) v_u_10
			return p_u_28(v_u_10(p31))
		end
	}
end)(v11)