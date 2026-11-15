-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Log.LogData
local v_u_1 = game:GetService("LogService")
local v_u_2 = game:GetService("TextService")
local v3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = v3.DefaultFontSize.MainWindow
local v_u_5 = v3.Font.Log
local v_u_6 = v3.LogFormatting.MaxStringSize
local v_u_7 = v3.EnumToMsgTypeName
local v_u_8 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_9 = require(script.Parent.Parent.Parent.Signal)
local v10 = settings()
local v_u_11 = tonumber(v10:GetFVariable("NewDevConsoleMaxLogCount"))
local v_u_12 = { "ClassDescriptor failed to learn", "EventDescriptor failed to learn", "Type failed to learn" }
local v_u_13 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local v_u_14 = {}
v_u_14.__index = v_u_14
local function v_u_23(p15, p16, p17, p18) -- name: messageEntry
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	local v19 = #p15
	local v20
	if v19 < v_u_6 then
		v20 = string.format("%s -- %s", p16, p15)
	else
		local v21 = v_u_6
		v20 = string.format("%s -- %s", p16, (string.sub(p15, 1, v21)))
	end
	local v22 = v_u_2:GetTextSize(v20, v_u_4, v_u_5, Vector2.new())
	if p18 and next(p18) == nil then
		p18 = nil
	end
	return {
		["Message"] = nil,
		["CharCount"] = nil,
		["Type"] = nil,
		["Dims"] = nil,
		["Context"] = nil,
		["Expanded"] = false,
		["Message"] = v20,
		["CharCount"] = v19,
		["Type"] = p17,
		["Dims"] = v22,
		["Context"] = p18
	}
end
local function v_u_27(p24) -- name: ignoreWarningMessageOnAdd
	-- upvalues: (copy) v_u_12
	if p24.Type ~= Enum.MessageType.MessageWarning.Value then
		return false
	end
	local v25 = false
	for _, v26 in ipairs(v_u_12) do
		if string.find(p24.Message, v26) == nil then
			continue
		end
		return true
	end
	return v25
end
local function v_u_31(p28, p29, p30) -- name: isMessageFiltered
	-- upvalues: (copy) v_u_7
	if #p30 == 0 and not next(p29) then
		return false
	elseif next(p29) and not p29[v_u_7[p28.Type]] then
		return false
	else
		return #p30 <= 0 or string.find(p28.Message:lower(), p30:lower()) ~= nil
	end
end
local function v_u_40(p32, p33, p34, p35) -- name: filterMessages
	-- upvalues: (copy) v_u_31, (copy) v_u_23
	p32:reset()
	local v36 = false
	for _, v37 in pairs(p34) do
		v36 = v36 or v37
	end
	if #p35 ~= 0 or v36 then
		local v38 = p33:next()
		local v39 = 0
		while v38 do
			if v_u_31(v38, p34, p35) then
				v39 = v39 + 1
				p32:push_back(v38)
			end
			v38 = p33:next()
		end
		if v39 == 0 then
			if #p35 > 0 then
				p32:push_back((v_u_23(string.format("\"%s\" was not found", p35), "", 0)))
				return
			end
			p32:push_back((v_u_23("No Messages were found", "", 0)))
		end
	end
end
function v_u_14.checkErrorWarningCounter(p41, p42) -- name: checkErrorWarningCounter
	if p42 == Enum.MessageType.MessageWarning.Value then
		p41._warningCount = p41._warningCount + 1
		p41._errorWarningSignal:Fire(p41._errorCount, p41._warningCount)
	elseif p42 == Enum.MessageType.MessageError.Value then
		p41._errorCount = p41._errorCount + 1
		p41._errorWarningSignal:Fire(p41._errorCount, p41._warningCount)
	end
