-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.CoreGuiConnector
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = game:GetService("StarterGui")
local v4 = v2.Modules
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.t)
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.Actions.UpdateCoreGuiEnabled)
local v_u_10 = require(v8.Parent.Common.EventConnection)
local v_u_11 = require(v4.Flags.FFlagMountCoreGuiBackpack)
if require(v8.Flags.FFlagTopBarDeprecateCoreGuiRodux) then
	return nil
end
local v_u_12 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local v13 = v_u_5.PureComponent:extend("CoreGuiConnector")
v13.validateProps = v7.strictInterface({
	["updateCoreGuiEnabled"] = v7.callback
})
function v13.didMount(p14) -- name: didMount
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_3
	local v15 = Enum.CoreGuiType:GetEnumItems()
	for _, v16 in ipairs(v15) do
		if v_u_11 and v16 == Enum.CoreGuiType.Backpack then
			continue
		end
		if v_u_12 and v16 == Enum.CoreGuiType.Health then
			continue
		end
		if v16 == Enum.CoreGuiType.All then
			continue
		end
		p14.props.updateCoreGuiEnabled(v16, v_u_3:GetCoreGuiEnabled(v16))
	end
end
function v13.render(p_u_17) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_10, (copy) v_u_3, (copy) v_u_11
	local v18 = v_u_5.createFragment
	local v21 = {
		["CoreGuiChangedConnection"] = v_u_5.createElement(v_u_10, {
			["event"] = v_u_3.CoreGuiChangedSignal,
			["callback"] = function(p19, p20) -- name: callback
				-- upvalues: (ref) v_u_11, (copy) p_u_17
				if v_u_11 then
					if p19 ~= Enum.CoreGuiType.Backpack then
						p_u_17.props.updateCoreGuiEnabled(p19, p20)
						return
					end
				else
					p_u_17.props.updateCoreGuiEnabled(p19, p20)
				end
			end
		})
	}
	return v18(v21)
end
return v6.UNSTABLE_connect2(nil, function(p_u_22) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_9
	return {
		["updateCoreGuiEnabled"] = function(p23, p24) -- name: updateCoreGuiEnabled
			-- upvalues: (copy) p_u_22, (ref) v_u_9
			return p_u_22(v_u_9(p23, p24))
		end
	}
end)(v13)