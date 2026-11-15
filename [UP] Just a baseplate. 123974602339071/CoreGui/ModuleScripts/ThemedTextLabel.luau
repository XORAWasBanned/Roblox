-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.PortedComponents.ThemedTextLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v_u_4 = v2.Cryo
local v5 = require(v1.Packages.UIBlox)
local v6 = require(v1.Packages.Foundation)
local v7 = v2.t
local v_u_8 = v5.Core.Style.withStyle
local v_u_9 = v6.Utility.normalizeFontFace
local v_u_10 = v6.Utility.Flags.FoundationFontFaceMigration
local v11 = script.Parent.Parent.Parent
local v_u_12 = require(v11.GlobalConfig)
local v_u_13 = {
	["Title"] = "HeadingLarge",
	["Header1"] = "HeadingSmall",
	["Header2"] = "TitleLarge",
	["SubHeader1"] = "TitleLarge",
	["Body"] = "BodyLarge",
	["CaptionHeader"] = "CaptionMedium",
	["CaptionSubHeader"] = "CaptionMedium",
	["CaptionBody"] = "BodySmall",
	["Footer"] = "CaptionSmall"
}
local v_u_14 = v7.strictInterface({
	["themeKey"] = v7.optional(v7.string),
	["fontKey"] = v7.optional(v7.string),
	["AnchorPoint"] = v7.optional(v7.Vector2),
	["LayoutOrder"] = v7.optional(v7.integer),
	["Position"] = v7.optional(v7.UDim2),
	["Size"] = v7.optional(v7.UDim2),
	["Text"] = v7.string,
	["TextColor3"] = v7.optional(v7.Color3),
	["TextTransparency"] = v7.optional(v7.numberConstrained(0, 1)),
	["TextWrapped"] = v7.optional(v7.boolean),
	["TextXAlignment"] = v7.optional(v7.enum(Enum.TextXAlignment)),
	["TextYAlignment"] = v7.optional(v7.enum(Enum.TextYAlignment)),
	["TextTruncate"] = v7.optional(v7.enum(Enum.TextTruncate)),
	["Visible"] = v7.optional(v7.boolean),
	["ZIndex"] = v7.optional(v7.integer),
	["AutomaticSize"] = v7.optional(v7.enum(Enum.AutomaticSize)),
	[v_u_3.Children] = v7.optional(v7.table)
})
return function(p_u_15) -- name: ThemedTextLabel
	-- upvalues: (copy) v_u_12, (copy) v_u_14, (copy) v_u_8, (copy) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_13, (copy) v_u_3
	if v_u_12.propValidation then
		local v16 = v_u_14
		assert(v16(p_u_15))
	end
	return v_u_8(function(p17)
		-- upvalues: (copy) p_u_15, (ref) v_u_4, (ref) v_u_10, (ref) v_u_9, (ref) v_u_13, (ref) v_u_3
		local v18 = p17.Theme[p_u_15.themeKey or "TextDefault"]
		local v19 = p17.Font[p_u_15.fontKey or "Body"]
		local v20 = v_u_4.Dictionary.join
		local v21 = {
			["TextColor3"] = v18.Color,
			["TextTransparency"] = v18.Transparency
		}
		local v22 = p_u_15
		local v23 = {
			["fontKey"] = nil,
			["themeKey"] = nil,
			["BackgroundTransparency"] = 1,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = nil,
			["fontKey"] = v_u_4.None,
			["themeKey"] = v_u_4.None
		}
		local v24
		if v_u_10 then
			v24 = v_u_4.None
		else
			v24 = v19.Font
		end
		v23.Font = v24
		local v25
		if v_u_10 then
			v25 = v_u_9(p17.Tokens.Typography[v_u_13[p_u_15.fontKey or "Body"]].Font)
		else
			v25 = nil
		end
		v23.FontFace = v25
		v23.TextSize = v19.RelativeSize * p17.Font.BaseSize
		local v26 = v20(v21, v22, v23)
		return v_u_3.createElement("TextLabel", v26)
	end)
end