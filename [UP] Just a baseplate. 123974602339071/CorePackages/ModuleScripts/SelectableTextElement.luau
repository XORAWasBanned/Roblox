-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.SelectableTextElement
local v1 = script:FindFirstAncestor("Components").Parent
local v2 = v1.Parent
local v3 = script:FindFirstAncestor("InlineLayoutElements")
local v_u_4 = require(v2.Dash)
local v5 = require(v2.Foundation)
local v_u_6 = require(v2.React)
local v_u_7 = require(v3.BaseTextElement)
local v_u_8 = require(v1.Utils.getFontFace)
local v_u_9 = v5.View
local v10 = {}
function mapProps(p11) -- name: mapProps
	-- upvalues: (copy) v_u_4
	return v_u_4.omit(p11, { "id", "EngineTags" })
end
local function v_u_26(p12) -- name: TextElementWrapper
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4
	local v13 = v_u_8(p12.fontStyle)
	local v14 = p12.textStyle
	local v15 = typeof(v14) ~= "table" and {} or p12.textStyle
	local v16 = p12.viewTags
	local v17 = typeof(v16) == "string" and {
		[p12.viewTags] = true
	} or (p12.viewTags or {})
	local v18 = v_u_6.createElement
	local v19 = v_u_9
	local v20 = {
		["tag"] = v_u_4.join({
			["size-full-0 auto-y"] = true
		}, v17),
		["LayoutOrder"] = p12.LayoutOrder
	}
	local v21 = {}
	local v22 = v_u_6.createElement
	local v23 = "TextBox"
	local v24 = {
		["Text"] = nil,
		["FontFace"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextTransparency"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["TextEditable"] = false,
		["ZIndex"] = 0,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["TextWrapped"] = false,
		["ClearTextOnFocus"] = false,
		["RichText"] = false,
		["TextXAlignment"] = nil,
		["Text"] = p12.Text,
		["FontFace"] = v13
	}
	local v25 = p12.fontStyle
	if v25 then
		v25 = p12.fontStyle.FontSize
	end
	v24.TextSize = v25
	v24.TextColor3 = v15.Color3
	v24.TextTransparency = v15.Transparency
	v24.Size = UDim2.fromScale(1, 0)
	v24.AutomaticSize = Enum.AutomaticSize.Y
	v24.TextXAlignment = Enum.TextXAlignment.Left
	v21.SelectableText = v22(v23, v24)
	return v18(v19, v20, v21)
end
function v10.new(p27) -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_26, (copy) v_u_4
	return v_u_7.new(v_u_26, v_u_4.omit(p27, { "EngineTags" }), mapProps)
end
return v10