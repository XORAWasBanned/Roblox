-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.FullscreenTitleBar
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("AppStorageService")
local v6 = require(v2.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v8 = v6.RoactRodux
local v9 = v6.t
local v10 = v6.UIBlox
local v_u_11 = v6.Promise
local v_u_12 = v10.App.Bar.FullscreenTitleBar
local v13 = script.Parent.Parent
local v14 = require(v13.InGameMenuPolicy)
local v_u_15 = require(v13.Thunks.OpenEducationalPopup)
local v_u_16 = require(v13.Actions.StartLeavingGame)
local v_u_17 = require(v13.Utility.ExternalEventConnection)
local v_u_18 = require(v13.Utility.UserLocalStore)
local v_u_19 = require(v13.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local v_u_20 = require(v13.Flags.GetFFlagFullscreenTitleBarInjectGameServices)
local v_u_21 = require(v13.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel)
local v22 = v_u_7.PureComponent:extend("FullscreenTitleBar")
v22.validateProps = v9.strictInterface({
	["titleText"] = v9.optional(v9.string),
	["displayOrder"] = v9.integer,
	["isMenuOpen"] = v9.boolean,
	["isEducationalPopupEnabled"] = v9.boolean,
	["maxDisplayCount"] = v9.integer,
	["openEducationalPopup"] = v9.callback,
	["startLeavingGame"] = v9.callback,
	["userGameSettings"] = v9.optional(v9.union(v9.Instance, v9.table)),
	["guiService"] = v9.optional(v9.union(v9.Instance, v9.table)),
	["appStorageService"] = v9.optional(v9.union(v9.Instance, v9.table))
})
v22.defaultProps = {
	["titleText"] = "Roblox",
	["userGameSettings"] = nil,
	["guiService"] = nil,
	["appStorageService"] = nil,
	["userGameSettings"] = v_u_3,
	["guiService"] = v_u_4,
	["appStorageService"] = v_u_5
}
function v22.init(p_u_23) -- name: init
	-- upvalues: (copy) v_u_20, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_19, (copy) v_u_11, (copy) v_u_18, (copy) v_u_21
	p_u_23.userGameSettings = v_u_20() and p_u_23.props.userGameSettings or v_u_3
	p_u_23.guiService = v_u_20() and p_u_23.props.guiService or v_u_4
	p_u_23.appStorageService = v_u_20() and p_u_23.props.appStorageService or v_u_5
	p_u_23:setState({
		["isTriggered"] = false,
		["fullscreenEnabled"] = nil,
		["fullscreenEnabled"] = p_u_23.userGameSettings:InFullScreen()
	})
	function p_u_23.onFullscreenChanged(p24)
		-- upvalues: (copy) p_u_23
		p_u_23:setState({
			["fullscreenEnabled"] = nil,
			["isTriggered"] = false,
			["fullscreenEnabled"] = p24
		})
	end
	function p_u_23.triggerTitleBar()
		-- upvalues: (ref) v_u_19, (copy) p_u_23, (ref) v_u_11
		local v25 = v_u_19() / 1000
		if v25 > 0 then
			p_u_23.triggerTitleBarPromise = v_u_11.delay(v25):andThenCall(function()
				-- upvalues: (ref) p_u_23
				p_u_23.triggerTitleBarPromise = nil
				if not p_u_23.state.isTriggered then
					p_u_23:setState({
						["isTriggered"] = true
					})
				end
			end)
		elseif not p_u_23.state.isTriggered then
			p_u_23:setState({
				["isTriggered"] = true
			})
		end
	end
	function p_u_23.cancelTriggerTitleBar()
		-- upvalues: (copy) p_u_23
		if p_u_23.triggerTitleBarPromise then
			p_u_23.triggerTitleBarPromise:cancel()
			p_u_23.triggerTitleBarPromise = nil
		end
	end
	function p_u_23.hideTitleBar()
		-- upvalues: (copy) p_u_23
		if p_u_23.state.isTriggered then
			p_u_23:setState({
				["isTriggered"] = false
			})
		end
	end
	function p_u_23.exitFullscreen()
		-- upvalues: (copy) p_u_23
		p_u_23.hideTitleBar()
		p_u_23.guiService:ToggleFullscreen()
	end
	function p_u_23.closeRoblox()
		-- upvalues: (copy) p_u_23, (ref) v_u_18
		p_u_23.hideTitleBar()
		if p_u_23.props.isEducationalPopupEnabled then
			local v26 = v_u_18.new()
			p_u_23.props.openEducationalPopup(p_u_23.guiService, v26, p_u_23.props.maxDisplayCount)
		else
			p_u_23.props.startLeavingGame()
		end
	end
	function p_u_23.onDisappear()
		-- upvalues: (copy) p_u_23, (ref) v_u_21, (ref) v_u_11
		if p_u_23.hideTitleBarPromise then
			if v_u_21() then
				p_u_23.hideTitleBarPromise:cancel()
			else
				p_u_23.hideTitleBarPromise.cancel()
			end
			p_u_23.hideTitleBarPromise = nil
		end
		p_u_23.hideTitleBarPromise = v_u_11.delay(0.5):andThenCall(function()
			-- upvalues: (ref) p_u_23
			p_u_23.hideTitleBarPromise = nil
			p_u_23.hideTitleBar()
		end)
	end
	function p_u_23.mouseReenter()
		-- upvalues: (copy) p_u_23
		if p_u_23.state.isTriggered and p_u_23.hideTitleBarPromise then
			p_u_23.hideTitleBarPromise:cancel()
			p_u_23.hideTitleBarPromise = nil
		end
	end
end
function v22.render(p27) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_17, (copy) v_u_1, (copy) v_u_12
	local v28 = v_u_7.createFragment
	local v29 = {
		["FullscreenChangedEvent"] = v_u_7.createElement(v_u_17, {
			["event"] = p27.userGameSettings.FullscreenChanged,
			["callback"] = p27.onFullscreenChanged
		})
	}
	local v30 = v_u_7.createElement
	local v31 = v_u_7.Portal
	local v32 = {
		["target"] = v_u_1
	}
	local v33 = {}
	local v34 = v_u_7.createElement
	local v35 = {
		["Enabled"] = nil,
		["IgnoreGuiInset"] = true,
		["ZIndexBehavior"] = nil,
		["DisplayOrder"] = nil,
		["Enabled"] = p27.state.fullscreenEnabled,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
		["DisplayOrder"] = p27.props.displayOrder
	}
	local v36 = {
		["TriggerArea"] = v_u_7.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, 1),
			[v_u_7.Event.MouseEnter] = p27.triggerTitleBar,
			[v_u_7.Event.MouseLeave] = p27.cancelTriggerTitleBar
		}),
		["Bar"] = v_u_7.createElement(v_u_12, {
			["title"] = p27.props.titleText,
			["isTriggered"] = p27.state.isTriggered,
			["onDisappear"] = p27.onDisappear,
			["onHover"] = p27.mouseReenter,
			["exitFullscreen"] = p27.exitFullscreen,
			["closeRoblox"] = p27.closeRoblox
		})
	}
	v33.InGameFullscreenTitleBarScreen = v34("ScreenGui", v35, v36)
	v29.FullscreenTitleBar = v30(v31, v32, v33)
	return v28(v29)
