-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.Prompts.PromptWithTextField
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v1.Packages.RoactGamepad)
local v7 = require(v1.Packages.t)
local v8 = require(v1.Packages.UIBlox)
local v_u_9 = v8.App.Dialog.Alert.InteractiveAlert
local _ = v8.App.Button.Enum.ButtonType
local v_u_10 = v8.Core.ImageSet.ImageSetLabel
local v_u_11 = v8.Style.withStyle
local v12 = v8.App.ImageSet.Images
v2:WaitForChild("RobloxGui")
local v_u_13 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_14 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_15 = v12["component_assets/circle_17_stroke_1"]
local v_u_16 = Rect.new(8, 8, 8, 8)
local v17 = v_u_4.PureComponent:extend("PromptWithTextField")
v17.validateProps = v7.strictInterface({
	["fieldText"] = v7.string,
	["onFieldTextUpdated"] = v7.callback,
	["title"] = v7.string,
	["bodyText"] = v7.optional(v7.string),
	["buttonStackInfo"] = v7.table,
	["screenSize"] = v7.Vector2
})
function v17.init(p_u_18) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	p_u_18:setState({
		["alertPosition"] = UDim2.fromScale(0.5, 0.5)
	})
	p_u_18.textBoxRef = v_u_4.createRef()
	function p_u_18.textUpdated(p19)
		-- upvalues: (copy) p_u_18
		p_u_18.props.onFieldTextUpdated(p19.Text)
	end
	p_u_18.lastAlertHeight = 100
	function p_u_18.calculateAlertPosition()
		-- upvalues: (ref) v_u_3, (copy) p_u_18
		local v20 = UDim2.fromScale(0.5, 0.5)
		if v_u_3.OnScreenKeyboardVisible then
			local v21 = (p_u_18.props.screenSize.Y - v_u_3.OnScreenKeyboardSize.Y) / 2
			local v22 = v21 - p_u_18.lastAlertHeight / 2
			if v22 < 20 then
				v21 = v21 + (20 - v22)
			end
			v20 = UDim2.new(0.5, 0, 0, v21)
		end
		if p_u_18.state.alertPosition ~= v20 then
			p_u_18:setState({
				["alertPosition"] = v20
			})
		end
	end
	function p_u_18.alertSizeChanged(p23)
		-- upvalues: (copy) p_u_18
		p_u_18.lastAlertHeight = p23.AbsoluteSize.Y
		p_u_18.calculateAlertPosition()
	end
	function p_u_18.alertMounted()
		-- upvalues: (copy) p_u_18
		local v24 = p_u_18.textBoxRef:getValue()
		if v24 then
			v24:CaptureFocus()
		end
	end
end
function v17.renderAlertMiddleContent(p_u_25) -- name: renderAlertMiddleContent
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_10, (copy) v_u_15, (copy) v_u_16, (copy) v_u_6, (copy) v_u_13
	return v_u_11(function(p26)
		-- upvalues: (ref) v_u_4, (ref) v_u_10, (ref) v_u_15, (ref) v_u_16, (ref) v_u_6, (ref) v_u_13, (copy) p_u_25
		local v27 = p26.Font
		local v28 = p26.Theme
		local v29 = v_u_4.createElement
		local v30 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 35),
			["Position"] = UDim2.fromScale(0, 1),
			["AnchorPoint"] = Vector2.new(0, 1)
		}
		local v31 = {}
		local v32 = v_u_4.createElement
		local v33 = v_u_10
		local v34 = {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["LayoutOrder"] = 3,
			["ScaleType"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["SliceCenter"] = nil,
			["Image"] = v_u_15,
			["ImageColor3"] = v28.UIDefault.Color,
			["ImageTransparency"] = v28.UIDefault.Transparency,
			["ScaleType"] = Enum.ScaleType.Slice,
			["Size"] = UDim2.new(1, 0, 1, -5),
			["Position"] = UDim2.fromScale(0, 1),
			["AnchorPoint"] = Vector2.new(0, 1),
			["SliceCenter"] = v_u_16
		}
		local v35 = {
			["Textbox"] = v_u_4.createElement(v_u_6.Focusable.TextBox, {
				["BackgroundTransparency"] = 1,
				["ClearTextOnFocus"] = false,
				["Font"] = v27.Header2.Font,
				["TextSize"] = v27.BaseSize * v27.CaptionBody.RelativeSize,
				["PlaceholderColor3"] = v28.TextDefault.Color,
				["PlaceholderText"] = v_u_13:FormatByKey("CoreScripts.AvatarEditorPrompts.OutfitNamePlaceholder"),
				["Position"] = UDim2.new(0, 6, 0, 0),
				["Size"] = UDim2.new(1, -12, 1, 0),
				["TextColor3"] = v28.TextEmphasis.Color,
				["TextTruncate"] = Enum.TextTruncate.AtEnd,
				["Text"] = p_u_25.props.fieldText,
				["TextWrapped"] = true,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["OverlayNativeInput"] = true,
				[v_u_4.Change.Text] = p_u_25.textUpdated,
				[v_u_4.Ref] = p_u_25.textBoxRef
			})
		}
		v31.TextboxBorder = v32(v33, v34, v35)
		return v29("Frame", v30, v31)
	end)
end
function v17.render(p_u_36) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_14, (copy) v_u_3
	local v37 = v_u_4.createFragment
	local v38 = {
		["InteractiveAlert"] = v_u_4.createElement(v_u_9, {
			["title"] = nil,
			["bodyText"] = nil,
			["buttonStackInfo"] = nil,
			["position"] = nil,
			["screenSize"] = nil,
			["middleContent"] = nil,
			["isMiddleContentFocusable"] = true,
			["onAbsoluteSizeChanged"] = nil,
			["onMounted"] = nil,
			["title"] = p_u_36.props.title,
			["bodyText"] = p_u_36.props.bodyText,
			["buttonStackInfo"] = p_u_36.props.buttonStackInfo,
			["position"] = p_u_36.state.alertPosition,
			["screenSize"] = p_u_36.props.screenSize,
			["middleContent"] = function() -- name: middleContent
				-- upvalues: (copy) p_u_36
				return p_u_36:renderAlertMiddleContent()
			end,
			["onAbsoluteSizeChanged"] = p_u_36.alertSizeChanged,
			["onMounted"] = p_u_36.alertMounted
		}),
		["OnScreenKeyboardVisibleConnection"] = v_u_4.createElement(v_u_14, {
			["event"] = v_u_3:GetPropertyChangedSignal("OnScreenKeyboardVisible"),
			["callback"] = p_u_36.calculateAlertPosition
		}),
		["OnScreenKeyboardSizeConnection"] = v_u_4.createElement(v_u_14, {
			["event"] = v_u_3:GetPropertyChangedSignal("OnScreenKeyboardSize"),
			["callback"] = p_u_36.calculateAlertPosition
		})
	}
	return v37(v38)
end
function v17.didMount(p39) -- name: didMount
	p39.calculateAlertPosition()
end
return v5.connect(function(p40) -- name: mapStateToProps
	return {
		["screenSize"] = p40.screenSize
	}
end, nil)(v17)