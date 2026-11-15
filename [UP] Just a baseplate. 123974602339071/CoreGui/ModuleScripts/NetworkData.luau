-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.NetworkData
local v_u_1 = game:GetService("LogService")
local v_u_2 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_3 = require(script.Parent.Parent.Parent.Signal)
local v_u_4 = require(script.Parent.Parent.Parent.Constants).NetworkFormatting.ChartHeaderNames
local v5 = settings()
local v_u_6 = tonumber(v5:GetFVariable("NewDevConsoleMaxHttpCount"))
local v_u_19 = {
	[v_u_4[1]] = function(p7, p8)
		return p7.Num < p8.Num
	end,
	[v_u_4[2]] = function(p9, p10)
		return p9.Method < p10.Method
	end,
	[v_u_4[3]] = function(p11, p12)
		return p11.Status < p12.Status
	end,
	[v_u_4[4]] = function(p13, p14)
		return p13.Time < p14.Time
	end,
	[v_u_4[5]] = function(p15, p16)
		return p15.RequestType < p16.RequestType
	end,
	[v_u_4[6]] = function(p17, p18)
		return p17.Url < p18.Url
	end
}
local v_u_20 = {}
v_u_20.__index = v_u_20
function v_u_20.new(p21) -- name: new
	-- upvalues: (copy) v_u_20, (copy) v_u_1, (copy) v_u_3, (copy) v_u_2, (copy) v_u_6, (copy) v_u_4
	local v22 = {}
	local v23 = v_u_20
	setmetatable(v22, v23)
	v22._isRunning = false
	v22._isClient = p21
	v22._httpResultSignal = p21 and v_u_1.HttpResultOut or v_u_1.ServerHttpResultOut
	v22._httpEntryAdded = v_u_3.new()
	v22._httpSummaryTable = {}
	v22._httpSummaryCount = 0
	v22._httpEntryBuffer = v_u_2.new(v_u_6)
	v22._httpLifeTimeEntryCount = 0
	v22._sortType = v_u_4[1]
	return v22
end
function v_u_20.addHttpEntry(p24, p25) -- name: addHttpEntry
	p24._httpLifeTimeEntryCount = p24._httpLifeTimeEntryCount + 1
	local v26 = {
		["Num"] = p24._httpLifeTimeEntryCount,
		["Method"] = p25.Method,
		["Status"] = p25.Status,
		["Time"] = p25.Time,
		["RequestType"] = p25.RequestType,
		["Url"] = p25.URL,
		["Response"] = p25.Response
	}
	p24._httpEntryBuffer:push_back(v26)
	local v27 = p25.RequestType
	local v28 = p24._httpSummaryTable[v27]
	if v28 then
		v28.RequestCount = v28.RequestCount + 1
		if p25.Status >= 400 then
			v28.FailedCount = v28.FailedCount + 1
		end
		v28.AverageTime = (v28.AverageTime * v28.RequestCount + p25.Time - v28.AverageTime) / v28.RequestCount
		if p25.Time < v28.MinTime then
			v28.MinTime = p25.Time
		end
		if p25.Time > v28.MaxTime then
			v28.MaxTime = p25.Time
		end
	else
		p24._httpSummaryCount = p24._httpSummaryCount + 1
		p24._httpSummaryTable[v27] = {
			["RequestType"] = nil,
			["RequestCount"] = 1,
			["FailedCount"] = 0,
			["AverageTime"] = nil,
			["MinTime"] = nil,
			["MaxTime"] = nil,
			["RequestType"] = v27,
			["AverageTime"] = p25.Time,
			["MinTime"] = p25.Time,
			["MaxTime"] = p25.Time
		}
		if p25.Status >= 400 then
			p24._httpSummaryTable[p25.RequestType].FailedCount = 1
			return
		end
	end
end
function v_u_20.setSortType(p29, p30) -- name: setSortType
	-- upvalues: (copy) v_u_19
	if v_u_19[p30] then
		p29._sortType = p30
		p29._httpEntryAdded:Fire(p29._httpSummaryTable, p29._httpSummaryCount, p29:getSortedEntries())
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p30))), 2)
	end
end
function v_u_20.getSortType(p31) -- name: getSortType
	return p31._sortType
end
function v_u_20.resetHttpEntryList(p32) -- name: resetHttpEntryList
	-- upvalues: (copy) v_u_1
	p32._httpSummaryTable = {}
	p32._httpEntryBuffer:reset()
	p32._httpLifeTimeEntryCount = 0
	local v33 = p32._isClient and v_u_1:GetHttpResultHistory()
	if v33 then
		for _, v34 in pairs(v33) do
			p32:addHttpEntry(v34)
		end
	end
end
function v_u_20.Signal(p35) -- name: Signal
	return p35._httpEntryAdded
end
function v_u_20.getSortedEntries(p36) -- name: getSortedEntries
	-- upvalues: (copy) v_u_19
	local v37 = p36._httpEntryBuffer:iterator()
	local v38 = v37:next()
	local v39 = {}
	local v40 = 1
	while v38 do
		v39[v40] = v38
		v40 = v40 + 1
		v38 = v37:next()
	end
	table.sort(v39, v_u_19[p36._sortType])
	return v39
end
function v_u_20.getCurrentData(p41) -- name: getCurrentData
	return {
		["summaryTable"] = p41._httpSummaryTable,
		["summaryCount"] = p41._httpSummaryCount,
		["entryList"] = p41:getSortedEntries()
	}
end
function v_u_20.isRunning(p42) -- name: isRunning
	return p42._isRunning
end
function v_u_20.start(p_u_43) -- name: start
	-- upvalues: (copy) v_u_1
	if not p_u_43._httpResultConnection then
		if p_u_43._additionHttpSetup then
			p_u_43._additionHttpSetup()
		end
		p_u_43._httpResultConnection = p_u_43._httpResultSignal:connect(function(p44)
			-- upvalues: (copy) p_u_43
			p_u_43:addHttpEntry(p44)
			p_u_43._httpEntryAdded:Fire(p_u_43._httpSummaryTable, p_u_43._httpSummaryCount, p_u_43:getSortedEntries())
		end)
		p_u_43:resetHttpEntryList()
		if not p_u_43._isClient then
			p_u_43._onHttpResultApprovedConnection = v_u_1.OnHttpResultApproved:connect(function(p45)
				-- upvalues: (ref) v_u_1, (copy) p_u_43
				v_u_1:RequestHttpResultApproved()
				if p45 then
					p_u_43._onHttpResultApprovedConnection:Disconnect()
					p_u_43._onHttpResultApprovedConnection = nil
				end
			end)
			v_u_1:RequestServerHttpResult()
		end
		p_u_43._isRunning = true
	end
end
function v_u_20.stop(p46) -- name: stop
	if p46._httpResultConnection then
		p46._httpResultConnection:Disconnect()
		p46._httpResultConnection = nil
	end
	p46._isRunning = false
end
return v_u_20