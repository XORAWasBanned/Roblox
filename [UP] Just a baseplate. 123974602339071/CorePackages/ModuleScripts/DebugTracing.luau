-- Path: CorePackages.Packages._Index.ReactReconciler.ReactReconciler.DebugTracing
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.Shared).console
local v4 = {}
local v_u_5 = nil
require(script.Parent.ReactFiberLane)
local v_u_6 = require(v1.Shared).ReactFeatureFlags.enableDebugTracing
local v_u_7 = nil
local v_u_8 = {}
local v_u_9 = 0
function decimalToBinaryString(p10) -- name: decimalToBinaryString
	local v11 = ""
	repeat
		local v12 = p10 / 2
		local v13
		p10, v13 = math.modf(v12)
		v11 = math.ceil(v13) .. v11
	until p10 == 0
	local v14 = 31 - string.len(v11)
	return string.rep("0", v14) .. v11
end
local function v_u_17(...) -- name: group
	-- upvalues: (copy) v_u_8, (ref) v_u_7, (copy) v_u_3, (ref) v_u_5
	for _, v15 in { ... } do
		local v16 = v_u_8
		table.insert(v16, v15)
	end
	if v_u_7 == nil then
		v_u_7 = v_u_3.log
		v_u_3.log = v_u_5
	end
end
local function v_u_18() -- name: groupEnd
	-- upvalues: (copy) v_u_8, (ref) v_u_9, (copy) v_u_3, (ref) v_u_7
	table.remove(v_u_8, 1)
	while v_u_9 > #v_u_8 do
		v_u_3.groupEnd()
		v_u_9 = v_u_9 - 1
	end
	if #v_u_8 == 0 then
		v_u_3.log = v_u_7
		v_u_7 = nil
	end
end
v_u_5 = function(...) -- name: log
	-- upvalues: (ref) v_u_9, (copy) v_u_8, (copy) v_u_3, (ref) v_u_7
	if v_u_9 < #v_u_8 then
		for v19 = v_u_9 + 1, #v_u_8 do
			local v20 = v_u_8[v19]
			v_u_3.group(v20)
		end
		v_u_9 = #v_u_8
	end
	local v21 = v_u_7
	if typeof(v21) == "function" then
		v_u_7(...)
	else
		v_u_3.log(...)
	end
end
function v4.logCommitStarted(p22) -- name: logCommitStarted
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_17
	if v_u_2.__DEV__ and v_u_6 then
		v_u_17(string.format("* commit (%s)", "0b" .. decimalToBinaryString(p22)), "", "", "")
	end
end
function v4.logCommitStopped() -- name: logCommitStopped
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_18
	if v_u_2.__DEV__ and v_u_6 then
		v_u_18()
	end
end
function v4.logComponentSuspended(p_u_23, p24) -- name: logComponentSuspended
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (ref) v_u_5
	if v_u_2.__DEV__ and v_u_6 then
		v_u_5(string.format("* %s suspended", p_u_23))
		p24:andThen(function()
			-- upvalues: (ref) v_u_5, (copy) p_u_23
			v_u_5(string.format("* %s resolved", p_u_23))
		end, function()
			-- upvalues: (ref) v_u_5, (copy) p_u_23
			v_u_5(string.format("* %s rejected", p_u_23))
		end)
	end
end
function v4.logLayoutEffectsStarted(p25) -- name: logLayoutEffectsStarted
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_17
	if v_u_2.__DEV__ and v_u_6 then
		v_u_17(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(p25)))
	end
end
function v4.logLayoutEffectsStopped() -- name: logLayoutEffectsStopped
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_18
	if v_u_2.__DEV__ and v_u_6 then
		v_u_18()
	end
end
function v4.logPassiveEffectsStarted(p26) -- name: logPassiveEffectsStarted
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_17
	if v_u_2.__DEV__ and v_u_6 then
		v_u_17(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(p26)))
	end
end
function v4.logPassiveEffectsStopped() -- name: logPassiveEffectsStopped
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_18
	if v_u_2.__DEV__ and v_u_6 then
		v_u_18()
	end
end
function v4.logRenderStarted(p27) -- name: logRenderStarted
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_17
	if v_u_2.__DEV__ and v_u_6 then
		v_u_17(string.format("* render (%s)", "0b" .. decimalToBinaryString(p27)))
	end
end
function v4.logRenderStopped() -- name: logRenderStopped
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_18
	if v_u_2.__DEV__ and v_u_6 then
		v_u_18()
	end
end
function v4.logForceUpdateScheduled(p28, p29) -- name: logForceUpdateScheduled
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (ref) v_u_5
	if v_u_2.__DEV__ and v_u_6 then
		v_u_5(string.format("* %s forced update (%s)", p28, "0b" .. decimalToBinaryString(p29)))
	end
end
function v4.logStateUpdateScheduled(p30, p31, _) -- name: logStateUpdateScheduled
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (ref) v_u_5
	if v_u_2.__DEV__ and v_u_6 then
		v_u_5(string.format("* %s updated state (%s)", p30, "0b" .. decimalToBinaryString(p31)))
	end
end
return v4