-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Log.MainViewLog
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Parent.Components
local v_u_5 = require(v4.Log.ClientLog)
local v_u_6 = require(v4.Log.ServerLog)
local v_u_7 = require(v4.UtilAndTab)
local v8 = require(v4.DataConsumer)
local v9 = script.Parent.Parent.Parent.Actions
local v_u_10 = require(v9.SetActiveTab)
local v_u_11 = require(script.Parent.Parent.Parent.Constants)
local v_u_12 = v_u_11.GeneralFormatting.MainRowPadding
local v_u_13 = v_u_11.MsgTypeNamesOrdered
local v14 = v_u_2.PureComponent:extend("MainViewLog")
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
		p_u_15.props.dispatchSetActiveTab("Log", true)
	end
	function p_u_15.onServerButton()
		-- upvalues: (copy) p_u_15
		p_u_15.props.dispatchSetActiveTab("Log", false)
	end
	function p_u_15.onCheckboxChanged(p17, p18)
		-- upvalues: (copy) p_u_15
		if p_u_15.props.isClientView then
			p_u_15.props.ClientLogData:setFilter(p17, p18)
		else
			p_u_15.props.ServerLogData:setFilter(p17, p18)
		end
	end
	function p_u_15.filterUpdated()
		-- upvalues: (copy) p_u_15
		if p_u_15.forceUpdate then
			p_u_15:forceUpdate()
		else
			p_u_15:setState({})
		end
	end
	function p_u_15.onSearchTermChanged(p19)
		-- upvalues: (copy) p_u_15
		if p_u_15.props.isClientView then
			p_u_15.props.ClientLogData:setSearchTerm(p19)
		else
			p_u_15.props.ServerLogData:setSearchTerm(p19)
		end
	end
	p_u_15.clientFilterConnection = p_u_15.props.ClientLogData:filterUpdatedSignal():Connect(p_u_15.filterUpdated)
	p_u_15.serverFilterConnection = p_u_15.props.ServerLogData:filterUpdatedSignal():Connect(p_u_15.filterUpdated)
	p_u_15.utilRef = v_u_2.createRef()
	p_u_15.state = {
		["utilTabHeight"] = 0
	}
end
function v14.didMount(p20) -- name: didMount
	p20:setState({
		["utilTabHeight"] = p20.utilRef.current.Size.Y.Offset
	})
end
function v14.didUpdate(p21) -- name: didUpdate
	local v22 = p21.utilRef.current.Size
	if v22.Y.Offset ~= p21.state.utilTabHeight then
		p21:setState({
			["utilTabHeight"] = v22.Y.Offset
		})
	end
end
function v14.willUnmount(p23) -- name: willUnmount
	if p23.clientFilterConnection then
		p23.clientFilterConnection:Disconnect()
		p23.clientFilterConnection = nil
	end
	if p23.serverFilterConnection then
		p23.serverFilterConnection:Disconnect()
		p23.serverFilterConnection = nil
	end
end
function v14.render(p24) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_13, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_11
	local v25 = p24.props.size
	local v26 = p24.props.formFactor
	local v27 = p24.props.isDeveloperView
	local v28 = p24.props.tabList
	local v29 = p24.props.isClientView
	local v30 = p24.state.utilTabHeight
	local v31
	if v29 then
		v31 = p24.props.ClientLogData:getSearchTerm()
	else
		v31 = p24.props.ServerLogData:getSearchTerm()
	end
	local v32 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_12)
		})
	}
	local v33
	if v29 then
		v33 = p24.props.ClientLogData:getFilters()
	else
		v33 = p24.props.ServerLogData:getFilters()
	end
	local v34 = {}
	for v35, v36 in ipairs(v_u_13) do
		v34[v35] = {
			["name"] = v36,
			["state"] = v33[v36]
		}
	end
	local v37 = v_u_2.createElement
	local v38 = v_u_7
	local v39 = {
		["windowWidth"] = nil,
		["formFactor"] = nil,
		["tabList"] = nil,
		["orderedCheckboxState"] = nil,
		["isClientView"] = nil,
		["searchTerm"] = nil,
		["layoutOrder"] = 1,
		["refForParent"] = nil,
		["onClientButton"] = nil,
		["onServerButton"] = nil,
		["onCheckboxChanged"] = nil,
		["onSearchTermChanged"] = nil,
		["windowWidth"] = v25.X.Offset,
		["formFactor"] = v26,
		["tabList"] = v28,
		["orderedCheckboxState"] = v34,
		["isClientView"] = v29,
		["searchTerm"] = v31,
		["refForParent"] = p24.utilRef
	}
	local v40
	if v27 then
		v40 = p24.onClientButton
	else
		v40 = v27
	end
	v39.onClientButton = v40
	if v27 then
		v27 = p24.onServerButton
	end
	v39.onServerButton = v27
	v39.onCheckboxChanged = p24.onCheckboxChanged
	v39.onSearchTermChanged = p24.onSearchTermChanged
	v32.UtilAndTab = v37(v38, v39)
	if v30 > 0 then
		if v29 then
			v32.ClientLog = v_u_2.createElement(v_u_5, {
				["size"] = nil,
				["layoutOrder"] = 2,
				["size"] = UDim2.new(1, 0, 1, -v30)
			})
		else
			v32.ServerLog = v_u_2.createElement(v_u_6, {
				["size"] = nil,
				["layoutOrder"] = 2,
				["size"] = UDim2.new(1, 0, 1, -v30)
			})
		end
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v25,
		["BackgroundColor3"] = v_u_11.Color.BaseGray
	}, v32)
end
return v3.UNSTABLE_connect2(function(p41, _) -- name: mapStateToProps
	return {
		["isClientView"] = p41.MainView.isClientView
	}
end, function(p_u_42) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_10
	return {
		["dispatchSetActiveTab"] = function(p43, p44) -- name: dispatchSetActiveTab
			-- upvalues: (copy) p_u_42, (ref) v_u_10
			p_u_42(v_u_10(p43, p44))
		end
	}
end)(v8(v14, "ClientLogData", "ServerLogData"))