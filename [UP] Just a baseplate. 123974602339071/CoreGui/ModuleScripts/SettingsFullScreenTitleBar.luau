-- Path: CoreGui.RobloxGui.Modules.Settings.Components.SettingsFullScreenTitleBar
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("CoreGui")
local v5 = v_u_4:WaitForChild("RobloxGui")
local v_u_6 = UserSettings():GetService("UserGameSettings")
local v7 = require(v1.Packages.InGameMenuDependencies)
local v_u_8 = v7.Roact
local v9 = v7.UIBlox
local v_u_10 = v7.Promise
require(v1.Packages.Dash)
local v11 = v7.t
local v12 = v5.Modules.InGameMenu
local v_u_13 = require(v12.Resources.Constants)
local v_u_14 = v9.App.Bar.FullscreenTitleBar
local v_u_15 = require(v12.Utility.ExternalEventConnection)
local v_u_16 = require(v1.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_17 = require(v5.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_18 = require(v12.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local v_u_19 = v_u_8.PureComponent:extend("SettingsFullScreenTitleBar")
v_u_19.validateProps = v11.strictInterface({
	["titleText"] = v11.optional(v11.string),
	["onClose"] = v11.optional(v11.callback),
	["_mockFullScreen"] = v11.optional(v11.boolean)
})
v_u_19.defaultProps = {
	["titleText"] = "Roblox"
}
function v_u_19.init(p_u_20) -- name: init
	p_u_20:setState({
		["isTriggered"] = false
	})
	function p_u_20.show()
		-- upvalues: (copy) p_u_20
		p_u_20:setTriggered(true)
	end
	function p_u_20.hide()
		-- upvalues: (copy) p_u_20
		p_u_20:setTriggered(false)
	end
	function p_u_20.cancel()
		-- upvalues: (copy) p_u_20
		p_u_20:unsetTriggered()
	end
	function p_u_20.onFullscreenChanged()
		-- upvalues: (copy) p_u_20
		p_u_20:unsetTriggered()
		p_u_20:setState({
			["isTriggered"] = false
		})
	end
end
function v_u_19.setTriggered(p_u_21, p_u_22) -- name: setTriggered
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_18
	p_u_21:unsetTriggered()
	if v_u_6:InFullScreen() or p_u_21.props._mockFullScreen then
		p_u_21.triggerPromise = v_u_10.delay(v_u_18() / 1000):andThenCall(function()
			-- upvalues: (copy) p_u_21, (copy) p_u_22
			p_u_21.triggerPromise = nil
			p_u_21:setState({
				["isTriggered"] = p_u_22
			})
		end)
	end
end
function v_u_19.unsetTriggered(p23) -- name: unsetTriggered
	if p23.triggerPromise then
		p23.triggerPromise:cancel()
		p23.triggerPromise = nil
	end
end
function v_u_19.toggleFullscreen(_) -- name: toggleFullscreen
	-- upvalues: (copy) v_u_2
	v_u_2:ToggleFullscreen()
end
function v_u_19.leaveGame(_) -- name: leaveGame
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_16
	v_u_2.SelectedCoreObject = nil
	v_u_3.RenderStepped:Wait()
	v_u_3.RenderStepped:Wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = v_u_16()
end
function v_u_19.render(p24) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_13, (copy) v_u_15, (copy) v_u_6, (copy) v_u_14, (copy) v_u_17
	local v25 = v_u_8.createElement
	local v26 = v_u_8.Portal
	local v27 = {
		["target"] = v_u_4
	}
	local v28 = {}
	local v29 = v_u_8.createElement
	local v30 = {
		["Enabled"] = true,
		["IgnoreGuiInset"] = true,
		["ZIndexBehavior"] = nil,
		["DisplayOrder"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		["DisplayOrder"] = v_u_13.DisplayOrder.FullscreenTitleBar
	}
	local v31 = {
		["FullscreenChangedEvent"] = v_u_8.createElement(v_u_15, {
			["event"] = v_u_6.FullscreenChanged,
			["callback"] = p24.onFullscreenChanged
		}),
		["TriggerArea"] = v_u_8.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, 1),
			[v_u_8.Event.MouseEnter] = p24.show,
			[v_u_8.Event.MouseLeave] = p24.cancel
		}),
		["Bar"] = v_u_8.createElement(v_u_14, {
			["title"] = p24.props.titleText,
			["isTriggered"] = p24.state.isTriggered,
			["onDisappear"] = p24.hide,
			["onHover"] = p24.cancel,
			["exitFullscreen"] = p24.toggleFullscreen,
			["closeRoblox"] = p24.props.onClose or p24.leaveGame
		})
	}
	v28.InGameFullscreenTitleBarScreen = v29("ScreenGui", v30, v31)
	return v_u_17({
		["FullscreenTitleBar"] = v25(v26, v27, v28)
	})
end
function v_u_19.willUnmount(p32) -- name: willUnmount
	p32:unsetTriggered()
end
return {
	["mount"] = function(p33, p34, p35) -- name: mount
		-- upvalues: (copy) v_u_8, (copy) v_u_19
		return v_u_8.mount(v_u_8.createElement(v_u_19, p33 or {}), p34, p35)
	end,
	["update"] = function(p36, p37) -- name: update
		-- upvalues: (copy) v_u_8, (copy) v_u_19
		return v_u_8.update(p36, v_u_8.createElement(v_u_19, p37))
	end,
	["unmount"] = function(p38) -- name: unmount
		-- upvalues: (copy) v_u_8
		return v_u_8.unmount(p38)
	end
}