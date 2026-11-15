-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.ReportTextEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v4 = require(v1.Packages.Foundation)
local v_u_5 = v4.Utility.normalizeFontFace
local v_u_6 = v4.Utility.Flags.FoundationFontFaceMigration
local v_u_7 = v3.Core.Style.useStyle
return function(p_u_8) -- name: ReportTextEntry
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_6, (copy) v_u_5
	local v9 = v_u_7()
	local v10 = v9.Font.Body.Font
	local v11 = v9.Tokens.FontSize.FontSize_400
	local v12 = v9.Theme
	local v13 = v_u_2.createElement
	local v14 = "Frame"
	local v15 = {
		["Size"] = UDim2.new(1, 0, 0, 40 + v9.Tokens.Size.Size_600 + 20),
		["BackgroundTransparency"] = v9.Theme.BackgroundDefault.Transparency,
		["BackgroundColor3"] = v9.Theme.BackgroundUIDefault.Color,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v16 = {
		["UIPadding"] = v_u_2.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 10),
			["PaddingRight"] = UDim.new(0, 10),
			["PaddingTop"] = UDim.new(0, 10),
			["PaddingBottom"] = UDim.new(0, 10)
		}),
		["UICorner"] = v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 8)
		})
	}
	local v17 = v_u_2.createElement
	local v18 = "TextBox"
	local v19 = {
		["Size"] = UDim2.new(1, 0, 0, 40 + v9.Tokens.Size.Size_600),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["AnchorPoint"] = Vector2.new(0, 0),
		["BackgroundColor3"] = v12.BackgroundUIDefault.Color,
		["PlaceholderText"] = p_u_8.placeholderText
	}
	if v_u_6 then
		v10 = nil
	end
	v19.Font = v10
	local v20
	if v_u_6 then
		v20 = v_u_5(v9.Tokens.Typography.BodyLarge.Font)
	else
		v20 = nil
	end
	v19.FontFace = v20
	v19.Text = p_u_8.text
	v19.TextSize = v11
	v19.TextColor3 = v12.TextDefault.Color
	v19.TextTransparency = v12.TextDefault.Transparency
	v19.TextXAlignment = Enum.TextXAlignment.Left
	v19.TextYAlignment = Enum.TextYAlignment.Top
	v19.BackgroundTransparency = v12.BackgroundDefault.Transparency
	v19.BorderSizePixel = 0
	v19.LayoutOrder = 1
	v19.RichText = false
	v19.MultiLine = true
	v19.TextWrapped = true
	v19.ClearTextOnFocus = false
	v19.OverlayNativeInput = true
	v19[v_u_2.Event.FocusLost] = function() end
	v19[v_u_2.Event.Focused] = function() end
	v19[v_u_2.Change.AbsoluteSize] = function() end
	v19[v_u_2.Change.Text] = function(p21)
		-- upvalues: (copy) p_u_8
		if p_u_8.text ~= p21.Text then
			p_u_8.onUpdate(p21.Text)
		end
	end
	v16.AbuseReportsText = v17(v18, v19)
	return v13(v14, v15, v16)
end