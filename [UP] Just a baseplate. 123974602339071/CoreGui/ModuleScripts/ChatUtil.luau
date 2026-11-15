-- Path: CoreGui.RobloxGui.Modules.ChatUtil
return {
	["Signal"] = function() -- name: Signal
		local v1 = {}
		local v_u_2 = Instance.new("BindableEvent")
		local v_u_3 = nil
		local v_u_4 = nil
		function v1.fire(_, ...) -- name: fire
			-- upvalues: (ref) v_u_3, (ref) v_u_4, (copy) v_u_2
			v_u_3 = { ... }
			v_u_4 = select("#", ...)
			v_u_2:Fire()
		end
		function v1.connect(_, p_u_5) -- name: connect
			-- upvalues: (copy) v_u_2, (ref) v_u_3, (ref) v_u_4
			if not p_u_5 then
				error("connect(nil)", 2)
			end
			return v_u_2.Event:connect(function()
				-- upvalues: (copy) p_u_5, (ref) v_u_3, (ref) v_u_4
				local v6 = v_u_3
				local v7 = v_u_4
				p_u_5(unpack(v6, 1, v7))
			end)
		end
		function v1.wait(_) -- name: wait
			-- upvalues: (copy) v_u_2, (ref) v_u_3, (ref) v_u_4
			v_u_2.Event:wait()
			local v8 = v_u_3
			assert(v8, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			local v9 = v_u_3
			local v10 = v_u_4
			return unpack(v9, 1, v10)
		end
		return v1
	end
}