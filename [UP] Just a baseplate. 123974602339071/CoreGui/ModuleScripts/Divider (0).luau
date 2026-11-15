-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.PortedComponents.Divider
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = v2.Cryo
local v6 = v2.t
local v_u_7 = v4.Core.Style.withStyle
local v8 = script.Parent.Parent.Parent
local v_u_9 = require(v8.GlobalConfig)
local v_u_10 = v6.strictInterface({
	["Size"] = v6.optional(v6.UDim2),
	["Position"] = v6.optional(v6.UDim2),
	["AnchorPoint"] = v6.optional(v6.Vector2),
	["LayoutOrder"] = v6.optional(v6.integer),
	["Visible"] = v6.optional(v6.boolean)
})
return function(p_u_11) -- name: Divider
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_7, (copy) v_u_3, (copy) v_u_5
	if v_u_9.propValidation then
		local v12 = v_u_10
		assert(v12(p_u_11))
	end
	return v_u_7(function(p13)
		-- upvalues: (ref) v_u_3, (ref) v_u_5, (copy) p_u_11
		return v_u_3.createElement("Frame", v_u_5.Dictionary.join({
			["Size"] = UDim2.new(1, 0, 0, 1)
		}, p_u_11, {
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = p13.Theme.Divider.Color,
			["BackgroundTransparency"] = p13.Theme.Divider.Transparency
		}))
	end)
end