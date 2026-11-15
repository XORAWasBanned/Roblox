-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.HealthConnector
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent.Parent
local v7 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local v_u_8 = require(v6.Actions.SetIsDead)
local v_u_9 = require(v6.Actions.UpdateHealth)
local v_u_10 = require(v6.Parent.Common.EventConnection)
local v_u_11 = v2.LocalPlayer
while not v_u_11 do
	v2:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_11 = v2.LocalPlayer
end
local v12 = v_u_3.PureComponent:extend("HealthConnector")
v12.validateProps = v5.strictInterface({
	["setIsDead"] = v5.callback,
	["updateHealth"] = v5.callback
})
function v12.init(p13) -- name: init
	p13:setState({
		["character"] = nil,
		["humanoid"] = nil
	})
end
function v12.didMount(p14) -- name: didMount
	-- upvalues: (ref) v_u_11
	local v15 = v_u_11.Character
	local v16
	if v15 then
		v16 = v15:FindFirstChildOfClass("Humanoid")
	else
		v16 = nil
	end
	p14:setState({
		["character"] = v15,
		["humanoid"] = v16
	})
end
function v12.render(p_u_17) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (ref) v_u_11
	local v18 = {}
	if p_u_17.state.humanoid then
		v18.HealthChangedConnection = v_u_3.createElement(v_u_10, {
			["event"] = p_u_17.state.humanoid.HealthChanged,
			["callback"] = function(_) -- name: callback
				-- upvalues: (copy) p_u_17
				p_u_17.props.updateHealth(p_u_17.state.humanoid.Health, p_u_17.state.humanoid.MaxHealth)
			end
		})
		v18.HumanoidDiedConnection = v_u_3.createElement(v_u_10, {
			["event"] = p_u_17.state.humanoid.Died,
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_17
				p_u_17.props.setIsDead(true)
			end
		})
	elseif p_u_17.state.character then
		v18.ChildAddedConnection = v_u_3.createElement(v_u_10, {
			["event"] = p_u_17.state.character.ChildAdded,
			["callback"] = function(p19) -- name: callback
				-- upvalues: (copy) p_u_17
				if p19:IsA("Humanoid") then
					p_u_17:setState({
						["humanoid"] = p19
					})
				end
			end
		})
	end
	v18.CharacterAddedConnection = v_u_3.createElement(v_u_10, {
		["event"] = v_u_11.CharacterAdded,
		["callback"] = function(p20) -- name: callback
			-- upvalues: (copy) p_u_17, (ref) v_u_3
			p_u_17:setState({
				["humanoid"] = p20:FindFirstChildOfClass("Humanoid") or v_u_3.None,
				["character"] = p20
			})
			p_u_17.props.setIsDead(false)
		end
	})
	v18.CharacterRemovingConnection = v_u_3.createElement(v_u_10, {
		["event"] = v_u_11.CharacterRemoving,
		["callback"] = function() -- name: callback
			-- upvalues: (copy) p_u_17, (ref) v_u_3
			p_u_17:setState({
				["humanoid"] = v_u_3.None,
				["character"] = v_u_3.None
			})
		end
	})
	return v_u_3.createFragment(v18)
end
function v12.didUpdate(p21, _, p22) -- name: didUpdate
	if p21.state.humanoid == nil then
		p21.props.updateHealth(0, 0)
	elseif p21.state.humanoid ~= p22.humanoid then
		p21.props.setIsDead(false)
		p21.props.updateHealth(p21.state.humanoid.Health, p21.state.humanoid.MaxHealth)
	end
	if p21.state.character and p21.state.character ~= p22.character then
		local v23 = p21.state.character:FindFirstChildWhichIsA("Humanoid")
		if v23 and v23 ~= p21.state.humanoid then
			p21:setState({
				["humanoid"] = v23
			})
		end
	end
end
local function v28(p_u_24) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8, (copy) v_u_9
	return {
		["setIsDead"] = function(p25) -- name: setIsDead
			-- upvalues: (copy) p_u_24, (ref) v_u_8
			return p_u_24(v_u_8(p25))
		end,
		["updateHealth"] = function(p26, p27) -- name: updateHealth
			-- upvalues: (copy) p_u_24, (ref) v_u_9
			return p_u_24(v_u_9(p26, p27))
		end
	}
end
local v29
if v7 then
	v29 = nil
else
	v29 = v4.UNSTABLE_connect2(nil, v28)(v12)
end
return v29