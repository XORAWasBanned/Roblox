-- Path: CorePackages.Packages._Index.InputHandlers.InputHandlers.handleInput
local v1 = script.Parent.Parent
require(v1.FocusNavigation)
local v_u_2 = require(script.Parent.Heartbeat)
local function v_u_6(p3, p_u_4) -- name: cancellableDelay
	local v_u_5 = false
	task.delay(p3, function()
		-- upvalues: (ref) v_u_5, (copy) p_u_4
		if not v_u_5 then
			p_u_4()
		end
	end)
	return {
		["cancel"] = function() -- name: cancel
			-- upvalues: (ref) v_u_5
			v_u_5 = true
		end
	}
end
return function(p_u_7) -- name: handleInput
	-- upvalues: (copy) v_u_6, (copy) v_u_2
	local v_u_8 = p_u_7.hold
	local v_u_9 = nil
	local v_u_10 = nil
	local v_u_11 = false
	return function(p12)
		-- upvalues: (ref) v_u_11, (copy) p_u_7, (ref) v_u_9, (ref) v_u_10, (copy) v_u_8, (ref) v_u_6, (ref) v_u_2
		local v13 = p12.eventData
		local v14
		if v13 then
			v14 = v13.immediateDispatch or false
		else
			v14 = false
		end
		v_u_11 = v14 or v_u_11
		local v15
		if v13 then
			v15 = v13.UserInputState
		else
			v15 = nil
		end
		if v15 == Enum.UserInputState.Begin then
			if p_u_7.onPress then
				p_u_7.onPress(p12)
			end
			if v_u_9 then
				v_u_9.cancel()
				v_u_9 = nil
			end
			if v_u_10 then
				v_u_10:Disconnect()
				v_u_10 = nil
			end
			v_u_11 = false
			if v_u_8 then
				if v14 then
					v_u_8.onComplete()
				else
					v_u_9 = v_u_6(v_u_8.durationSeconds, function()
						-- upvalues: (ref) v_u_8, (ref) v_u_11, (ref) v_u_10
						if not v_u_8.allowReleaseAfterHold then
							v_u_11 = false
						end
						v_u_8.onComplete()
						if v_u_10 then
							v_u_10:Disconnect()
							v_u_10 = nil
						end
					end)
					local v16
					if v_u_8.onStep then
						v16 = v_u_2:Connect(v_u_8.onStep)
					else
						v16 = nil
					end
					v_u_10 = v16
				end
			end
			if v14 then
				if v_u_9 then
					v_u_9.cancel()
					v_u_9 = nil
				end
				if v_u_10 then
					v_u_10:Disconnect()
					v_u_10 = nil
				end
				v_u_11 = false
			else
				v_u_11 = true
			end
		end
		if v15 == Enum.UserInputState.End then
			if p_u_7.onRelease and v_u_11 then
				p_u_7.onRelease(p12)
			end
			if v_u_9 then
				v_u_9.cancel()
				v_u_9 = nil
			end
			if v_u_10 then
				v_u_10:Disconnect()
				v_u_10 = nil
			end
			v_u_11 = false
		end
		if v15 == Enum.UserInputState.Cancel then
			if v_u_9 then
				v_u_9.cancel()
				v_u_9 = nil
			end
			if v_u_10 then
				v_u_10:Disconnect()
				v_u_10 = nil
			end
			v_u_11 = false
		end
	end
end