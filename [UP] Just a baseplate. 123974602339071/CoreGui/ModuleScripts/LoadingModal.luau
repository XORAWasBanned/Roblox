-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.LoadingModal
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(v1.Workspace.Packages.AppBlox).LoadingBar
local v_u_4 = Color3.fromRGB(41, 41, 41)
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0.1,
		["Size"] = UDim2.new(0, 160, 0, 160),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundColor3"] = v_u_4
	}, { v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 4)
		}), v_u_2.createElement(v_u_3) })
end