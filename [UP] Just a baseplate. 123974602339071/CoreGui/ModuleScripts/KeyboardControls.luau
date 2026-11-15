-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ControlsPage.ControlLayouts.KeyboardControls
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.InGameMenuDependencies).Roact
local v3 = script.Parent.Parent.Parent.Parent
local v_u_4 = require(v3.Resources.Controls)
local v_u_5 = require(script.Parent.Parent.ControlLayoutContainer)
local v_u_6 = require(v3.Components.PaddedScrollFrame)
local v_u_7 = require(script.Parent.Parent.ControlEntry)
local v_u_8 = require(script.Parent.Parent.ControlEntryHeader)
return function(_) -- name: KeyboardControls
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	local v9 = {
		["ListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Padding"] = v_u_2.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 95),
			["PaddingRight"] = UDim.new(0, 95)
		}),
		["SizeConstraint"] = v_u_2.createElement("UISizeConstraint", {
			["MaxSize"] = Vector2.new(1090, (1 / 0)),
			["MinSize"] = Vector2.new(150, 0)
		})
	}
	local v10 = 0
	local v11 = 1
	local v12 = 0
	for _, v13 in ipairs(v_u_4.keybinds) do
		local v14 = v13.title
		v10 = v10 + 1
		v9[v14 .. "_header"] = v_u_2.createElement(v_u_8, {
			["title"] = v14,
			["LayoutOrder"] = v11
		})
		v11 = v11 + 1
		for v15, v16 in ipairs(v13.controls) do
			v12 = v12 + 1
			v9[v14 .. "_" .. v15] = v_u_2.createElement(v_u_7, {
				["LayoutOrder"] = v11,
				["actionDescription"] = v16.desc,
				["inputs"] = v16.inputs,
				["isList"] = v16.list,
				["hasDivider"] = v15 ~= #v13.controls
			})
			v11 = v11 + 1
		end
	end
	local v17 = v10 * 45 + v12 * 50
	return v_u_2.createElement(v_u_5, {
		["titleText"] = "CoreScripts.InGameMenu.Controls.KeyboardAndMouseTitle"
	}, {
		["ScrollContent"] = v_u_2.createElement(v_u_6, {
			["CanvasSize"] = UDim2.new(0, 0, 0, v17),
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["Size"] = UDim2.new(1, 0, 1, -130)
		}, {
			["ListContainer"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0),
				["Position"] = UDim2.new(0.5, 0, 0, 0)
			}, v9)
		})
	})
end