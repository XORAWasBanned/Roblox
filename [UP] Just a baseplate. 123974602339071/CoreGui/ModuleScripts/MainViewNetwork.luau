-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.MainViewNetwork
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Parent.Components
local v_u_5 = require(v4.Network.ClientNetwork)
local v_u_6 = require(v4.Network.ServerNetwork)
local v_u_7 = require(v4.UtilAndTab)
local v8 = script.Parent.Parent.Parent.Actions
local v_u_9 = require(v8.ClientNetworkUpdateSearchFilter)
local v_u_10 = require(v8.ServerNetworkUpdateSearchFilter)
local v_u_11 = require(v8.SetActiveTab)
local v_u_12 = require(script.Parent.Parent.Parent.Constants)
local v_u_13 = v_u_12.GeneralFormatting.MainRowPadding
local v14 = v_u_2.Component:extend("MainViewNetwork")
function v14.init(p_u_15) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_15.onUtilTabHeightChanged(p16)
		-- upvalues: (copy) p_u_15
		p_u_15:setState({
			["utilTabHeight"] = p16
		})
	end
	function p_u_15.onClientButton()
		-- upvalues: (copy) p_u_15
		p_u_15.props.dispatchSetActiveTab("Network", true)
	end
	function p_u_15.onServerButton()
		-- upvalues: (copy) p_u_15
		p_u_15.props.dispatchSetActiveTab("Network", false)
	end
	function p_u_15.onSearchTermChanged(p17)
		-- upvalues: (copy) p_u_15
		if p_u_15.props.isClientView then
			p_u_15.props.dispatchClientNetworkUpdateSearchFilter(p17, {})
		else
			p_u_15.props.dispatchServerNetworkUpdateSearchFilter(p17, {})
		end
	end
	p_u_15.utilRef = v_u_2.createRef()
	p_u_15.state = {
		["utilTabHeight"] = 0
	}
end
function v14.didMount(p18) -- name: didMount
	p18:setState({
		["utilTabHeight"] = p18.utilRef.current.Size.Y.Offset
	})
end
function v14.didUpdate(p19) -- name: didUpdate
	local v20 = p19.utilRef.current.Size
	if v20.Y.Offset ~= p19.state.utilTabHeight then
		p19:setState({
			["utilTabHeight"] = v20.Y.Offset
		})
	end
end
function v14.render(p21) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_12
	local v22 = {}
	local v23 = p21.props.size
	local v24 = p21.props.formFactor
	local v25 = p21.props.tabList
	local v26 = p21.props.isClientView
	local v27 = p21.state.utilTabHeight
	local v28 = v26 and p21.props.clientSearchTerm or p21.props.serverSearchTerm
	v22.UIListLayout = v_u_2.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, v_u_13)
	})
	v22.UtilAndTab = v_u_2.createElement(v_u_7, {
		["windowWidth"] = nil,
		["formFactor"] = nil,
		["tabList"] = nil,
		["isClientView"] = nil,
		["searchTerm"] = nil,
		["layoutOrder"] = 1,
		["refForParent"] = nil,
		["onHeightChanged"] = nil,
		["onClientButton"] = nil,
		["onServerButton"] = nil,
		["onSearchTermChanged"] = nil,
		["windowWidth"] = v23.X.Offset,
		["formFactor"] = v24,
		["tabList"] = v25,
		["isClientView"] = v26,
		["searchTerm"] = v28,
		["refForParent"] = p21.utilRef,
		["onHeightChanged"] = p21.onUtilTabHeightChanged,
		["onClientButton"] = p21.onClientButton,
		["onServerButton"] = p21.onServerButton,
		["onSearchTermChanged"] = p21.onSearchTermChanged
	})
	if v27 > 0 then
		if v26 then
			v22.ClientNetwork = v_u_2.createElement(v_u_5, {
				["size"] = nil,
				["searchTerm"] = nil,
				["layoutOrder"] = 2,
				["size"] = UDim2.new(1, 0, 1, -v27),
				["searchTerm"] = v28
			})
		else
			v22.ServerNetwork = v_u_2.createElement(v_u_6, {
				["size"] = nil,
				["searchTerm"] = nil,
				["layoutOrder"] = 2,
				["size"] = UDim2.new(1, 0, 1, -v27),
				["searchTerm"] = v28
			})
		end
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v23,
		["BackgroundColor3"] = v_u_12.Color.BaseGray
	}, v22)
end
return v3.UNSTABLE_connect2(function(p29, _) -- name: mapStateToProps
	return {
		["isClientView"] = p29.MainView.isClientView,
		["clientSearchTerm"] = p29.NetworkData.clientSearchTerm,
		["serverSearchTerm"] = p29.NetworkData.serverSearchTerm
	}
end, function(p_u_30) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_11
	return {
		["dispatchClientNetworkUpdateSearchFilter"] = function(p31, p32) -- name: dispatchClientNetworkUpdateSearchFilter
			-- upvalues: (copy) p_u_30, (ref) v_u_9
			p_u_30(v_u_9(p31, p32))
		end,
		["dispatchServerNetworkUpdateSearchFilter"] = function(p33, p34) -- name: dispatchServerNetworkUpdateSearchFilter
			-- upvalues: (copy) p_u_30, (ref) v_u_10
			p_u_30(v_u_10(p33, p34))
		end,
		["dispatchSetActiveTab"] = function(p35, p36) -- name: dispatchSetActiveTab
			-- upvalues: (copy) p_u_30, (ref) v_u_11
			p_u_30(v_u_11(p35, p36))
		end
	}
end)(v14)