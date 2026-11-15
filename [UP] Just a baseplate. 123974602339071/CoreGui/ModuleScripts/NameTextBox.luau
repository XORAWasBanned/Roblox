-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.NameTextBox
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.RoactGamepad)
local v5 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_6 = v4.Focusable
local v7 = require(v1.Packages.UIBlox)
local v8 = require(v1.Packages.Foundation)
local v_u_9 = v8.Utility.normalizeFontFace
local v_u_10 = v8.Utility.Flags.FoundationFontFaceMigration
local v_u_11 = v7.Style.withStyle
local v_u_12 = v7.App.SelectionImage.withSelectionCursorProvider
local v_u_13 = v7.App.SelectionImage.CursorKind
local v14 = v_u_2.PureComponent:extend("NameTextBox")
local v_u_15 = game:DefineFastFlag("RemoveNameRegex", false)
v14.validateProps = v3.strictInterface({
	["Size"] = v3.optional(v3.UDim2),
	["Position"] = v3.optional(v3.UDim2),
	["centerText"] = v3.optional(v3.boolean),
	["maxLength"] = v3.optional(v3.number),
	["onNameUpdated"] = v3.callback,
	["LayoutOrder"] = v3.optional(v3.number),
	["nameTextBoxRef"] = v3.optional(v3.table),
	["NextSelectionDown"] = v3.optional(v3.table),
	["defaultName"] = v3.optional(v3.string),
	["invalidInputText"] = v3.optional(v3.string)
})
v14.defaultProps = {
	["maxLength"] = 50,
	["centerText"] = true,
	["invalidInputText"] = nil,
	["invalidInputText"] = v5:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName")
}
function v14.init(p_u_16) -- name: init
	p_u_16:setState({
		["name"] = nil,
		["lastValidName"] = "",
		["isNameValid"] = true,
		["name"] = p_u_16.props.defaultName or ""
	})
	p_u_16.wasInitiallyFocused = false
	function p_u_16.tryFocusTextBox()
		-- upvalues: (copy) p_u_16
		if not p_u_16.wasInitiallyFocused then
			local v17 = p_u_16.props.nameTextBoxRef
			if v17 then
				v17 = p_u_16.props.nameTextBoxRef:getValue()
			end
			if v17 and v17:IsDescendantOf(game) then
				v17:CaptureFocus()
				p_u_16.wasInitiallyFocused = true
			end
		end
	end
	function p_u_16.onTextChanged(p18)
		-- upvalues: (copy) p_u_16
		local v19 = p18.Text
		local v20 = p_u_16.props.maxLength
		local v21 = utf8.len(utf8.nfcnormalize(v19))
		if v21 == nil and true or v20 < v21 then
			local v22 = utf8.offset(v19, v20 + 1) - 1
			v19 = string.sub(v19, 1, v22)
			p18.Text = v19
		end
		local v23 = p_u_16:checkIsNameValid(v19)
		local v24 = p_u_16.state.lastValidName
		if v23 then
			v24 = p18.Text
		end
		p_u_16:setState({
			["lastValidName"] = v24,
			["isNameValid"] = v23,
			["name"] = v19
		})
		p_u_16.props.onNameUpdated(v19, v23)
	end
end
function v14.checkIsNameValid(_, p25) -- name: checkIsNameValid
	-- upvalues: (copy) v_u_15
	if not v_u_15 then
		if not string.match(p25, "[0-9a-zA-Z_\'%s]+$") then
			return false
		end
		if string.sub(p25, 1, 1) == " " then
			return false
		end
	end
	return not string.match(p25, "^%s*$")
