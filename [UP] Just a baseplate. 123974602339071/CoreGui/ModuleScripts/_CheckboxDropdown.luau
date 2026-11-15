-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components._CheckboxDropdown
local v1 = game:GetService("CorePackages")
local _ = game:GetService("CoreGui").RobloxGui
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Constants)
local v4 = v_u_2.Component:extend("CheckboxDropdown")
function v4.render(p5) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = p5.props[v_u_2.Children] or {}
	local v7 = p5.props.absolutePosition
	local v8 = p5.props.frameWidth
	local v9 = p5.props.elementHeight
	local v10 = p5.props.numElements
	local v11 = p5.props.dropdownTargetGui
	local v12 = p5.props.onCloseCheckbox
	local v13 = v9 * v10
	local v14 = UDim2.new(0, v8, 0, 24 + v13)
	local v15 = v_u_2.createElement
	local v16 = v_u_2.Portal
	local v17 = {}
	if v11 == nil or not v11 then
		v11 = game:GetService("CoreGui").DevConsoleMaster
	end
	v17.target = v11
	local v18 = {
		["InputCatcher"] = v_u_2.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["BackgroundTransparency"] = 1,
			[v_u_2.Event.InputEnded] = v12
		}, {
			["OuterFrame"] = v_u_2.createElement("ImageButton", {
				["Size"] = nil,
				["AutoButtonColor"] = false,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0,
				["Size"] = v14,
				["Position"] = v7,
				["BackgroundColor3"] = v_u_3.Color.TextBoxGray
			}, {
				["innerFrame"] = v_u_2.createElement("Frame", {
					["Position"] = nil,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Position"] = UDim2.new(0, 12, 0, 12),
					["Size"] = UDim2.new(0, v8, 0, v13)
				}, v6)
			})
		})
	}
	return v15(v16, v17, v18)
end
return v4