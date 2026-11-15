-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.MainViewClientOperationQueuePanel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.FilterChip)
local v_u_5 = require(v3.InfoBanner)
local v_u_6 = require(v3.MergeObservedNames)
local v_u_7 = require(v3.OperationRow)
local v_u_8 = require(v3.VirtualList)
local v_u_9 = require(script.Parent.CollapsibleSection)
local v_u_10 = require(script.Parent.VoiceDebugOperationLabels)
local function v_u_16(p11, p12, p13) -- name: filterOperations
	local v14 = {}
	for _, v15 in p11 do
		if p13 then
			if v15.operationType ~= "ClientCullingOperation" then
				continue
			end
			v14[#v14 + 1] = v15
		else
			if v15.operationType == "ClientCullingOperation" or p12[v15.operationType] then
				continue
			end
			v14[#v14 + 1] = v15
		end
	end
	return v14
end
local function v_u_20(p17, p18) -- name: nextChipState
	if p17 == "ClientCullingOperation" then
		return {
			["excludedNames"] = p18.excludedNames,
			["showCullingExclusively"] = not p18.showCullingExclusively
		}
	end
	local v19 = table.clone(p18.excludedNames)
	if p18.showCullingExclusively then
		v19[p17] = nil
	else
		v19[p17] = not v19[p17] or nil
	end
	return {
		["excludedNames"] = nil,
		["showCullingExclusively"] = false,
		["excludedNames"] = v19
	}
end
local v21 = v_u_2.Component:extend("ClientOperationQueuePanel")
function v21.init(p_u_22) -- name: init
	-- upvalues: (copy) v_u_6, (copy) v_u_20
	local v23 = {}
	v_u_6((p_u_22.props.remoteOperations or {}).operations or {}, v23, "operationType")
	p_u_22.state = {
		["observedNames"] = nil,
		["excludedNames"] = nil,
		["showCullingExclusively"] = false,
		["observedNames"] = v23,
		["excludedNames"] = {}
	}
	function p_u_22.onChipActivated(p_u_24)
		-- upvalues: (copy) p_u_22, (ref) v_u_20
		p_u_22:setState(function(p25)
			-- upvalues: (ref) v_u_20, (copy) p_u_24
			return v_u_20(p_u_24, p25)
		end)
	end
end
function v21.didUpdate(p26, p27) -- name: didUpdate
	-- upvalues: (copy) v_u_6
	if p27.remoteOperations ~= p26.props.remoteOperations then
		local v28 = (p26.props.remoteOperations or {}).operations or {}
		local v29 = table.clone(p26.state.observedNames)
		if v_u_6(v28, v29, "operationType") then
			p26:setState({
				["observedNames"] = v29
			})
		end
	end
end
function v21.render(p_u_30) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_2, (copy) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7
	local v31 = p_u_30.props.remoteOperations or {}
	local v32 = p_u_30.props.layoutOrder
	local v33 = p_u_30.state.excludedNames
	local v34 = p_u_30.state.showCullingExclusively
	local v35 = v_u_16(v31.operations or {}, v33, v34)
	table.sort(v35, function(p36, p37)
		return p36.timestampSeconds > p37.timestampSeconds
	end)
	local v38 = 0
	local v39 = {}
	for v_u_40 in p_u_30.state.observedNames do
		v38 = v38 + 1
		local v41 = "chip" .. v_u_40
		local v42 = v_u_2.createElement
		local v43 = v_u_4
		local v44 = {
			["name"] = v_u_10.labelForOperationType(v_u_40)
		}
		local v45 = v_u_40 ~= "ClientCullingOperation" and not v34
		if v45 then
			v45 = not v33[v_u_40]
		end
		v44.isOn = v45
		v44.layoutOrder = v38
		function v44.onActivated() -- name: onActivated
			-- upvalues: (copy) p_u_30, (copy) v_u_40
			p_u_30.onChipActivated(v_u_40)
		end
		v39[v41] = v42(v43, v44)
	end
	local v46 = v31.operations ~= nil
	local v47 = v31.opQueueCaptureEnabled == true
	local v48 = v_u_2.createElement
	local v49 = v_u_9
	local v50 = {
		["title"] = "Client Activity",
		["layoutOrder"] = nil,
		["layoutOrder"] = v32
	}
	local v51 = {}
	local v52
	if v46 and not v47 then
		v52 = v_u_2.createElement(v_u_5, {
			["layoutOrder"] = 1,
			["text"] = "Operation capture is off (FFlag::VoiceMetricsDataEnabled). Enable it to see executed operations here."
		}) or nil
	else
		v52 = nil
	end
	v51.CaptureNotice = v52
	v51.Filters = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = 2,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}, {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = nil,
			["Wraps"] = true,
			["SortOrder"] = nil,
			["Padding"] = nil,
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 4)
		}),
		["Chips"] = v_u_2.createFragment(v39)
	})
	local v53 = v_u_2.createElement
	local v54 = v_u_8
	local v59 = {
		["items"] = nil,
		["rowHeight"] = 22,
		["renderItem"] = nil,
		["size"] = nil,
		["layoutOrder"] = 3,
		["emptyText"] = "No activity observed yet.",
		["items"] = v35,
		["renderItem"] = function(p55, p56) -- name: renderItem
			-- upvalues: (ref) v_u_10, (ref) v_u_2, (ref) v_u_7
			local v57 = p55.name:match("::(.+)$") or p55.name
			local v58 = v_u_10.labelForOperationType(p55.operationType) .. ": " .. v_u_10.humanizeName(v57)
			return v_u_2.createElement(v_u_7, {
				["timestampText"] = nil,
				["tag"] = "op",
				["name"] = nil,
				["layoutOrder"] = nil,
				["timestampText"] = p55.timestampText,
				["name"] = v58,
				["layoutOrder"] = p56
			})
		end
	}
	local v60 = UDim2.new
	local v61 = 1
	local v62 = 0
	local v63 = 0
	local v64
	if #v35 > 0 then
		local v65 = #v35 * 22
		v64 = math.min(v65, 320) or 44
	else
		v64 = 44
	end
	v59.size = v60(v61, v62, v63, v64)
	v51.List = v53(v54, v59)
	return v48(v49, v50, v51)
end
v21._filterOperations = v_u_16
function v21._isChipOn(p66, p67, p68) -- name: isChipOn
	if p66 == "ClientCullingOperation" then
		return p68
	end
	local v69 = not p68
	if v69 then
		v69 = not p67[p66]
	end
	return v69
end
v21._nextChipState = v_u_20
return v21