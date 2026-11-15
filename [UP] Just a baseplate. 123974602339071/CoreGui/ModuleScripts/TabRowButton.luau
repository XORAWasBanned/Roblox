-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.TabRowButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Constants)
local v_u_4 = v_u_3.TabRowFormatting.HighlightHeight
local v_u_5 = v_u_3.TabRowFormatting.FrameHeight
return function(p6) -- name: TabRowButton
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	local v_u_7 = p6.index
	local v8 = p6.name
	local v9 = p6.textWidth
	local v10 = p6.padding
	local v11 = p6.isSelected
	local v12 = p6.layoutOrder
	local v_u_13 = p6.onTabButtonClicked
	local v14 = v9 + v10
	local v15 = v_u_3.TabRowFormatting.UnselectedTextTransparency
	if v11 then
		v15 = v_u_3.TabRowFormatting.SelectedTextTransparency
	end
	local v16 = v_u_2.createElement
	local v17 = "TextButton"
	local v18 = {
		["Text"] = v8,
		["TextSize"] = v_u_3.DefaultFontSize.TabBar,
		["Font"] = v_u_3.Font.TabBar,
		["TextScaled"] = false,
		["TextTransparency"] = v15,
		["Size"] = UDim2.new(0, v14, 0, v_u_5),
		["AutoButtonColor"] = false,
		["TextColor3"] = v_u_3.Color.Text,
		["BackgroundColor3"] = v_u_3.Color.UnselectedGray,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = v12,
		[v_u_2.Event.Activated] = function(_)
			-- upvalues: (copy) v_u_13, (copy) v_u_7
			v_u_13(v_u_7)
		end
	}
	local v19 = {}
	if v11 then
		v11 = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["Size"] = UDim2.new(1, 0, 0, -v_u_4),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["BackgroundColor3"] = v_u_3.Color.HighlightBlue
		})
	end
	v19.BlueHighlight = v11
	return v16(v17, v18, v19)
end