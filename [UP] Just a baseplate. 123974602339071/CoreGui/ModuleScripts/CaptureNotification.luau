-- Path: CoreGui.RobloxGui.Modules.CaptureNotification
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v2.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_5 = require(v2.Packages.Roact)
local v6 = require(v2.Packages.UIBlox)
local v7 = require(v2.Packages.t)
local v_u_8 = v6.App.Button.Enum.ButtonType
local v_u_9 = v6.App.Dialog.Alert.InteractiveAlert
local v_u_10 = v6.App.Dialog.Toast
local v_u_11 = v6.App.ImageSet.Images
local v12 = v1:WaitForChild("RobloxGui")
local v_u_13 = require(v12.Modules.shouldSaveScreenshotToAlbum)
local v_u_14 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_15 = require(v12.Modules.Common.renderWithCoreScriptsStyleProvider)
local v16 = v_u_5.PureComponent:extend("CaptureNotification")
v16.validateProps = v7.strictInterface({
	["forceDismissToast"] = v7.optional(v7.table),
	["permissionEvent"] = v7.optional(v7.instanceOf("BindableEvent"))
})
function v16.init(p_u_17) -- name: init
	-- upvalues: (copy) v_u_11, (copy) v_u_14, (copy) v_u_5, (copy) v_u_3
	p_u_17.state = {
		["screenSize"] = nil,
		["dismissedPermission"] = false,
		["notificationType"] = "None",
		["toastContent"] = nil,
		["screenSize"] = Vector2.new(0, 0)
	}
	function p_u_17.onScreenSizeChanged(p18)
		-- upvalues: (copy) p_u_17
		if p_u_17.state.screenSize ~= p18.AbsoluteSize then
			p_u_17:setState({
				["screenSize"] = p18.AbsoluteSize
			})
		end
	end
	function p_u_17.getToastContent(p19)
		-- upvalues: (ref) v_u_11, (ref) v_u_14, (copy) p_u_17, (ref) v_u_5
		if p19 ~= "Success" and p19 ~= "Fail" then
			return v_u_5.None
		end
		local v20 = p19 == "Success"
		return {
			["iconImage"] = v20 and v_u_11["icons/status/success"] or v_u_11["icons/status/alert"],
			["iconColorStyle"] = not v20 and ({
				["Color"] = nil,
				["Transparency"] = 0,
				["Color"] = Color3.fromRGB(247, 75, 82)
			} or nil) or nil,
			["toastTitle"] = v20 and v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Success.ToastText") or v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Fail.ToastText"),
			["onDismissed"] = function() -- name: onDismissed
				-- upvalues: (ref) p_u_17, (ref) v_u_5
				p_u_17:setState({
					["notificationType"] = "None",
					["toastContent"] = nil,
					["toastContent"] = v_u_5.None
				})
				if p_u_17.props.forceDismissToast and p_u_17.props.forceDismissToast.onDismissed then
					p_u_17.props.forceDismissToast.onDismissed()
				end
			end
		}
	end
	function p_u_17.dismissPermissionAlert()
		-- upvalues: (copy) p_u_17
		p_u_17:setState({
			["dismissedPermission"] = true,
			["notificationType"] = "Fail",
			["toastContent"] = nil,
			["toastContent"] = p_u_17.getToastContent("Fail")
		})
	end
	function p_u_17.screenshotSavedToAlbumCallback(_, p21, p22)
		-- upvalues: (copy) p_u_17
		local v23 = p21 and "Success" or ((p_u_17.state.dismissedPermission or not (p22:find("Domain=ALAssetsLibraryErrorDomain") and p22:find("Data unavailable"))) and "Fail" or "Permission")
		p_u_17:setState({
			["notificationType"] = v23,
			["toastContent"] = p_u_17.getToastContent(v23)
		})
	end
	function p_u_17.permissionEventCallback()
		-- upvalues: (copy) p_u_17
		p_u_17:setState({
			["notificationType"] = "Permission",
			["toastContent"] = nil,
			["toastContent"] = p_u_17.getToastContent("Permission")
		})
	end
	function p_u_17.getPermissionAlertBodyText()
		-- upvalues: (ref) v_u_3, (ref) v_u_14
		if v_u_3:GetPlatform() == Enum.Platform.IOS then
			return v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextIOS")
		elseif v_u_3:GetPlatform() == Enum.Platform.Android then
			return v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextAndroid")
		else
			return v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertText")
		end
	end
