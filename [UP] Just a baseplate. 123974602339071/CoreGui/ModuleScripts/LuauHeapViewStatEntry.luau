-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.LuauHeapViewStatEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
require(script.Parent.LuauHeapTypes)
local v6 = require(script.Parent.Parent.Parent.Constants)
local v_u_7 = v6.GeneralFormatting.LineWidth
local v_u_8 = v6.GeneralFormatting.LineColor
local v_u_9 = v6.LuauHeapFormatting.StatEntryFrameHeight
local _ = v6.LuauHeapFormatting.DepthIndent
local v_u_10 = v6.LuauHeapFormatting.ValueCellWidth
local v_u_11 = v6.LuauHeapFormatting.CellPadding
local v_u_12 = v6.LuauHeapFormatting.ValuePadding
local v13 = v_u_2.PureComponent:extend("LuauHeapViewStatEntry")
local function v_u_17(p14) -- name: BorderedCellLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_7, (copy) v_u_12, (copy) v_u_8
	local v15 = v_u_2.createFragment
	local v16 = {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = nil,
			["size"] = nil,
			["pos"] = nil,
			["richText"] = true,
			["text"] = p14.text,
			["size"] = p14.size,
			["pos"] = p14.pos
		}),
		["LeftBorder"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(UDim.new(0, v_u_7), p14.size.Y),
			["Position"] = UDim2.fromOffset(-v_u_12, 0) + p14.pos,
			["AnchorPoint"] = Vector2.new(0, 0),
			["BackgroundColor3"] = v_u_8
		})
	}
	return v15(v16)
end
function v13.renderValues(_, p18) -- name: renderValues
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_9, (copy) v_u_2, (copy) v_u_17
	local v19 = UDim2.new(v_u_10, -v_u_12, 0, v_u_9)
	local v20 = UDim2.new(1 - v_u_10 * #p18, v_u_12, 0, 0)
	local v21 = {}
	for v22, v23 in p18 do
		v21[tostring(v22)] = v_u_2.createElement(v_u_17, {
			["text"] = tostring(v23),
			["size"] = v19,
			["pos"] = v20 + UDim2.fromScale(v_u_10 * (v22 - 1), 0)
		})
	end
	return v21
end
function v13.render(p24) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_11
	local v25 = p24.props
	local v26 = v25.size or UDim2.new(1, 0, 0, v_u_9)
	local v27 = v25.layoutOrder or 0
	local v28 = v25.data
	local v29 = v25.compare
	local v30 = string.format("%.0f", v28.Size)
	local v31 = string.format("%.0f", v28.Count)
	if v29 then
		if v29.Size ~= v28.Size then
			v30 = string.format("%d <font color=\"#%s\">(%s%d)</font>", v28.Size, v29.Size > v28.Size and "0f0" or "f00", v29.Size > v28.Size and "" or "+", v28.Size - v29.Size)
		end
		if v29.Count ~= v28.Count then
			v31 = string.format("%d <font color=\"#%s\">(%s%d)</font>", v28.Count, v29.Count > v28.Count and "0f0" or "f00", v29.Count > v28.Count and "" or "+", v28.Count - v29.Count)
		end
	end
	local v32 = { v30, v31 }
	local v33 = UDim.new(1 - v_u_10 * #v32, 0)
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = v26,
		["LayoutOrder"] = v27,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}, {
		["layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["button"] = v_u_2.createElement(v_u_5, {
			["size"] = nil,
			["inset"] = 0,
			["isExpanded"] = false,
			["isExpandable"] = false,
			["layoutOrder"] = -1,
			["size"] = UDim2.new(1, 0, 0, v_u_9)
		}, {
			["name"] = v_u_2.createElement(v_u_4, {
				["text"] = v28.Name,
				["size"] = UDim2.new(v33, UDim.new(1, 0)),
				["pos"] = UDim2.new(0, v_u_11, 0, 0)
			}),
			["values"] = v_u_2.createFragment(p24:renderValues(v32))
		})
	})
end
return v13