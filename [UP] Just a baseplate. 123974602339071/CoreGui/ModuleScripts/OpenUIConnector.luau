-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.OpenUIConnector
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent.Parent
if require(v6.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
	return nil
end
local v_u_7 = require(v6.Actions.SetBackpackOpen)
local v_u_8 = require(v6.Actions.SetEmotesOpen)
local v_u_9 = require(v6.Actions.SetLeaderboardOpen)
local v_u_10 = require(v6.Actions.SetEmotesEnabled)
local v_u_11 = require(v6.Parent.Common.EventConnection)
local v12 = v2:WaitForChild("RobloxGui")
local v_u_13 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_14
if v_u_13 then
	v_u_14 = nil
else
	v_u_14 = require(v12.Modules.BackpackScript)
end
local v_u_15
if v_u_13 then
	v_u_15 = require(v1.Workspace.Packages.System).Features
else
	v_u_15 = nil
end
local v_u_16 = require(v12.Modules.EmotesMenu.EmotesMenuMaster)
local v_u_17 = require(v12.Modules.PlayerList.PlayerListManager)
local v18 = v_u_3.PureComponent:extend("OpenUIConnector")
v18.validateProps = v5.strictInterface({
	["setBackpackOpen"] = v5.callback,
	["setEmotesOpen"] = v5.callback,
	["setLeaderboardOpen"] = v5.callback,
	["setEmotesEnabled"] = v5.callback
})
function v18.didMount(p_u_19) -- name: didMount
	-- upvalues: (copy) v_u_17, (copy) v_u_13, (copy) v_u_15, (copy) v_u_14, (copy) v_u_16
	p_u_19.props.setLeaderboardOpen(v_u_17:GetSetVisible())
	if v_u_13 then
		p_u_19.props.setBackpackOpen(v_u_15.getVisibility(v_u_15.FeatureName.Backpack))
		p_u_19.disposeBackpackListener = v_u_15.onVisibilityChanged(v_u_15.FeatureName.Backpack, function(p20)
			-- upvalues: (copy) p_u_19
			p_u_19.props.setBackpackOpen(p20)
		end)
	else
		p_u_19.props.setBackpackOpen(v_u_14.IsOpen)
	end
	p_u_19.props.setEmotesOpen(v_u_16:isOpen())
	p_u_19.props.setEmotesEnabled(v_u_16.MenuIsVisible)
end
function v18.willUnmount(p21) -- name: willUnmount
	if p21.disposeBackpackListener then
		p21.disposeBackpackListener()
		p21.disposeBackpackListener = nil
	end
end
function v18.render(p_u_22) -- name: render
	-- upvalues: (copy) v_u_17, (copy) v_u_3, (copy) v_u_11, (copy) v_u_13, (copy) v_u_14, (copy) v_u_16
	local v23 = v_u_17:GetSetVisibleChangedEvent()
	local v24 = v_u_3.createFragment
	local v26 = {
		["LeaderboardOpenChangedConnection"] = v_u_3.createElement(v_u_11, {
			["event"] = v23.Event,
			["callback"] = function(p25) -- name: callback
				-- upvalues: (copy) p_u_22
				p_u_22.props.setLeaderboardOpen(p25)
			end
		})
	}
	local v27
	if v_u_13 then
		v27 = nil
	else
		v27 = v_u_3.createElement(v_u_11, {
			["event"] = v_u_14.StateChanged.Event,
			["callback"] = function(p28) -- name: callback
				-- upvalues: (copy) p_u_22
				p_u_22.props.setBackpackOpen(p28)
			end
		})
	end
	v26.BackpackOpenChangedConnection = v27
	v26.EmotesOpenChangedConnection = v_u_3.createElement(v_u_11, {
		["event"] = v_u_16.EmotesMenuToggled.Event,
		["callback"] = function(p29) -- name: callback
			-- upvalues: (copy) p_u_22
			p_u_22.props.setEmotesOpen(p29)
		end
	})
	v26.EmotesEnabledChangedConnection = v_u_3.createElement(v_u_11, {
		["event"] = v_u_16.MenuVisibilityChanged.Event,
		["callback"] = function(p30) -- name: callback
			-- upvalues: (copy) p_u_22
			p_u_22.props.setEmotesEnabled(p30)
		end
	})
	return v24(v26)
end
return v4.UNSTABLE_connect2(nil, function(p_u_31) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	return {
		["setBackpackOpen"] = function(p32) -- name: setBackpackOpen
			-- upvalues: (copy) p_u_31, (ref) v_u_7
			return p_u_31(v_u_7(p32))
		end,
		["setEmotesOpen"] = function(p33) -- name: setEmotesOpen
			-- upvalues: (copy) p_u_31, (ref) v_u_8
			return p_u_31(v_u_8(p33))
		end,
		["setLeaderboardOpen"] = function(p34) -- name: setLeaderboardOpen
			-- upvalues: (copy) p_u_31, (ref) v_u_9
			return p_u_31(v_u_9(p34))
		end,
		["setEmotesEnabled"] = function(p35) -- name: setEmotesEnabled
			-- upvalues: (copy) p_u_31, (ref) v_u_10
			return p_u_31(v_u_10(p35))
		end
	}
end)(v18)