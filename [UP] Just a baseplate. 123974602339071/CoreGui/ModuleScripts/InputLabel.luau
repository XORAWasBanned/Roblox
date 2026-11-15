-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.InputLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.GlobalConfig)
local v_u_7 = require(v5.Components.ThemedTextLabel)
local v_u_8 = require(v5.Localization.withLocalization)
local v_u_9 = v4.strictInterface({
	["AnchorPoint"] = v4.optional(v4.Vector2),
	["Position"] = v4.optional(v4.UDim2),
	["Size"] = v4.optional(v4.UDim2),
	["localizationKey"] = v4.string,
	["LayoutOrder"] = v4.optional(v4.number)
})
return function(p_u_10)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7
	if v_u_6.propValidation then
		local v11 = v_u_9
		assert(v11(p_u_10))
	end
	return v_u_8({
		["text"] = p_u_10.localizationKey
	})(function(p12)
		-- upvalues: (ref) v_u_3, (ref) v_u_7, (copy) p_u_10
		return v_u_3.createElement(v_u_7, {
			["fontKey"] = "Body",
			["themeKey"] = "TextDefault",
			["LayoutOrder"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextTruncate"] = nil,
			["TextXAlignment"] = nil,
			["LayoutOrder"] = p_u_10.LayoutOrder,
			["AnchorPoint"] = p_u_10.AnchorPoint or Vector2.new(0, 0.5),
			["Position"] = p_u_10.Position or UDim2.new(0, 0, 0.5, 0),
			["Size"] = p_u_10.Size or UDim2.new(1, -72, 0.5, 0),
			["Text"] = p12.text,
			["TextTruncate"] = Enum.TextTruncate.AtEnd,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		})
	end)
end