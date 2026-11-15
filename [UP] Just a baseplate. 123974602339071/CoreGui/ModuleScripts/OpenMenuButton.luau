-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.OpenMenuButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = v2.UIBlox
local v6 = script.Parent.Parent
local v_u_7 = require(v6.Resources.Assets)
local v_u_8 = v5.Core.ImageSet.ImageSetButton
local v_u_9 = require(v6.GlobalConfig)
local v_u_10 = v4.strictInterface({
	["onClick"] = v4.callback
})
return function(p11) -- name: OpenMenuButton
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	if v_u_9.propValidation then
		local v12 = v_u_10
		assert(v12(p11))
	end
	return v_u_3.createElement(v_u_8, {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundTransparency"] = 1,
		["Image"] = v_u_7.Images.RobloxLogo,
		["Position"] = UDim2.new(0, 50, 0.5, 0),
		["Size"] = UDim2.new(0, 32, 0, 32),
		[v_u_3.Event.Activated] = p11.onClick
	})
end