-- Path: CorePackages.Packages._Index.React.React.ReactNoopUpdateQueue
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v_u_3 = require(v1.Shared).console
local v_u_4 = {}
return {
	["isMounted"] = function(_) -- name: isMounted
		return false
	end,
	["enqueueForceUpdate"] = function(p5, _, _) -- name: enqueueForceUpdate
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
		if v_u_2.__DEV__ then
			local v6 = p5.__componentName or "ReactClass"
			local v7 = v6 .. ".forceUpdate"
			if v_u_4[v7] then
				return
			end
			v_u_3.error("Can\'t call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component\'s `init` method.", "forceUpdate", v6)
			v_u_4[v7] = true
		end
	end,
	["enqueueReplaceState"] = function(p8, _, _, _) -- name: enqueueReplaceState
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
		if v_u_2.__DEV__ then
			local v9 = p8.__componentName or "ReactClass"
			local v10 = v9 .. ".replaceState"
			if v_u_4[v10] then
				return
			end
			v_u_3.error("Can\'t call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component\'s `init` method.", "replaceState", v9)
			v_u_4[v10] = true
		end
	end,
	["enqueueSetState"] = function(p11, _, _, _) -- name: enqueueSetState
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
		if v_u_2.__DEV__ then
			local v12 = p11.__componentName or "ReactClass"
			local v13 = v12 .. ".setState"
			if v_u_4[v13] then
				return
			end
			v_u_3.error("Can\'t call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component\'s `init` method.", "setState", v12)
			v_u_4[v13] = true
		end
	end
}