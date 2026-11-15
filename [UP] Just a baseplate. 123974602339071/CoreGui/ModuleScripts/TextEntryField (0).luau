-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.TextEntryField
local v_u_1 = game:GetService("TextService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.UIBlox
local v6 = v3.t
local v_u_7 = v3.Cryo
local v_u_8 = require(v2.Workspace.Packages.Style).GetTextSize
local v_u_9 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_10 = v5.App.ImageSet.Images
local v11 = require(v2.Packages.Foundation)
local v_u_12 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_13 = v11.Utility.Flags.FoundationFontFaceMigration
local v_u_14 = v11.Utility.normalizeFontFace
local v_u_15
if v_u_12 then
	v_u_15 = v11.UNSTABLE.withCursorMigration
else
	v_u_15 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_16
if v_u_12 then
	v_u_16 = v11.Enums.CursorType
else
	v_u_16 = v5.App.SelectionImage.CursorKind
end
local v17 = script.Parent.Parent.Parent
local v_u_18 = require(v17.Resources.Assets)
local v_u_19 = require(script.Parent.FillCircle)
local v_u_20 = require(v17.Components.ThemedTextLabel)
local v_u_21 = v5.Core.ImageSet.ImageSetLabel
local v_u_22 = v11.Image
local v_u_23 = v_u_4.PureComponent:extend("TextEntryField")
local v_u_24 = v_u_10["component_assets/circle_17"]
v_u_23.validateProps = v6.strictInterface({
	["enabled"] = v6.boolean,
	["text"] = v6.string,
	["textChanged"] = v6.callback,
	["maxTextLength"] = v6.integer,
	["autoFocusOnEnabled"] = v6.boolean,
	["PlaceholderText"] = v6.string,
	["LayoutOrder"] = v6.optional(v6.integer),
	["Size"] = v6.UDim2,
	["Position"] = v6.optional(v6.UDim2),
	["textBoxRef"] = v6.optional(v6.table)
})
function v_u_23.init(p25) -- name: init
	-- upvalues: (copy) v_u_4
	p25.textBoxRef = p25.props.textBoxRef or v_u_4.createRef()
	p25.state = {
		["textBoxWidth"] = 100,
		["scrollingFrameHeight"] = 100,
		["canvasPosition"] = 0,
		["cursorPosition"] = 0
	}
end
function v_u_23.calculateNeedsRescroll(p26, p_u_27, p_u_28) -- name: calculateNeedsRescroll
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_1
	p26:setState(function(p29, p30)
		-- upvalues: (copy) p_u_28, (copy) p_u_27, (ref) v_u_13, (ref) v_u_8, (ref) v_u_1
		if p29.cursorPosition == -1 then
			return nil
		end
		local v31 = p30.text:sub(1, p29.cursorPosition - 1)
		local v32 = p_u_28.RelativeSize * p_u_27.Font.BaseSize
		local v33 = Vector2.new(p30.textBoxWidth, 10000)
		local v34
		if v_u_13 then
			v34 = v_u_8(v31, v32, p_u_27.Tokens.Typography.BodyLarge.Font, v33, {
				["addTemporaryPadding"] = false
			})
		else
			v34 = v_u_1:GetTextSize(v31, v32, p_u_28.Font, v33)
		end
		return v34.Y > p29.scrollingFrameHeight + p29.canvasPosition and {
			["canvasPosition"] = v34.Y - p29.scrollingFrameHeight
		} or (v34.Y - v32 < p29.canvasPosition and {
			["canvasPosition"] = v34.Y - v32
		} or nil)
	end)
end
function v_u_23.renderWithSelectionCursor(p_u_35, p_u_36) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_8, (copy) v_u_1, (copy) v_u_24, (copy) v_u_4, (copy) v_u_14, (copy) v_u_16, (copy) v_u_20, (copy) v_u_10, (copy) v_u_19, (copy) v_u_12, (copy) v_u_22, (copy) v_u_18, (copy) v_u_21
	return v_u_9(function(p37)
		-- upvalues: (ref) v_u_13
		local v38 = {}
		local v39
		if v_u_13 then
			v39 = p37
		else
			v39 = nil
		end
		v38.Tokens = v39
		v38.Theme = {
			["TextDefault"] = {
				["Color"] = p37.Color.Content.Default.Color3,
				["Transparency"] = p37.Color.Content.Default.Transparency
			},
			["BackgroundMuted"] = {
				["Color"] = p37.Color.Surface.Surface_200.Color3,
				["Transparency"] = p37.Color.Surface.Surface_200.Transparency
			}
		}
		v38.Font = {
			["BaseSize"] = 1,
			["Body"] = nil,
			["Body"] = {
				["Font"] = p37.Typography.BodyLarge.Font,
				["RelativeSize"] = p37.Typography.BodyLarge.FontSize
			}
		}
		return v38
	end, function(p_u_40)
		-- upvalues: (ref) v_u_13, (ref) v_u_8, (copy) p_u_35, (ref) v_u_1, (ref) v_u_24, (ref) v_u_4, (ref) v_u_14, (copy) p_u_36, (ref) v_u_16, (ref) v_u_20, (ref) v_u_10, (ref) v_u_19, (ref) v_u_12, (ref) v_u_22, (ref) v_u_18, (ref) v_u_21
		local v41 = p_u_40.Theme.TextDefault
		local v_u_42 = p_u_40.Font.Body
		local v43
		if v_u_13 then
			v43 = v_u_8(p_u_35.props.text, v_u_42.RelativeSize * p_u_40.Font.BaseSize, p_u_40.Tokens.Typography.BodyLarge.Font, Vector2.new(p_u_35.state.textBoxWidth, 10000), {
				["addTemporaryPadding"] = false
			})
		else
			v43 = v_u_1:GetTextSize(p_u_35.props.text, v_u_42.RelativeSize * p_u_40.Font.BaseSize, v_u_42.Font, Vector2.new(p_u_35.state.textBoxWidth, 10000))
		end
		local v44 = v_u_24.ImageRectSize
		local v45 = v_u_24.ImageRectOffset
		local v46 = v44.X
		local v47 = v46 / 2
		local v48 = {}
		local v49 = v_u_4.createElement
		local v50 = "ScrollingFrame"
		local v53 = {
			["Size"] = UDim2.new(1, -24, 1, -44),
			["AnchorPoint"] = Vector2.new(0.5, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 7),
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["CanvasSize"] = UDim2.new(1, -24, 0, v43.Y),
			["ScrollBarThickness"] = 8,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always,
			["CanvasPosition"] = Vector2.new(0, p_u_35.state.canvasPosition),
			["Selectable"] = false,
			[v_u_4.Change.CanvasPosition] = function(p51)
				-- upvalues: (ref) p_u_35
				p_u_35:setState({
					["canvasPosition"] = p51.CanvasPosition.Y
				})
			end,
			[v_u_4.Change.AbsoluteSize] = function(p52)
				-- upvalues: (ref) p_u_35, (copy) p_u_40, (copy) v_u_42
				p_u_35:setState({
					["scrollingFrameHeight"] = p52.AbsoluteSize.Y
				}, function()
					-- upvalues: (ref) p_u_35, (ref) p_u_40, (ref) v_u_42
					p_u_35:calculateNeedsRescroll(p_u_40, v_u_42)
				end)
			end
		}
		local v54 = {}
		local v55 = v_u_4.createElement
		local v56 = "TextBox"
		local v57 = {
			["Size"] = UDim2.new(1, -2, 1, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Text"] = p_u_35.props.text,
			["ClearTextOnFocus"] = false,
			["TextEditable"] = p_u_35.props.enabled,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["TextColor3"] = v41.Color,
			["TextTransparency"] = v41.Transparency
		}
		local v58
		if v_u_13 then
			v58 = nil
		else
			v58 = v_u_42.Font
		end
		v57.Font = v58
		local v59
		if v_u_13 then
			v59 = v_u_14(p_u_40.Tokens.Typography.BodyLarge.Font)
		else
			v59 = nil
		end
		v57.FontFace = v59
		v57.TextSize = v_u_42.RelativeSize * p_u_40.Font.BaseSize
		v57.TextWrapped = true
		v57.SelectionImageObject = p_u_36(v_u_16.InputFields)
		v57[v_u_4.Ref] = p_u_35.textBoxRef
		v57[v_u_4.Change.Text] = function(p60)
			-- upvalues: (ref) p_u_35, (copy) p_u_40, (copy) v_u_42
			if utf8.len(utf8.nfcnormalize(p60.Text)) > p_u_35.props.maxTextLength then
				local v61 = utf8.offset(p60.Text, p_u_35.props.maxTextLength + 1) - 1
				local v62 = p60.Text
				p60.Text = string.sub(v62, 1, v61)
			else
				p_u_35.props.textChanged(p60.Text)
				p_u_35:setState({
					["cursorPosition"] = p60.CursorPosition
				}, function()
					-- upvalues: (ref) p_u_35, (ref) p_u_40, (ref) v_u_42
					p_u_35:calculateNeedsRescroll(p_u_40, v_u_42)
				end)
			end
		end
		v57[v_u_4.Change.AbsoluteSize] = function(p63)
			-- upvalues: (ref) p_u_35, (copy) p_u_40, (copy) v_u_42
			p_u_35:setState({
				["textBoxWidth"] = p63.AbsoluteSize.X
			}, function()
				-- upvalues: (ref) p_u_35, (ref) p_u_40, (ref) v_u_42
				p_u_35:calculateNeedsRescroll(p_u_40, v_u_42)
			end)
		end
		v57[v_u_4.Change.CursorPosition] = function(p64)
			-- upvalues: (ref) p_u_35, (copy) p_u_40, (copy) v_u_42
			p_u_35:setState({
				["cursorPosition"] = p64.CursorPosition
			}, function()
				-- upvalues: (ref) p_u_35, (ref) p_u_40, (ref) v_u_42
				p_u_35:calculateNeedsRescroll(p_u_40, v_u_42)
			end)
		end
		local v65 = {
			["PlaceholderText"] = v_u_4.createElement(v_u_20, {
				["themeKey"] = "TextDefault",
				["fontKey"] = "Body",
				["Text"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["TextTransparency"] = 0.5,
				["TextXAlignment"] = nil,
				["TextYAlignment"] = nil,
				["Visible"] = nil,
				["Text"] = p_u_35.props.PlaceholderText,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["TextYAlignment"] = Enum.TextYAlignment.Top,
				["Visible"] = p_u_35.props.text == ""
			})
		}
		v54.TextBox = v55(v56, v57, v65)
		v48.ScrollingFrame = v49(v50, v53, v54)
		v48.BottomBar = v_u_4.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = 0,
			["ScaleType"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["SliceCenter"] = nil,
			["SliceScale"] = nil,
			["ImageRectSize"] = nil,
			["ImageRectOffset"] = nil,
			["Image"] = v_u_24.Image,
			["ImageColor3"] = p_u_40.Theme.BackgroundMuted.Color,
			["ScaleType"] = Enum.ScaleType.Slice,
			["AnchorPoint"] = Vector2.new(0, 1),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["Size"] = UDim2.new(1, 0, 0, 32),
			["SliceCenter"] = Rect.new(v47 - 1, 0, v47 + 1, 1),
			["SliceScale"] = 1 / v_u_10.ImagesResolutionScale,
			["ImageRectSize"] = Vector2.new(v46, v47),
			["ImageRectOffset"] = v45 + Vector2.new(0, v47)
		}, {
			["TextAmmountIndicator"] = v_u_4.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Size"] = nil,
				["Position"] = UDim2.new(1, -10, 0.5, 0),
				["AnchorPoint"] = Vector2.new(1, 0.5),
				["Size"] = UDim2.new(0, 20, 0, 20)
			}, { v_u_4.createElement(v_u_19, {
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["fillFraction"] = nil,
					["largerCircleFraction"] = nil,
					["popCircleFraction"] = 1,
					["shakeCircleFraction"] = nil,
					["BackgroundColor"] = nil,
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["fillFraction"] = utf8.len(utf8.nfcnormalize(p_u_35.props.text)) / (p_u_35.props.maxTextLength - 10),
					["largerCircleFraction"] = (p_u_35.props.maxTextLength - 20) / p_u_35.props.maxTextLength,
					["shakeCircleFraction"] = p_u_35.props.maxTextLength / (p_u_35.props.maxTextLength - 10),
					["BackgroundColor"] = p_u_40.Theme.BackgroundMuted.Color
				}) })
		})
		if v_u_12 then
			return v_u_4.createElement(v_u_22, {
				["Image"] = v_u_18.Images.RoundedRectImageKey,
				["imageStyle"] = {
					["Color3"] = p_u_40.Theme.BackgroundMuted.Color,
					["Transparency"] = p_u_40.Theme.BackgroundMuted.Transparency
				},
				["Position"] = p_u_35.props.Position,
				["Size"] = p_u_35.props.Size,
				["LayoutOrder"] = p_u_35.props.LayoutOrder,
				["slice"] = {
					["center"] = Rect.new(8, 8, 9, 9)
				}
			}, v48)
		else
			return v_u_4.createElement(v_u_21, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Position"] = nil,
				["ScaleType"] = nil,
				["Size"] = nil,
				["SliceCenter"] = nil,
				["LayoutOrder"] = nil,
				["Image"] = v_u_18.Images.RoundedRect.Image,
				["ImageColor3"] = p_u_40.Theme.BackgroundMuted.Color,
				["ImageTransparency"] = p_u_40.Theme.BackgroundMuted.Transparency,
				["Position"] = p_u_35.props.Position,
				["ScaleType"] = v_u_18.Images.RoundedRect.ScaleType,
				["Size"] = p_u_35.props.Size,
				["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter,
				["LayoutOrder"] = p_u_35.props.LayoutOrder
			}, v48)
		end
	end)
end
function v_u_23.render(p_u_66) -- name: render
	-- upvalues: (copy) v_u_15
	return v_u_15(function(p67)
		-- upvalues: (copy) p_u_66
		return p_u_66:renderWithSelectionCursor(p67)
	end)
end
function v_u_23.didUpdate(p68, p69, _) -- name: didUpdate
	if p68.props.enabled or not p69.enabled then
		if p68.props.enabled and (not p69.enabled and (p68.props.autoFocusOnEnabled and p68.textBoxRef.current)) then
			p68.textBoxRef.current:CaptureFocus()
		end
	elseif p68.textBoxRef.current and p68.textBoxRef.current:IsFocused() then
		p68.textBoxRef.current:ReleaseFocus()
		return
	end
end
return v_u_4.forwardRef(function(p70, p71)
	-- upvalues: (copy) v_u_4, (copy) v_u_23, (copy) v_u_7
	return v_u_4.createElement(v_u_23, v_u_7.Dictionary.join(p70, {
		["textBoxRef"] = p71
	}))
end)