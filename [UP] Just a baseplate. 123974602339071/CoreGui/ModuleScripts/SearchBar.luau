-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.SearchBar
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.ScrollingTextBox)
local v_u_4 = require(script.Parent.Parent.Constants)
local v5 = v_u_2.Component:extend("SearchBar")
function v5.render(p6) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v7 = p6.props.size
	local v8 = p6.props.pos
	local v9 = p6.props.frameHeight
	local v10 = p6.props.textSize
	local v11 = p6.props.font
	local v12 = p6.props.searchTerm
	local v13 = p6.props.layoutOrder
	local v14 = p6.props.visible
	local v15 = p6.props.showClear
	local v16 = v9 * 0.6
	local v17 = v_u_2.createElement
	local v18 = "Frame"
	local v19 = {
		["Size"] = v7,
		["Position"] = v8,
		["BackgroundColor3"] = v_u_4.Color.UnselectedGray,
		["BorderColor3"] = v_u_4.Color.BorderGray,
		["Visible"] = v14,
		["LayoutOrder"] = v13
	}
	local v20 = {
		["SearchImage"] = v_u_2.createElement("ImageLabel", {
			["Name"] = "SearchIcon",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["Size"] = UDim2.new(0, v16, 0, v16),
			["Position"] = UDim2.new(0, 10, 0.5, -v16 / 2),
			["Image"] = v_u_4.Image.Search
		})
	}
	if v15 then
		v15 = v_u_2.createElement("ImageButton", {
			["Size"] = UDim2.new(0, -v16, 0, v16),
			["Position"] = UDim2.new(1, -10, 0.5, -v16 / 2),
			["BackgroundTransparency"] = 1,
			["Image"] = v_u_4.Image.Clear,
			[v_u_2.Event.InputEnded] = p6.props.cancelInput
		})
	end
	v20.ClearButton = v15
	v20.InputField = v_u_2.createElement(v_u_3, {
		["Text"] = v12 or "",
		["TextSize"] = v10,
		["Font"] = v11,
		["Size"] = UDim2.new(1, -(2 * v9), 1, 0),
		["Position"] = UDim2.new(0, 20 + v16, 0, 0),
		["ShowNativeInput"] = true,
		["TextColor3"] = v_u_4.Color.Text,
		["BackgroundTransparency"] = 1,
		["TextXAlignment"] = 0,
		["ClearTextOnFocus"] = false,
		["PlaceholderText"] = "Search",
		[v_u_2.Ref] = p6.props.refForParent,
		["TextBoxFocusLost"] = p6.props.focusLost
	})
	return v17(v18, v19, v20)
end
return v5