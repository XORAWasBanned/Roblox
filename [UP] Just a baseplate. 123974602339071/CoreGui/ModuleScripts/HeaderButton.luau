-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.HeaderButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Constants)
local v_u_4 = v3.Font.MainWindowHeader
local v_u_5 = v3.DefaultFontSize.MainWindowHeader
local v_u_6 = v3.Color.Text
return function(p7) -- name: HeaderButton
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	local v_u_8 = p7.text
	local v9 = p7.size
	local v10 = p7.pos
	local v_u_11 = p7.sortfunction
	return v_u_2.createElement("TextButton", {
		["Text"] = v_u_8,
		["TextSize"] = v_u_5,
		["TextColor3"] = v_u_6,
		["Font"] = v_u_4,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Size"] = v9,
		["Position"] = v10,
		["BackgroundTransparency"] = 1,
		[v_u_2.Event.Activated] = function()
			-- upvalues: (copy) v_u_11, (copy) v_u_8
			if v_u_11 then
				v_u_11(v_u_8)
			end
		end
	})
end