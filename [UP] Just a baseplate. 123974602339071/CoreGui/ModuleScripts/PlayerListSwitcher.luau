-- Path: CoreGui.RobloxGui.Modules.PlayerList.PlayerListSwitcher
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Workspace.Packages.PlayerList)
local v_u_6 = require(v1.Workspace.Packages.Style).UiModeStyleProvider
local v7 = script.Parent
local v8 = v7.Components.Connection
local v_u_9 = require(v7.Components.Presentation.PlayerListApp)
local v_u_10 = require(v7.Components.PresentationMobile.PlayerListApp)
local v_u_11 = require(v8.LayoutValues).Provider
local v_u_12 = require(v7.CreateLayoutValues)
local v_u_13 = require(v2.Modules.TenFootInterface)
local v_u_14 = require(v7.Actions.SetPlayerListVisibility)
local v_u_15 = require(v7.PlayerListInitialVisibleState)
local v_u_16 = v5.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_17 = v5.Flags.FFlagPlayerListTwoTabsOnLegacy
local v_u_18 = require(v7.Flags.FFlagPlayerListKeepModalHiddenOnRemount)
local v_u_19 = v5.Container.PlatformLeaderboardContainer
local v20 = v_u_3.PureComponent:extend("PlayerListSwitcher")
function v20.didMount(p21) -- name: didMount
	-- upvalues: (copy) v_u_18, (copy) v_u_15
	if v_u_18 and p21.props.isSmallTouchDevice then
		p21.props.setPlayerListVisible(false)
	else
		p21.props.setPlayerListVisible(v_u_15())
	end
end
function v20.wrapWithUiModeStyleProvider(p22, p23) -- name: wrapWithUiModeStyleProvider
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v24 = {}
	local v25 = v_u_3.createElement
	local v26 = v_u_6
	local v27 = {
		["style"] = {
			["themeName"] = p22.props.appStyleForUiModeStyleProvider.themeName,
			["fontName"] = p22.props.appStyleForUiModeStyleProvider.fontName
		}
	}
	v24.ThemeProvider = v25(v26, v27, p23)
	return v24
end
function v20.render(p28) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_12, (copy) v_u_16, (copy) v_u_13, (copy) v_u_10, (copy) v_u_9, (copy) v_u_17, (copy) v_u_19
	local v29 = v_u_3.createElement
	local v30 = v_u_11
	local v31 = {}
	local v32 = v_u_12
	local v33
	if v_u_16 then
		v33 = false
	else
		v33 = v_u_13:IsEnabled()
	end
	v31.layoutValues = v32(v33)
	local v34 = v29(v30, v31, p28:wrapWithUiModeStyleProvider({
		["PlayerListApp"] = p28.props.isSmallTouchDevice and v_u_3.createElement(v_u_10, {
			["setLayerCollectorEnabled"] = p28.props.setLayerCollectorEnabled
		}) or v_u_3.createElement(v_u_9, {
			["setLayerCollectorEnabled"] = p28.props.setLayerCollectorEnabled
		})
	}))
	if v_u_17 then
		return v_u_3.createElement(v_u_19, {}, v34)
	else
		return v34
	end
end
function v20.didUpdate(p35) -- name: didUpdate
	p35.props.setPlayerListVisible(not p35.props.isSmallTouchDevice)
end
return v4.connect(function(p36) -- name: mapStateToProps
	return {
		["isSmallTouchDevice"] = p36.displayOptions.isSmallTouchDevice
	}
end, function(p_u_37) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_14
	return {
		["setPlayerListVisible"] = function(p38) -- name: setPlayerListVisible
			-- upvalues: (copy) p_u_37, (ref) v_u_14
			return p_u_37(v_u_14(p38))
		end
	}
end)(v20)