-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Connection.EnabledNotifier
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = script.Parent.Parent.Parent
if require(v6.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
	return nil
end
local v7 = v2:WaitForChild("RobloxGui")
local v_u_8 = require(v7.Modules.ChatSelector)
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_10
if v_u_9 then
	v_u_10 = nil
else
	v_u_10 = require(v7.Modules.BackpackScript)
end
local v_u_11 = require(v7.Modules.EmotesMenu.EmotesMenuMaster)
local v_u_12 = require(v7.Modules.PlayerList.PlayerListManager)
local v13 = v3.PureComponent:extend("CoreGuiCEnabledNotifieronnector")
v13.validateProps = v5.strictInterface({
	["topBarEnabled"] = v5.boolean
})
function v13.notifyEnabled(p14) -- name: notifyEnabled
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	v_u_12:SetTopBarEnabled(p14.props.topBarEnabled)
	v_u_8:TopbarEnabledChanged(p14.props.topBarEnabled)
	if not v_u_9 and v_u_10 then
		v_u_10:TopbarEnabledChanged(p14.props.topBarEnabled)
	end
	v_u_11:setTopBarEnabled(p14.props.topBarEnabled)
end
function v13.didMount(p15) -- name: didMount
	p15:notifyEnabled()
end
function v13.render(_) -- name: render
	return nil
end
function v13.didUpdate(p16, p17, _) -- name: didUpdate
	if p16.props.topBarEnabled ~= p17.topBarEnabled then
		p16:notifyEnabled()
	end
end
return v4.UNSTABLE_connect2(function(p18) -- name: mapStateToProps
	return {
		["topBarEnabled"] = p18.displayOptions.topbarEnabled
	}
end, nil)(v13)