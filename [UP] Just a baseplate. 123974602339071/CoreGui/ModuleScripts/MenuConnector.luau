-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.MenuConnector
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = v2:WaitForChild("RobloxGui")
local v_u_4 = require(v3.Modules.Common.PerfUtils)
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.t)
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Actions.SetMenuOpen)
local v_u_10 = require(v8.Actions.SetRespawnBehaviour)
local v_u_11 = require(v8.Parent.Common.EventConnection)
local v_u_12 = v2:WaitForChild("RobloxGui")
local v_u_13 = require(v_u_12.Modules.isNewInGameMenuEnabled)
local v_u_14 = require(v_u_12.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local v_u_15 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen
local v_u_16 = require(v8.Flags.FFlagTopBarDeprecateRespawnRodux)
local v17 = v_u_5.PureComponent:extend("MenuConnector")
local v18 = v7.strictInterface
local v19 = {}
local v20
if v_u_15 then
	v20 = nil
else
	v20 = v7.callback
end
v19.setMenuOpen = v20
v19.setRespawnBehaviour = v7.callback
v17.validateProps = v18(v19)
function v17.didMount(p21) -- name: didMount
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_15
	if v_u_13() then
		local v22 = require(v_u_12.Modules.InGameMenuInit)
		if not v_u_15 then
			p21.props.setMenuOpen(v22.getOpen())
		end
		local v23, v24 = v22.getRespawnBehaviour()
		p21.props.setRespawnBehaviour(v23, v24)
	else
		local v25 = require(v_u_12.Modules.Settings.SettingsHub)
		if not v_u_15 then
			p21.props.setMenuOpen(v25:GetVisibility())
		end
		local v26, v27 = v25:GetRespawnBehaviour()
		p21.props.setRespawnBehaviour(v26, v27)
	end
end
function v17.render(p_u_28) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_5, (copy) v_u_15, (copy) v_u_11, (copy) v_u_14, (copy) v_u_4
	if v_u_13() then
		local v29 = require(v_u_12.Modules.InGameMenuInit)
		local v30 = v29.getOpenChangedEvent()
		local v31 = v29.getRespawnBehaviourChangedEvent()
		local v32 = v_u_5.createFragment
		local v33 = {}
		local v34
		if v_u_15 then
			v34 = nil
		else
			v34 = v_u_5.createElement(v_u_11, {
				["event"] = v30.Event,
				["callback"] = function(p35) -- name: callback
					-- upvalues: (copy) p_u_28
					p_u_28.props.setMenuOpen(p35)
				end
			})
		end
		v33.MenuOpenChangedConnection = v34
		v33.RespawnBehaviourConnection = v_u_5.createElement(v_u_11, {
			["event"] = v31.Event,
			["callback"] = function(p36, p37) -- name: callback
				-- upvalues: (copy) p_u_28
				p_u_28.props.setRespawnBehaviour(p36, p37)
			end
		})
		return v32(v33)
	else
		local v38 = require(v_u_12.Modules.Settings.SettingsHub)
		local v39 = v38.SettingsShowEvent
		local v40 = v38.RespawnBehaviourChangedEvent
		local v41 = v_u_5.createFragment
		local v42 = {}
		local v43
		if v_u_15 then
			v43 = nil
		else
			v43 = v_u_5.createElement(v_u_11, {
				["event"] = v39.Event,
				["callback"] = function(p44) -- name: callback
					-- upvalues: (ref) v_u_14, (ref) v_u_4, (copy) p_u_28
					if v_u_14() and p44 then
						v_u_4.menuOpenBegin()
					end
					p_u_28.props.setMenuOpen(p44)
				end
			})
		end
		v42.MenuOpenChangedConnection = v43
		v42.RespawnBehaviourConnection = v_u_5.createElement(v_u_11, {
			["event"] = v40.Event,
			["callback"] = function(p45, p46) -- name: callback
				-- upvalues: (copy) p_u_28
				p_u_28.props.setRespawnBehaviour(p45, p46)
			end
		})
		return v41(v42)
	end
end
return v6.UNSTABLE_connect2(nil, function(p_u_47) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_16, (copy) v_u_10
	return {
		["setMenuOpen"] = not v_u_15 and function(p48)
			-- upvalues: (copy) p_u_47, (ref) v_u_9
			return p_u_47(v_u_9(p48))
		end or nil,
		["setRespawnBehaviour"] = not v_u_16 and (function(p49, p50)
			-- upvalues: (copy) p_u_47, (ref) v_u_10
			return p_u_47(v_u_10(p49, p50))
		end or nil) or nil
	}
end)(v17)