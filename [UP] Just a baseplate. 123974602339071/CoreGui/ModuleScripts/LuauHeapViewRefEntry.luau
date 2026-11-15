-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LuauHeap.LuauHeapViewRefEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
require(script.Parent.LuauHeapTypes)
local v6 = require(script.Parent.Parent.Parent.Constants)
local v_u_7 = v6.GeneralFormatting.LineWidth
local v_u_8 = v6.GeneralFormatting.LineColor
local v_u_9 = v6.LuauHeapFormatting.RefEntryFrameHeight
local _ = v6.LuauHeapFormatting.DepthIndent
local v_u_10 = v6.LuauHeapFormatting.ValueCellWidth
local v_u_11 = v6.LuauHeapFormatting.CellPadding
local v_u_12 = v6.LuauHeapFormatting.ValuePadding
local v_u_13 = require(script.Parent.LuauHeapViewPathEntry)
local v14 = v_u_2.PureComponent:extend("LuauHeapViewRefEntry")
local function v_u_18(p15) -- name: BorderedCellLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_7, (copy) v_u_12, (copy) v_u_8
	local v16 = v_u_2.createFragment
	local v17 = {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = nil,
			["size"] = nil,
			["pos"] = nil,
			["richText"] = true,
			["text"] = p15.text,
			["size"] = p15.size,
			["pos"] = p15.pos
		}),
		["LeftBorder"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(UDim.new(0, v_u_7), p15.size.Y),
			["Position"] = UDim2.fromOffset(-v_u_12, 0) + p15.pos,
			["AnchorPoint"] = Vector2.new(0, 0),
			["BackgroundColor3"] = v_u_8
		})
	}
	return v16(v17)
end
function v14.init(p_u_19) -- name: init
	p_u_19.state = {
		["expanded"] = false
	}
	function p_u_19.onButtonPress()
		-- upvalues: (copy) p_u_19
		p_u_19:setState(function(p20)
			return {
				["expanded"] = not p20.expanded
			}
		end)
	end
end
function v14.renderValues(_, p21) -- name: renderValues
	-- upvalues: (copy) v_u_10, (copy) v_u_12, (copy) v_u_9, (copy) v_u_2, (copy) v_u_18
	local v22 = UDim2.new(v_u_10, -v_u_12, 0, v_u_9)
	local v23 = UDim2.new(1 - v_u_10 * #p21, v_u_12, 0, 0)
	local v24 = {}
	for v25, v26 in p21 do
		v24[tostring(v25)] = v_u_2.createElement(v_u_18, {
			["text"] = tostring(v26),
			["size"] = v22,
			["pos"] = v23 + UDim2.fromScale(v_u_10 * (v25 - 1), 0)
		})
	end
	return v24
end
function v14.renderChildren(p27, p28) -- name: renderChildren
	-- upvalues: (copy) v_u_2, (copy) v_u_13
	local v29 = {}
	if p27.state.expanded and p28 then
		for v30, v31 in ipairs(p28) do
			v29[v30] = v_u_2.createElement(v_u_13, {
				["layoutOrder"] = nil,
				["depth"] = 1,
				["name"] = nil,
				["data"] = nil,
				["layoutOrder"] = v30,
				["name"] = ("Path #%*"):format(v30),
				["data"] = v31
			})
		end
	end
	return v29
end
function v14.render(p32) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_11
	local v33 = p32.props
	local v34 = v33.size or UDim2.new(1, 0, 0, v_u_9)
	local v35 = v33.layoutOrder or 0
	local v36 = v33.data
	local v37 = { ("%*"):format(v36.Count), (("%*"):format(v36.Instances)) }
	local v38 = UDim.new(1 - v_u_10 * #v37, 0)
	local v39 = v_u_2.createElement
	local v40 = "Frame"
	local v41 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = v34,
		["LayoutOrder"] = v35,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v42 = {
		["layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v43 = v_u_2.createElement
	local v44 = v_u_5
	local v45 = {
		["size"] = nil,
		["inset"] = 0,
		["isExpanded"] = nil,
		["isExpandable"] = nil,
		["onButtonPress"] = nil,
		["layoutOrder"] = -1,
		["size"] = UDim2.new(1, 0, 0, v_u_9),
		["isExpanded"] = p32.state.expanded
	}
	local v46 = v36.Paths
	if v46 then
		v46 = #v36.Paths ~= 0
	end
	v45.isExpandable = v46
	v45.onButtonPress = p32.onButtonPress
	v42.button = v43(v44, v45, {
		["name"] = v_u_2.createElement(v_u_4, {
			["text"] = v36.Name,
			["size"] = UDim2.new(v38, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, v_u_11, 0, 0)
		}),
		["values"] = v_u_2.createFragment(p32:renderValues(v37))
	})
	v42.children = v_u_2.createFragment(p32:renderChildren(v36.Paths))
	return v39(v40, v41, v42)
end
return v14