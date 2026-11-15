-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Service.ChromeUtils
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("StarterGui")
local v3 = require(v1.Workspace.Packages.SharedFlags)
local v_u_4 = require(v1.Workspace.Packages.AppCommonLib).Signal
require(v1.Workspace.Packages.Chrome)
local v_u_5 = v3.FFlagEnableConsoleExpControls
local v_u_6 = {
	["Unavailable"] = 0,
	["Loading"] = 1,
	["Available"] = 2,
	["Pinned"] = 3
}
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new(p8) -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	local v9 = {
		["_state"] = p8 or v_u_6.Unavailable
	}
	local v10
	if v_u_5 then
		v10 = false
	else
		v10 = nil
	end
	v9._forceUnavailable = v10
	v9._changeSignal = v_u_4.new()
	local v11 = v_u_7
	return setmetatable(v9, v11)
end
function v_u_7.connect(p12, p13) -- name: connect
	return p12._changeSignal:connect(p13)
end
function v_u_7.set(p14, p15) -- name: set
	-- upvalues: (copy) v_u_5
	if p14._state ~= p15 then
		p14._state = p15
		if not (v_u_5 and p14._forceUnavailable) then
			p14._changeSignal:fire(p15)
		end
	end
end
function v_u_7.get(p16) -- name: get
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if v_u_5 and p16._forceUnavailable then
		return v_u_6.Unavailable
	else
		return p16._state
	end
end
function v_u_7.available(p17) -- name: available
	-- upvalues: (copy) v_u_6
	p17:set(v_u_6.Available)
end
function v_u_7.loading(p18) -- name: loading
	-- upvalues: (copy) v_u_6
	p18:set(v_u_6.Loading)
end
function v_u_7.unavailable(p19) -- name: unavailable
	-- upvalues: (copy) v_u_6
	p19:set(v_u_6.Unavailable)
end
function v_u_7.pinned(p20) -- name: pinned
	-- upvalues: (copy) v_u_6
	p20:set(v_u_6.Pinned)
end
function v_u_7.forceUnavailable(p21) -- name: forceUnavailable
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if v_u_5 and not p21._forceUnavailable then
		p21._forceUnavailable = true
		if p21._state ~= v_u_6.Unavailable then
			p21._changeSignal:fire(v_u_6.Unavailable)
		end
	end
end
function v_u_7.unforceUnavailable(p22) -- name: unforceUnavailable
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if v_u_5 and p22._forceUnavailable then
		p22._forceUnavailable = false
		if p22._state ~= v_u_6.Unavailable then
			p22._changeSignal:fire(p22._state)
		end
	end
end
local v_u_23 = {}
v_u_23.__index = v_u_23
function v_u_23.new(p24) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_23
	local v25 = {
		["_value"] = {
			["type"] = "empty",
			["value"] = nil
		},
		["_changeSignal"] = v_u_4.new(),
		["_excludeFromTotalCounts"] = p24 or false
	}
	local v26 = v_u_23
	return setmetatable(v25, v26)
end
function v_u_23.setExcludeFromTotalCounts(p27, p28) -- name: setExcludeFromTotalCounts
	p27._excludeFromTotalCounts = p28
end
function v_u_23.excludeFromTotalCounts(p29) -- name: excludeFromTotalCounts
	return p29._excludeFromTotalCounts
end
function v_u_23.connect(p30, p31) -- name: connect
	return p30._changeSignal:connect(p31)
end
function v_u_23.get(p32) -- name: get
	return p32._value
end
function v_u_23.clear(p33) -- name: clear
	if p33._value and p33._value.type ~= "empty" then
		p33._value = {
			["type"] = "empty",
			["value"] = nil
		}
		p33._changeSignal:fire(p33._value)
	end
end
function v_u_23.fireCount(p34, p35) -- name: fireCount
	local v36 = {
		["type"] = "count",
		["value"] = nil,
		["value"] = p35
	}
	if p34._value ~= v36 then
		p34._value = v36
		p34._changeSignal:fire(p34._value)
	end
end
function v_u_23.isEmpty(p37) -- name: isEmpty
	local v38 = p37._value
	if v38 then
		v38 = p37._value.type == "empty"
	end
	return v38
