-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.RequestOrchestrator.OrchestratorRow
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = v3.Font.Mono
local v_u_5 = {
	["inflight"] = Color3.fromRGB(255, 165, 0),
	["retrying"] = Color3.fromRGB(255, 165, 0),
	["success"] = Color3.fromRGB(66, 135, 245),
	["failure"] = Color3.fromRGB(220, 50, 50),
	["exhausted"] = Color3.fromRGB(220, 50, 50),
	["queueOp"] = Color3.fromRGB(0, 149, 235),
	["queueRetry"] = Color3.fromRGB(239, 68, 68),
	["batchOutline"] = Color3.fromRGB(255, 171, 37),
	["labelText"] = Color3.fromRGB(200, 200, 200),
	["queueText"] = Color3.fromRGB(160, 160, 160),
	["cacheHot"] = Color3.fromRGB(100, 255, 180),
	["cacheCold"] = Color3.fromRGB(60, 120, 95),
	["cacheEmpty"] = v3.Color.BaseGray,
	["idleText"] = Color3.fromRGB(70, 70, 70),
	["timelineTick"] = Color3.fromRGB(50, 50, 50),
	["timelineBackground"] = Color3.fromRGB(20, 20, 20),
	["rowBackground"] = Color3.fromRGB(28, 28, 28)
}
local function v_u_7(p6) -- name: renderTypeLabel
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	return v_u_2.createElement("TextLabel", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = 12,
		["Font"] = nil,
		["TextXAlignment"] = nil,
		["TextYAlignment"] = nil,
		["Size"] = UDim2.new(0, 130, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Text"] = p6,
		["TextColor3"] = v_u_5.labelText,
		["Font"] = v_u_4,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextYAlignment"] = Enum.TextYAlignment.Top
	})
end
local function v_u_24(p8, p9) -- name: renderBatchOutline
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	local v10 = math.min(p9, 30)
	local v11 = p8.panelWidth
	if v11 and v11 > 0 then
		local v12 = (v11 - 374 - 8 - 8 + 3) / 19
		local v13 = math.floor(v12)
		v10 = math.min(v10, v13)
	end
	local v14 = math.max(1, v10)
	local v15 = v14 < p9
	local v16 = v14 * 16
	local v17 = v14 - 1
	local v18 = v16 + math.max(0, v17) * 3 + 8
	local v19 = v_u_2.createElement
	local v20 = "Frame"
	local v21 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, v18, 0, 21),
		["Position"] = UDim2.new(0, 374, 0, 1.5)
	}
	local v22 = {
		["Corner"] = v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 4)
		}),
		["Stroke"] = v_u_2.createElement("UIStroke", {
			["Color"] = nil,
			["Thickness"] = 1.5,
			["Transparency"] = 0.15,
			["Color"] = v_u_5.batchOutline
		})
	}
	local v23
	if v15 then
		v23 = v_u_2.createElement("TextLabel", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = "\194\187",
			["TextColor3"] = nil,
			["TextSize"] = 12,
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, -2, 0.5, 0),
			["Size"] = UDim2.new(0, 10, 1, 0),
			["TextColor3"] = v_u_5.batchOutline,
			["Font"] = v_u_4,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
	else
		v23 = nil
	end
	v22.Overflow = v23
	return v19(v20, v21, v22)
