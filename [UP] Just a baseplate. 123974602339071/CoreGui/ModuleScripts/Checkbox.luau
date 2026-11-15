-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Checkbox
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Constants)
local v_u_3 = require(v1.Packages.Roact)
local v4 = v_u_3.Component:extend("Checkbox")
function v4.render(p_u_5) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = p_u_5.props.Size
	local v7 = p_u_5.props.Position or UDim2.new(0, 0, 0, 0)
	local v8 = p_u_5.props.LayoutOrder or 0
	local v_u_9 = p_u_5.props.Name
	local v10 = p_u_5.props.SelectedColor or v_u_2.Color.SelectedBlue
	local v11 = p_u_5.props.UnselectedColor or v_u_2.Color.UnselectedGray
	local v_u_12 = p_u_5.props.OnSelectedStateChanged
	local v13, v14
	if p_u_5.props.IsSelected then
		v13 = v_u_2.Image.Check
		v14 = 0
	else
		v10 = v11
		v13 = ""
		v14 = 1
	end
	return v_u_3.createElement("ImageButton", {
		["Size"] = v6,
		["Position"] = v7,
		["Image"] = v13,
		["BackgroundColor3"] = v10,
		["BackgroundTransparency"] = 0,
		["BorderColor3"] = v_u_2.Color.Text,
		["BorderSizePixel"] = v14,
		["LayoutOrder"] = v8,
		[v_u_3.Event.Activated] = function(_)
			-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) p_u_5
			if v_u_12 then
				v_u_12(v_u_9, not p_u_5.props.IsSelected)
			end
		end
	})
end
return v4