-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.SliderWithInput
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = game:GetService("GuiService")
local v5 = require(v1.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.UIBlox
local v_u_8 = v5.Cryo
local v9 = v5.t
local v_u_10 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v11 = require(v1.Packages.Foundation)
local v_u_12 = v11.Utility.normalizeFontFace
local v13 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_14 = v11.Utility.Flags.FoundationFontFaceMigration
local v_u_15
if v13 then
	v_u_15 = v11.UNSTABLE.withCursorMigration
else
	v_u_15 = v7.App.SelectionImage.withSelectionCursorProvider
end
local v_u_16
if v13 then
	v_u_16 = v11.Enums.CursorType
else
	v_u_16 = v7.App.SelectionImage.CursorKind
end
local v17 = script.Parent.Parent
local v_u_18 = require(v17.Utility.ExternalEventConnection)
local v_u_19 = require(script.Parent.Connection.FocusHandler)
local v_u_20 = require(script.Parent.Slider)
local v_u_21 = require(script.Parent.AssetImage)
local v22 = v_u_6.PureComponent:extend("SliderWithInput")
v22.defaultProps = {
	["width"] = UDim.new(1, 0)
}
v22.validateProps = v9.intersection(v9.strictInterface({
	["min"] = v9.number,
	["max"] = v9.number,
	["stepInterval"] = v9.numberPositive,
	["keyboardInputStepInterval"] = v9.optional(v9.numberPositive),
	["value"] = v9.number,
	["valueChanged"] = v9.callback,
	["disabled"] = v9.optional(v9.boolean),
	["width"] = v9.optional(v9.UDim),
	["AnchorPoint"] = v9.optional(v9.Vector2),
	["LayoutOrder"] = v9.optional(v9.integer),
	["Position"] = v9.optional(v9.UDim2),
	["canCaptureFocus"] = v9.optional(v9.boolean),
	["isMenuOpen"] = v9.optional(v9.boolean),
	["sliderDotRef"] = v9.optional(v9.table),
	["onSelectionLost"] = v9.callback,
	["onSelectionGained"] = v9.callback
}), function(p23)
	if p23.min > p23.max then
		return false, "min must be less than or equal to max"
	elseif p23.value > p23.max or p23.value < p23.min then
		return false, "value must be within min and max"
	else
		return true
	end
end)
function v22.init(p24) -- name: init
	-- upvalues: (copy) v_u_6
	p24.textBoxRef = v_u_6.createRef()
	p24.state = {
		["textEntryMode"] = false
	}
end
function v22.renderFocusHandler(p_u_25) -- name: renderFocusHandler
	-- upvalues: (copy) v_u_6, (copy) v_u_19, (copy) v_u_4, (copy) v_u_3
	local v26 = v_u_6.createElement
	local v27 = v_u_19
	local v28 = {}
	local v29
	if p_u_25.props.canCaptureFocus then
		v29 = p_u_25.state.textEntryMode or false
	else
		v29 = false
	end
	v28.isFocused = v29
	function v28.didFocus() -- name: didFocus
		-- upvalues: (ref) v_u_4, (copy) p_u_25, (ref) v_u_3
		v_u_4.CoreGuiNavigationEnabled = false
		local v_u_30 = p_u_25.props.value
		v_u_3:BindCoreAction("LeaveTextEntryMode", function(_, p31)
			-- upvalues: (ref) p_u_25, (copy) v_u_30
			if p31 ~= Enum.UserInputState.End then
				return Enum.ContextActionResult.Pass
			end
			p_u_25:setState({
				["textEntryMode"] = false
			})
			local v32 = p_u_25.textBoxRef.current
			v32.Text = v_u_30
			v32:ReleaseFocus()
			return Enum.ContextActionResult.Sink
		end, false, Enum.KeyCode.ButtonB)
	end
	function v28.didBlur() -- name: didBlur
		-- upvalues: (ref) v_u_4, (ref) v_u_3
		v_u_4.CoreGuiNavigationEnabled = true
		v_u_3:UnbindCoreAction("LeaveTextEntryMode")
	end
	return v26(v27, v28) or nil
end
function v22.renderWithSelectionCursor(p_u_33, p_u_34) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_20, (copy) v_u_10, (copy) v_u_14, (copy) v_u_21, (copy) v_u_12, (copy) v_u_16, (copy) v_u_18, (copy) v_u_2
	local v_u_35 = p_u_33.props
	local v36 = v_u_8.Dictionary.join(v_u_35, {
		["width"] = UDim.new(1, -80),
		["LayoutOrder"] = v_u_8.None,
		["Position"] = v_u_8.None,
		["AnchorPoint"] = v_u_8.None,
		["keyboardInputStepInterval"] = v_u_8.None,
		["NextSelectionRight"] = p_u_33.textBoxRef
	})
	local v37 = v_u_6.createElement
	local v38 = "Frame"
	local v39 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(v_u_35.width.Scale, v_u_35.width.Offset, 0, 36),
		["Position"] = v_u_35.Position,
		["LayoutOrder"] = v_u_35.LayoutOrder
	}
	local v66 = {
		["Slider"] = v_u_6.createElement(v_u_20, v36),
		["TextContainer"] = v_u_10(function(p40)
			-- upvalues: (ref) v_u_14
			local v41 = {}
			local v42
			if v_u_14 then
				v42 = p40
			else
				v42 = nil
			end
			v41.Tokens = v42
			v41.Theme = {
				["TextMuted"] = {
					["Color"] = p40.Color.Content.Muted.Color3,
					["Transparency"] = p40.Color.Content.Muted.Transparency
				},
				["TextDefault"] = {
					["Color"] = p40.Color.Content.Default.Color3,
					["Transparency"] = p40.Color.Content.Default.Transparency
				},
				["BackgroundUIContrast"] = {
					["Color"] = p40.Color.OverMedia.OverMedia_0.Color3,
					["Transparency"] = p40.Color.OverMedia.OverMedia_0.Transparency
				}
			}
			v41.Font = {
				["BaseSize"] = 1,
				["Body"] = nil,
				["Body"] = {
					["Font"] = p40.Typography.BodyLarge.Font,
					["RelativeSize"] = p40.Typography.BodyLarge.FontSize,
					["RelativeMinSize"] = p40.Typography.BodyLarge.FontSize
				}
			}
			return v41
		end, function(p43)
			-- upvalues: (copy) v_u_35, (ref) v_u_6, (ref) v_u_21, (copy) p_u_33, (ref) v_u_14, (ref) v_u_12, (copy) p_u_34, (ref) v_u_16
			local v44 = v_u_35.disabled and p43.Theme.TextMuted or p43.Theme.TextDefault
			local v45 = v_u_6.createElement
			local v46 = v_u_21.Label
			local v47 = {
				["BackgroundTransparency"] = 1,
				["imageKey"] = "RoundedRect",
				["ImageTransparency"] = nil,
				["ImageColor3"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["ImageTransparency"] = p43.Theme.BackgroundUIContrast.Transparency,
				["ImageColor3"] = p43.Theme.BackgroundUIContrast.Color,
				["Size"] = UDim2.new(0, 64, 0, 36),
				["Position"] = UDim2.new(1, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(1, 0.5)
			}
			local v48 = {
				["FocusHandler"] = p_u_33:renderFocusHandler()
			}
			local v49 = v_u_6.createElement
			local v50 = "TextBox"
			local v51 = {
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.new(0.5, 0, 0.5, 0)
			}
			local v52
			if v_u_14 then
				v52 = nil
			else
				v52 = p43.Font.Body.Font
			end
			v51.Font = v52
			local v53
			if v_u_14 then
				v53 = v_u_12(p43.Tokens.Typography.BodyLarge.Font)
			else
				v53 = nil
			end
			v51.FontFace = v53
			v51.TextScaled = true
			v51.ClearTextOnFocus = false
			v51.TextEditable = not v_u_35.disabled
			v51.TextColor3 = v44.Color
			v51.TextTransparency = v44.Transparency
			local v54 = v_u_35.value
			v51.Text = tostring(v54)
			v51.NextSelectionLeft = p_u_33.props.sliderDotRef
			v51.SelectionImageObject = p_u_34(v_u_16.InputFields)
			v51[v_u_6.Event.SelectionLost] = p_u_33.props.onSelectionLost
			v51[v_u_6.Event.SelectionGained] = p_u_33.props.onSelectionGained
			v51[v_u_6.Ref] = p_u_33.textBoxRef
			v51[v_u_6.Event.Focused] = v_u_35.disabled and function(p55)
				p55:ReleaseFocus(false)
			end or function()
				-- upvalues: (ref) p_u_33
				p_u_33:setState({
					["textEntryMode"] = true
				})
			end
			v51[v_u_6.Event.FocusLost] = function(p56, _)
				-- upvalues: (ref) p_u_33, (ref) v_u_35
				p_u_33:setState({
					["textEntryMode"] = false
				})
				local v57 = p56.Text
				local v58 = tonumber(v57)
				if v58 ~= v_u_35.value then
					if v58 == nil then
						local v59 = v_u_35.value
						p56.Text = tostring(v59)
						return
					end
					local v60 = v_u_35.stepInterval
					if v_u_35.keyboardInputStepInterval then
						v60 = v_u_35.keyboardInputStepInterval
					end
					local v61 = v58 / v60 + 0.5
					local v62 = math.floor(v61) * v60
					local v63 = v_u_35.min
					local v64 = v_u_35.max
					local v65 = math.clamp(v62, v63, v64)
					p56.Text = tostring(v65)
					if v65 ~= v_u_35.value then
						v_u_35.valueChanged(v65)
					end
				end
			end
			v48.Box = v49(v50, v51, {
				["TextSizeConstraint"] = v_u_6.createElement("UITextSizeConstraint", {
					["MinTextSize"] = p43.Font.Body.RelativeMinSize * p43.Font.BaseSize,
					["MaxTextSize"] = p43.Font.Body.RelativeSize * p43.Font.BaseSize
				})
			})
			return v45(v46, v47, v48)
		end)
	}
	local v67 = not v_u_35.disabled
	if v67 then
		v67 = v_u_6.createElement(v_u_18, {
			["event"] = v_u_2.InputBegan,
			["callback"] = function(p68, _) -- name: callback
				-- upvalues: (ref) v_u_2, (copy) p_u_33, (copy) v_u_35
				if p68.UserInputType == Enum.UserInputType.Keyboard then
					if v_u_2:GetFocusedTextBox() == p_u_33.textBoxRef.current then
						local v69 = p68.KeyCode == Enum.KeyCode.Up and 1 or (p68.KeyCode == Enum.KeyCode.Down and -1 or 0)
						if v_u_2:IsKeyDown(Enum.KeyCode.LeftShift) or v_u_2:IsKeyDown(Enum.KeyCode.RightShift) then
							v69 = v69 * 10
						end
						if v69 ~= 0 then
							local v70 = (v_u_35.value + v_u_35.stepInterval * v69) / v_u_35.stepInterval + 0.5
							local v71 = math.floor(v70) * v_u_35.stepInterval
							local v72 = v_u_35.min
							local v73 = v_u_35.max
							local v74 = math.clamp(v71, v72, v73)
							if v74 ~= v_u_35.value then
								v_u_35.valueChanged(v74)
							end
						end
					end
				else
					return
				end
			end
		})
	end
	v66.UserInputConnection = v67
	return v37(v38, v39, v66)
end
function v22.render(p_u_75) -- name: render
	-- upvalues: (copy) v_u_15
	return v_u_15(function(p76)
		-- upvalues: (copy) p_u_75
		return p_u_75:renderWithSelectionCursor(p76)
	end)
end
return v22