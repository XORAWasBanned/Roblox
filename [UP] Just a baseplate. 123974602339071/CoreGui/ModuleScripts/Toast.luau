-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.Toast
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.t)
local v_u_6 = v4.App.Dialog.Toast
local v_u_7 = v4.App.ImageSet.Images
local v8 = v_u_2.PureComponent:extend("Toast")
v8.validateProps = v5.strictInterface({
	["toastTitle"] = v5.optional(v5.string),
	["toastSubtitle"] = v5.optional(v5.string)
})
function v8.render(p9) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_7
	if not p9.props.toastTitle then
		return nil
	end
	local v10 = v_u_2.createElement
	local v11 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["ZIndex"] = 100,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v12 = {}
	local v13 = v_u_2.createElement
	local v14 = v_u_6
	local v15 = {
		["duration"] = 3,
		["toastContent"] = nil,
		["toastContent"] = {
			["iconImage"] = v_u_7["icons/status/success"],
			["toastTitle"] = p9.props.toastTitle,
			["toastSubtitle"] = p9.props.toastSubtitle
		}
	}
	v12.Toast = v13(v14, v15)
	return v10("Frame", v11, v12)
end
return v3.UNSTABLE_connect2(function(p16, _)
	return {
		["toastTitle"] = p16.common.toastTitle,
		["toastSubtitle"] = p16.common.toastSubtitle
	}
end, nil)(v8)