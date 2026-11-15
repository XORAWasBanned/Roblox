-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlEntry
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.t
local v5 = v2.UIBlox
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.GlobalConfig)
local v_u_8 = require(v6.Components.ThemedTextLabel)
local v_u_9 = v5.App.Menu.KeyLabel
local v_u_10 = require(v6.Components.PointerLabel)
local v_u_11 = require(v6.Components.Divider)
local v_u_12 = require(v6.Localization.withLocalization)
local v_u_13 = v4.strictInterface({
	["actionDescription"] = v4.string,
	["inputs"] = v4.table,
	["isList"] = v4.optional(v4.boolean),
	["hasDivider"] = v4.boolean,
	["LayoutOrder"] = v4.integer
})
local function v_u_18(p14, p15, p16) -- name: renderHorizontalSpacer
	-- upvalues: (copy) v_u_3, (copy) v_u_8
	local v17 = p16 and UDim2.new(0, 19, 0, 24) or UDim2.new(0, 19, 0, 16)
	if p16 then
		p16 = Enum.TextYAlignment.Bottom
	end
	return v_u_3.createElement(v_u_8, {
		["themeKey"] = "TextEmphasis",
		["fontKey"] = "Header1",
		["Text"] = nil,
		["Size"] = nil,
		["TextYAlignment"] = nil,
		["LayoutOrder"] = nil,
		["Text"] = p14,
		["Size"] = v17,
		["TextYAlignment"] = p16,
		["LayoutOrder"] = p15
	})
end
local function v_u_21(p19, p20) -- name: renderKey
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_10
	if p19.EnumType == Enum.KeyCode then
		return v_u_3.createElement(v_u_9, {
			["keyCode"] = nil,
			["textThemeKey"] = "TextEmphasis",
			["LayoutOrder"] = nil,
			["keyCode"] = p19,
			["LayoutOrder"] = p20
		})
	else
		return v_u_3.createElement(v_u_10, {
			["input"] = p19,
			["LayoutOrder"] = p20
		})
	end
end
local function v_u_35(p22, p23) -- name: renderInputIconContainer
	-- upvalues: (copy) v_u_3, (copy) v_u_21, (copy) v_u_18, (copy) v_u_8
	local v24 = {
		["ListLayout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, p23 and 0 or 7)
		})
	}
	local v25 = 1
	for v26, v27 in ipairs(p22) do
		if typeof(v27) == "table" then
			for v28, v29 in ipairs(v27) do
				local v30 = string.format("%d_%d", v26, v28)
				v24["groupedInput" .. v30] = v_u_21(v29, v25)
				v25 = v25 + 1
				if v28 >= #v27 then
					continue
				end
				local v31 = "groupedDivider" .. v30
				local v32 = {
					["themeKey"] = "TextEmphasis",
					["fontKey"] = "Header1",
					["Text"] = "+",
					["Size"] = nil,
					["TextYAlignment"] = nil,
					["LayoutOrder"] = nil,
					["Size"] = UDim2.new(0, 19, 0, 16),
					["LayoutOrder"] = v25
				}
				v24[v31] = v_u_3.createElement(v_u_8, v32)
				v25 = v25 + 1
			end
		else
			v24["input" .. v26] = v_u_21(v27, v25)
			v25 = v25 + 1
			if p23 and v26 == #p22 then
				v24.Elipses = v_u_18("...", v25, true)
			end
		end
		if p23 or v26 >= #p22 then
			continue
		end
		local v33 = "divider" .. v26
		local v34 = {
			["themeKey"] = "TextEmphasis",
			["fontKey"] = "Header1",
			["Text"] = "/",
			["Size"] = nil,
			["TextYAlignment"] = nil,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(0, 19, 0, 16),
			["LayoutOrder"] = v25
		}
		v24[v33] = v_u_3.createElement(v_u_8, v34)
		v25 = v25 + 1
	end
	return v_u_3.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(0, 0, 1, 0),
		["Position"] = UDim2.new(1, 0, 0, 0)
	}, v24)
end
return function(p_u_36) -- name: ControlEntry
	-- upvalues: (copy) v_u_7, (copy) v_u_13, (copy) v_u_12, (copy) v_u_3, (copy) v_u_8, (copy) v_u_11, (copy) v_u_35
	if v_u_7.propValidation then
		local v37 = v_u_13
		assert(v37(p_u_36))
	end
	return v_u_12({
		["actionDescription"] = p_u_36.actionDescription
	})(function(p38)
		-- upvalues: (ref) v_u_3, (copy) p_u_36, (ref) v_u_8, (ref) v_u_11, (ref) v_u_35
		local v39 = v_u_3.createElement
		local v40 = "Frame"
		local v41 = {
			["LayoutOrder"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = p_u_36.LayoutOrder,
			["Size"] = UDim2.new(1, 0, 0, 50)
		}
		local v42 = {
			["ActionLabel"] = v_u_3.createElement(v_u_8, {
				["fontKey"] = "Header2",
				["themeKey"] = "TextEmphasis",
				["TextXAlignment"] = nil,
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Text"] = nil,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Size"] = UDim2.new(0, 200, 0, 22),
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, 0, 0.5, 0),
				["Text"] = p38.actionDescription
			})
		}
		local v43 = p_u_36.hasDivider
		if v43 then
			v43 = v_u_3.createElement(v_u_11, {
				["Size"] = UDim2.new(1, 0, 0, 1),
				["Position"] = UDim2.new(0, 0, 1, -1)
			})
		end
		v42.Divider = v43
		v42.Inputs = v_u_35(p_u_36.inputs, p_u_36.isList)
		return v39(v40, v41, v42)
	end)
end