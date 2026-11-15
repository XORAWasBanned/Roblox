-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.GameSettingsPage.SliderEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = require(v1.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.t
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(script.Parent.InputLabel)
local v_u_8 = require(v6.Components.SliderWithInput)
local v9 = v_u_4.PureComponent:extend("SliderEntry")
v9.validateProps = v5.strictInterface({
	["LayoutOrder"] = v5.integer,
	["labelKey"] = v5.string,
	["min"] = v5.number,
	["max"] = v5.number,
	["stepInterval"] = v5.number,
	["keyboardInputStepInterval"] = v5.optional(v5.numberPositive),
	["value"] = v5.number,
	["disabled"] = v5.optional(v5.boolean),
	["valueChanged"] = v5.callback,
	["canCaptureFocus"] = v5.optional(v5.boolean),
	["isMenuOpen"] = v5.optional(v5.boolean),
	["buttonRef"] = v5.optional(v5.table)
})
function v9.init(p10) -- name: init
	p10.state = {
		["isFrameSelectable"] = true
	}
end
function v9.render(p_u_11) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8
	local v_u_12 = p_u_11.props.buttonRef or v_u_4.createRef()
	return v_u_4.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 92),
		["LayoutOrder"] = p_u_11.props.LayoutOrder,
		["Selectable"] = p_u_11.state.isFrameSelectable,
		[v_u_4.Event.SelectionGained] = function()
			-- upvalues: (ref) v_u_2, (copy) v_u_12, (copy) p_u_11
			v_u_2.SelectedCoreObject = v_u_12:getValue()
			p_u_11:setState({
				["isFrameSelectable"] = false
			})
		end
	}, {
		["Padding"] = v_u_4.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingTop"] = UDim.new(0, 12),
			["PaddingRight"] = UDim.new(0, 30),
			["PaddingBottom"] = UDim.new(0, 24)
		}),
		["Label"] = v_u_4.createElement(v_u_7, {
			["Size"] = UDim2.new(1, 0, 0, 24),
			["localizationKey"] = p_u_11.props.labelKey,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0, 0)
		}),
		["Slider"] = v_u_4.createElement(v_u_8, {
			["min"] = p_u_11.props.min,
			["max"] = p_u_11.props.max,
			["stepInterval"] = p_u_11.props.stepInterval,
			["keyboardInputStepInterval"] = p_u_11.props.keyboardInputStepInterval,
			["value"] = p_u_11.props.value,
			["Position"] = UDim2.new(0, 0, 0, 32),
			["disabled"] = p_u_11.props.disabled,
			["valueChanged"] = p_u_11.props.valueChanged,
			["canCaptureFocus"] = p_u_11.props.canCaptureFocus,
			["isMenuOpen"] = p_u_11.props.isMenuOpen,
			["sliderDotRef"] = v_u_12,
			["onSelectionLost"] = function() -- name: onSelectionLost
				-- upvalues: (copy) p_u_11
				p_u_11:setState({
					["isFrameSelectable"] = true
				})
			end,
			["onSelectionGained"] = function() -- name: onSelectionGained
				-- upvalues: (copy) p_u_11
				p_u_11:setState({
					["isFrameSelectable"] = false
				})
			end
		})
	})
end
return v9