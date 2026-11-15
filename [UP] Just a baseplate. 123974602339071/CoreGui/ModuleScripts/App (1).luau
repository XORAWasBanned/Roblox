-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.App
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v4 = v1.RobloxGui.Modules
local v_u_5 = require(v2.Packages.Roact)
local v6 = require(v2.Packages.RoactRodux)
local v_u_7 = require(v2.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local v8 = v4.Settings.Pages.ShareGame
local v_u_9 = require(v8.Constants)
local v_u_10 = require(v2.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local v_u_11 = require(v2.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local v_u_12 = require(v8.Components.LayoutProvider)
local v_u_13 = require(v8.Components.ShareGameContainer)
local v14 = v_u_5.PureComponent:extend("App")
local function v_u_20(p15) -- name: wrapWithProviders
	-- upvalues: (copy) v_u_5, (copy) v_u_12, (copy) v_u_7, (copy) v_u_10
	local v16 = v_u_5.createElement
	local v17 = v_u_12
	local v18 = {}
	local v19 = {
		["policy"] = { v_u_10 }
	}
	v18.PolicyProvider = v_u_5.createElement(v_u_7.Provider, v19, p15)
	return v16(v17, nil, v18)
end
function v14.render(p21) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_9, (copy) v_u_20
	local v22 = p21.props.analytics
	local v23 = p21.props.pageTarget
	local v24
	if p21.props.isPageOpen then
		v24 = v_u_5.createElement(v_u_13, {
			["analytics"] = v22,
			["zIndex"] = v_u_9.SHARE_GAME_Z_INDEX
		})
	else
		v24 = nil
	end
	return v_u_20({ v_u_5.createElement(v_u_5.Portal, {
			["target"] = v23
		}, {
			["ShareGamePageFrame"] = v24
		}) })
end
function v14.didMount(p25) -- name: didMount
	-- upvalues: (copy) v_u_11, (copy) v_u_3
	p25.eventStream = v_u_11.new(v_u_3)
end
function v14.willUnmount(p26) -- name: willUnmount
	p26.eventStream:releaseRBXEventStream()
end
return v6.UNSTABLE_connect2(function(p27, _)
	return {
		["isPageOpen"] = p27.Page.IsOpen
	}
end)(v14)