-- Path: CorePackages.Packages._Index.EventPropagation.EventPropagation.eventPropagationService
local v1 = script.Parent.Parent
local v2 = require(v1.FocusNavigationUtils)
local v_u_3 = v2.getAncestors
local v_u_4 = v2.mockableWarn
local v_u_5 = require(script.Parent.eventPropagationEvent)
local v_u_6 = _G.__DEBUG_EVENT_PROPAGATION__
local function v_u_8(p7) -- name: describeFunction
	return table.concat(table.pack(debug.info(p7, "sln")), " ")
end
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.registerEventHandler(p10, p11, p12, p13, p14) -- name: registerEventHandler
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_8
	if v_u_6 then
		print("+++ register handler", p12, tostring(p11), p14 or "Bubble")
	end
	local v15 = p14 or "Bubble"
	p10.eventHandlerRegistry[p11] = p10.eventHandlerRegistry[p11] or {}
	p10.eventHandlerRegistry[p11][p12] = p10.eventHandlerRegistry[p11][p12] or {}
	local v16 = _G.__DEV__ and p10.eventHandlerRegistry[p11][p12][v15]
	if v16 then
		v_u_4(string.format("New handler bound to the %s phase of \'%s\' will override an existing handler:\n\tprevious handler: %s\n\t     new handler: %s", v15, p12, table.concat(table.pack(debug.info(p13, "sln")), " "), v_u_8(v16)))
	end
	p10.eventHandlerRegistry[p11][p12][v15] = p13
end
function v_u_9.registerEventHandlers(p17, p18, p19) -- name: registerEventHandlers
	if not p17.eventHandlerRegistry[p18] then
		p17.eventHandlerRegistry[p18] = {}
	end
	for v20, v21 in p19 do
		p17:registerEventHandler(p18, v20, v21.handler, v21.phase)
	end
end
function v_u_9.deregisterEventHandlers(p22, p23, p24) -- name: deregisterEventHandlers
	if p22.eventHandlerRegistry[p23] then
		for v25, v26 in p24 do
			p22:deregisterEventHandler(p23, v25, v26.handler, v26.phase)
		end
	end
end
function v_u_9.deregisterEventHandler(p27, p28, p29, p30, p31) -- name: deregisterEventHandler
	-- upvalues: (copy) v_u_6, (copy) v_u_4
	if v_u_6 then
		print("--- deregister handler", p29, tostring(p28), p31 or "Bubble")
	end
	local v32 = p31 or "Bubble"
	local v33 = p27.eventHandlerRegistry[p28]
	local v34
	if v33 then
		v34 = v33[p29]
	else
		v34 = nil
	end
	if v34 and v34[v32] then
		if _G.__DEV__ then
			local v35 = v34[v32]
			if v35 ~= p30 then
				local v36 = v_u_4
				local v37 = string.format
				local v38 = "Deregistering non-matching event handler bound to the %s phase of \'%s\':\n\tprevious handler: %s\n\t     new handler: %s"
				local v39
				if type(p30) == "function" then
					v39 = table.concat(table.pack(debug.info(p30, "sln")), " ")
				else
					v39 = tostring(p30)
				end
				local v40
				if type(v35) == "function" then
					v40 = table.concat(table.pack(debug.info(v35, "sln")), " ")
				else
					v40 = tostring(v35)
				end
				v36(v37(v38, v32, p29, v39, v40))
			end
		end
		v34[v32] = nil
	elseif _G.__DEV__ then
		v_u_4(string.format("Cannot deregister unregistered event handler bound to the %s phase of \'%s\'", v32, p29))
	end
end
function v_u_9.getRegisteredEventHandlers(p41, p42) -- name: getRegisteredEventHandlers
	local v43 = p41.eventHandlerRegistry[p42]
	if not v43 then
		return nil
	end
	local v44 = {}
	for v45, v46 in v43 do
		v44[v45] = next(v46) ~= nil
	end
	return v44
end
function v_u_9.propagateEvent(p47, p48, p49, p50, p51) -- name: propagateEvent
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	local v52 = p51 or {}
	local v53 = v52.synthetic or false
	local v54 = v52.silent and { p48 } or v_u_3(p48)
	if v_u_6 then
		print(">>> capture event", p49, "for", (tostring(p48)))
	end
	for v55 = #v54, 1, -1 do
		local v56 = v54[v55]
		local v57 = p47.eventHandlerRegistry[v56]
		local v58
		if v57 then
			v58 = v57[p49]
		else
			v58 = nil
		end
		local v59
		if v58 == nil then
			v59 = nil
		else
			v59 = v58.Capture
		end
		local v60
		if v59 then
			local v61 = v_u_5.new(p48, v56, p49, "Capture", v53, p50)
			v59(v61)
			v60 = v61.cancelled
		else
			v60 = false
		end
		if not v60 then
			continue
		end
		return
	end
	local v62 = p47.eventHandlerRegistry[p48]
	local v63
	if v62 then
		v63 = v62[p49]
	else
		v63 = nil
	end
	local v64
	if v63 == nil then
		v64 = nil
	else
		v64 = v63.Target
	end
	local v65
	if v64 then
		local v66 = v_u_5.new(p48, p48, p49, "Target", v53, p50)
		v64(v66)
		v65 = v66.cancelled
	else
		v65 = false
	end
	if not v65 then
		if v_u_6 then
			print("<<< bubble event", p49, "from", (tostring(p48)))
		end
		for v67 = 1, #v54 do
			local v68 = v54[v67]
			local v69 = p47.eventHandlerRegistry[v68]
			local v70
			if v69 then
				v70 = v69[p49]
			else
				v70 = nil
			end
			local v71
			if v70 == nil then
				v71 = nil
			else
				v71 = v70.Bubble
			end
			local v72
			if v71 then
				local v73 = v_u_5.new(p48, v68, p49, "Bubble", v53, p50)
				v71(v73)
				v72 = v73.cancelled
			else
				v72 = false
			end
			if not v72 then
				continue
			end
			return
		end
	end
end
function v_u_9.new() -- name: new
	-- upvalues: (copy) v_u_9
	local v74 = {
		["eventHandlerRegistry"] = setmetatable({}, {
			["__mode"] = "k"
		})
	}
	local v75 = v_u_9
	setmetatable(v74, v75)
	return v74
end
return v_u_9