end
local function v_u_25() -- name: renderIdleQueue
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	return v_u_2.createElement("TextLabel", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = "idle",
		["TextColor3"] = nil,
		["TextSize"] = 10,
		["Font"] = nil,
		["TextXAlignment"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["TextColor3"] = v_u_5.idleText,
		["Font"] = v_u_4,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
end
local function v_u_42(p26, p27) -- name: renderCacheChildren
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	local v28 = {}
	local v29 = not p26 and {} or p26.items
	local v30 = #v29
	v28.Count = v_u_2.createElement("TextLabel", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = 10,
		["Font"] = nil,
		["TextXAlignment"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 12),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Text"] = string.format("cache %d", v30),
		["TextColor3"] = v_u_5.queueText,
		["Font"] = v_u_4,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
	for v31, v32 in ipairs(v29) do
		if v31 > 48 then
			break
		end
		local v33 = (v31 - 1) % 12
		local v34 = (v31 - 1) / 12
		local v35 = math.floor(v34)
		local v36
		if v32.lastHitTime then
			local v37 = 1 - (p27 - v32.lastHitTime) / 0.6
			v36 = math.clamp(v37, 0, 1)
		else
			v36 = 0
		end
		v28["c" .. v31] = v_u_2.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.new(0, v33 * 10, 0, v35 * 10 + 12),
			["Size"] = UDim2.new(0, 8, 0, 8),
			["BackgroundColor3"] = v_u_5.cacheCold:Lerp(v_u_5.cacheHot, v36)
		}, {
			["Corner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 2)
			})
		})
	end
	for v38 = v30 + 1, 48 do
		local v39 = (v38 - 1) % 12
		local v40 = (v38 - 1) / 12
		local v41 = math.floor(v40)
		v28["e" .. v38] = v_u_2.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.new(0, v39 * 10, 0, v41 * 10 + 12),
			["Size"] = UDim2.new(0, 8, 0, 8),
			["BackgroundColor3"] = v_u_5.cacheEmpty
		}, {
			["Corner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 2)
			})
		})
	end
	return v28
end
local function v_u_61(p43, p44) -- name: renderTimelineChildren
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	local v45 = p44 - 30
	local v46 = {}
	for v47, v48 in pairs(p43) do
		local v49 = v48.attempts or {}
		local v50 = #v49
		for v51, v52 in ipairs(v49) do
			local v53 = v52.finish or p44
			if v45 > v53 then
				continue
			end
			local v54 = (v52.start - v45) / 30
			local v55 = math.max(0, v54)
			local v56 = (v53 - v45) / 30
			local v57 = math.min(1, v56)
			if v55 >= v57 then
				continue
			end
			local v58
			if v51 == v50 then
				v58 = v_u_5[v48.state] or v_u_5.inflight
			else
				v58 = v_u_5.retrying
			end
			v46["batch_" .. v47 .. "_" .. v51] = v_u_2.createElement("Frame", {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(v55, 0, 0, 2),
				["Size"] = UDim2.new(v57 - v55, 0, 1, -4),
				["BackgroundColor3"] = v58
			}, {
				["Corner"] = v_u_2.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 4)
				})
			})
		end
	end
	for v59 = 0, 2 do
		local v60 = 1 - v59 * 10 / 30
		v46["tick_" .. v59] = v_u_2.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.new(v60, 0, 0, 0),
			["Size"] = UDim2.new(0, 1, 1, 0),
			["BackgroundColor3"] = v_u_5.timelineTick
		})
	end
	return v46
end
local v62 = v_u_2.Component:extend("OrchestratorRow")
function v62.init(p63) -- name: init
	p63.opAnim = {}
