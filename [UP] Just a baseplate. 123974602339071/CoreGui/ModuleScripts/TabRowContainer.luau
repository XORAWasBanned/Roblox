-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.TabRowContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v_u_4 = game:GetService("TextService")
local v_u_5 = require(script.Parent.Parent.Actions.SetActiveTab)
local v_u_6 = require(script.Parent.TabRowButton)
local v_u_7 = require(script.Parent.DropDown)
local v_u_8 = require(script.Parent.FullScreenDropDownButton)
local v_u_9 = require(script.Parent.Parent.Constants)
local v_u_10 = v_u_9.TabRowFormatting.TabDropDownWidth
local v_u_11 = v_u_9.TabRowFormatting.TabOverlapThreshold
local v12 = v_u_2.Component:extend("TabRowContainer")
local function v_u_19(p13) -- name: initTabList
	-- upvalues: (copy) v_u_4, (copy) v_u_9
	local v14 = {}
	local v15 = 0
	local v16 = 0
	for v17, _ in pairs(p13) do
		local v18 = v_u_4:GetTextSize(v17, v_u_9.DefaultFontSize.TabBar, v_u_9.Font.TabBar, Vector2.new(0, 0))
		v14[v17] = v18.X
		v15 = v15 + v18.X
		v16 = v16 + 1
	end
	return v14, v15, v16
end
function v12.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_19
	local v21, v22, v23 = v_u_19(p_u_20.props.tabList)
	p_u_20.state = {
		["textWidths"] = nil,
		["totalTextLength"] = nil,
		["totalTabCount"] = nil,
		["currContainerWidth"] = 0,
		["textWidths"] = v21,
		["totalTextLength"] = v22,
		["totalTabCount"] = v23
	}
	function p_u_20.onTabButtonClicked(p24)
		-- upvalues: (copy) p_u_20
		for v25, v26 in pairs(p_u_20.props.tabList) do
			if v26.layoutOrder ~= p24 then
				continue
			end
			p_u_20.props.dispatchSetActiveTab(v25, v26.hasClientServer)
			return
		end
	end
end
function v12.didUpdate(p27, p28, _) -- name: didUpdate
	-- upvalues: (copy) v_u_19
	if p28.tabList ~= p27.props.tabList then
		local v29, v30, v31 = v_u_19(p27.props.tabList)
		p27:setState({
			["textWidths"] = v29,
			["totalTextLength"] = v30,
			["totalTabCount"] = v31
		})
	end
end
function v12.render(p32) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_2, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6
	local v33 = p32.props.tabList
	local v34 = p32.props.currTabIndex
	local v35 = p32.props.formFactor
	local v36 = p32.props.windowWidth
	local v37 = p32.props.frameHeight
	local v38 = p32.props.layoutOrder
	local v39 = p32.state.textWidths
	local v40 = p32.state.totalTextLength
	local v41 = p32.state.totalTabCount
	local v42 = {}
	local v43 = (v36 - v40) / v41
	local v44 = v43 % 1 * v41 / 2
	local v45
	if v43 < v_u_11 then
		v45 = v36 > 0
	else
		v45 = false
	end
	local v46 = v35 == v_u_9.FormFactor.Small
	if v33 then
		if v45 or v46 then
			local v47 = v33[v34].layoutOrder
			local v48 = {}
			for v49, v50 in pairs(v33) do
				v48[v50.layoutOrder] = v49
			end
			if v46 then
				return v_u_2.createElement(v_u_8, {
					["buttonSize"] = UDim2.new(0, v_u_10, 0, v37),
					["dropDownList"] = v48,
					["selectedIndex"] = v47,
					["onSelection"] = p32.onTabButtonClicked,
					["layoutOrder"] = v38
				})
			end
			if v45 then
				return v_u_2.createElement(v_u_7, {
					["buttonSize"] = UDim2.new(0, v_u_10, 0, v37),
					["dropDownList"] = v48,
					["selectedIndex"] = v47,
					["onSelection"] = p32.onTabButtonClicked
				})
			end
		else
			for v51, v52 in pairs(v33) do
				if not v39[v51] then
					continue
				end
				v42[v51] = v_u_2.createElement(v_u_6, {
					["index"] = v52.layoutOrder,
					["name"] = v51,
					["padding"] = v43,
					["textWidth"] = v45 and v_u_10 or v39[v51],
					["isSelected"] = v51 == v34,
					["layoutOrder"] = v52.layoutOrder,
					["onTabButtonClicked"] = p32.onTabButtonClicked
				})
			end
		end
		v42.UIListLayout = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["FillDirection"] = Enum.FillDirection.Horizontal
		})
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["Transparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v37),
		["Position"] = UDim2.new(0, v44, 0, 0),
		["LayoutOrder"] = v38
	}, v42)
end
return v3.UNSTABLE_connect2(function(p53, _) -- name: mapStateToProps
	return {
		["tabList"] = p53.MainView.tabList,
		["currTabIndex"] = p53.MainView.currTabIndex
	}
end, function(p_u_54) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_5
	return {
		["dispatchSetActiveTab"] = function(p55, p56) -- name: dispatchSetActiveTab
			-- upvalues: (copy) p_u_54, (ref) v_u_5
			p_u_54(v_u_5(p55, p56))
		end
	}
end)(v12)