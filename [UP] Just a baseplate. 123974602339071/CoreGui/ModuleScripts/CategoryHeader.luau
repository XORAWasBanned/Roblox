-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.CategoryHeader
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.GlobalConfig)
local v_u_7 = require(script.Parent.Parent.ThemedTextLabel)
local v_u_8 = require(v5.Localization.withLocalization)
local v_u_9 = v4.strictInterface({
	["LayoutOrder"] = v4.integer,
	["localizationKey"] = v4.string
})
return function(p10)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	if v_u_6.propValidation then
		local v11 = v_u_9
		assert(v11(p10))
	end
	local v12 = v_u_3.createElement
	local v13 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = p10.LayoutOrder,
		["Size"] = UDim2.new(1, 0, 0, 36)
	}
	local v15 = {
		["Label"] = v_u_8({
			["text"] = p10.localizationKey
		})(function(p14)
			-- upvalues: (ref) v_u_3, (ref) v_u_7
			return v_u_3.createElement(v_u_7, {
				["fontKey"] = "Footer",
				["themeKey"] = "TextEmphasis",
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextTruncate"] = nil,
				["TextXAlignment"] = nil,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["Size"] = UDim2.new(1, -48, 0, 14),
				["Text"] = p14.text,
				["TextTruncate"] = Enum.TextTruncate.AtEnd,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		end)
	}
	return v12("Frame", v13, v15)
end