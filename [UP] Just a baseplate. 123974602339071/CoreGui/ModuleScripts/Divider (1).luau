-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Divider
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v_u_4 = v2.Cryo
local v5 = v2.t
local v_u_6 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v7 = script.Parent.Parent
local v_u_8 = require(v7.GlobalConfig)
local v_u_9 = v5.strictInterface({
	["Size"] = v5.optional(v5.UDim2),
	["Position"] = v5.optional(v5.UDim2),
	["AnchorPoint"] = v5.optional(v5.Vector2),
	["LayoutOrder"] = v5.optional(v5.integer),
	["Visible"] = v5.optional(v5.boolean)
})
return function(p_u_10) -- name: Divider
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	if v_u_8.propValidation then
		local v11 = v_u_9
		assert(v11(p_u_10))
	end
	return v_u_6(function(p12)
		local v13 = {}
		local v14 = {
			["Divider"] = {
				["Color"] = p12.Color.Stroke.Emphasis.Color3,
				["Transparency"] = p12.Color.Stroke.Emphasis.Transparency
			}
		}
		v13.Theme = v14
		return v13
	end, function(p15)
		-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) p_u_10
		return v_u_3.createElement("Frame", v_u_4.Dictionary.join({
			["Size"] = UDim2.new(1, 0, 0, 1)
		}, p_u_10, {
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BackgroundColor3"] = p15.Theme.Divider.Color,
			["BackgroundTransparency"] = p15.Theme.Divider.Transparency
		}))
	end)
end