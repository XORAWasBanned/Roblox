-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Scripts.MainViewScripts
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Parent.Components
local v_u_5 = require(v4.Scripts.ServerScripts)
local v_u_6 = require(v4.UtilAndTab)
local v7 = script.Parent.Parent.Parent.Actions
local v_u_8 = require(v7.ServerScriptsUpdateSearchFilter)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.MainRowPadding
local v_u_11 = { "Active", "Inactive" }
local v12 = v_u_2.PureComponent:extend("MainViewScripts")
function v12.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_13.onUtilTabHeightChanged(p14)
		-- upvalues: (copy) p_u_13
		p_u_13:setState({
			["utilTabHeight"] = p14
		})
	end
	function p_u_13.onCheckboxChanged(p15, p16)
		-- upvalues: (copy) p_u_13
		p_u_13.props.dispatchServerScriptsUpdateSearchFilter(nil, {
			[p15] = p16
		})
	end
	function p_u_13.onSearchTermChanged(p17)
		-- upvalues: (copy) p_u_13
		p_u_13.props.dispatchServerScriptsUpdateSearchFilter(p17, {})
	end
	p_u_13.utilRef = v_u_2.createRef()
	p_u_13.state = {
		["utilTabHeight"] = 0,
		["isClientView"] = true
	}
end
function v12.didMount(p18) -- name: didMount
	p18:setState({
		["utilTabHeight"] = p18.utilRef.current.Size.Y.Offset
	})
end
function v12.didUpdate(p19) -- name: didUpdate
	local v20 = p19.utilRef.current.Size
	if v20.Y.Offset ~= p19.state.utilTabHeight then
		p19:setState({
			["utilTabHeight"] = v20.Y.Offset
		})
	end
end
function v12.render(p21) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_5
	local v22 = p21.props.size
	local v23 = p21.props.formFactor
	local v24 = p21.props.tabList
	local v25 = p21.props.serverTypeFilters
	local v26 = p21.state.utilTabHeight
	local v27 = p21.props.serverSearchTerm
	local v28 = {}
	for v29, v30 in ipairs(v_u_11) do
		local v31 = v25[v30]
		v28[v29] = {
			["name"] = v30,
			["state"] = v31 == nil and true or v31
		}
	end
	local v32 = v_u_2.createElement
	local v33 = "Frame"
	local v34 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v22,
		["BackgroundColor3"] = v_u_9.Color.BaseGray
	}
	local v35 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_10),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = v_u_2.createElement(v_u_6, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["orderedCheckboxState"] = nil,
			["searchTerm"] = nil,
			["layoutOrder"] = 1,
			["refForParent"] = nil,
			["onHeightChanged"] = nil,
			["onCheckboxChanged"] = nil,
			["onSearchTermChanged"] = nil,
			["windowWidth"] = v22.X.Offset,
			["formFactor"] = v23,
			["tabList"] = v24,
			["orderedCheckboxState"] = v28,
			["searchTerm"] = v27,
			["refForParent"] = p21.utilRef,
			["onHeightChanged"] = p21.onUtilTabHeightChanged,
			["onCheckboxChanged"] = p21.onCheckboxChanged,
			["onSearchTermChanged"] = p21.onSearchTermChanged
		})
	}
	local v36
	if v26 > 0 then
		v36 = v_u_2.createElement(v_u_5, {
			["size"] = nil,
			["searchTerm"] = nil,
			["scriptFilters"] = nil,
			["layoutOrder"] = 2,
			["size"] = UDim2.new(1, 0, 1, -v26),
			["searchTerm"] = v27,
			["scriptFilters"] = v25
		})
	else
		v36 = false
	end
	v35.ServerScripts = v36
	return v32(v33, v34, v35)
end
return v3.UNSTABLE_connect2(function(p37, _) -- name: mapStateToProps
	return {
		["serverSearchTerm"] = p37.ScriptsData.serverSearchTerm,
		["serverTypeFilters"] = p37.ScriptsData.serverTypeFilters
	}
end, function(p_u_38) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8
	return {
		["dispatchServerScriptsUpdateSearchFilter"] = function(p39, p40) -- name: dispatchServerScriptsUpdateSearchFilter
			-- upvalues: (copy) p_u_38, (ref) v_u_8
			p_u_38(v_u_8(p39, p40))
		end
	}
end)(v12)