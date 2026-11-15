-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.VoiceSourceToggle
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Parent.Constants)
local v4 = require(script.Parent.VoiceDebugSource)
local v_u_5 = {
	{
		["source"] = nil,
		["label"] = "In-experience",
		["source"] = v4.InExperience
	},
	{
		["source"] = nil,
		["label"] = "Party voice",
		["source"] = v4.Party
	}
}
local v_u_6 = UDim.new(0, 8)
local function v_u_18(p7, p8, p9, p10) -- name: Segment
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_6
	local v11 = p8 and v_u_3.Color.Text or v_u_3.Color.BorderGray
	local v12 = v_u_2.createElement
	local v13 = "TextButton"
	local v14 = {
		["Text"] = p7.label,
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["Size"] = UDim2.new(0, 0, 0, 20),
		["LayoutOrder"] = p9,
		["Font"] = v_u_3.Font.MainWindow,
		["TextSize"] = v_u_3.DefaultFontSize.MainWindow + -2,
		["TextColor3"] = v11,
		["BackgroundTransparency"] = 1,
		["AutoButtonColor"] = false,
		[v_u_2.Event.Activated] = p10
	}
	local v15 = {}
	local v16 = {
		["PaddingLeft"] = v_u_6,
		["PaddingRight"] = v_u_6
	}
	v15.Padding = v_u_2.createElement("UIPadding", v16)
	local v17
	if p8 then
		v17 = v_u_2.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0.5, 1),
			["Position"] = UDim2.new(0.5, 0, 1, 0),
			["Size"] = UDim2.new(1, -8, 0, 2),
			["BackgroundColor3"] = v_u_3.Color.SelectedBlue
		}) or nil
	else
		v17 = nil
	end
	v15.Underline = v17
	return v12(v13, v14, v15)
end
return function(p_u_19) -- name: VoiceSourceToggle
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_18
	local v20 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	for v21, v_u_22 in v_u_5 do
		v20[v_u_22.source] = v_u_18(v_u_22, p_u_19.source == v_u_22.source, v21, function()
			-- upvalues: (copy) p_u_19, (copy) v_u_22
			local v23 = p_u_19.source
			local v24 = v_u_22.source
			if v23 == v24 then
				v24 = nil
			end
			if v24 then
				p_u_19.onSourceChanged(v24)
			end
		end)
	end
	return v_u_2.createElement("Frame", {
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["Size"] = UDim2.new(0, 0, 0, 20),
		["LayoutOrder"] = p_u_19.layoutOrder
	}, v20)
end