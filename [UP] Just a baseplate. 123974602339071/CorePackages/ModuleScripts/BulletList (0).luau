-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.Components.BulletList
local v1 = script:FindFirstAncestor("MarkdownCore").Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.Dash)
local v_u_4 = require(v1.Foundation)
local v_u_5 = v_u_3.map
local v6 = script:FindFirstAncestor("MarkdownCore")
local v_u_7 = require(v6.Flags)
local v_u_8 = v_u_4.View
local v_u_9 = v_u_4.Image
local v_u_10 = v_u_4.Text
local v_u_11 = v_u_4.Utility.Flags
local v_u_12 = {
	["ItemOffset"] = 12,
	["MarkerImage"] = "rbxasset://textures/StudioSharedUI/dot.png",
	["MarkerSize"] = 4,
	["Padding"] = 6,
	["LineHeight"] = 18,
	["Font"] = nil,
	["TextColor"] = nil,
	["TextSize"] = 18,
	["ItemIndentation"] = 0,
	["SubItemStyle"] = nil,
	["Font"] = Enum.Font.BuilderSans,
	["TextColor"] = Color3.fromRGB(0, 0, 0),
	["SubItemStyle"] = {
		["ItemIndentation"] = 20,
		["ItemOffset"] = 12
	}
}
return function(p13) -- name: BulletList
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3
	local v14 = v_u_4.Hooks.useTokens()
	local v_u_15 = p13.TextWrapped
	local v_u_16 = p13.TextTruncate
	local v_u_17 = p13.ListStyle or v_u_12
	local v18 = p13.Items
	local v_u_19 = v_u_17.ItemIndentation or v_u_12.ItemIndentation
	local v20 = v14.Gap.Small
	local v21 = (v_u_17.MarkerSize or v_u_12.MarkerSize) + v20
	local v_u_22 = UDim2.new(1, -v21, 0, 0)
	local v_u_23, v_u_24, v_u_25, v_u_26
	if v_u_7.FFlagMarkdownAssistantParity then
		local v27 = v14.Typography.BodyMedium
		v_u_23 = v_u_17.Font or v27.Font
		v_u_24 = v_u_17.TextSize or v27.FontSize
		v_u_25 = v_u_17.TextColor or v14.Color.Content.Default.Color3
		v_u_26 = v_u_17.LineHeight or v_u_24 * v27.LineHeight
	else
		v_u_23 = v_u_17.Font or v_u_12.Font
		v_u_24 = v_u_17.TextSize or v_u_12.TextSize
		v_u_25 = v_u_17.TextColor or v_u_12.TextColor
		v_u_26 = v_u_17.LineHeight or v_u_12.LineHeight
	end
	local v55 = v_u_5(v18, function(p28, p29)
		-- upvalues: (copy) v_u_19, (copy) v_u_17, (ref) v_u_12, (ref) v_u_2, (ref) v_u_10, (ref) v_u_11, (ref) v_u_23, (ref) v_u_24, (copy) v_u_22, (ref) v_u_25, (copy) v_u_16, (copy) v_u_15, (ref) v_u_8, (ref) v_u_26, (ref) v_u_9
		local v30 = v_u_19
		local v31 = v_u_17.MarkerImage or v_u_12.MarkerImage
		local v32 = nil
		local v33 = nil
		local v34
		if type(p28) == "string" then
			local v35 = v_u_2.createElement
			local v36 = v_u_10
			local v37 = {
				["AutomaticSize"] = nil,
				["Font"] = nil,
				["fontStyle"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Text"] = nil,
				["TextColor"] = nil,
				["textStyle"] = nil,
				["TextSize"] = nil,
				["TextTruncate"] = nil,
				["TextWrapped"] = nil,
				["Padding"] = nil,
				["TextXAlignment"] = nil,
				["AutomaticSize"] = Enum.AutomaticSize.XY
			}
			local v38
			if v_u_11.FoundationFontFaceMigration then
				v38 = nil
			else
				v38 = v_u_23
			end
			v37.Font = v38
			v37.fontStyle = v_u_11.FoundationFontFaceMigration and {
				["Font"] = v_u_23,
				["FontSize"] = v_u_24
			} or nil
			v37.Size = v_u_22
			v37.Text = p28
			local v39
			if v_u_11.FoundationFontFaceMigration then
				v39 = nil
			else
				v39 = v_u_25
			end
			v37.TextColor = v39
			v37.textStyle = v_u_11.FoundationFontFaceMigration and {
				["Color3"] = v_u_25
			} or nil
			local v40
			if v_u_11.FoundationFontFaceMigration then
				v40 = nil
			else
				v40 = v_u_24
			end
			v37.TextSize = v40
			v37.TextTruncate = v_u_16
			v37.TextWrapped = v_u_15
			v37.Padding = v_u_17.Padding or v_u_12.Padding
			v37.TextXAlignment = Enum.TextXAlignment.Left
			v34 = v35(v36, v37)
		elseif typeof(p28) == "table" and p28.Text then
			v33 = p28.Prefix
			local v41 = v_u_17.SubItemStyle
			local v42 = UDim2.new(1, -v41.ItemOffset or v_u_12.SubItemStyle.ItemOffset, 0, 0)
			local v43 = v41.ItemIndentation or v30
			v31 = v41.MarkerStyle or v31
			if v43 then
				v32 = v_u_2.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, v43)
				})
			end
			v34 = v_u_2.createElement(v_u_10, {
				["AutomaticSize"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["textStyle"] = nil,
				["FontStyle"] = nil,
				["fontStyle"] = nil,
				["Text"] = nil,
				["TextWrapped"] = nil,
				["TextTruncate"] = nil,
				["TextXAlignment"] = nil,
				["AutomaticSize"] = Enum.AutomaticSize.XY,
				["Size"] = v42,
				["textStyle"] = {
					["Color3"] = v_u_25
				},
				["FontStyle"] = not v_u_11.FoundationFontFaceMigration and {
					["Font"] = v_u_23,
					["FontSize"] = v_u_24
				} or nil,
				["fontStyle"] = v_u_11.FoundationFontFaceMigration and {
					["Font"] = v_u_23,
					["FontSize"] = v_u_24
				} or nil,
				["Text"] = p28.Text,
				["TextWrapped"] = v_u_15,
				["TextTruncate"] = v_u_16,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		elseif typeof(p28) == "table" and p28.Item then
			v33 = p28.Prefix
			v34 = v_u_2.createElement(v_u_8, {
				["tag"] = "auto-y",
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Size"] = v_u_22
			}, {
				["ContentElement"] = p28.Item
			})
		else
			local v44 = {
				["tag"] = "auto-y",
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Size"] = v_u_22
			}
			v34 = v_u_2.createElement(v_u_8, v44, {
				["ContentElement"] = p28
			})
		end
		local v45 = v_u_2.createElement
		local v46 = v_u_8
		local v47 = {
			["key"] = nil,
			["testId"] = "--markdown--bullet-list-item",
			["LayoutOrder"] = nil,
			["tag"] = "gap-xsmall auto-xy row align-x-left align-y-top",
			["key"] = tostring(p29),
			["LayoutOrder"] = p29
		}
		local v48 = {}
		local v49 = v_u_2.createElement
		local v50 = v_u_8
		local v51 = {
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromOffset(v_u_17.MarkerSize or v_u_12.MarkerSize, v_u_26)
		}
		local v52 = {}
		local v53 = v33 and not v33:find("^*")
		if v53 then
			v53 = not v33:find("^-")
		end
		local v54
		if v53 then
			v54 = v_u_2.createElement(v_u_10, {
				["tag"] = "position-center-left anchor-center-left",
				["Text"] = nil,
				["fontStyle"] = nil,
				["textStyle"] = nil,
				["Size"] = nil,
				["Text"] = ("%*."):format(v33),
				["fontStyle"] = {
					["Font"] = v_u_23,
					["FontSize"] = v_u_24
				},
				["textStyle"] = {
					["Color3"] = v_u_25
				},
				["Size"] = UDim2.fromOffset(v_u_17.MarkerSize or v_u_12.MarkerSize, v_u_17.MarkerSize or v_u_12.MarkerSize)
			})
		else
			v54 = v_u_2.createElement(v_u_9, {
				["tag"] = "position-center-left anchor-center-left",
				["Image"] = nil,
				["imageStyle"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = nil,
				["Image"] = v31,
				["imageStyle"] = {
					["Color3"] = v_u_25
				},
				["Size"] = UDim2.fromOffset(v_u_17.MarkerSize or v_u_12.MarkerSize, v_u_17.MarkerSize or v_u_12.MarkerSize)
			})
		end
		v52.Image = v54
		v48.Marker = v49(v50, v51, v52)
		v48.Content = v34
		v48.Padding = v32
		return v45(v46, v47, v48)
	end)
	local v56 = p13.Size
	local v57 = p13.Position
	local v58 = Enum.AutomaticSize.XY
	if v56 and (v56.X.Scale > 0 or v56.X.Offset > 0) then
		v58 = Enum.AutomaticSize.Y
	end
	return v_u_2.createElement(v_u_8, {
		["testId"] = "--markdown--bullet-list",
		["tag"] = "col align-x-left gap-xsmall",
		["AutomaticSize"] = nil,
		["backgroundStyle"] = nil,
		["LayoutOrder"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = v58,
		["backgroundStyle"] = {
			["Transparency"] = 1
		},
		["LayoutOrder"] = p13.LayoutOrder or 1,
		["Position"] = v57,
		["Size"] = v56
	}, v_u_3.assign(v55, p13.children or {}))
end