end
local v_u_39 = {}
v_u_39.__index = v_u_39
function v_u_39.new(p40) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_39
	local v41 = {
		["_value"] = p40,
		["_changeSignal"] = v_u_4.new()
	}
	local v42 = v_u_39
	return setmetatable(v41, v42)
end
function v_u_39.get(p43) -- name: get
	return p43._value
end
function v_u_39.setMomentary(p_u_44, p45, p46, p_u_47) -- name: setMomentary
	if p_u_44._value ~= p45 then
		p_u_44._value = p45
		p_u_44._changeSignal:fire(p45)
	end
	local v48 = p_u_44._momentaryClearThread
	if v48 then
		task.cancel(v48)
	end
	p_u_44._momentaryClearThread = task.delay(p46, function()
		-- upvalues: (copy) p_u_44, (copy) p_u_47
		p_u_44._momentaryClearThread = nil
		p_u_44.set(p_u_44, p_u_47)
	end)
end
function v_u_39.set(p49, p50) -- name: set
	local v51 = p49._momentaryClearThread
	if v51 then
		task.cancel(v51)
		p49._momentaryClearThread = nil
	end
	if p49._value ~= p50 then
		p49._value = p50
		p49._changeSignal:fire(p50)
	end
end
function v_u_39.signal(p52) -- name: signal
	return p52._changeSignal
end
function v_u_39.connect(p53, p54, p55) -- name: connect
	local v56 = p53._changeSignal:connect(p54)
	if p55 == true then
		p54(p53._value)
	end
	return v56
end
local v_u_57 = {}
v_u_57.__index = v_u_57
function v_u_57.new(p58, p59, p60) -- name: new
	-- upvalues: (copy) v_u_57
	if not p58 then
		error("No signal provided to MappedSignal")
	end
	if not p59 then
		error("No fetchMapFunction provided to MappedSignal")
	end
	local v61 = v_u_57
	return setmetatable({
		["_signal"] = p58,
		["_fetchMapFunction"] = p59,
		["_eventReceiver"] = p60
	}, v61)
end
function v_u_57.connect(p_u_62, p_u_63) -- name: connect
	if not p_u_62._signal then
		warn("MappedSignal: Missing signal")
		return function() end
	end
	local v64 = p_u_62._signal:connect(function()
		-- upvalues: (copy) p_u_62, (copy) p_u_63
		if p_u_62._eventReceiver then
			p_u_62._eventReceiver()
		end
		p_u_63(p_u_62._fetchMapFunction())
	end)
	if p_u_62._eventReceiver then
		p_u_62._eventReceiver()
	end
	p_u_63(p_u_62._fetchMapFunction())
	return v64
end
function v_u_57.get(p65) -- name: get
	return p65._fetchMapFunction()
end
function setCoreGuiAvailability(p_u_66, p_u_67, p_u_68) -- name: setCoreGuiAvailability
	-- upvalues: (copy) v_u_2
	local function v70() -- name: updateAvailable
		-- upvalues: (ref) v_u_2, (copy) p_u_67, (copy) p_u_68, (copy) p_u_66
		local v69 = v_u_2:GetCoreGuiEnabled(p_u_67)
		if p_u_68 then
			p_u_68(v69)
			return
		elseif v69 then
			p_u_66.availability:available()
		else
			p_u_66.availability:unavailable()
		end
	end
	local v71 = v_u_2.CoreGuiChangedSignal:Connect(v70)
	local v72 = v_u_2:GetCoreGuiEnabled(p_u_67)
	if p_u_68 then
		p_u_68(v72)
		return v71
	elseif v72 then
		p_u_66.availability:available()
		return v71
	else
		p_u_66.availability:unavailable()
		return v71
	end
end
return {
	["MappedSignal"] = v_u_57,
	["AvailabilitySignal"] = v_u_7,
	["AvailabilitySignalState"] = v_u_6,
	["NotifySignal"] = v_u_23,
	["ObservableValue"] = v_u_39,
	["setCoreGuiAvailability"] = setCoreGuiAvailability
}