end
function v14.renderWithProviders(p26, p27, p28) -- name: renderWithProviders
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_10, (copy) v_u_9, (copy) v_u_13
	local v29 = p27.Font
	local v30 = p27.Theme
	local v31 = v29.Body
	local v32 = not p26.state.isNameValid
	local v33 = v_u_2.createElement
	local v34 = "Frame"
	local v35 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = nil,
		["Size"] = p26.props.Size,
		["Position"] = p26.props.Position,
		["LayoutOrder"] = p26.props.LayoutOrder
	}
	local v36 = {}
	local v37 = v_u_2.createElement
	local v38 = "Frame"
	local v39 = {
		["BackgroundColor3"] = nil,
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["BackgroundColor3"] = v30.BackgroundMuted.Color,
		["Size"] = p26.props.Size
	}
	local v40 = {}
	local v41 = v_u_2.createElement
	local v42 = v_u_6.TextBox
	local v43 = {
		["Text"] = p26.state.name,
		["BackgroundTransparency"] = 1,
		["ClearTextOnFocus"] = false
	}
	local v44
	if v_u_10 then
		v44 = nil
	else
		v44 = v31.Font
	end
	v43.Font = v44
	local v45
	if v_u_10 then
		v45 = v_u_9(p27.Tokens.Typography.BodyLarge.Font)
	else
		v45 = nil
	end
	v43.FontFace = v45
	v43.TextSize = v29.BaseSize * v31.RelativeSize
	v43.PlaceholderColor3 = v30.PlaceHolder.Color
	v43.PlaceholderText = p26.props.defaultName
	v43.Position = UDim2.fromOffset(6, 0)
	v43.Size = UDim2.new(1, -12, 1, 0)
	v43.TextColor3 = v30.TextDefault.Color
	v43.TextTruncate = Enum.TextTruncate.AtEnd
	v43.TextWrapped = true
	v43.TextXAlignment = Enum.TextXAlignment.Left
	local v46
	if p26.props.centerText then
		v46 = nil
	else
		v46 = Enum.TextYAlignment.Top
	end
	v43.TextYAlignment = v46
	v43.OverlayNativeInput = true
	v43[v_u_2.Change.Text] = p26.onTextChanged
	v43.SelectionImageObject = p28(v_u_13.InputFields)
	v43.NextSelectionDown = p26.props.NextSelectionDown
	v43[v_u_2.Ref] = p26.props.nameTextBoxRef
	v43[v_u_2.Event.AncestryChanged] = p26.tryFocusTextBox
	local v47 = {}
	local v48 = v_u_2.createElement
	local v49 = "UIPadding"
	local v50 = {
		["PaddingLeft"] = UDim.new(0, 6),
		["PaddingRight"] = UDim.new(0, 6)
	}
	local v51
	if p26.props.centerText then
		v51 = nil
	else
		v51 = UDim.new(0, 6)
	end
	v50.PaddingTop = v51
	v47.UIPadding = v48(v49, v50)
	v40.Textbox = v41(v42, v43, v47)
	v40.UICorner = v_u_2.createElement("UICorner", {
		["CornerRadius"] = UDim.new(0, 8)
	})
	v40.UIStroke = v_u_2.createElement("UIStroke", {
		["Thickness"] = 0.5,
		["Transparency"] = nil,
		["Color"] = nil,
		["ApplyStrokeMode"] = nil,
		["Transparency"] = v30.Divider.Transparency,
		["Color"] = v30.Divider.Color,
		["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	})
	v36.TextBoxContainer = v37(v38, v39, v40)
	if v32 then
		local v52 = v_u_2.createElement
		local v53 = "TextLabel"
		local v54 = {
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["LayoutOrder"] = 2,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Size"] = nil,
			["TextColor3"] = nil,
			["TextWrapped"] = true,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = 12,
			["Position"] = UDim2.new(0, 0, 1, 0),
			["Text"] = p26.props.invalidInputText,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Size"] = UDim2.new(1, 0, 0, 20),
			["TextColor3"] = v30.Alert.Color
		}
		local v55
		if v_u_10 then
			v55 = nil
		else
			v55 = v29.Body.Font
		end
		v54.Font = v55
		local v56
		if v_u_10 then
			v56 = v_u_9(p27.Tokens.Typography.BodyLarge.Font)
		else
			v56 = nil
		end
		v54.FontFace = v56
		v32 = v52(v53, v54)
	end
	v36.WarningText = v32
	return v33(v34, v35, v36)
end
function v14.render(p_u_57) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	return v_u_11(function(p_u_58)
		-- upvalues: (ref) v_u_12, (copy) p_u_57
		return v_u_12(function(p59)
			-- upvalues: (ref) p_u_57, (copy) p_u_58
			return p_u_57:renderWithProviders(p_u_58, p59)
		end)
	end)
end
function v14.didMount(p60) -- name: didMount
	p60.tryFocusTextBox()
end
return v14