end
function v16.renderWithStyle(_, p24) -- name: renderWithStyle
	-- upvalues: (copy) v_u_15
	return v_u_15(p24)
end
function v16.render(p25) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_9, (copy) v_u_14, (copy) v_u_8, (copy) v_u_13, (copy) v_u_4
	local v26 = p25.state.notificationType
	local v27
	if v26 == "Success" then
		v27 = p25.state.toastContent
	else
		v27 = false
	end
	local v28
	if v26 == "Fail" then
		v28 = p25.state.toastContent
	else
		v28 = false
	end
	local v29 = v26 == "Permission"
	local v30 = {}
	local v31 = v_u_5.createElement
	local v32 = "ScreenGui"
	local v33 = {
		["AutoLocalize"] = false,
		["DisplayOrder"] = 9,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["ZIndexBehavior"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v34 = {}
	local v35 = v_u_5.createElement
	local v36 = "Frame"
	local v37 = {
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0),
		[v_u_5.Change.AbsoluteSize] = p25.onScreenSizeChanged
	}
	local v38 = {}
	if v27 then
		v27 = v_u_5.createElement(v_u_10, {
			["duration"] = 3,
			["show"] = nil,
			["toastContent"] = nil,
			["show"] = not p25.props.forceDismissToast,
			["toastContent"] = p25.state.toastContent
		})
	end
	v38.SuccessToast = v27
	if v28 then
		v28 = v_u_5.createElement(v_u_10, {
			["duration"] = 3,
			["show"] = nil,
			["toastContent"] = nil,
			["show"] = not p25.props.forceDismissToast,
			["toastContent"] = p25.state.toastContent
		})
	end
	v38.FailToast = v28
	if v29 then
		local v39 = v_u_5.createElement
		local v40 = {
			["Active"] = true,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.5,
			["Size"] = nil,
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["Size"] = UDim2.new(1, 0, 1, 0)
		}
		local v41 = {}
		local v42 = v_u_5.createElement
		local v43 = v_u_9
		local v44 = {
			["title"] = v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTitle"),
			["bodyText"] = p25.getPermissionAlertBodyText(),
			["buttonStackInfo"] = {
				["buttons"] = {
					{
						["buttonType"] = v_u_8.PrimarySystem,
						["props"] = {
							["onActivated"] = p25.dismissPermissionAlert,
							["text"] = v_u_14:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertButtonText")
						}
					}
				}
			},
			["position"] = UDim2.fromScale(0.5, 0.5),
			["screenSize"] = p25.state.screenSize
		}
		v41.PermissionAlert = v42(v43, v44)
		v29 = v39("Frame", v40, v41)
	end
	v38.PermissionAlertOverlay = v29
	local v45 = v_u_13()
	if v45 then
		v45 = v_u_5.createElement(v_u_4, {
			["event"] = game.ScreenshotSavedToAlbum,
			["callback"] = p25.screenshotSavedToAlbumCallback
		})
	end
	v38.ScreenshotSavedToAlbumConnection = v45
	local v46 = p25.props.permissionEvent
	if v46 then
		v46 = v_u_5.createElement(v_u_4, {
			["event"] = p25.props.permissionEvent.Event,
			["callback"] = p25.permissionEventCallback
		})
	end
	v38.PermissionEventConnection = v46
	v34.Content = v35(v36, v37, v38)
	v30.RobloxCaptureNotificationGui = v31(v32, v33, v34)
	return p25:renderWithStyle(v30)
end
function v16.didUpdate(p47, p48) -- name: didUpdate
	local v49 = p47.props.forceDismissToast
	if p48.forceDismissToast ~= v49 then
		local v50
		if p47.state.notificationType == "Success" or p47.state.notificationType == "Fail" then
			v50 = p47.state.toastContent
		else
			v50 = false
		end
		if not v50 and (v49 and v49.onDismissed) then
			v49.onDismissed()
		end
	end
end
return v16