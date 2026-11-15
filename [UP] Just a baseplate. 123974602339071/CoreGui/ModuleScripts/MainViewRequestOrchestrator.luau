-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.RequestOrchestrator.MainViewRequestOrchestrator
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = script.Parent.Parent
local v_u_5 = require(v4.UtilAndTab)
local v_u_6 = require(v4.DropDown)
local v_u_7 = require(script.Parent.OrchestratorRow)
local v_u_8 = require(script.Parent.RequestOrchestratorData)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.MainRowPadding
local v_u_11 = v_u_9.Font.Mono
local v_u_12 = Color3.fromRGB(220, 220, 220)
local v_u_13 = {
	["BatchCreated"] = { v_u_8.registerBatch, v_u_8.trackQueueOnCreated },
	["BatchSent"] = { v_u_8.openSendAttempt, v_u_8.drainQueueOnSent },
	["BatchResponseReceived"] = { v_u_8.settleBatch },
	["BatchRetrying"] = { v_u_8.reclassifyOnRetry, v_u_8.requeueRetryOps },
	["BatchExhausted"] = { v_u_8.markExhausted, v_u_8.clearQueueOnExhausted },
	["OperationEnqueued"] = { v_u_8.enqueueOperation },
	["CacheItemAdded"] = { v_u_8.recordCacheItemAdded },
	["CacheHit"] = { v_u_8.recordCacheHit }
}
local function v_u_16(p14, p15) -- name: makeLabel
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_11
	return v_u_3.createElement("TextLabel", {
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = 11,
		["Font"] = nil,
		["TextXAlignment"] = nil,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["Size"] = UDim2.new(0, 0, 0, 22),
		["Text"] = p14,
		["TextColor3"] = v_u_12,
		["Font"] = v_u_11,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["LayoutOrder"] = p15
	})
end
local v17 = v_u_3.Component:extend("MainViewRequestOrchestrator")
function v17.init(p_u_18) -- name: init
	-- upvalues: (copy) v_u_8, (copy) v_u_3
	p_u_18.model = v_u_8.new()
	p_u_18.connections = {}
	p_u_18.utilRef = v_u_3.createRef()
	function p_u_18.onUtilTabHeightChanged(p19)
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["utilTabHeight"] = p19
		})
	end
	function p_u_18.onTypeToggle(p20)
		-- upvalues: (copy) p_u_18
		local v21 = p_u_18.state.selectedTypes
		local v22 = {}
		for v23, v24 in pairs(v21) do
			v22[v23] = v24
		end
		v22[p20] = not v22[p20] or nil
		p_u_18:setState({
			["selectedTypes"] = v22
		})
	end
	p_u_18.state = {
		["utilTabHeight"] = 0,
		["selectedTypes"] = nil,
		["selectedTypes"] = {}
	}
end
function v17.observeType(p25, p26) -- name: observeType
	-- upvalues: (copy) v_u_8
	local v27 = v_u_8.observeType(p25.model, p26)
	if v27 then
		local v28 = p25.state.selectedTypes
		local v29 = {}
		for v30, v31 in pairs(v28) do
			v29[v30] = v31
		end
		v29[v27] = true
		p25:setState({
			["selectedTypes"] = v29
		})
	end
end
function v17.didMount(p_u_32) -- name: didMount
	-- upvalues: (copy) v_u_8, (copy) v_u_13, (copy) v_u_2
	p_u_32:setState({
		["utilTabHeight"] = p_u_32.utilRef.current.Size.Y.Offset
	})
	local v_u_33 = game:GetService("RequestOrchestratorService")
	local v34, v35 = pcall(function()
		-- upvalues: (copy) v_u_33
		return v_u_33:GetRegisteredOrchestrators()
	end)
	if v34 and v35 then
		local v36 = v_u_8.observeTypes(p_u_32.model, v35)
		if #v36 > 0 then
			local v37 = p_u_32.state.selectedTypes
			local v38 = {}
			for v39, v40 in pairs(v37) do
				v38[v39] = v40
			end
			for _, v41 in ipairs(v36) do
				v38[v41] = true
			end
			p_u_32:setState({
				["selectedTypes"] = v38
			})
		end
	end
	for v42, v_u_43 in pairs(v_u_13) do
		p_u_32.connections[v42] = v_u_33[v42]:Connect(function(p44)
			-- upvalues: (copy) p_u_32, (copy) v_u_43
			local v45 = p44.orchestratorType or "Unknown"
			p_u_32:observeType(v45)
			for _, v46 in ipairs(v_u_43) do
				v46(p_u_32.model, v45, p44)
			end
			p_u_32:setState({})
		end)
	end
	p_u_32.connections.heartbeat = v_u_2.Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_8, (copy) p_u_32
		v_u_8.advanceTime(p_u_32.model)
		p_u_32:setState({})
	end)
