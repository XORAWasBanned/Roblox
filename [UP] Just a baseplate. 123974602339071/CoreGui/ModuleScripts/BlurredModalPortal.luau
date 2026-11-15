-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.BlurredModalPortal
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("VRService")
local v5 = require(v2.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.t
local v8 = script:FindFirstAncestor("InGameMenu")
local v_u_9 = require(v8.Resources.Constants)
local v10 = v_u_6.PureComponent:extend("BlurredModalPortal")
v10.validateProps = v7.strictInterface({
	["Enabled"] = v7.boolean,
	[v_u_6.Children] = v7.optional(v7.table)
})
function v10.render(p11) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_9
	local v12 = v_u_6.createElement
	local v13 = v_u_6.Portal
	local v14 = {
		["target"] = v_u_1
	}
	local v15 = {
		["InGameMenuModalBlur"] = v_u_6.createElement("ScreenGui", {
			["OnTopOfCoreBlur"] = true,
			["Enabled"] = nil,
			["IgnoreGuiInset"] = true,
			["DisplayOrder"] = nil,
			["Enabled"] = p11.props.Enabled,
			["DisplayOrder"] = v_u_9.DisplayOrder.BlurredModalPortal
		}, p11.props[v_u_6.Children])
	}
	return v12(v13, v14, v15)
end
function v10.didUpdate(p16, p17) -- name: didUpdate
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if not v_u_4.VREnabled then
		local v18 = p17.Enabled
		local v19 = p16.props.Enabled
		if v18 ~= v19 then
			v_u_3:SetRobloxGuiFocused(v19)
		end
	end
end
return v10