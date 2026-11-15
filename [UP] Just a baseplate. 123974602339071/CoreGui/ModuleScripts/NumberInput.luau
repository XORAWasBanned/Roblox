-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.NumberInput
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Constants)
local v_u_3 = require(v1.Packages.Roact)
local v4 = v_u_3.Component:extend("NumberInput")
function v4.init(p5) -- name: init
	p5.state = {
		["Value"] = p5.props.DefaultValue
	}
end
function v4.render(p_u_6) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_7 = p_u_6.props
	return v_u_3.createElement("TextBox", {
		["Font"] = v_u_2.Font.Log,
		["Text"] = ("%*"):format(p_u_6.state.Value),
		["TextColor3"] = v_u_2.Color.Text,
		["TextSize"] = v_u_2.GeneralFormatting.NumberInputTextSize,
		["TextXAlignment"] = v_u_7.TextXAlignment or Enum.TextXAlignment.Center,
		["BackgroundColor3"] = v_u_2.Color.TextBoxGray,
		["BorderColor3"] = v_u_2.GeneralFormatting.LineColor,
		["LayoutOrder"] = v_u_7.LayoutOrder,
		["Size"] = v_u_7.Size,
		["ClearTextOnFocus"] = true,
		[v_u_3.Event.FocusLost] = function(p8)
			-- upvalues: (copy) p_u_6, (copy) v_u_7
			local v9 = p8.Text
			local v10 = tonumber(v9)
			if v10 == nil or v10 ~= v10 then
				p8.Text = ("%*"):format(p_u_6.state.Value)
			else
				if v_u_7.IntegerOnly then
					v10 = math.floor(v10)
				end
				local v11 = v_u_7.Range.Min
				local v12 = v_u_7.Range.Max
				local v13 = math.clamp(v10, v11, v12)
				p_u_6:setState({
					["Value"] = v13
				})
				p8.Text = ("%*"):format(v13)
				if v_u_7.OnNumberInputChanged then
					v_u_7.OnNumberInputChanged(v13)
				end
			end
		end
	})
end
return v4