-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Memory.MainViewMemory
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Stats")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent.Parent.Components
local v_u_6 = require(v5.Memory.ClientMemory)
local v_u_7 = require(v5.Memory.ServerMemory)
local v_u_8 = require(v5.UtilAndTab)
local v9 = require(v5.DataConsumer)
local v10 = script.Parent.Parent.Parent.Actions
local v_u_11 = require(v10.ClientMemoryUpdateSearchFilter)
local v_u_12 = require(v10.ServerMemoryUpdateSearchFilter)
local v_u_13 = require(script.Parent.Parent.Parent.Constants)
local v_u_14 = v_u_13.GeneralFormatting.MainRowPadding
local v_u_15 = game:DefineFastFlag("DevConsoleMemoryTrackingAlert", false)
local v16 = v_u_3.Component:extend("LogButton")
function v16.init(p_u_17) -- name: init
	function p_u_17.onAction()
		-- upvalues: (copy) p_u_17
		local v18 = p_u_17.props.isClientView and p_u_17.props.ClientMemoryData or p_u_17.props.ServerMemoryData
		local v_u_19 = "\n"
		v_u_19 = v_u_19 .. "Name                                       Min   Max\n"
		v_u_19 = v_u_19 .. "----------------------------------------   ---   ---\n"
		local function v_u_25(p20, p21, p22) -- name: recurseMemoryTree
			-- upvalues: (ref) v_u_19, (copy) v_u_25
			v_u_19 = v_u_19 .. string.format("%s %s %s %3d   %3d", string.rep(" ", p22), p20, string.rep(" ", 40 - p22 - #p20), p21.min, p21.max) .. "\n"
			if p21.children then
				for v23, v24 in pairs(p21.children) do
					v_u_25(v23, v24, p22 + 2)
				end
			end
		end
		v_u_25("Memory", v18._memoryData.Memory, 0)
		print(v_u_19)
	end
end
function v16.render(p26) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_13
	return v_u_3.createElement("TextButton", {
		["Text"] = "Log",
		["Visible"] = true,
		["BorderSizePixel"] = 1,
		["BackgroundColor3"] = v_u_13.Color.UnselectedGray,
		["TextColor3"] = v_u_13.Color.Text,
		[v_u_3.Event.Activated] = p26.onAction
	})
end
local v_u_27 = v9(v16, "ClientMemoryData", "ServerMemoryData")
local v28 = v_u_3.Component:extend("MainViewMemory")
function v28.init(p_u_29) -- name: init
	-- upvalues: (copy) v_u_3
	function p_u_29.onUtilTabHeightChanged(p30)
		-- upvalues: (copy) p_u_29
		p_u_29:setState({
			["utilTabHeight"] = p30
		})
	end
	function p_u_29.onClientButton()
		-- upvalues: (copy) p_u_29
		p_u_29:setState({
			["isClientView"] = true
		})
	end
	function p_u_29.onServerButton()
		-- upvalues: (copy) p_u_29
		p_u_29:setState({
			["isClientView"] = false
		})
	end
	function p_u_29.onSearchTermChanged(p31)
		-- upvalues: (copy) p_u_29
		if p_u_29.state.isClientView then
			p_u_29.props.dispatchClientMemoryUpdateSearchFilter(p31, {})
		else
			p_u_29.props.dispatchServerMemoryUpdateSearchFilter(p31, {})
		end
	end
	p_u_29.utilRef = v_u_3.createRef()
	p_u_29.state = {
		["utilTabHeight"] = 0,
		["isClientView"] = true
	}
end
function v28.didMount(p32) -- name: didMount
	p32:setState({
		["utilTabHeight"] = p32.utilRef.current.Size.Y.Offset
	})
end
function v28.didUpdate(p33) -- name: didUpdate
	local v34 = p33.utilRef.current.Size.Y.Offset
	if v34 ~= p33.state.utilTabHeight then
		p33:setState({
			["utilTabHeight"] = v34
		})
	end
end
function v28.render(p35) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_2, (copy) v_u_3, (copy) v_u_14, (copy) v_u_8, (ref) v_u_27, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7
	local v36 = {}
	local v37 = p35.props.size
	local v38 = p35.props.isDeveloperView
	local v39 = p35.props.formFactor
	local v40 = p35.props.tabList
	local v41 = p35.state.utilTabHeight
	local v42 = p35.state.isClientView
	local v43 = v42 and p35.props.clientSearchTerm or p35.props.serverSearchTerm
	local v44
	if v_u_15 then
		v44 = not v_u_2.MemoryTrackingEnabled
	else
		v44 = false
	end
	v36.UIListLayout = v_u_3.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, v_u_14)
	})
	local v45 = v_u_3.createElement
	local v46 = v_u_8
	local v47 = {
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
		["windowWidth"] = v37.X.Offset,
		["formFactor"] = v39,
		["tabList"] = v40,
		["isClientView"] = v42,
		["searchTerm"] = v43,
		["refForParent"] = p35.utilRef,
		["onHeightChanged"] = p35.onUtilTabHeightChanged
	}
	local v48
	if v38 then
		v48 = p35.onClientButton
	else
		v48 = v38
	end
	v47.onClientButton = v48
	if v38 then
		v38 = p35.onServerButton
	end
	v47.onServerButton = v38
	v47.onSearchTermChanged = p35.onSearchTermChanged
	local v49 = {}
	local v50 = v_u_27
	if v50 then
		v50 = v_u_3.createElement(v_u_27, {
			["isClientView"] = v42
		})
	end
	__set_list(v49, 1, {v50})
	v36.UtilAndTab = v45(v46, v47, v49)
	if v44 then
		v36.MemoryHeader = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Memory category counters are disabled. Restart the client with the MicroProfiler on to guarantee counters are enabled.",
			["TextColor3"] = nil,
			["BackgroundColor3"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 20),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_13.Color.Text,
			["BackgroundColor3"] = Color3.new(1, 0, 0)
		})
	end
	if v41 > 0 then
		if v42 then
			v36.ClientMemory = v_u_3.createElement(v_u_6, {
				["size"] = nil,
				["searchTerm"] = nil,
				["layoutOrder"] = 3,
				["size"] = UDim2.new(1, 0, 1, -v41),
				["searchTerm"] = v43
			})
		else
			v36.ServerMemory = v_u_3.createElement(v_u_7, {
				["size"] = nil,
				["searchTerm"] = nil,
				["layoutOrder"] = 3,
				["size"] = UDim2.new(1, 0, 1, -v41),
				["searchTerm"] = v43
			})
		end
	end
	return v_u_3.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 4,
		["Size"] = v37,
		["BackgroundColor3"] = v_u_13.Color.BaseGray
	}, v36)
end
return v4.UNSTABLE_connect2(function(p51, _) -- name: mapStateToProps
	return {
		["clientSearchTerm"] = p51.MemoryData.clientSearchTerm,
		["clientTypeFilters"] = p51.MemoryData.clientTypeFilters,
		["serverSearchTerm"] = p51.MemoryData.serverSearchTerm,
		["serverTypeFilters"] = p51.MemoryData.serverTypeFilters
	}
end, function(p_u_52) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	return {
		["dispatchClientMemoryUpdateSearchFilter"] = function(p53, p54) -- name: dispatchClientMemoryUpdateSearchFilter
			-- upvalues: (copy) p_u_52, (ref) v_u_11
			p_u_52(v_u_11(p53, p54))
		end,
		["dispatchServerMemoryUpdateSearchFilter"] = function(p55, p56) -- name: dispatchServerMemoryUpdateSearchFilter
			-- upvalues: (copy) p_u_52, (ref) v_u_12
			p_u_52(v_u_12(p55, p56))
		end
	}
end)(v28)