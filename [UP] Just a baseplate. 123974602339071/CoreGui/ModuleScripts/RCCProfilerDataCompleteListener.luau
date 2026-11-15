-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.RCCProfilerDataCompleteListener
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent.Parent.Actions
local v_u_6 = require(v5.AppendRecentDumpPath)
local v_u_7 = require(v5.SetRCCProfilerState)
local v8 = v3.Component:extend("RCCProfilerDataCompleteListener")
function v8.didMount(p_u_9) -- name: didMount
	-- upvalues: (copy) v_u_2
	local v10 = v_u_2()
	if v10 then
		p_u_9.completeSignal = v10.RCCProfilerDataComplete:Connect(function(p11, p12)
			-- upvalues: (copy) p_u_9
			if p_u_9.props.waitingForRecording then
				if not p11 then
					warn(p12)
					p_u_9.props.dispatchSetRCCProfilerState(false)
					return
				end
				p_u_9.props.dispatchSetRCCProfilerState(false, p12)
				p_u_9.props.dispatchAppendRecentDumpPath(p12)
			end
		end)
	end
end
function v8.willUnmount(p13) -- name: willUnmount
	if p13.completeSignal then
		p13.completeSignal:Disconnect()
		p13.completeSignal = nil
	end
end
function v8.render(_) -- name: render
	return nil
end
return v4.UNSTABLE_connect2(function(p14, _) -- name: mapStateToProps
	return {
		["waitingForRecording"] = p14.MicroProfiler.waitingForRecording
	}
end, function(p_u_15) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	return {
		["dispatchAppendRecentDumpPath"] = function(p16) -- name: dispatchAppendRecentDumpPath
			-- upvalues: (copy) p_u_15, (ref) v_u_6
			p_u_15(v_u_6(p16))
		end,
		["dispatchSetRCCProfilerState"] = function(p17, p18) -- name: dispatchSetRCCProfilerState
			-- upvalues: (copy) p_u_15, (ref) v_u_7
			p_u_15(v_u_7(p17, p18))
		end
	}
end)(v8)