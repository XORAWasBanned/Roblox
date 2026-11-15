-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.LabeledTextBox
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v4 = require(v1.Packages.Foundation)
local v_u_5 = v4.Utility.normalizeFontFace
local v_u_6 = v4.Utility.Flags.FoundationFontFaceMigration
local v_u_7 = require(v1.Packages.Cryo)
local v_u_8 = v3.Core.Style.useStyle
local v9 = script.Parent
local v_u_10 = require(v9.NameTextBox)
local v_u_11 = {
	["textBoxHeight"] = 30,
	["topPadding"] = 0
}
return function(p12) -- name: LabeledTextBox
	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_8, (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_10
	local v13 = v_u_7.Dictionary.join(v_u_11, p12)
	local v14 = v_u_8()
	local v15 = v14.Font
	local v16 = v15.BaseSize
	local v17 = v14.Theme
	local v18 = 19 + v13.textBoxHeight + v13.topPadding
	local v19 = v15.CaptionHeader
	local v20 = v17.TextDefault.Color
	local v21 = v_u_2.createElement
	local v22 = "Frame"
	local v23 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v18),
		["LayoutOrder"] = v13.LayoutOrder
	}
	local v24 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["Padding"] = UDim.new(0, 4)
		}),
		["UIPadding"] = v_u_2.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, v13.topPadding)
		})
	}
	local v25 = v_u_2.createElement
	local v26 = "TextLabel"
	local v27 = {
		["Size"] = nil,
		["Font"] = nil,
		["FontFace"] = nil,
		["Text"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["TextXAlignment"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 15)
	}
	local v28
	if v_u_6 then
		v28 = nil
	else
		v28 = v19.Font
	end
	v27.Font = v28
	local v29
	if v_u_6 then
		v29 = v_u_5(v14.Tokens.Typography.CaptionLarge.Font)
	else
		v29 = nil
	end
	v27.FontFace = v29
	v27.Text = v13.labelText
	v27.TextSize = v16 * v19.RelativeSize
	v27.TextColor3 = v20
	v27.TextXAlignment = Enum.TextXAlignment.Left
	v24.TextboxLabel = v25(v26, v27)
	v24.Textbox = v_u_2.createElement(v_u_10, {
		["Size"] = nil,
		["maxLength"] = nil,
		["onNameUpdated"] = nil,
		["defaultName"] = nil,
		["centerText"] = nil,
		["nameTextBoxRef"] = nil,
		["LayoutOrder"] = 2,
		["invalidInputText"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v13.textBoxHeight),
		["maxLength"] = v13.maxLength,
		["onNameUpdated"] = v13.onTextUpdated,
		["defaultName"] = v13.defaultText,
		["centerText"] = v13.centerText,
		["nameTextBoxRef"] = v13.textBoxRef,
		["invalidInputText"] = v13.invalidInputText
	})
	return v21(v22, v23, v24)
end