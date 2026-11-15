-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.AssetDescriptionTextBox
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.RoactGamepad)
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_8 = v6.Focusable
local v9 = require(v1.Packages.UIBlox)
local v10 = require(v1.Packages.Foundation)
local v_u_11 = v10.Utility.normalizeFontFace
local v_u_12 = require(v1.Workspace.Packages.Style).GetTextSize
local v_u_13 = v10.Utility.Flags.FoundationFontFaceMigration
local v_u_14 = v9.Style.withStyle
local v_u_15 = v9.App.SelectionImage.withSelectionCursorProvider
local v_u_16 = v9.App.SelectionImage.CursorKind
local v17 = v9.App.ImageSet.Images
local v_u_18 = v9.Core.ImageSet.ImageSetLabel
local v_u_19 = v17["component_assets/circle_17_stroke_1"]
local v_u_20 = Rect.new(8, 8, 8, 8)
local v21 = v_u_3.PureComponent:extend("AssetDescriptionTextBox")
v21.validateProps = v5.strictInterface({
	["Size"] = v5.optional(v5.UDim2),
	["Position"] = v5.optional(v5.UDim2),
	["onAssetDescriptionUpdated"] = v5.callback,
	["descriptionTextBoxRef"] = v5.optional(v5.table),
	["NextSelectionUp"] = v5.optional(v5.table),
	["assetType"] = v5.optional(v5.enum(Enum.AssetType)),
	["defaultDescription"] = v5.optional(v5.string)
})
function v21.init(p_u_22) -- name: init
	p_u_22:setState({
		["lastValidDescription"] = "",
		["assetDescription"] = nil,
		["descriptionLength"] = 0,
		["scrollingFrameHeight"] = 100,
		["canvasHeight"] = 100,
		["canvasPosition"] = 0,
		["cursorPosition"] = 0,
		["textBoxWidth"] = 100,
		["isDescriptionValid"] = true,
		["assetDescription"] = p_u_22.props.defaultDescription or ""
	})
	p_u_22.wasInitiallyFocused = false
	function p_u_22.tryFocusTextBox()
		-- upvalues: (copy) p_u_22
		if not p_u_22.wasInitiallyFocused then
			local v23 = p_u_22.props.descriptionTextBoxRef:getValue()
			if v23 and v23:IsDescendantOf(game) then
				v23:CaptureFocus()
				p_u_22.wasInitiallyFocused = true
			end
		end
	end
end
function v21.calculateNeedsRescroll(p24, p25, p26) -- name: calculateNeedsRescroll
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_2
	if p24.state.cursorPosition == -1 then
		return
	else
		local v27 = (p24.state.assetDescription or ""):sub(1, p24.state.cursorPosition - 1)
		local v28 = p26.RelativeSize * p25.Font.BaseSize
		local v29 = Vector2.new(p24.state.textBoxWidth, 10000)
		local v30
		if v_u_13 then
			v30 = v_u_12(v27, v28, p25.Tokens.Typography.BodySmall.Font, v29, {
				["addTemporaryPadding"] = false
			})
		else
			v30 = v_u_2:GetTextSize(v27, v28, p26.Font, v29)
		end
		if v30.Y > p24.state.scrollingFrameHeight + p24.state.canvasPosition then
			p24:setState({
				["canvasPosition"] = v30.Y - p24.state.scrollingFrameHeight
			})
		elseif v30.Y - v28 < p24.state.canvasPosition then
			p24:setState({
				["canvasPosition"] = v30.Y - v28
			})
		end
	end
end
function v21.onTextChanged(p31, p32, p33, p34) -- name: onTextChanged
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_2
	local v35 = p32.Text
	local v36 = p31.state.lastValidDescription
	local v37 = utf8.len(utf8.nfcnormalize(v35))
	local v38
	if (v37 == nil and 0 or v37) > 1000 then
		p32.Text = v36
		v38 = v36
	else
		v38 = p32.Text
		v36 = v35
	end
	local v39 = utf8.len(utf8.nfcnormalize(v36))
	local v40 = v39 == nil and 0 or v39
	local v41 = p34.RelativeSize * p33.Font.BaseSize
	local v42 = Vector2.new(p31.state.textBoxWidth, 10000)
	local v43
	if v_u_13 then
		v43 = v_u_12(v36, v41, p33.Tokens.Typography.BodySmall.Font, v42, {
			["addTemporaryPadding"] = false
		})
	else
		v43 = v_u_2:GetTextSize(v36, v41, p34.Font, v42)
	end
	local v44 = {
		["lastValidDescription"] = nil,
		["assetDescription"] = nil,
		["descriptionLength"] = nil,
		["canvasHeight"] = nil,
		["isDescriptionValid"] = true,
		["lastValidDescription"] = v38,
		["assetDescription"] = v36,
		["descriptionLength"] = v40
	}
	local v45 = v43.Y
	v44.canvasHeight = math.max(100, v45)
	p31:setState(v44)
	p31.props.onAssetDescriptionUpdated(v36, true)
