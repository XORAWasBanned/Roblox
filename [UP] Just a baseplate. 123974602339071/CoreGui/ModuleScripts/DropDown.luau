-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DropDown
local v1 = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = game:DefineFastFlag("DevConsoleDropdownFlipFix", false)
local v_u_4 = game:DefineFastFlag("DevConsoleDropdownMultiSelect", false)
local v_u_5 = require(script.Parent.Parent.Constants)
local v_u_6 = v_u_5.Font.UtilBar
local v_u_7 = v_u_5.DefaultFontSize.UtilBar
local v_u_8 = v_u_5.GeneralFormatting.DropDownArrowHeight
local v_u_9 = v_u_8 / 2
local v_u_10 = v_u_5.Image.DownArrow
local v11 = v_u_2.Component:extend("DropDown")
function v11.init(p_u_12) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if v_u_3 then
		p_u_12.guiInset = game:GetService("GuiService"):GetGuiInset()
	end
	function p_u_12.onMainButtonPressed(_, _)
		-- upvalues: (copy) p_u_12
		p_u_12:setState({
			["showDropDown"] = true
		})
	end
	function p_u_12.nonDropDownSelection(_, p13)
		-- upvalues: (copy) p_u_12
		if p13.UserInputType == Enum.UserInputType.MouseButton1 or p13.UserInputType == Enum.UserInputType.Touch and p13.UserInputState == Enum.UserInputState.End then
			p_u_12:setState({
				["showDropDown"] = false
			})
		end
	end
	p_u_12.state = {
		["showDropDown"] = false
	}
	p_u_12.ref = v_u_2.createRef()
end
function v11.render(p_u_14) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_3, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9
	local v15 = p_u_14.props.buttonSize
	local v16 = p_u_14.props.dropDownList
	local v17 = p_u_14.props.selectedIndex
	local v_u_18 = p_u_14.props.onSelection
	local v19 = p_u_14.props.layoutOrder
	local v20 = p_u_14.props.selectedSet
	local v_u_21 = p_u_14.props.onToggle
	local v_u_22 = v_u_4
	if v_u_22 then
		v_u_22 = v_u_21 ~= nil
	end
	local v23 = p_u_14.props.dropDownTargetParent
	local v24 = p_u_14.ref.current
	if v24 then
		v24 = p_u_14.state.showDropDown
	end
	local v25 = {}
	local v26 = 0
	local v27, v28, v29
	if p_u_14.ref.current and v24 then
		local v30 = p_u_14.ref.current.AbsolutePosition
		local v31 = p_u_14.ref.current.AbsoluteSize
		v27 = v31.X
		v25.UIListLayout = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		})
		for v_u_32, v33 in pairs(v16) do
			local v34
			if v_u_22 then
				if v20 == nil then
					v34 = false
				else
					v34 = v20[v_u_32] == true
				end
			else
				v34 = v_u_32 == v17
			end
			local v35 = v34 and v_u_5.Color.SelectedGray or v_u_5.Color.UnselectedGray
			v25[v33] = v_u_2.createElement("TextButton", {
				["Size"] = v15,
				["Text"] = v33,
				["TextColor3"] = v_u_5.Color.Text,
				["TextSize"] = v_u_7,
				["Font"] = v_u_6,
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = v35,
				["BackgroundTransparency"] = 0,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = v_u_32,
				[v_u_2.Event.Activated] = function()
					-- upvalues: (copy) v_u_22, (copy) v_u_21, (copy) v_u_32, (copy) v_u_18, (copy) p_u_14
					if v_u_22 then
						v_u_21(v_u_32)
					else
						v_u_18(v_u_32)
						p_u_14:setState({
							["showDropDown"] = false
						})
					end
				end
			})
			v26 = v26 + v31.Y
		end
		local v36 = v26 + 24
		if v_u_3 then
			local v37 = workspace.CurrentCamera
			local v38 = (v37 and v37.ViewportSize.Y or (1 / 0)) - p_u_14.guiInset.Y - (v30.Y + v31.Y)
			local v39 = v30.Y
			local v40
			if v38 < v36 then
				v40 = v38 < v39
			else
				v40 = false
			end
			v28 = UDim2.new(0, v27 + 24, 0, v36)
			if v40 then
				v29 = UDim2.new(0, v30.X, 0, v30.Y - v36)
			else
				v29 = UDim2.new(0, v30.X, 0, v30.Y + v31.Y)
			end
		else
			v28 = UDim2.new(0, v27 + 24, 0, v26 + 24)
			v29 = UDim2.new(0, v30.X, 0, v30.Y + v31.Y)
		end
	else
		v27 = 0
		v28 = nil
		v29 = nil
	end
	local v41 = v_u_2.createElement
	local v42 = "TextButton"
	local v43 = {
		["Size"] = v15,
		["Position"] = not v_u_3 or p_u_14.props.position or (UDim2.new() or nil)
	}
	local v44
	if v_u_22 then
		v44 = p_u_14.props.summaryText or ""
	else
		v44 = v16[v17]
	end
	v43.Text = v44
	v43.TextColor3 = v_u_5.Color.Text
	v43.TextSize = v_u_7
	v43.Font = v_u_6
	v43.AutoButtonColor = false
	v43.BackgroundColor3 = v_u_5.Color.UnselectedGray
	v43.BackgroundTransparency = 0
	v43.LayoutOrder = v19
	v43[v_u_2.Event.Activated] = p_u_14.onMainButtonPressed
	v43[v_u_2.Ref] = p_u_14.ref
	local v45 = {
		["arrow"] = v_u_2.createElement("ImageLabel", {
			["Image"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Image"] = v_u_10,
			["Size"] = UDim2.new(0, v_u_8, 0, v_u_8),
			["Position"] = UDim2.new(1, -v_u_8 - v_u_9, 0.5, -v_u_9)
		})
	}
	if v24 then
		local v46 = v_u_2.createElement
		local v47 = v_u_2.Portal
		local v48 = {}
		if v23 == nil or not v23 then
			v23 = game:GetService("CoreGui").DevConsoleMaster
		end
		v48.target = v23
		v24 = v46(v47, v48, {
			["InputCatcher"] = v_u_2.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["BackgroundTransparency"] = 1,
				[v_u_2.Event.InputEnded] = p_u_14.nonDropDownSelection
			}, {
				["OuterFrame"] = v_u_2.createElement("ImageButton", {
					["Size"] = nil,
					["AutoButtonColor"] = false,
					["Position"] = nil,
					["BackgroundColor3"] = nil,
					["BackgroundTransparency"] = 0,
					["Size"] = v28,
					["Position"] = v29,
					["BackgroundColor3"] = v_u_5.Color.TextBoxGray
				}, {
					["innerFrame"] = v_u_2.createElement("Frame", {
						["Position"] = nil,
						["Size"] = nil,
						["BackgroundTransparency"] = 1,
						["Position"] = UDim2.new(0, 12, 0, 12),
						["Size"] = UDim2.new(0, v27, 0, v26)
					}, v25)
				})
			})
		})
	end
	v45.DropDown = v24
	return v41(v42, v43, v45)
end
return v11