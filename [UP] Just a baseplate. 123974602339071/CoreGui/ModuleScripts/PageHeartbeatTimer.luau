-- Path: CoreGui.RobloxGui.Modules.Shell.PageHeartbeatTimer
local v_u_1 = require(script.Parent.Analytics)
local v_u_2 = { 2, 10 }
local v_u_3 = {}
local v4 = {}
local function v_u_6() -- name: cancelTasks
	-- upvalues: (ref) v_u_3
	for _, v5 in ipairs(v_u_3) do
		if v5 == nil then
			continue
		end
		v5()
	end
	v_u_3 = {}
end
function v4.onPageChanged(p_u_7) -- name: onPageChanged
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (ref) v_u_3, (copy) v_u_1
	v_u_6()
	for v_u_8, v9 in ipairs(v_u_2) do
		local v10 = v_u_3
		local function v_u_12(p11)
			-- upvalues: (ref) v_u_1, (copy) p_u_7
			v_u_1.reportPageHeartbeat(p11, p_u_7)
		end
		local v_u_13 = false
		task.delay(v9, function()
			-- upvalues: (ref) v_u_13, (copy) v_u_12, (copy) v_u_8
			if not v_u_13 then
				v_u_12(v_u_8)
			end
		end)
		v10[v_u_8] = function()
			-- upvalues: (ref) v_u_13
			v_u_13 = true
		end
	end
end
return v4