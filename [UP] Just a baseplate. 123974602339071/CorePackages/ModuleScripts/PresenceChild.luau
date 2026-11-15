-- Path: CorePackages.Packages._Index.Motion-31ab8d40-0.0.7.Motion.AnimatePresence.PresenceChild
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.utils).useIdFallback
local v_u_4 = require(script.Parent.PresenceContext)
return function(p5) -- name: PresenceChild
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	if p5.children then
		local v6 = p5.children
		if typeof(v6) == "string" then
			error("PresenceChild: children must be a React.Element")
		end
	else
		error("PresenceChild: children must be a React.Element")
	end
	if not p5.children.type then
		error("PresenceChild: children must be a React.Element")
	end
	if p5.onExitComplete then
		local v7 = p5.onExitComplete
		if typeof(v7) ~= "function" and not p5.onExitComplete._isMockFunction then
			error("PresenceChild: onExitComplete must be a function")
		end
	end
	local v8 = p5.children
	local v9 = p5.isPresent
	local v_u_10 = p5.onExitComplete
	local v11 = p5.passThroughData
	local v12 = p5.presenceId
	local v_u_13 = v_u_2.useRef({}).current
	local v17 = {
		["id"] = v12 or v_u_3(),
		["isPresent"] = v9 ~= false,
		["passThroughData"] = v11,
		["onExitComplete"] = function(p14) -- name: handleExitComplete
			-- upvalues: (copy) v_u_13, (copy) v_u_10
			v_u_13[p14] = true
			local v15 = true
			for _, v16 in pairs(v_u_13) do
				if v16 then
					continue
				end
				v15 = false
			end
			if v15 and v_u_10 then
				v_u_10()
			end
		end
	}
	if v9 ~= nil then
		for v18, _ in pairs(v_u_13) do
			v_u_13[v18] = false
		end
	end
	return v_u_2.createElement(v_u_4.Provider, {
		["value"] = v17
	}, v8)
end