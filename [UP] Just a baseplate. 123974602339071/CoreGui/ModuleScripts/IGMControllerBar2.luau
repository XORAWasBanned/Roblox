-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.IGMControllerBar2
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.UIBlox.App.Bar.ControllerBar
local v5 = script.Parent.Parent
local v_u_6 = v3.Roact
local v7 = v3.t
local v8 = v3.RoactRodux
local v_u_9 = require(v5.Resources.Constants)
local v_u_10 = require(v5.Actions.IncrementControllerBar)
local v_u_11 = require(v5.Actions.DecrementControllerBar)
local v12 = v_u_6.PureComponent:extend("IGMControllerBar2")
v12.validateProps = v7.strictInterface({
	["rightHints"] = v7.table,
	["leftHint"] = v7.table,
	["incrementControllerBar"] = v7.callback,
	["decrementControllerBar"] = v7.callback
})
function v12.init(p13) -- name: init
	p13.props.incrementControllerBar()
end
function v12.willUnmount(p14) -- name: willUnmount
	p14.props.decrementControllerBar()
end
function v12.render(p15) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_9, (copy) v_u_4
	local v16 = v_u_6.createElement
	local v17 = v_u_6.Portal
	local v18 = {
		["target"] = v_u_2
	}
	local v19 = {}
	local v20 = v_u_6.createElement
	local v21 = {
		["DisplayOrder"] = v_u_9.DisplayOrder.ControllerBar
	}
	local v22 = {
		["ControllerBar"] = v_u_6.createElement(v_u_4, {
			["rightHints"] = p15.props.rightHints,
			["leftHint"] = p15.props.leftHint
		})
	}
	v19.IGMControllerBar = v20("ScreenGui", v21, v22)
	return v16(v17, v18, v19)
end
return v8.UNSTABLE_connect2(nil, function(p_u_23)
	-- upvalues: (copy) v_u_10, (copy) v_u_11
	return {
		["incrementControllerBar"] = function() -- name: incrementControllerBar
			-- upvalues: (copy) p_u_23, (ref) v_u_10
			p_u_23(v_u_10())
		end,
		["decrementControllerBar"] = function() -- name: decrementControllerBar
			-- upvalues: (copy) p_u_23, (ref) v_u_11
			p_u_23(v_u_11())
		end
	}
end)(v12)