-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.FreezeToggle
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = UDim.new(0, 6)
return function(p5) -- name: FreezeToggle
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v6 = v_u_2.createElement
	local v7 = {
		["Text"] = p5.frozen and "Frozen" or "Freeze",
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["Size"] = UDim2.new(0, 0, 0, 16),
		["LayoutOrder"] = p5.layoutOrder,
		["Font"] = v_u_3.Font.MainWindow,
		["TextSize"] = v_u_3.DefaultFontSize.MainWindow + -2,
		["TextColor3"] = p5.frozen and v_u_3.Color.HighlightBlue or v_u_3.Color.Text,
		["BackgroundColor3"] = v_u_3.Color.UnselectedGray,
		["BorderSizePixel"] = 1,
		["BorderColor3"] = v_u_3.Color.Text,
		[v_u_2.Event.Activated] = p5.onToggle
	}
	local v8 = {}
	local v9 = {
		["PaddingLeft"] = v_u_4,
		["PaddingRight"] = v_u_4
	}
	v8.Padding = v_u_2.createElement("UIPadding", v9)
	return v6("TextButton", v7, v8)
end