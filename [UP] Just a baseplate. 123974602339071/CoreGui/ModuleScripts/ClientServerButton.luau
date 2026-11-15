-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ClientServerButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Constants)
local v_u_4 = v_u_3.UtilityBarFormatting.FrameHeight
local v_u_5 = v_u_3.UtilityBarFormatting.SmallFrameHeight
local v_u_6 = v_u_3.UtilityBarFormatting.ClientServerButtonWidth
local v_u_7 = v_u_3.UtilityBarFormatting.ClientServerDropDownWidth
local v_u_8 = v_u_3.Font.UtilBar
local v_u_9 = v_u_3.DefaultFontSize.UtilBar
local v_u_10 = v_u_3.Color.Text
local v_u_11 = require(script.Parent.FullScreenDropDownButton)
local v_u_12 = require(script.Parent.DropDown)
local v_u_13 = UDim2.new(0, v_u_6, 0, v_u_4)
local v_u_14 = { "Client", "Server" }
local v15 = v_u_2.Component:extend("ClientServerButton")
function v15.init(p_u_16) -- name: init
	function p_u_16.dropDownCallback(p17)
		-- upvalues: (copy) p_u_16
		if p17 == 1 then
			p_u_16.props.onClientButton()
		elseif p17 == 2 then
			p_u_16.props.onServerButton()
		end
	end
end
function v15.render(p18) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_11, (copy) v_u_7, (copy) v_u_5, (copy) v_u_14, (copy) v_u_12, (copy) v_u_6, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_8, (copy) v_u_13
	local v19 = p18.props.formFactor
	local v20 = p18.props.useDropDown
	local v21 = p18.props.isClientView
	local v22 = p18.props.layoutOrder
	local v23 = p18.props.onServerButton
	local v24 = p18.props.onClientButton
	local v25 = v_u_3.Color.SelectedBlue
	local v26 = v_u_3.Color.UnselectedGray
	if v21 then
		v26 = v_u_3.Color.SelectedBlue
		v25 = v_u_3.Color.UnselectedGray
	end
	if v19 == v_u_3.FormFactor.Small then
		return v_u_2.createElement(v_u_11, {
			["buttonSize"] = UDim2.new(0, v_u_7, 0, v_u_5),
			["dropDownList"] = v_u_14,
			["selectedIndex"] = v21 and 1 or 2,
			["onSelection"] = p18.dropDownCallback,
			["layoutOrder"] = v22
		})
	elseif v20 then
		return v_u_2.createElement(v_u_12, {
			["buttonSize"] = UDim2.new(0, v_u_7, 0, v_u_5),
			["dropDownList"] = v_u_14,
			["selectedIndex"] = v21 and 1 or 2,
			["onSelection"] = p18.dropDownCallback,
			["layoutOrder"] = v22
		})
	else
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(0, 2 * v_u_6, 0, v_u_4),
			["LayoutOrder"] = v22
		}, {
			["ClientButton"] = v_u_2.createElement("TextButton", {
				["Text"] = v_u_14[1],
				["TextSize"] = v_u_9,
				["TextColor3"] = v_u_10,
				["Font"] = v_u_8,
				["Size"] = v_u_13,
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = v26,
				["BackgroundTransparency"] = 0,
				["LayoutOrder"] = 1,
				[v_u_2.Event.Activated] = v24
			}),
			["ServerButton"] = v_u_2.createElement("TextButton", {
				["Text"] = v_u_14[2],
				["TextSize"] = v_u_9,
				["TextColor3"] = v_u_10,
				["Font"] = v_u_8,
				["Size"] = v_u_13,
				["AutoButtonColor"] = false,
				["Position"] = UDim2.new(0, v_u_6, 0, 0),
				["BackgroundColor3"] = v25,
				["BackgroundTransparency"] = 0,
				["LayoutOrder"] = 2,
				[v_u_2.Event.Activated] = v23
			})
		})
	end
end
return v15