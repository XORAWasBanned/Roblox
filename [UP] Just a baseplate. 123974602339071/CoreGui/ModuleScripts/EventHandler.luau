-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.EventHandler
local v1 = script.Parent.Parent
local v2 = require(v1.Enums.PlatformEnum)
local v3 = require(v1.Events.VR.VRFTUXEventHandler)
local v_u_4 = require(v1.Events.Events)
local v_u_5 = {
	[v2.QuestVR] = v3
}
return {
	["StartEvents"] = function(p6, p7, p8) -- name: StartEvents
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		local v9 = v_u_5[p6]
		local v10 = v_u_4[p6][p7]
		if v10 then
			for _, v11 in pairs(v10) do
				v9.StartEvent(v11, p8)
			end
		end
	end,
	["StopEvents"] = function(p12, p13) -- name: StopEvents
		-- upvalues: (copy) v_u_5, (copy) v_u_4
		local v14 = v_u_5[p12]
		local v15 = v_u_4[p12][p13]
		if v15 then
			for _, v16 in pairs(v15) do
				v14.StopEvent(v16)
			end
		end
	end
}