-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.MainViewRemoteOperationsPanel
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
local function v_u_18(p11, p12) -- name: mergeChronologically
	local v13 = table.create(#p11 + #p12)
	local v14 = 1
	local v15 = 1
	while v14 <= #p11 or v15 <= #p12 do
		if v14 <= #p11 and (#p12 < v15 or p11[v14].timestampSeconds <= p12[v15].timestampSeconds) then
			local v16 = p11[v14]
			v13[#v13 + 1] = {
				["name"] = nil,
				["timestampSeconds"] = nil,
				["timestampText"] = nil,
				["tag"] = "snt",
				["name"] = v16.name,
				["timestampSeconds"] = v16.timestampSeconds,
				["timestampText"] = v16.timestampText
			}
			v14 = v14 + 1
		else
			local v17 = p12[v15]
			v13[#v13 + 1] = {
				["name"] = nil,
				["timestampSeconds"] = nil,
				["timestampText"] = nil,
				["tag"] = "srv",
				["name"] = v17.name,
				["timestampSeconds"] = v17.timestampSeconds,
				["timestampText"] = v17.timestampText
			}
			v15 = v15 + 1
		end
	end
	return v13
end
local v19 = v_u_2.Component:extend("RemoteOperationsPanel")
function v19.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_6
	local v21 = {}
	local v22 = p_u_20.props.remoteOperations or {}
	v_u_6(v22.sent or {}, v21, "name")
	v_u_6(v22.received or {}, v21, "name")
	p_u_20.state = {
		["observedNames"] = v21,
		["excludedNames"] = {}
	}
	function p_u_20.onChipActivated(p_u_23)
		-- upvalues: (copy) p_u_20
		p_u_20:setState(function(p24)
			-- upvalues: (copy) p_u_23
			local v25 = table.clone(p24.excludedNames)
			v25[p_u_23] = not v25[p_u_23] or nil
			return {
				["excludedNames"] = v25
			}
		end)
	end
end
function v19.didUpdate(p26, p27) -- name: didUpdate
	-- upvalues: (copy) v_u_6
	if p27.remoteOperations ~= p26.props.remoteOperations then
		local v28 = p26.props.remoteOperations or {}
		local v29 = table.clone(p26.state.observedNames)
		if v_u_6(v28.sent or {}, v29, "name") or v_u_6(v28.received or {}, v29, "name") then
			p26:setState({
				["observedNames"] = v29
			})
		end
	end
end
function v19.render(p_u_30) -- name: render
	-- upvalues: (copy) v_u_18, (copy) v_u_2, (copy) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7
	local v31 = p_u_30.props.remoteOperations or {}
	local v32 = p_u_30.props.layoutOrder
	local v33 = p_u_30.state.excludedNames
	local v34 = v_u_18(v31.sent or {}, v31.received or {})
	local v35 = {}
	for v36 = #v34, 1, -1 do
		local v37 = v34[v36]
		if v33[v37.name] then
			continue
		end
		v35[#v35 + 1] = v37
	end
	local v38 = 0
	local v39 = {}
	for v_u_40 in p_u_30.state.observedNames do
		v38 = v38 + 1
		v39["chip" .. v_u_40] = v_u_2.createElement(v_u_4, {
			["name"] = v_u_10.labelForEventName(v_u_40),
			["isOn"] = not v33[v_u_40],
			["layoutOrder"] = v38,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_30, (copy) v_u_40
				p_u_30.onChipActivated(v_u_40)
			end
		})
	end
	local v41 = v31.sent ~= nil
	local v42 = v31.receivedCaptureEnabled == true
	local v43 = v31.sentCaptureEnabled == true
	local v44 = v_u_2.createElement
	local v45 = v_u_9
	local v46 = {
		["title"] = "Message Log",
		["layoutOrder"] = nil,
		["layoutOrder"] = v32
	}
	local v47 = {}
	local v48 = v41 and not v42 and v_u_2.createElement(v_u_5, {
		["layoutOrder"] = 1,
		["text"] = "Remote operation capture is off (FFlag::VoiceMetricsDataEnabled). Enable it to see sent/received events here."
	})
	if not v48 then
		if v41 then
			v48 = not v43 and v_u_2.createElement(v_u_5, {
				["layoutOrder"] = 1,
				["text"] = "Sent-event capture is off (FFlag::VoiceChatEventReplicatorWrapperEnabled). Received events are still shown below."
			}) or nil
		else
			v48 = nil
		end
	end
	v47.Banner = v48
	v47.Filters = v_u_2.createElement("Frame", {
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
	local v49 = v_u_2.createElement
	local v50 = v_u_8
	local v53 = {
		["items"] = nil,
		["rowHeight"] = 22,
		["renderItem"] = nil,
		["size"] = nil,
		["layoutOrder"] = 3,
		["emptyText"] = nil,
		["items"] = v35,
		["renderItem"] = function(p51, p52) -- name: renderItem
			-- upvalues: (ref) v_u_2, (ref) v_u_7, (ref) v_u_10
			return v_u_2.createElement(v_u_7, {
				["timestampText"] = p51.timestampText,
				["tag"] = p51.tag,
				["name"] = v_u_10.labelForEventName(p51.name),
				["layoutOrder"] = p52
			})
		end
	}
	local v54 = UDim2.new
	local v55 = 1
	local v56 = 0
	local v57 = 0
	local v58
	if #v35 > 0 then
		local v59 = #v35 * 22
		v58 = math.min(v59, 280) or 44
	else
		v58 = 44
	end
	v53.size = v54(v55, v56, v57, v58)
	v53.emptyText = #v34 > 0 and "No messages match filter." or "No messages observed yet."
	v47.List = v49(v50, v53)
	return v44(v45, v46, v47)
end
v19._mergeChronologically = v_u_18
return v19