end
function v_u_14.new(p43) -- name: new
	-- upvalues: (copy) v_u_14, (copy) v_u_8, (copy) v_u_11, (copy) v_u_7, (copy) v_u_9
	local v44 = {}
	local v45 = v_u_14
	setmetatable(v44, v45)
	v44._initialized = false
	v44._isRunning = false
	v44._isClient = p43
	v44._logData = v_u_8.new(v_u_11)
	v44._logDataSearched = v_u_8.new(v_u_11)
	v44._searchTerm = ""
	v44._commandLineHistory = v_u_8.new(100)
	v44._commandLineIndex = 0
	v44._filters = {}
	for _, v46 in pairs(v_u_7) do
		v44._filters[v46] = true
	end
	v44._errorCount = p43 and 0
	v44._warningCount = p43 and 0
	v44._logDataUpdate = v_u_9.new()
	if p43 then
		p43 = v_u_9.new()
	end
	v44._errorWarningSignal = p43
	v44._filterUpdated = v_u_9.new()
	return v44
end
function v_u_14.Signal(p47) -- name: Signal
	return p47._logDataUpdate
end
function v_u_14.errorWarningSignal(p48) -- name: errorWarningSignal
	return p48._errorWarningSignal
end
function v_u_14.filterUpdatedSignal(p49) -- name: filterUpdatedSignal
	return p49._filterUpdated
end
function v_u_14.setSearchTerm(p50, p51) -- name: setSearchTerm
	-- upvalues: (copy) v_u_40
	if p50._searchTerm ~= p51 then
		p50._searchTerm = p51
		if p50._searchTerm == "" then
			p50._logDataSearched:reset()
			p50._logDataUpdate:Fire(p50._logData)
			return
		end
		v_u_40(p50._logDataSearched, p50._logData:iterator(), p50._filters, p50._searchTerm)
		p50._logDataUpdate:Fire(p50._logDataSearched)
	end
end
function v_u_14.getSearchTerm(p52) -- name: getSearchTerm
	return p52._searchTerm
end
function v_u_14.getCommandLineHistory(p53) -- name: getCommandLineHistory
	return p53._commandLineHistory
end
function v_u_14.getCommandLineIndex(p54) -- name: getCommandLineIndex
	return p54._commandLineIndex
end
function v_u_14.setCommandLineIndex(p55, p56) -- name: setCommandLineIndex
	p55._commandLineIndex = p56
end
function v_u_14.getFilters(p57) -- name: getFilters
	return p57._filters
end
function v_u_14.setFilter(p58, p59, p60) -- name: setFilter
	-- upvalues: (copy) v_u_40
	local v61 = p58._filters[p59]
	p58._filters[p59] = p60
	local v62 = p58._filters
	local v63 = false
	for _, v64 in pairs(v62) do
		v63 = v63 or v64
	end
	if v63 then
		v_u_40(p58._logDataSearched, p58._logData:iterator(), p58._filters, p58._searchTerm)
		p58._logDataUpdate:Fire(p58._logDataSearched)
		p58._filterUpdated:Fire()
	else
		p58._filters[p59] = v61
	end
end
function v_u_14.setFilters(p65, p66) -- name: setFilters
	-- upvalues: (copy) v_u_40
	p65._filters = p66
	local v67 = false
	for _, v68 in pairs(p66) do
		v67 = v67 or v68
	end
	if v67 then
		v_u_40(p65._logDataSearched, p65._logData:iterator(), p65._filters, p65._searchTerm)
		p65._logDataUpdate:Fire(p65._logDataSearched)
		p65._filterUpdated:Fire()
	else
		p65._logDataSearched:reset()
		p65._logDataUpdate:Fire(p65._logData)
	end
end
function v_u_14.getLogData(p69) -- name: getLogData
	if #p69._logDataSearched:getData() > 0 then
		return p69._logDataSearched
	else
		return p69._logData
	end
end
function v_u_14.getErrorWarningCount(p70) -- name: getErrorWarningCount
	return p70._errorCount, p70._warningCount
end
function v_u_14.isRunning(p71) -- name: isRunning
	return p71._initialized
