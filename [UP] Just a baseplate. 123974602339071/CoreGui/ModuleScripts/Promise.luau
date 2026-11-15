-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.Promise
local function v_u_1(...) -- name: pack
	return select("#", ...), { ... }
end
local function v_u_11(p_u_2, ...) -- name: wpcallPacked
	-- upvalues: (copy) v_u_1
	local v_u_3, v_u_4 = v_u_1(...)
	local v5 = v_u_1
	local v6 = debug.traceback
	local v9, v10 = v5(xpcall(function()
		-- upvalues: (copy) p_u_2, (copy) v_u_4, (copy) v_u_3
		local v7 = v_u_4
		local v8 = v_u_3
		return p_u_2(unpack(v7, 1, v8))
	end, v6))
	return v9, v10
end
assert(true, "createSymbol requires `name` to be a string.")
local v_u_12 = newproxy(true)
local v_u_13 = "PromiseMarker"
getmetatable(v_u_12).__tostring = function()
	-- upvalues: (copy) v_u_13
	return ("Symbol(%s)"):format(v_u_13)
end
local v_u_14 = {
	["prototype"] = {}
}
v_u_14.__index = v_u_14.prototype
local v15 = {}
assert(true, "createSymbol requires `name` to be a string.")
local v16 = newproxy(true)
local v_u_17 = "Started"
getmetatable(v16).__tostring = function()
	-- upvalues: (copy) v_u_17
	return ("Symbol(%s)"):format(v_u_17)
end
v15.Started = v16
assert(true, "createSymbol requires `name` to be a string.")
local v18 = newproxy(true)
local v_u_19 = "Resolved"
getmetatable(v18).__tostring = function()
	-- upvalues: (copy) v_u_19
	return ("Symbol(%s)"):format(v_u_19)
end
v15.Resolved = v18
assert(true, "createSymbol requires `name` to be a string.")
local v20 = newproxy(true)
local v_u_21 = "Rejected"
getmetatable(v20).__tostring = function()
	-- upvalues: (copy) v_u_21
	return ("Symbol(%s)"):format(v_u_21)
end
v15.Rejected = v20
v_u_14.Status = v15
function v_u_14.new(p22) -- name: new
	-- upvalues: (copy) v_u_12, (copy) v_u_14, (copy) v_u_11
	local v_u_23 = {
		["_source"] = debug.traceback(),
		[v_u_12] = true,
		["_status"] = v_u_14.Status.Started,
		["_values"] = nil,
		["_valuesLength"] = -1,
		["_unhandledRejection"] = false,
		["_queuedResolve"] = {},
		["_queuedReject"] = {}
	}
	local v24 = v_u_14
	setmetatable(v_u_23, v24)
	local function v25(...) -- name: reject
		-- upvalues: (copy) v_u_23
		v_u_23:_reject(...)
	end
	local _, v26 = v_u_11(p22, function(...) -- name: resolve
		-- upvalues: (copy) v_u_23
		v_u_23:_resolve(...)
	end, v25)
	local v27 = v26[1]
	local v28 = v26[2]
	if not v27 and v_u_23._status == v_u_14.Status.Started then
		v25(v28)
	end
	return v_u_23
end
function v_u_14.resolve(p_u_29) -- name: resolve
	-- upvalues: (copy) v_u_14
	return v_u_14.new(function(p30)
		-- upvalues: (copy) p_u_29
		p30(p_u_29)
	end)
end
function v_u_14.reject(p_u_31) -- name: reject
	-- upvalues: (copy) v_u_14
	return v_u_14.new(function(_, p32)
		-- upvalues: (copy) p_u_31
		p32(p_u_31)
	end)
end
function v_u_14.all(p_u_33) -- name: all
	-- upvalues: (copy) v_u_14
	if type(p_u_33) ~= "table" then
		error("Please pass a list of promises to Promise.all", 2)
	end
	if #p_u_33 == 0 then
		return v_u_14.resolve({})
	end
	for v34 = 1, #p_u_33 do
		if v_u_14.is(p_u_33[v34]) then
			continue
		end
		error(("Non-promise value passed into Promise.all at index #%d"):format(v34), 2)
	end
	return v_u_14.new(function(p_u_35, p_u_36)
		-- upvalues: (copy) p_u_33
		local v_u_37 = {}
		local v_u_38 = 0
		local function v_u_40(p39, ...) -- name: resolveOne
			-- upvalues: (copy) v_u_37, (ref) v_u_38, (ref) p_u_33, (copy) p_u_35
			v_u_37[p39] = ...
			v_u_38 = v_u_38 + 1
			if v_u_38 == #p_u_33 then
				p_u_35(v_u_37)
			end
		end
		for v_u_41 = 1, #p_u_33 do
			p_u_33[v_u_41]:andThen(function(...)
				-- upvalues: (copy) v_u_40, (copy) v_u_41
				v_u_40(v_u_41, ...)
			end, function(...)
				-- upvalues: (copy) p_u_36
				p_u_36(...)
			end)
		end
	end)
end
function v_u_14.is(p42) -- name: is
	-- upvalues: (copy) v_u_12
	if type(p42) == "table" then
		return p42[v_u_12] == true
	else
		return false
	end
end
function v_u_14.prototype.getStatus(p43) -- name: getStatus
	return p43._status
