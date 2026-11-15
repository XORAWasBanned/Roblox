-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.CollapsibleSection
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
local v_u_6 = require(script.Parent.Parent.Parent.Constants).GeneralFormatting.MainRowPadding
local v7 = v_u_2.PureComponent:extend("CollapsibleSection")
function v7.init(p_u_8) -- name: init
	p_u_8.state = {
		["expanded"] = p_u_8.props.defaultExpanded == nil and true or p_u_8.props.defaultExpanded
	}
	function p_u_8.onButtonPress()
		-- upvalues: (copy) p_u_8
		p_u_8:setState(function(p9)
			return {
				["expanded"] = not p9.expanded
			}
		end)
	end
end
function v7.render(p10) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v11 = p10.props.title
	local v12 = p10.props.layoutOrder
	local v13 = p10.state.expanded
	local v14 = p10.props.hideLines
	local v15 = v_u_2.createElement
	local v16 = "Frame"
	local v17 = {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = v12
	}
	local v18 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_6)
		}),
		["Header"] = v_u_2.createElement(v_u_5, {
			["size"] = nil,
			["isExpanded"] = nil,
			["isExpandable"] = true,
			["hideLines"] = nil,
			["onButtonPress"] = nil,
			["layoutOrder"] = 1,
			["size"] = UDim2.new(1, 0, 0, 20),
			["isExpanded"] = v13,
			["hideLines"] = v14,
			["onButtonPress"] = p10.onButtonPress
		}, {
			["Label"] = v_u_2.createElement(v_u_4, {
				["text"] = nil,
				["bold"] = true,
				["size"] = nil,
				["pos"] = nil,
				["text"] = v11,
				["size"] = UDim2.new(1, -20, 1, 0),
				["pos"] = UDim2.new(0, 20, 0, 0)
			})
		})
	}
	local v19
	if v13 then
		v19 = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}, {
			["UIListLayout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, v_u_6)
			}),
			["Children"] = v_u_2.createFragment(p10.props[v_u_2.Children] or {})
		}) or nil
	else
		v19 = nil
	end
	v18.Content = v19
	return v15(v16, v17, v18)
end
return v7