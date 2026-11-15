-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.BoxButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(script.Parent.Parent.Constants)
local v_u_5 = v4.Font.MainWindowHeader
local v_u_6 = v4.DefaultFontSize.MainWindowHeader
local v_u_7 = v4.Color.Text
local v_u_8 = v4.Color.UnselectedGray
local v_u_9 = v4.Color.InactiveBox
return function(p_u_10) -- name: BoxButton
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_7, (copy) v_u_5, (copy) v_u_8, (copy) v_u_9
	local v11 = p_u_10.text
	local v12 = p_u_10.size
	local v13 = p_u_10.pos
	local _ = p_u_10.onClicked
	local v14 = p_u_10.enabled
	local v15 = typeof(v14) ~= "boolean" and true or p_u_10.enabled
	local v16 = v_u_2.useCallback(function()
		-- upvalues: (copy) p_u_10
		p_u_10.onClicked(p_u_10.text)
	end, { p_u_10.onClicked, p_u_10.text })
	local v17 = v_u_3.createElement
	local v18 = "TextButton"
	local v19 = {
		["Text"] = v11,
		["TextSize"] = v_u_6,
		["TextColor3"] = v_u_7,
		["Font"] = v_u_5,
		["Size"] = v12,
		["Position"] = v13,
		["AutoButtonColor"] = v15
	}
	local v20
	if v15 then
		v20 = v_u_8
	else
		v20 = v_u_9
	end
	v19.BackgroundColor3 = v20
	v19.Active = v15
	v19.BackgroundTransparency = 0
	v19[v_u_3.Event.Activated] = v16
	return v17(v18, v19)
end