end
function v21.renderWithProviders(p_u_46, p_u_47, p48) -- name: renderWithProviders
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_8, (copy) v_u_13, (copy) v_u_11, (copy) v_u_7, (copy) v_u_16
	local v49 = p_u_47.Font
	local v_u_50 = v49.CaptionBody
	local v51 = p_u_47.Theme
	local v52 = v_u_3.createElement
	local v53 = "Frame"
	local v54 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = p_u_46.props.Size,
		["Position"] = p_u_46.props.Position
	}
	local v55 = {}
	local v56 = v_u_3.createElement
	local v57 = v_u_18
	local v58 = {
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["LayoutOrder"] = 1,
		["ScaleType"] = nil,
		["Size"] = nil,
		["SliceCenter"] = nil,
		["Image"] = v_u_19,
		["ImageColor3"] = v51.UIDefault.Color,
		["ImageTransparency"] = v51.UIDefault.Transparency,
		["ScaleType"] = Enum.ScaleType.Slice,
		["Size"] = UDim2.new(1, 0, 1, -15),
		["SliceCenter"] = v_u_20
	}
	local v59 = {}
	local v60 = v_u_3.createElement
	local v61 = "ScrollingFrame"
	local v64 = {
		["Size"] = UDim2.fromScale(1, 1),
		["BackgroundTransparency"] = 1,
		["CanvasPosition"] = Vector2.new(0, p_u_46.state.canvasPosition),
		["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
		["ScrollBarThickness"] = 12,
		["BorderSizePixel"] = 0,
		[v_u_3.Change.CanvasPosition] = function(p62)
			-- upvalues: (copy) p_u_46
			p_u_46:setState({
				["canvasPosition"] = p62.CanvasPosition.Y
			})
		end,
		[v_u_3.Change.AbsoluteSize] = function(p63)
			-- upvalues: (copy) p_u_46, (copy) p_u_47, (copy) v_u_50
			p_u_46:setState({
				["scrollingFrameHeight"] = p63.AbsoluteSize.Y
			})
			p_u_46:calculateNeedsRescroll(p_u_47, v_u_50)
		end
	}
	local v65 = {}
	local v66 = v_u_3.createElement
	local v67 = v_u_8.TextBox
	local v68 = {
		["Text"] = p_u_46.state.assetDescription,
		["BackgroundTransparency"] = 1,
		["ClearTextOnFocus"] = false
	}
	local v69
	if v_u_13 then
		v69 = nil
	else
		v69 = v49.Header2.Font
	end
	v68.Font = v69
	local v70
	if v_u_13 then
		v70 = v_u_11(p_u_47.Tokens.Typography.TitleLarge.Font)
	else
		v70 = nil
	end
	v68.FontFace = v70
	v68.TextSize = v49.BaseSize * v_u_50.RelativeSize
	v68.PlaceholderColor3 = v51.PlaceHolder.Color
	v68.PlaceholderText = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.AssetDescriptionPlaceholder")
	v68.Position = UDim2.fromOffset(6, 0)
	v68.Size = UDim2.new(1, -24, 0, p_u_46.state.canvasHeight)
	v68.MultiLine = true
	v68.TextColor3 = v51.TextDefault.Color
	v68.TextTruncate = Enum.TextTruncate.AtEnd
	v68.TextWrapped = true
	v68.TextXAlignment = Enum.TextXAlignment.Left
	v68.TextYAlignment = Enum.TextYAlignment.Top
	v68.OverlayNativeInput = true
	v68.NextSelectionUp = p_u_46.props.NextSelectionUp
	v68[v_u_3.Change.TextFits] = p_u_46.onTextFitsChanged
	v68.SelectionImageObject = p48(v_u_16.InputFields)
	v68[v_u_3.Ref] = p_u_46.props.descriptionTextBoxRef
	v68[v_u_3.Event.AncestryChanged] = p_u_46.tryFocusTextBox
	v68[v_u_3.Change.Text] = function(p71)
		-- upvalues: (copy) p_u_46, (copy) p_u_47, (copy) v_u_50
		p_u_46:onTextChanged(p71, p_u_47, v_u_50)
	end
	v68[v_u_3.Change.AbsoluteSize] = function(p72)
		-- upvalues: (copy) p_u_46, (copy) p_u_47, (copy) v_u_50
		p_u_46:setState({
			["textBoxWidth"] = p72.AbsoluteSize.X
		})
		p_u_46:calculateNeedsRescroll(p_u_47, v_u_50)
	end
	v68[v_u_3.Change.CursorPosition] = function(p73)
		-- upvalues: (copy) p_u_46, (copy) p_u_47, (copy) v_u_50
		p_u_46:setState({
			["cursorPosition"] = p73.CursorPosition
		})
		p_u_46:calculateNeedsRescroll(p_u_47, v_u_50)
	end
	v65.Textbox = v66(v67, v68)
	v59.ScrollingFrame = v60(v61, v64, v65)
	v55.TextboxContainer = v56(v57, v58, v59)
	local v74
	if p_u_46.state.descriptionLength / 1000 > 0.9 then
		v74 = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 15),
			["AnchorPoint"] = Vector2.new(1, 1),
			["Position"] = UDim2.fromScale(1, 1),
			["Text"] = p_u_46.state.descriptionLength .. "/" .. 1000,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["TextColor3"] = v51.TextDefault.Color
		})
	else
		v74 = nil
	end
	v55.LengthDisplay = v74
	return v52(v53, v54, v55)
end
function v21.render(p_u_75) -- name: render
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	return v_u_14(function(p_u_76)
		-- upvalues: (ref) v_u_15, (copy) p_u_75
		return v_u_15(function(p77)
			-- upvalues: (ref) p_u_75, (copy) p_u_76
			return p_u_75:renderWithProviders(p_u_76, p77)
		end)
	end)
end
function v21.didMount(p78) -- name: didMount
	p78.tryFocusTextBox()
end
return v4.connect(function(p79) -- name: mapStateToProps
	return {
		["assetType"] = p79.promptRequest.promptInfo.assetType
	}
end)(v21)