end
function v_u_14.prototype.andThen(p_u_44, p_u_45, p_u_46) -- name: andThen
	-- upvalues: (copy) v_u_14, (copy) v_u_11
	p_u_44._unhandledRejection = false
	return v_u_14.new(function(p_u_47, p_u_48)
		-- upvalues: (copy) p_u_45, (ref) v_u_11, (copy) p_u_46, (copy) p_u_44, (ref) v_u_14
		local v49
		if p_u_45 then
			local v_u_50 = p_u_45
			v49 = function(...)
				-- upvalues: (ref) v_u_11, (copy) v_u_50, (copy) p_u_47, (copy) p_u_48
				local v51, v52 = v_u_11(v_u_50, ...)
				if v52[1] then
					p_u_47(unpack(v52, 2, v51))
				else
					p_u_48(unpack(v52, 2, v51))
				end
			end
		else
			v49 = p_u_47
		end
		if p_u_46 then
			local v_u_53 = p_u_46
			p_u_48 = function(...)
				-- upvalues: (ref) v_u_11, (copy) v_u_53, (copy) p_u_47, (copy) p_u_48
				local v54, v55 = v_u_11(v_u_53, ...)
				if v55[1] then
					p_u_47(unpack(v55, 2, v54))
				else
					p_u_48(unpack(v55, 2, v54))
				end
			end
		end
		if p_u_44._status == v_u_14.Status.Started then
			local v56 = p_u_44._queuedResolve
			table.insert(v56, v49)
			local v57 = p_u_44._queuedReject
			table.insert(v57, p_u_48)
			return
		elseif p_u_44._status == v_u_14.Status.Resolved then
			local v58 = p_u_44._values
			local v59 = p_u_44._valuesLength
			v49(unpack(v58, 1, v59))
		elseif p_u_44._status == v_u_14.Status.Rejected then
			local v60 = p_u_44._values
			local v61 = p_u_44._valuesLength
			p_u_48(unpack(v60, 1, v61))
		end
	end)
end
function v_u_14.prototype.catch(p62, p63) -- name: catch
	return p62:andThen(nil, p63)
end
function v_u_14.prototype.await(p64) -- name: await
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	p64._unhandledRejection = false
	if p64._status == v_u_14.Status.Started then
		local v_u_65 = nil
		local v_u_66 = nil
		local v_u_67 = Instance.new("BindableEvent")
		p64:andThen(function(...)
			-- upvalues: (ref) v_u_66, (ref) v_u_65, (ref) v_u_1, (copy) v_u_67
			local v68, v69 = v_u_1(...)
			v_u_66 = v68
			v_u_65 = v69
			v_u_67:Fire(true)
		end, function(...)
			-- upvalues: (ref) v_u_66, (ref) v_u_65, (ref) v_u_1, (copy) v_u_67
			local v70, v71 = v_u_1(...)
			v_u_66 = v70
			v_u_65 = v71
			v_u_67:Fire(false)
		end)
		local v72 = v_u_67.Event:Wait()
		v_u_67:Destroy()
		local v73 = v_u_65
		local v74 = v_u_66
		return v72, unpack(v73, 1, v74)
	end
	if p64._status == v_u_14.Status.Resolved then
		local v75 = p64._values
		local v76 = p64._valuesLength
		return true, unpack(v75, 1, v76)
	end
	if p64._status == v_u_14.Status.Rejected then
		local v77 = p64._values
		local v78 = p64._valuesLength
		return false, unpack(v77, 1, v78)
	end
	error("Promise had an invalid status.")
end
function v_u_14.prototype._unwrap(p79) -- name: _unwrap
	-- upvalues: (copy) v_u_14
	if p79._status == v_u_14.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	local v80 = p79._status == v_u_14.Status.Resolved
	local v81 = p79._values
	local v82 = p79._valuesLength
	return v80, unpack(v81, 1, v82)
end
function v_u_14.prototype._resolve(p_u_83, ...) -- name: _resolve
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	if p_u_83._status == v_u_14.Status.Started then
		if v_u_14.is((...)) then
			if select("#", ...) > 1 then
				local v84 = ("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s"):format(p_u_83._source)
				warn(v84)
			end
			(...):andThen(function(...)
				-- upvalues: (copy) p_u_83
				p_u_83:_resolve(...)
			end, function(...)
				-- upvalues: (copy) p_u_83
				p_u_83:_reject(...)
			end)
		else
			p_u_83._status = v_u_14.Status.Resolved
			local v85, v86 = v_u_1(...)
			p_u_83._valuesLength = v85
			p_u_83._values = v86
			for _, v87 in ipairs(p_u_83._queuedResolve) do
				v87(...)
			end
		end
	else
		return
	end
end
function v_u_14.prototype._reject(p_u_88, ...) -- name: _reject
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	if p_u_88._status == v_u_14.Status.Started then
		p_u_88._status = v_u_14.Status.Rejected
		local v89, v90 = v_u_1(...)
		p_u_88._valuesLength = v89
		p_u_88._values = v90
		local v91 = p_u_88._queuedReject
		if next(v91) == nil then
			p_u_88._unhandledRejection = true
			local v_u_92 = tostring((...))
			spawn(function()
				-- upvalues: (copy) p_u_88, (copy) v_u_92
				if p_u_88._unhandledRejection then
					local v93 = ("Unhandled promise rejection:\n\n%s\n\n%s"):format(v_u_92, p_u_88._source)
					warn(v93)
				end
			end)
		else
			for _, v94 in ipairs(p_u_88._queuedReject) do
				v94(...)
			end
		end
	else
		return
	end
end
return v_u_14