-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.HeadsetMenu
local v1 = game:GetService("CorePackages")
game:GetService("CoreGui")
local v2 = game:GetService("GuiService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("VRService")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.t)
local v_u_8 = require(v1.Packages.Signals)
local v_u_9 = require(v1.Workspace.Packages.Display)
local v10 = script.Parent.Parent.Parent
local v_u_11 = require(v10.Parent.Common.EventConnection)
local v_u_12 = require(v1.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local v_u_13 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v_u_14 = require(script.DisconnectedDialog)
local v15 = v_u_5.PureComponent:extend("HeadsetMenu")
local v16 = v7.strictInterface
local v17 = {}
local v18
if v_u_13 then
	v18 = nil
else
	v18 = v7.Vector2
end
v17.screenSize = v18
v17.vrService = v7.optional(v7.union(v7.instanceOf("VRService"), v7.table))
v17.guiService = v7.optional(v7.union(v7.instanceOf("GuiService"), v7.table))
v15.validateProps = v16(v17)
v15.defaultProps = {
	["vrService"] = v4,
	["guiService"] = v2
}
function v15.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8
	p_u_19.state = {
		["vrDeviceAvailable"] = false,
		["shouldShowDisconnectDialog"] = false
	}
	function p_u_19.restartApp()
		-- upvalues: (copy) p_u_19, (ref) v_u_12, (ref) v_u_3
		local v20 = p_u_19.props.guiService:GetNotificationTypeList()
		if v_u_12() then
			if game:GetEngineFeature("EnableLuaControlsRestartApp") then
				p_u_19.props.guiService:BroadcastNotification("", v20.RESTART_APP)
			else
				p_u_19.props.guiService:BroadcastNotification("", v20.NATIVE_EXIT)
			end
		else
			v_u_3.Heartbeat:Wait()
			game:Shutdown()
		end
		p_u_19:setState({
			["shouldShowDisconnectDialog"] = false
		})
	end
	if v_u_13 then
		local v_u_21 = v_u_9.GetDisplayStore(false).getViewportSize
		p_u_19.disposeScreenSize = v_u_8.createEffect(function(p22)
			-- upvalues: (copy) p_u_19, (copy) v_u_21
			p_u_19:setState({
				["screenSize"] = v_u_21(p22)
			})
		end)
	end
end
function v15.render(p_u_23) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13
	local v24 = v_u_5.createFragment
	local v25 = {}
	local v26 = v_u_5.createElement
	local v27 = v_u_11
	local v28 = {
		["event"] = p_u_23.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"),
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_23
			p_u_23:setState({
				["vrDeviceAvailable"] = p_u_23.props.vrService.VRDeviceAvailable
			})
		end
	}
	local v29 = {}
	local v30 = v_u_5.createElement
	local v31 = v_u_14
	local v32 = {
		["visible"] = p_u_23.state.shouldShowDisconnectDialog
	}
	local v33
	if v_u_13 then
		v33 = p_u_23.state.screenSize
	else
		v33 = p_u_23.props.screenSize
	end
	v32.screenSize = v33
	v32.onConfirm = p_u_23.restartApp
	v32.guiService = p_u_23.props.guiService
	v29.HeadsetDisconnectedDialog = v30(v31, v32)
	v25.HeadsetConnection = v26(v27, v28, v29)
	return v24(v25)
end
function v15.didMount(p34) -- name: didMount
	p34:setState({
		["vrDeviceAvailable"] = p34.props.vrService.VRDeviceAvailable
	})
end
function v15.willUnmount(p35) -- name: willUnmount
	-- upvalues: (copy) v_u_13
	if v_u_13 then
		p35.disposeScreenSize()
	end
end
function v15.didUpdate(p36, _, p37) -- name: didUpdate
	if p36.state.vrDeviceAvailable ~= p37.vrDeviceAvailable and not p36.state.vrDeviceAvailable then
		p36:setState({
			["shouldShowDisconnectDialog"] = true
		})
	end
end
if not v_u_13 then
	v15 = v6.connect(function(p38)
		return {
			["screenSize"] = p38.displayOptions.screenSize
		}
	end)(v15)
end
return v15