end
function v62.renderQueueChildren(p64, p65, p66, p67) -- name: renderQueueChildren
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	local v68 = {}
	local v69 = {}
	for _, v70 in ipairs(p65.retryOps or {}) do
		table.insert(v68, {
			["id"] = nil,
			["isRetry"] = true,
			["id"] = v70
		})
	end
	for _, v71 in ipairs(p65.ops or {}) do
		table.insert(v68, {
			["id"] = nil,
			["isRetry"] = false,
			["id"] = v71
		})
	end
	local v72 = p67 - p65.createdTime
	local v73 = #v68
	local v74 = v_u_2.createElement
	local v75 = "TextLabel"
	local v76 = {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = 10,
		["Font"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(0, 120, 1, 0)
	}
	local v77
	if p66 then
		v77 = string.format("%d/%d ops  %.1fs", v73, p66, v72)
	else
		v77 = string.format("%d ops  %.1fs", v73, v72)
	end
	v76.Text = v77
	v76.TextColor3 = v_u_5.queueText
	v76.Font = v_u_4
	v76.TextXAlignment = Enum.TextXAlignment.Left
	v69.Info = v74(v75, v76)
	local v78 = {}
	for v79, v80 in ipairs(v68) do
		if v79 > 30 then
			break
		end
		local v81 = v80.id
		if v78[v81] then
			v81 = v81 .. "#" .. v79
		end
		v78[v81] = true
		local v82 = 120 + (v79 - 1) * 19
		local v83 = p64.opAnim[v81]
		if v83 then
			if v83.toX ~= v82 then
				local v84 = v83.fromX
				local v85 = v83.toX
				local v86 = (p67 - v83.start) / 0.25
				local v87 = math.clamp(v86, 0, 1)
				local v88 = v87 * v87 * (3 - 2 * v87)
				v83.fromX = v84 + (v85 - v84) * v88
				v83.toX = v82
				v83.start = p67
			end
		else
			local v89
			if v80.isRetry then
				v89 = v82 - 19
			else
				v89 = v82
			end
			v83 = {
				["fromX"] = v89,
				["toX"] = v82,
				["start"] = p67
			}
			p64.opAnim[v81] = v83
		end
		local v90 = v83.fromX
		local v91 = v83.toX
		local v92 = (p67 - v83.start) / 0.25
		local v93 = math.clamp(v92, 0, 1)
		local v94 = v93 * v93 * (3 - 2 * v93)
		local v95 = v90 + (v91 - v90) * v94
		local v96 = v_u_5.queueOp
		local v97
		if v80.isRetry then
			v96 = v_u_5.queueRetry
			local v98 = p67 * 7
			v97 = (math.sin(v98) * 0.5 + 0.5) * 0.75
		else
			v97 = 0
		end
		v69["op_" .. v81] = v_u_2.createElement("Frame", {
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.new(0, v95, 0.5, -8),
			["Size"] = UDim2.new(0, 16, 0, 16),
			["BackgroundColor3"] = v96,
			["BackgroundTransparency"] = v97
		}, {
			["Corner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 3)
			})
		})
	end
	for v99 in pairs(p64.opAnim) do
		if v78[v99] then
			continue
		end
		p64.opAnim[v99] = nil
	end
	return v69
end
function v62.render(p100) -- name: render
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_42, (copy) v_u_24, (copy) v_u_25, (copy) v_u_5, (copy) v_u_61
	local v101 = p100.props.orchestratorType
	local v102 = p100.props.batches
	local v103 = p100.props.queue
	local v104 = p100.props.now
	local v105 = p100.props.size
	local v106 = p100.props.layoutOrder
	local v107 = {
		["Label"] = v_u_7(v101),
		["CacheGrid"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["Size"] = UDim2.new(0, 120, 1, 0),
			["Position"] = UDim2.new(0, 134, 0, 0)
		}, (v_u_42(p100.props.cache, v104)))
	}
	local v108 = p100.props.observedMaxBatchSize
	if not v108 or v108 <= 0 then
		v108 = nil
	end
	if v108 then
		v107.BatchOutline = v_u_24(p100.props, v108)
	end
	local v109
	if v103 then
		v109 = p100:renderQueueChildren(v103, v108, v104)
	else
		p100.opAnim = {}
		v109 = {
			["Idle"] = v_u_25()
		}
	end
	v107.Queue = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["ClipsDescendants"] = true,
		["Size"] = UDim2.new(1, -258, 0, 24),
		["Position"] = UDim2.new(0, 258, 0, 0)
	}, v109)
	v107.Timeline = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["ClipsDescendants"] = true,
		["Size"] = UDim2.new(1, -258, 0, 28),
		["Position"] = UDim2.new(0, 258, 0, 24),
		["BackgroundColor3"] = v_u_5.timelineBackground
	}, (v_u_61(v102, v104)))
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = nil,
		["Size"] = v105,
		["BackgroundColor3"] = v_u_5.rowBackground,
		["LayoutOrder"] = v106
	}, v107)
end
return v62