end
function v22.didUpdate(p37, p38) -- name: didUpdate
	if not p38.isMenuOpen and p37.props.isMenuOpen then
		p37.hideTitleBar()
	end
end
function v22.willUnmount(p39) -- name: willUnmount
	if p39.hideTitleBarPromise then
		p39.hideTitleBarPromise:cancel()
	end
	if p39.triggerTitleBarPromise then
		p39.triggerTitleBarPromise:cancel()
	end
end
local v41 = v14.connect(function(p40, _)
	return {
		["isEducationalPopupEnabled"] = p40.enableEducationalPopup(),
		["maxDisplayCount"] = p40.educationalPopupMaxDisplayCount()
	}
end)(v22)
return v8.UNSTABLE_connect2(function(p42, _)
	return {
		["isMenuOpen"] = p42.isMenuOpen
	}
end, function(p_u_43)
	-- upvalues: (copy) v_u_15, (copy) v_u_16
	return {
		["openEducationalPopup"] = function(p44, p45, p46) -- name: openEducationalPopup
			-- upvalues: (copy) p_u_43, (ref) v_u_15
			return p_u_43(v_u_15(p44, p45, p46))
		end,
		["startLeavingGame"] = function() -- name: startLeavingGame
			-- upvalues: (copy) p_u_43, (ref) v_u_16
			p_u_43(v_u_16())
		end
	}
end)(v41)