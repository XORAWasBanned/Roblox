-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.TextEntryField
local v_u_1 = game:GetService("TextService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
local v_u_4 = require(v2.Packages.Roact)
local v5 = require(v2.Packages.UIBlox)
local v6 = require(v2.Packages.Foundation)
local v_u_7 = require(v2.Workspace.Packages.Style).GetTextSize
local v_u_8 = v6.Utility.normalizeFontFace
local v_u_9 = v6.Utility.Flags.FoundationFontFaceMigration
local v10 = require(v2.Packages.t)
local v11 = script.Parent.Parent
local v_u_12 = require(v11.Resources.Assets)
local v_u_13 = require(v11.Components.PortedComponents.ThemedTextLabel)
local v_u_14 = v5.Core.ImageSet.ImageSetLabel
local v_u_15 = v5.Core.Style.withStyle
local v_u_16 = v5.App.SelectionImage.CursorKind
local v_u_17 = v5.App.SelectionImage.withSelectionCursorProvider
local v_u_18 = v_u_4.PureComponent:extend("TextEntryField")
v_u_18.validateProps = v10.strictInterface({
	["enabled"] = v10.boolean,
	["text"] = v10.string,
	["textChanged"] = v10.callback,
	["maxTextLength"] = v10.integer,
	["autoFocusOnEnabled"] = v10.boolean,
	["PlaceholderText"] = v10.string,
	["LayoutOrder"] = v10.optional(v10.integer),
	["Size"] = v10.UDim2,
	["Position"] = v10.optional(v10.UDim2),
	["textBoxRef"] = v10.optional(v10.table)
})
function v_u_18.init(p19) -- name: init
	-- upvalues: (copy) v_u_4
	p19.textBoxRef = p19.props.textBoxRef or v_u_4.createRef()
	p19.state = {
		["textBoxWidth"] = 100,
		["scrollingFrameHeight"] = 100,
		["canvasPosition"] = 0,
		["cursorPosition"] = 0
	}
end
function v_u_18.calculateNeedsRescroll(p20, p_u_21, p_u_22) -- name: calculateNeedsRescroll
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_1
	p20:setState(function(p23, p24)
		-- upvalues: (copy) p_u_22, (copy) p_u_21, (ref) v_u_9, (ref) v_u_7, (ref) v_u_1
		if p23.cursorPosition == -1 then
			return nil
		end
		local v25 = p24.text:sub(1, p23.cursorPosition - 1)
		local v26 = p_u_22.RelativeSize * p_u_21.Font.BaseSize
		local v27 = Vector2.new(p24.textBoxWidth, 10000)
		local v28
		if v_u_9 then
			v28 = v_u_7(v25, v26, p_u_21.Tokens.Typography.BodyLarge.Font, v27, {
				["addTemporaryPadding"] = false
			})
		else
			v28 = v_u_1:GetTextSize(v25, v26, p_u_22.Font, v27)
		end
		return v28.Y > p23.scrollingFrameHeight + p23.canvasPosition and {
			["canvasPosition"] = v28.Y - p23.scrollingFrameHeight
		} or (v28.Y - v26 < p23.canvasPosition and {
			["canvasPosition"] = v28.Y - v26
		} or nil)
	end)
end
function v_u_18.renderWithSelectionCursor(p_u_29, p_u_30) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_7, (copy) v_u_1, (copy) v_u_4, (copy) v_u_14, (copy) v_u_12, (copy) v_u_8, (copy) v_u_16, (copy) v_u_13
	return v_u_15(function(p_u_31)
		-- upvalues: (copy) p_u_29, (ref) v_u_9, (ref) v_u_7, (ref) v_u_1, (ref) v_u_4, (ref) v_u_14, (ref) v_u_12, (ref) v_u_8, (copy) p_u_30, (ref) v_u_16, (ref) v_u_13
		local v32 = p_u_31.Theme.TextDefault
		local v_u_33 = p_u_31.Font.Body
		local v34 = Vector2.new(p_u_29.state.textBoxWidth, 10000)
		local v35
		if v_u_9 then
			v35 = v_u_7(p_u_29.props.text, v_u_33.RelativeSize * p_u_31.Font.BaseSize, p_u_31.Tokens.Typography.BodyLarge.Font, v34, {
				["addTemporaryPadding"] = false
			})
		else
			v35 = v_u_1:GetTextSize(p_u_29.props.text, v_u_33.RelativeSize * p_u_31.Font.BaseSize, v_u_33.Font, v34)
		end
		local v36 = v_u_4.createElement
		local v37 = v_u_14
		local v38 = {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Position"] = nil,
			["ScaleType"] = nil,
			["Size"] = nil,
			["SliceCenter"] = nil,
			["LayoutOrder"] = nil,
			["Image"] = v_u_12.Images.RoundedRect.Image,
			["ImageColor3"] = p_u_31.Theme.BackgroundMuted.Color,
			["ImageTransparency"] = p_u_31.Theme.BackgroundMuted.Transparency,
			["Position"] = p_u_29.props.Position,
			["ScaleType"] = v_u_12.Images.RoundedRect.ScaleType,
			["Size"] = p_u_29.props.Size,
			["SliceCenter"] = v_u_12.Images.RoundedRect.SliceCenter,
			["LayoutOrder"] = p_u_29.props.LayoutOrder
		}
		local v39 = {}
		local v40 = v_u_4.createElement
		local v41 = "ScrollingFrame"
		local v44 = {
			["Size"] = UDim2.new(1, -24, 1, -14),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 7),
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["CanvasSize"] = UDim2.new(1, -24, 0, v35.Y),
			["ScrollBarThickness"] = 8,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always,
			["CanvasPosition"] = Vector2.new(0, p_u_29.state.canvasPosition),
			["Selectable"] = false,
			[v_u_4.Change.CanvasPosition] = function(p42)
				-- upvalues: (ref) p_u_29
				p_u_29:setState({
					["canvasPosition"] = p42.CanvasPosition.Y
				})
			end,
			[v_u_4.Change.AbsoluteSize] = function(p43)
				-- upvalues: (ref) p_u_29, (copy) p_u_31, (copy) v_u_33
				p_u_29:setState({
					["scrollingFrameHeight"] = p43.AbsoluteSize.Y
				}, function()
					-- upvalues: (ref) p_u_29, (ref) p_u_31, (ref) v_u_33
					p_u_29:calculateNeedsRescroll(p_u_31, v_u_33)
				end)
			end
		}
		local v45 = {}
		local v46 = v_u_4.createElement
		local v47 = "TextBox"
		local v48 = {
			["Size"] = UDim2.new(1, -2, 1, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Text"] = p_u_29.props.text,
			["ClearTextOnFocus"] = false,
			["TextEditable"] = p_u_29.props.enabled,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["TextColor3"] = v32.Color,
			["TextTransparency"] = v32.Transparency
		}
		local v49
		if v_u_9 then
			v49 = nil
		else
			v49 = v_u_33.Font
		end
		v48.Font = v49
		local v50
		if v_u_9 then
			v50 = v_u_8(p_u_31.Tokens.Typography.BodyLarge.Font)
		else
			v50 = nil
		end
		v48.FontFace = v50
		v48.TextSize = v_u_33.RelativeSize * p_u_31.Font.BaseSize
		v48.TextWrapped = true
		v48.MultiLine = true
		v48.SelectionImageObject = p_u_30(v_u_16.InputFields)
		v48[v_u_4.Ref] = p_u_29.textBoxRef
		v48[v_u_4.Change.Text] = function(p_u_51)
			-- upvalues: (ref) p_u_29, (copy) p_u_31, (copy) v_u_33
			local v52, v53 = pcall(function()
				-- upvalues: (copy) p_u_51
				return utf8.len(utf8.nfcnormalize(p_u_51.Text))
			end)
			if v52 and p_u_29.props.maxTextLength >= v53 then
				p_u_29.props.textChanged(p_u_51.Text)
				p_u_29:setState({
					["cursorPosition"] = p_u_51.CursorPosition
				}, function()
					-- upvalues: (ref) p_u_29, (ref) p_u_31, (ref) v_u_33
					p_u_29:calculateNeedsRescroll(p_u_31, v_u_33)
				end)
			else
				p_u_51.Text = p_u_29.props.text
			end
		end
		v48[v_u_4.Change.AbsoluteSize] = function(p54)
			-- upvalues: (ref) p_u_29, (copy) p_u_31, (copy) v_u_33
			p_u_29:setState({
				["textBoxWidth"] = p54.AbsoluteSize.X
			}, function()
				-- upvalues: (ref) p_u_29, (ref) p_u_31, (ref) v_u_33
				p_u_29:calculateNeedsRescroll(p_u_31, v_u_33)
			end)
		end
		v48[v_u_4.Change.CursorPosition] = function(p55)
			-- upvalues: (ref) p_u_29, (copy) p_u_31, (copy) v_u_33
			p_u_29:setState({
				["cursorPosition"] = p55.CursorPosition
			}, function()
				-- upvalues: (ref) p_u_29, (ref) p_u_31, (ref) v_u_33
				p_u_29:calculateNeedsRescroll(p_u_31, v_u_33)
			end)
		end
		local v56 = {
			["PlaceholderText"] = v_u_4.createElement(v_u_13, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "Body",
				["Text"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["TextTransparency"] = 0.5,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Visible"] = nil,
				["Text"] = p_u_29.props.PlaceholderText,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Top,
				["Visible"] = p_u_29.props.text == ""
			})
		}
		v45.TextBox = v46(v47, v48, v56)
		v39.ScrollingFrame = v40(v41, v44, v45)
		return v36(v37, v38, v39)
	end)
end
function v_u_18.render(p_u_57) -- name: render
	-- upvalues: (copy) v_u_17
	return v_u_17(function(p58)
		-- upvalues: (copy) p_u_57
		return p_u_57:renderWithSelectionCursor(p58)
	end)
end
function v_u_18.didUpdate(p59, p60) -- name: didUpdate
	if p59.props.enabled or not p60.enabled then
		if p59.props.enabled and (not p60.enabled and (p59.props.autoFocusOnEnabled and p59.textBoxRef.current)) then
			p59.textBoxRef.current:CaptureFocus()
		end
	elseif p59.textBoxRef.current and p59.textBoxRef.current:IsFocused() then
		p59.textBoxRef.current:ReleaseFocus()
		return
	end
end
return v_u_4.forwardRef(function(p61, p62)
	-- upvalues: (copy) v_u_4, (copy) v_u_18, (copy) v_u_3
	return v_u_4.createElement(v_u_18, v_u_3.Dictionary.join(p61, {
		["textBoxRef"] = p62
	}))
end)