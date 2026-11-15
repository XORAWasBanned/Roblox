-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.CellLabel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Constants)
local v_u_4 = v3.DefaultFontSize.MainWindow
local v_u_5 = v3.Color.Text
local v_u_6 = v3.Font.MainWindow
local v_u_7 = v3.Font.MainWindowBold
return function(p8) -- name: CellLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6
	local v9 = p8.text
	local v10 = p8.size
	local v11 = p8.pos
	local v12 = p8.bold
	local v13 = p8.layoutOrder
	local v14 = p8.richText
	local v15 = p8.textWrapped == nil and true or p8.textWrapped
	local v16
	if p8.textTruncate == nil then
		v16 = nil
	else
		v16 = p8.textTruncate
	end
	return v_u_2.createElement("TextLabel", {
		["Text"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["TextWrapped"] = nil,
		["TextTruncate"] = nil,
		["Font"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["RichText"] = nil,
		["Text"] = v9,
		["TextSize"] = v_u_4,
		["TextColor3"] = v_u_5,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextWrapped"] = v15,
		["TextTruncate"] = v16,
		["Font"] = v12 and v_u_7 or v_u_6,
		["Size"] = v10,
		["Position"] = v11,
		["LayoutOrder"] = v13,
		["RichText"] = v14
	})
end