end
function v_u_14.start(p_u_72) -- name: start
	-- upvalues: (copy) v_u_1, (copy) v_u_23, (copy) v_u_13, (copy) v_u_27, (copy) v_u_31
	if p_u_72._isClient then
		if not p_u_72._initialized then
			p_u_72._initialized = true
			if #{} == 0 then
				local v73 = v_u_1:GetLogHistory()
				for _, v74 in ipairs(v73) do
					local v75 = v_u_23(v74.message or "[DevConsole Error 1]", v_u_13(v74.timestamp), v74.messageType.Value, v74.context)
					if v_u_27(v75) then
						continue
					end
					p_u_72:checkErrorWarningCounter(v74.messageType.Value)
					p_u_72._logData:push_back(v75)
				end
			end
		end
		p_u_72._connection = v_u_1.MessageOut:connect(function(p76, p77, p78)
			-- upvalues: (ref) v_u_23, (ref) v_u_13, (ref) v_u_27, (copy) p_u_72, (ref) v_u_31
			local v79 = v_u_23(p76 or "[DevConsole Error 2]", v_u_13(os.time()), p77.Value, p78)
			if not v_u_27(v79) then
				p_u_72:checkErrorWarningCounter(p77.Value)
				p_u_72._logData:push_back(v79)
				if #p_u_72._logDataSearched:getData() > 0 then
					if v_u_31(v79, p_u_72._filters, p_u_72._searchTerm) then
						p_u_72._logDataSearched:push_back(v79)
						p_u_72._logDataUpdate:Fire(p_u_72._logDataSearched)
						return
					end
				else
					p_u_72._logDataUpdate:Fire(p_u_72._logData)
				end
			end
		end)
	else
		p_u_72._connection = v_u_1.ServerMessageOut:connect(function(p80, p81, p82, p83)
			-- upvalues: (ref) v_u_23, (ref) v_u_13, (ref) v_u_27, (copy) p_u_72, (ref) v_u_31
			local v84 = v_u_23(p80 or "[DevConsole Error 3]", v_u_13(p82), p81.Value, p83)
			if not v_u_27(v84) then
				p_u_72._logData:push_back(v84)
				if #p_u_72._logDataSearched:getData() > 0 then
					if v_u_31(v84, p_u_72._filters, p_u_72._searchTerm) then
						p_u_72._logDataSearched:push_back(v84)
						p_u_72._logDataUpdate:Fire(p_u_72._logDataSearched)
						return
					end
				else
					p_u_72._logDataUpdate:Fire(p_u_72._logData)
				end
			end
		end)
		local function v91()
			-- upvalues: (copy) p_u_72, (ref) v_u_1, (ref) v_u_23, (ref) v_u_13, (ref) v_u_27, (ref) v_u_31
			p_u_72._variantConnection = v_u_1.ServerContextOut:connect(function(p85)
				-- upvalues: (ref) v_u_23, (ref) v_u_13, (ref) v_u_27, (ref) p_u_72, (ref) v_u_31
				if type(p85) == "table" and p85._structuredContext then
					local v86 = p85._message or ""
					local v87 = p85._messageType or 0
					local v88 = p85._timestamp or 0
					local v89 = p85._structuredContext
					local v90 = v_u_23(v86, v_u_13(v88), v87, v89)
					if not v_u_27(v90) then
						p_u_72._logData:push_back(v90)
						if #p_u_72._logDataSearched:getData() > 0 then
							if v_u_31(v90, p_u_72._filters, p_u_72._searchTerm) then
								p_u_72._logDataSearched:push_back(v90)
								p_u_72._logDataUpdate:Fire(p_u_72._logDataSearched)
								return
							end
						else
							p_u_72._logDataUpdate:Fire(p_u_72._logData)
						end
					end
				end
			end)
		end
		pcall(v91)
		v_u_1:RequestServerOutput()
	end
	p_u_72._isRunning = true
end
function v_u_14.stop(p92) -- name: stop
	p92._initialized = false
	p92._isRunning = false
	if p92._connection then
		p92._connection:Disconnect()
	end
	if p92._variantConnection then
		p92._variantConnection:Disconnect()
	end
end
return v_u_14