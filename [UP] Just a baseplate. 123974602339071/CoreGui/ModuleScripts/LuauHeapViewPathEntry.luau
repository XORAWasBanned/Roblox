-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.LuauHeapViewPathEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
require(script.Parent.LuauHeapTypes)
local v6 = require(script.Parent.Parent.Parent.Constants)
local _ = v6.GeneralFormatting.LineWidth
local _ = v6.GeneralFormatting.LineColor
local v_u_7 = v6.LuauHeapFormatting.PathEntryFrameHeight
local v_u_8 = v6.LuauHeapFormatting.DepthIndent
local _ = v6.LuauHeapFormatting.ValueCellWidth
local v_u_9 = v6.LuauHeapFormatting.CellPadding
local _ = v6.LuauHeapFormatting.ValuePadding
local v10 = v_u_2.PureComponent:extend("LuauHeapViewPathEntry")
function v10.init(p_u_11) -- name: init
	p_u_11.state = {
		["expanded"] = false
	}
	function p_u_11.onButtonPress()
		-- upvalues: (copy) p_u_11
		p_u_11:setState(function(p12)
			return {
				["expanded"] = not p12.expanded
			}
		end)
	end
end
function v10.renderChildren(p13, p14) -- name: renderChildren
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_4, (copy) v_u_7
	local v15 = {}
	local v16 = 2 * v_u_8 + v_u_9
	if p13.state.expanded and p14 then
		for v17, v18 in ipairs(p14) do
			v15[v17] = v_u_2.createElement(v_u_4, {
				["text"] = v18,
				["layoutOrder"] = v17,
				["size"] = UDim2.new(UDim.new(1, -v16), UDim.new(0, v_u_7)),
				["pos"] = UDim2.new(0, v16, 0, 0)
			})
		end
	end
	return v15
end
function v10.render(p19) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_9
	local v20 = p19.props
	local v21 = v20.size or UDim2.new(1, 0, 0, v_u_7)
	local v22 = v20.layoutOrder or 0
	local v23 = v20.name
	local v24 = v20.data
	local v25 = v20.depth * v_u_8
	local v26 = v_u_2.createElement
	local v27 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = v21,
		["LayoutOrder"] = v22,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v28 = {
		["layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["button"] = v_u_2.createElement(v_u_5, {
			["size"] = nil,
			["inset"] = nil,
			["isExpanded"] = nil,
			["isExpandable"] = nil,
			["onButtonPress"] = nil,
			["layoutOrder"] = -1,
			["size"] = UDim2.new(1, 0, 0, v_u_7),
			["inset"] = v25,
			["isExpanded"] = p19.state.expanded,
			["isExpandable"] = #v24 ~= 0,
			["onButtonPress"] = p19.onButtonPress
		}, {
			["name"] = v_u_2.createElement(v_u_4, {
				["text"] = v23,
				["size"] = UDim2.new(UDim.new(1, -v25), UDim.new(1, 0)),
				["pos"] = UDim2.new(0, v_u_9 + v25, 0, 0)
			})
		}),
		["children"] = v_u_2.createFragment(p19:renderChildren(v24))
	}
	return v26("Frame", v27, v28)
end
return v10