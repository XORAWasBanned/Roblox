-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.CheckboxContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = script.Parent.Parent.Components
local v_u_5 = require(v4.LabeledCheckbox)
local v_u_6 = require(v4.CheckboxDropdown)
local v_u_7 = require(script.Parent.Parent.Constants)
local v_u_8 = v_u_7.UtilityBarFormatting.CheckboxHeight
local v_u_9 = v_u_7.UtilityBarFormatting.CheckboxInnerPadding * 2
local v_u_10 = v_u_7.Image.FilterUnfilled
local v_u_11 = v_u_7.Image.FilterFilled
local v12 = v_u_3.PureComponent:extend("CheckboxContainer")
function v12.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3
	function p_u_13.onCheckboxClicked(p14, p15)
		-- upvalues: (copy) p_u_13
		p_u_13.props.onCheckboxChanged(p14, p15)
	end
	function p_u_13.onCheckboxExpanded(_, p16)
		-- upvalues: (copy) p_u_13
		if p16.UserInputType == Enum.UserInputType.MouseButton1 or p16.UserInputType == Enum.UserInputType.Touch and p16.UserInputState == Enum.UserInputState.End then
			p_u_13:setState({
				["expanded"] = true
			})
		end
	end
	function p_u_13.onCloseCheckbox(_, p17)
		-- upvalues: (copy) p_u_13
		if p17.UserInputType == Enum.UserInputType.MouseButton1 or p17.UserInputType == Enum.UserInputType.Touch and p17.UserInputState == Enum.UserInputState.End then
			p_u_13:setState({
				["expanded"] = false
			})
		end
	end
	if not p_u_13.props.orderedCheckboxState then
		warn("CheckboxContainer must be passed a list of Box Names or else it only creates an empty frame")
	end
	local v18 = 0
	local v19 = {}
	local v20 = 0
	for v21, v22 in ipairs(p_u_13.props.orderedCheckboxState) do
		local v23 = v_u_2:GetTextSize(v22.name, v_u_7.DefaultFontSize.UtilBar, v_u_7.Font.UtilBar, Vector2.new(0, 0))
		v19[v21] = v23.X
		v20 = v20 + v23.X + v_u_8 + v_u_9
		v18 = v18 + 1
	end
	p_u_13.ref = v_u_3.createRef()
	p_u_13.state = {
		["expanded"] = false,
		["textWidths"] = nil,
		["numCheckboxes"] = nil,
		["minFullLength"] = nil,
		["textWidths"] = v19,
		["numCheckboxes"] = v18,
		["minFullLength"] = v20
	}
end
function v12.render(p24) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_8, (copy) v_u_11, (copy) v_u_10, (copy) v_u_6
	local v25 = p24.props.frameWidth
	local v26 = p24.props.frameHeight
	local v27 = p24.props.pos
	local v28 = p24.props.layoutOrder
	local v29 = p24.props.orderedCheckboxState
	local v30 = p24.state.minFullLength
	local v31 = p24.state.expanded
	local v32 = p24.state.numCheckboxes
	local v33 = {}
	local v34 = false
	for v35, v36 in ipairs(v29) do
		v33[v36.name] = v_u_3.createElement(v_u_5, {
			["name"] = v36.name,
			["font"] = v_u_7.Font.UtilBar,
			["fontSize"] = v_u_7.DefaultFontSize.UtilBar,
			["checkboxHeight"] = v_u_8,
			["frameHeight"] = v26,
			["layoutOrder"] = v35,
			["isSelected"] = v36.state,
			["selectedColor"] = v_u_7.Color.SelectedBlue,
			["unselectedColor"] = v_u_7.Color.UnselectedGray,
			["onCheckboxClicked"] = p24.onCheckboxClicked
		})
		v34 = v34 or v36.state
	end
	if v25 >= v30 then
		v33.CheckboxLayout = v_u_3.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["FillDirection"] = Enum.FillDirection.Horizontal
		})
		return v_u_3.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(0, v25, 0, v26),
			["Position"] = v27,
			["LayoutOrder"] = v28
		}, v33)
	end
	v33.CheckboxLayout = v_u_3.createElement("UIListLayout", {
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["VerticalAlignment"] = Enum.VerticalAlignment.Top,
		["FillDirection"] = Enum.FillDirection.Vertical
	})
	local v37 = p24.ref.current and v31
	local v38
	if v37 then
		local v39 = p24.ref.current.AbsolutePosition
		v38 = UDim2.new(0, v39.X, 0, v39.Y + v26 + 3)
	else
		v38 = nil
	end
	local v40 = v_u_3.createElement
	local v41 = "ImageButton"
	local v42 = {
		["Size"] = UDim2.new(0, v26, 0, v26),
		["LayoutOrder"] = v28,
		["Image"] = v37 and v_u_11 or v_u_10,
		["BackgroundTransparency"] = 1,
		["BorderColor3"] = v_u_7.Color.Text,
		[v_u_3.Event.InputEnded] = p24.onCheckboxExpanded,
		[v_u_3.Ref] = p24.ref
	}
	local v43 = {}
	if v37 then
		v37 = v_u_3.createElement(v_u_6, {
			["absolutePosition"] = v38,
			["frameWidth"] = v25,
			["elementHeight"] = v26,
			["numElements"] = v32,
			["onCloseCheckbox"] = p24.onCloseCheckbox
		}, v33)
	end
	v43.DropDown = v37
	return v40(v41, v42, v43)
end
return v12