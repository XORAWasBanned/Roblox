-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Components.TextEntryField
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
local v13 = require(v11.Dependencies)
local v_u_14 = require(v13.ThemedTextLabel)
local v_u_15 = require(v11.Components.FillCircle)
local v_u_16 = v5.Core.ImageSet.ImageSetLabel
local v_u_17 = v5.Core.Style.withStyle
local v_u_18 = v5.App.SelectionImage.CursorKind
local v_u_19 = v5.App.SelectionImage.withSelectionCursorProvider
local v_u_20 = v_u_4.PureComponent:extend("TextEntryField")
v_u_20.validateProps = v10.strictInterface({
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
function v_u_20.init(p21) -- name: init
	-- upvalues: (copy) v_u_4
	p21.textBoxRef = p21.props.textBoxRef or v_u_4.createRef()
	p21.state = {
		["textBoxWidth"] = 100,
		["scrollingFrameHeight"] = 100,
		["canvasPosition"] = 0,
		["cursorPosition"] = 0
	}
end
function v_u_20.calculateNeedsRescroll(p22, p_u_23, p_u_24) -- name: calculateNeedsRescroll
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_1
	p22:setState(function(p25, p26)
		-- upvalues: (copy) p_u_24, (copy) p_u_23, (ref) v_u_9, (ref) v_u_7, (ref) v_u_1
		if p25.cursorPosition == -1 then
			return nil
		end
		local v27 = p26.text:sub(1, p25.cursorPosition - 1)
		local v28 = p_u_24.RelativeSize * p_u_23.Font.BaseSize
		local v29 = Vector2.new(p26.textBoxWidth, 10000)
		local v30
		if v_u_9 then
			v30 = v_u_7(v27, v28, p_u_23.Tokens.Typography.BodyLarge.Font, v29, {
				["addTemporaryPadding"] = false
			})
		else
			v30 = v_u_1:GetTextSize(v27, v28, p_u_24.Font, v29)
		end
		return v30.Y > p25.scrollingFrameHeight + p25.canvasPosition and {
			["canvasPosition"] = v30.Y - p25.scrollingFrameHeight
		} or (v30.Y - v28 < p25.canvasPosition and {
			["canvasPosition"] = v30.Y - v28
		} or nil)
	end)
end
function v_u_20.renderWithSelectionCursor(p_u_31, p_u_32) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_17, (copy) v_u_9, (copy) v_u_7, (copy) v_u_1, (copy) v_u_4, (copy) v_u_16, (copy) v_u_12, (copy) v_u_8, (copy) v_u_18, (copy) v_u_14, (copy) v_u_15
	return v_u_17(function(p_u_33)
		-- upvalues: (copy) p_u_31, (ref) v_u_9, (ref) v_u_7, (ref) v_u_1, (ref) v_u_4, (ref) v_u_16, (ref) v_u_12, (ref) v_u_8, (copy) p_u_32, (ref) v_u_18, (ref) v_u_14, (ref) v_u_15
		local v34 = p_u_33.Theme.TextDefault
		local v_u_35 = p_u_33.Font.Body
		local v36 = Vector2.new(p_u_31.state.textBoxWidth, 10000)
		local v37
		if v_u_9 then
			v37 = v_u_7(p_u_31.props.text, v_u_35.RelativeSize * p_u_33.Font.BaseSize, p_u_33.Tokens.Typography.BodyLarge.Font, v36, {
				["addTemporaryPadding"] = false
			})
		else
			v37 = v_u_1:GetTextSize(p_u_31.props.text, v_u_35.RelativeSize * p_u_33.Font.BaseSize, v_u_35.Font, v36)
		end
		local v38 = v_u_4.createElement
		local v39 = v_u_16
		local v40 = {
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
			["ImageColor3"] = p_u_33.Theme.BackgroundMuted.Color,
			["ImageTransparency"] = p_u_33.Theme.BackgroundMuted.Transparency,
			["Position"] = p_u_31.props.Position,
			["ScaleType"] = v_u_12.Images.RoundedRect.ScaleType,
			["Size"] = p_u_31.props.Size,
			["SliceCenter"] = v_u_12.Images.RoundedRect.SliceCenter,
			["LayoutOrder"] = p_u_31.props.LayoutOrder
		}
		local v41 = {}
		local v42 = v_u_4.createElement
		local v43 = "ScrollingFrame"
		local v46 = {
			["Size"] = UDim2.new(1, -24, 1, -14),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 7),
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["CanvasSize"] = UDim2.new(1, -24, 0, v37.Y),
			["ScrollBarThickness"] = 8,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always,
			["CanvasPosition"] = Vector2.new(0, p_u_31.state.canvasPosition),
			["Selectable"] = false,
			[v_u_4.Change.CanvasPosition] = function(p44)
				-- upvalues: (ref) p_u_31
				p_u_31:setState({
					["canvasPosition"] = p44.CanvasPosition.Y
				})
			end,
			[v_u_4.Change.AbsoluteSize] = function(p45)
				-- upvalues: (ref) p_u_31, (copy) p_u_33, (copy) v_u_35
				p_u_31:setState({
					["scrollingFrameHeight"] = p45.AbsoluteSize.Y
				}, function()
					-- upvalues: (ref) p_u_31, (ref) p_u_33, (ref) v_u_35
					p_u_31:calculateNeedsRescroll(p_u_33, v_u_35)
				end)
			end
		}
		local v47 = {}
		local v48 = v_u_4.createElement
		local v49 = "TextBox"
		local v50 = {
			["Size"] = UDim2.new(1, -2, 1, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Text"] = p_u_31.props.text,
			["ClearTextOnFocus"] = false,
			["TextEditable"] = p_u_31.props.enabled,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["TextColor3"] = v34.Color,
			["TextTransparency"] = v34.Transparency
		}
		local v51
		if v_u_9 then
			v51 = nil
		else
			v51 = v_u_35.Font
		end
		v50.Font = v51
		local v52
		if v_u_9 then
			v52 = v_u_8(p_u_33.Tokens.Typography.BodyLarge.Font)
		else
			v52 = nil
		end
		v50.FontFace = v52
		v50.TextSize = v_u_35.RelativeSize * p_u_33.Font.BaseSize
		v50.TextWrapped = true
		v50.MultiLine = true
		v50.SelectionImageObject = p_u_32(v_u_18.InputFields)
		v50[v_u_4.Ref] = p_u_31.textBoxRef
		v50[v_u_4.Change.Text] = function(p_u_53)
			-- upvalues: (ref) p_u_31, (copy) p_u_33, (copy) v_u_35
			local v54, v55 = pcall(function()
				-- upvalues: (copy) p_u_53
				return utf8.len(utf8.nfcnormalize(p_u_53.Text))
			end)
			if v54 and p_u_31.props.maxTextLength >= v55 then
				p_u_31.props.textChanged(p_u_53.Text)
				p_u_31:setState({
					["cursorPosition"] = p_u_53.CursorPosition
				}, function()
					-- upvalues: (ref) p_u_31, (ref) p_u_33, (ref) v_u_35
					p_u_31:calculateNeedsRescroll(p_u_33, v_u_35)
				end)
			else
				p_u_53.Text = p_u_31.props.text
			end
		end
		v50[v_u_4.Change.AbsoluteSize] = function(p56)
			-- upvalues: (ref) p_u_31, (copy) p_u_33, (copy) v_u_35
			p_u_31:setState({
				["textBoxWidth"] = p56.AbsoluteSize.X
			}, function()
				-- upvalues: (ref) p_u_31, (ref) p_u_33, (ref) v_u_35
				p_u_31:calculateNeedsRescroll(p_u_33, v_u_35)
			end)
		end
		v50[v_u_4.Change.CursorPosition] = function(p57)
			-- upvalues: (ref) p_u_31, (copy) p_u_33, (copy) v_u_35
			p_u_31:setState({
				["cursorPosition"] = p57.CursorPosition
			}, function()
				-- upvalues: (ref) p_u_31, (ref) p_u_33, (ref) v_u_35
				p_u_31:calculateNeedsRescroll(p_u_33, v_u_35)
			end)
		end
		local v58 = {
			["PlaceholderText"] = v_u_4.createElement(v_u_14, {
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
				["Text"] = p_u_31.props.PlaceholderText,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Top,
				["Visible"] = p_u_31.props.text == ""
			})
		}
		v47.TextBox = v48(v49, v50, v58)
		v41.ScrollingFrame = v42(v43, v46, v47)
		v41.TextAmmountIndicator = v_u_4.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["ZIndex"] = 1,
			["Position"] = UDim2.new(1, -10, 1, -16),
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Size"] = UDim2.new(0, 20, 0, 20)
		}, { v_u_4.createElement(v_u_15, {
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["fillFraction"] = nil,
				["largerCircleFraction"] = nil,
				["popCircleFraction"] = 1,
				["shakeCircleFraction"] = nil,
				["BackgroundColor"] = nil,
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["fillFraction"] = utf8.len(utf8.nfcnormalize(p_u_31.props.text)) / (p_u_31.props.maxTextLength - 10),
				["largerCircleFraction"] = (p_u_31.props.maxTextLength - 20) / p_u_31.props.maxTextLength,
				["shakeCircleFraction"] = p_u_31.props.maxTextLength / (p_u_31.props.maxTextLength - 10),
				["BackgroundColor"] = p_u_33.Theme.BackgroundMuted.Color
			}) })
		return v38(v39, v40, v41)
	end)
end
function v_u_20.render(p_u_59) -- name: render
	-- upvalues: (copy) v_u_19
	return v_u_19(function(p60)
		-- upvalues: (copy) p_u_59
		return p_u_59:renderWithSelectionCursor(p60)
	end)
end
function v_u_20.didUpdate(p61, p62, _) -- name: didUpdate
	if p61.props.enabled or not p62.enabled then
		if p61.props.enabled and (not p62.enabled and (p61.props.autoFocusOnEnabled and p61.textBoxRef.current)) then
			p61.textBoxRef.current:CaptureFocus()
		end
	elseif p61.textBoxRef.current and p61.textBoxRef.current:IsFocused() then
		p61.textBoxRef.current:ReleaseFocus()
		return
	end
end
return v_u_4.forwardRef(function(p63, p64)
	-- upvalues: (copy) v_u_4, (copy) v_u_20, (copy) v_u_3
	return v_u_4.createElement(v_u_20, v_u_3.Dictionary.join(p63, {
		["textBoxRef"] = p64
	}))
end)