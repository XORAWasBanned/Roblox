-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.FullScreenDropDownButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui").RobloxGui
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_5 = require(script.Parent.Parent.Constants)
local v_u_6 = v_u_5.GeneralFormatting.DropDownEntryHeight
local v_u_7 = v_u_5.GeneralFormatting.DropDownArrowHeight
local v_u_8 = v_u_7 / 2
local v_u_9 = v_u_5.Image.DownArrow
local v10 = v_u_3.Component:extend("FullScreenDropDownButton")
function v10.init(p_u_11) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_11.startDropDownView()
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["selectionScreenExpanded"] = true
		})
	end
	function p_u_11.noSelection(_, p12)
		-- upvalues: (copy) p_u_11
		if p12.UserInputType == Enum.UserInputType.MouseButton1 or p12.UserInputType == Enum.UserInputType.Touch and p12.UserInputState == Enum.UserInputState.End then
			p_u_11:setState({
				["selectionScreenExpanded"] = false
			})
		end
	end
	p_u_11.state = {
		["selectionScreenExpanded"] = false,
		["guiSizeY"] = nil,
		["guiSizeY"] = v_u_2.AbsoluteSize.Y
	}
end
function v10.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
	local v14 = p_u_13.props.buttonSize
	local v15 = p_u_13.props.dropDownList
	local v16 = p_u_13.props.selectedIndex
	local v_u_17 = p_u_13.props.onSelection
	local v18 = p_u_13.props.layoutOrder
	local v19 = p_u_13.state.selectionScreenExpanded
	local v20 = p_u_13.props.portalTarget
	local v21 = {}
	local v22 = 16
	if v19 then
		v21.UIListLayout = v_u_3.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["FillDirection"] = Enum.FillDirection.Vertical
		})
		if v15 then
			for v_u_23, v24 in ipairs(v15) do
				local v25 = v_u_23 == v16 and v_u_5.Color.SelectedGray or v_u_5.Color.UnselectedGray
				v21[v_u_23] = v_u_3.createElement("TextButton", {
					["Text"] = v24,
					["Font"] = v_u_5.Font.TabBar,
					["TextSize"] = v_u_5.DefaultFontSize.DropDownTabBar,
					["TextColor3"] = v_u_5.Color.Text,
					["AutoButtonColor"] = false,
					["Size"] = UDim2.new(1, 0, 0, v_u_6),
					["BackgroundColor3"] = v25,
					["LayoutOrder"] = v_u_23,
					["BorderSizePixel"] = 0,
					[v_u_3.Event.Activated] = function(_)
						-- upvalues: (copy) p_u_13, (copy) v_u_17, (copy) v_u_23
						p_u_13:setState({
							["selectionScreenExpanded"] = false
						})
						v_u_17(v_u_23)
					end
				})
				v22 = v22 + v_u_6
			end
		end
	end
	local v26 = v22 - 16 - p_u_13.state.guiSizeY
	local v27 = v_u_3.createElement
	local v28 = "TextButton"
	local v29 = {
		["Size"] = v14,
		["BackgroundColor3"] = v_u_5.Color.UnselectedGray,
		["Text"] = "",
		["AutoButtonColor"] = false,
		["LayoutOrder"] = v18,
		[v_u_3.Event.Activated] = p_u_13.startDropDownView
	}
	local v30 = {
		["SizeChangeEvent"] = v_u_3.createElement(v_u_4, {
			["event"] = v_u_2:GetPropertyChangedSignal("AbsoluteSize"),
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_13, (ref) v_u_2
				p_u_13:setState({
					["guiSizeY"] = v_u_2.AbsoluteSize.Y
				})
			end
		}),
		["text"] = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextXAlignment"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, -v_u_7 - v_u_8, 1, 0),
			["Text"] = v15[v16],
			["Font"] = v_u_5.Font.TabBar,
			["TextSize"] = v_u_5.DefaultFontSize.DropDownTabBar,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextColor3"] = v_u_5.Color.Text
		}),
		["arrow"] = v_u_3.createElement("ImageLabel", {
			["Image"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Image"] = v_u_9,
			["Size"] = UDim2.new(0, v_u_7, 0, v_u_7),
			["Position"] = UDim2.new(1, -v_u_7 - v_u_8, 0.5, -v_u_8)
		})
	}
	if v19 then
		local v31 = v_u_3.createElement
		local v32 = v_u_3.Portal
		local v33 = {}
		if v20 == nil or not v20 then
			v20 = game:GetService("CoreGui").DevConsoleMaster
		end
		v33.target = v20
		local v34 = {
			["GreyOutFrame"] = v_u_3.createElement("Frame", {
				["Size"] = UDim2.new(1, 0, 1, 0),
				["BackgroundColor3"] = v_u_5.Color.Black,
				["BackgroundTransparency"] = 0.36,
				["Active"] = true,
				[v_u_3.Event.InputEnded] = p_u_13.noSelection
			}, {
				["BorderFrame"] = v_u_3.createElement("Frame", {
					["Size"] = nil,
					["Position"] = nil,
					["BackgroundColor3"] = nil,
					["BorderSizePixel"] = 0,
					["Size"] = UDim2.new(0, 375, 0, v22),
					["Position"] = UDim2.new(0.5, -187.5, 0, 0),
					["BackgroundColor3"] = v_u_5.Color.UnselectedGray
				}, {
					["SelectionFrame"] = v_u_3.createElement("ScrollingFrame", {
						["Size"] = nil,
						["Position"] = nil,
						["BackgroundTransparency"] = 1,
						["CanvasSize"] = nil,
						["BorderSizePixel"] = 0,
						["ScrollBarThickness"] = 0,
						["Size"] = UDim2.new(1, -30, 1, -16),
						["Position"] = UDim2.new(0, 15, 0, 8),
						["CanvasSize"] = UDim2.new(1, -30, 1, v26)
					}, v21)
				})
			})
		}
		v19 = v31(v32, v33, v34)
	end
	v30.selectionView = v19
	return v27(v28, v29, v30)
end
return v10