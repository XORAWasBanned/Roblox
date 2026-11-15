-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ServerJobs.MainViewServerJobs
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Parent.Components
local v_u_5 = require(v4.ServerJobs.ServerJobsChart)
local v_u_6 = require(v4.UtilAndTab)
local v7 = script.Parent.Parent.Parent.Actions
local v_u_8 = require(v7.ServerJobsUpdateSearchFilter)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.MainRowPadding
local v11 = v_u_2.Component:extend("MainViewServerJobs")
function v11.init(p_u_12) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_12.onUtilTabHeightChanged(p13)
		-- upvalues: (copy) p_u_12
		p_u_12:setState({
			["utilTabHeight"] = p13
		})
	end
	function p_u_12.onSearchTermChanged(p14)
		-- upvalues: (copy) p_u_12
		p_u_12.props.dispatchServerJobsUpdateSearchFilter(p14, {})
	end
	p_u_12.utilRef = v_u_2.createRef()
	p_u_12.state = {
		["utilTabHeight"] = 0
	}
end
function v11.didMount(p15) -- name: didMount
	p15:setState({
		["utilTabHeight"] = p15.utilRef.current.Size.Y.Offset
	})
end
function v11.didUpdate(p16) -- name: didUpdate
	local v17 = p16.utilRef.current.Size
	if v17.Y.Offset ~= p16.state.utilTabHeight then
		p16:setState({
			["utilTabHeight"] = v17.Y.Offset
		})
	end
end
function v11.render(p18) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_5
	local v19 = p18.props.size
	local v20 = p18.props.formFactor
	local v21 = p18.props.tabList
	local v22 = p18.props.jobsSearchTerm
	local v23 = p18.state.utilTabHeight
	local v24 = v_u_2.createElement
	local v25 = "Frame"
	local v26 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v19,
		["BackgroundColor3"] = v_u_9.Color.BaseGray
	}
	local v27 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_10),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = v_u_2.createElement(v_u_6, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["searchTerm"] = nil,
			["layoutOrder"] = 1,
			["refForParent"] = nil,
			["onHeightChanged"] = nil,
			["onSearchTermChanged"] = nil,
			["windowWidth"] = v19.X.Offset,
			["formFactor"] = v20,
			["tabList"] = v21,
			["searchTerm"] = v22,
			["refForParent"] = p18.utilRef,
			["onHeightChanged"] = p18.onUtilTabHeightChanged,
			["onSearchTermChanged"] = p18.onSearchTermChanged
		})
	}
	local v28
	if v23 > 0 then
		v28 = v_u_2.createElement(v_u_5, {
			["size"] = nil,
			["searchTerm"] = nil,
			["layoutOrder"] = 2,
			["size"] = UDim2.new(1, 0, 1, -v23),
			["searchTerm"] = v22
		})
	else
		v28 = false
	end
	v27.ServerJobs = v28
	return v24(v25, v26, v27)
end
return v3.UNSTABLE_connect2(function(p29, _) -- name: mapStateToProps
	return {
		["jobsSearchTerm"] = p29.ServerJobsData.jobsSearchTerm
	}
end, function(p_u_30) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8
	return {
		["dispatchServerJobsUpdateSearchFilter"] = function(p31, p32) -- name: dispatchServerJobsUpdateSearchFilter
			-- upvalues: (copy) p_u_30, (ref) v_u_8
			p_u_30(v_u_8(p31, p32))
		end
	}
end)(v11)