end
function v17.willUnmount(p47) -- name: willUnmount
	for _, v48 in pairs(p47.connections) do
		v48:Disconnect()
	end
	p47.connections = {}
end
function v17.didUpdate(p49) -- name: didUpdate
	local v50 = p49.utilRef.current.Size.Y.Offset
	if v50 ~= p49.state.utilTabHeight then
		p49:setState({
			["utilTabHeight"] = v50
		})
	end
end
function v17.render(p51) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_5, (copy) v_u_16, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9
	local v52 = p51.props.size
	local v53 = p51.props.formFactor
	local v54 = p51.props.tabList
	local v55 = p51.state.utilTabHeight
	local v56 = p51.state.selectedTypes
	local v57 = p51.model.allTypes
	local v58 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_10)
		}),
		["UtilAndTab"] = v_u_3.createElement(v_u_5, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["layoutOrder"] = 1,
			["refForParent"] = nil,
			["onHeightChanged"] = nil,
			["windowWidth"] = v52.X.Offset,
			["formFactor"] = v53,
			["tabList"] = v54,
			["refForParent"] = p51.utilRef,
			["onHeightChanged"] = p51.onUtilTabHeightChanged
		})
	}
	if v55 > 0 then
		local v59 = 0
		local v60 = nil
		for v61, v62 in ipairs(v57) do
			if not v56[v61] then
				continue
			end
			v59 = v59 + 1
			v60 = v62
		end
		if #v57 == 0 then
			v60 = "(waiting for traffic)"
		elseif v59 == 0 then
			v60 = "(none)"
		elseif v59 ~= 1 then
			if v59 == #v57 then
				v60 = string.format("All (%d)", v59)
			else
				v60 = string.format("%d selected", v59)
			end
		end
		v58.Controls = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 0, 24)
		}, {
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 4),
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			}),
			["ShowLabel"] = v_u_16("Show", 1),
			["TypeDropDown"] = v_u_3.createElement(v_u_6, {
				["buttonSize"] = nil,
				["dropDownList"] = nil,
				["selectedSet"] = nil,
				["onToggle"] = nil,
				["summaryText"] = nil,
				["layoutOrder"] = 2,
				["buttonSize"] = UDim2.new(0, 220, 0, 22),
				["dropDownList"] = v57,
				["selectedSet"] = v56,
				["onToggle"] = p51.onTypeToggle,
				["summaryText"] = v60
			})
		})
		for v63, v64 in ipairs(v57) do
			if not v56[v63] then
				continue
			end
			v58["Row_" .. v64] = v_u_3.createElement(v_u_7, {
				["orchestratorType"] = v64,
				["batches"] = p51.model.batchesByType[v64] or {},
				["queue"] = p51.model.queues[v64],
				["cache"] = p51.model.cacheByType[v64],
				["observedMaxBatchSize"] = p51.model.observedMaxByType[v64],
				["panelWidth"] = v52.X.Offset,
				["now"] = p51.model.now,
				["size"] = UDim2.new(1, 0, 0, 52),
				["layoutOrder"] = 2 + v63
			})
		end
	end
	return v_u_3.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 4,
		["Size"] = v52,
		["BackgroundColor3"] = v_u_9.Color.BaseGray
	}, v58)
end
return v17