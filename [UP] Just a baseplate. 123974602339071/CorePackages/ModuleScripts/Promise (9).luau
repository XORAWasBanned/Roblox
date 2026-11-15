-- Path: CorePackages.Packages._Index.Promise.Promise
local v_u_1 = {
	["__mode"] = "k"
}
local v2 = game.DefineFastFlag
local v3 = game
local v4, v_u_5 = pcall(v2, v3, "ReducePromiseTaskDefer", false)
if not v4 then
	v_u_5 = false
end
local function v11(p_u_6, p7) -- name: makeEnum
	local v8 = {}
	for _, v9 in ipairs(p7) do
		v8[v9] = v9
	end
	return setmetatable(v8, {
		["__index"] = function(_, p10) -- name: __index
			-- upvalues: (copy) p_u_6
			error(string.format("%s is not in %s!", p10, p_u_6), 2)
		end,
		["__newindex"] = function() -- name: __newindex
			-- upvalues: (copy) p_u_6
			error(string.format("Creating new members in %s is not allowed!", p_u_6), 2)
		end
	})
end
local v_u_12 = {
	["Kind"] = v11("Promise.Error.Kind", {
		"ExecutionError",
		"AlreadyCancelled",
		"NotResolvedInTime",
		"TimedOut"
	})
}
v_u_12.__index = v_u_12
function v_u_12.new(p13, p14) -- name: new
	-- upvalues: (ref) v_u_12
	local v15 = p13 or {}
	local v16 = {}
	local v17 = v15.error
	v16.error = tostring(v17) or "[This error has no error text.]"
	v16.trace = v15.trace
	v16.context = v15.context
	v16.kind = v15.kind
	v16.parent = p14
	v16.createdTick = os.clock()
	v16.createdTrace = debug.traceback()
	local v18 = v_u_12
	return setmetatable(v16, v18)
end
function v_u_12.is(p19) -- name: is
	if type(p19) == "table" then
		local v20 = getmetatable(p19)
		if type(v20) == "table" then
			local v21
			if rawget(p19, "error") == nil then
				v21 = false
			else
				local v22 = rawget(v20, "extend")
				v21 = type(v22) == "function"
			end
			return v21
		end
	end
	return false
end
function v_u_12.isKind(p23, p24) -- name: isKind
	-- upvalues: (ref) v_u_12
	local v25 = p24 ~= nil
	assert(v25, "Argument #2 to Promise.Error.isKind must not be nil")
	local v26 = v_u_12.is(p23)
	if v26 then
		v26 = p23.kind == p24
	end
	return v26
end
function v_u_12.extend(p27, p28) -- name: extend
	-- upvalues: (ref) v_u_12
	local v29 = p28 or {}
	v29.kind = v29.kind or p27.kind
	return v_u_12.new(v29, p27)
end
function v_u_12.getErrorChain(p30) -- name: getErrorChain
	local v31 = { p30 }
	while v31[#v31].parent do
		local v32 = v31[#v31].parent
		table.insert(v31, v32)
	end
	return v31
end
function v_u_12.__tostring(p33) -- name: __tostring
	local v34 = { string.format("-- Promise.Error(%s) --", p33.kind or "?") }
	for _, v35 in ipairs(p33:getErrorChain()) do
		local v36 = table.concat
		local v37 = { v35.trace or v35.error, v35.context }
		table.insert(v34, v36(v37, "\n"))
	end
	return table.concat(v34, "\n")
end
local function v_u_38(...) -- name: pack
	return select("#", ...), { ... }
end
local function v_u_40(p39, ...) -- name: packResult
	return p39, select("#", ...), { ... }
end
local function v_u_47(p_u_41, p42, ...) -- name: runExecutor
	-- upvalues: (copy) v_u_40, (ref) v_u_12
	local v43 = v_u_40
	local v44 = p_u_41 ~= nil
	assert(v44, "traceback is nil")
	local function v46(p45)
		-- upvalues: (ref) v_u_12, (copy) p_u_41
		if type(p45) == "table" then
			return p45
		else
			return v_u_12.new({
				["error"] = p45,
				["kind"] = v_u_12.Kind.ExecutionError,
				["trace"] = debug.traceback(tostring(p45), 2),
				["context"] = "Promise created at:\n\n" .. p_u_41
			})
		end
	end
	return v43(xpcall(p42, v46, ...))
end
local v_u_48 = {
	["Error"] = v_u_12,
	["Status"] = v11("Promise.Status", {
		"Started",
		"Resolved",
		"Rejected",
		"Cancelled"
	}),
	["_getTime"] = os.clock,
	["_timeEvent"] = game:GetService("RunService").Heartbeat,
	["_unhandledRejectionCallbacks"] = {},
	["prototype"] = {}
}
v_u_48.__index = v_u_48.prototype
function v_u_48._new(p49, p_u_50, p51) -- name: _new
	-- upvalues: (copy) v_u_48, (copy) v_u_1, (copy) v_u_47
	if p51 ~= nil and not v_u_48.is(p51) then
		error("Argument #2 to Promise.new must be a promise or nil", 2)
	end
	local v_u_52 = {
		["_thread"] = nil,
		["_source"] = nil,
		["_status"] = nil,
		["_values"] = nil,
		["_valuesLength"] = -1,
		["_unhandledRejection"] = true,
		["_queuedResolve"] = nil,
		["_queuedReject"] = nil,
		["_queuedFinally"] = nil,
		["_cancellationHook"] = nil,
		["_parent"] = nil,
		["_consumers"] = nil,
		["_source"] = p49,
		["_status"] = v_u_48.Status.Started,
		["_queuedResolve"] = {},
		["_queuedReject"] = {},
		["_queuedFinally"] = {},
		["_parent"] = p51
	}
	local v53 = v_u_1
	v_u_52._consumers = setmetatable({}, v53)
	if p51 and p51._status == v_u_48.Status.Started then
		p51._consumers[v_u_52] = true
	end
	local v54 = v_u_48
	setmetatable(v_u_52, v54)
	local function v_u_55(...) -- name: resolve
		-- upvalues: (copy) v_u_52
		v_u_52:_resolve(...)
	end
	local function v_u_56(...) -- name: reject
		-- upvalues: (copy) v_u_52
		v_u_52:_reject(...)
	end
	local function v_u_58(p57) -- name: onCancel
		-- upvalues: (copy) v_u_52, (ref) v_u_48
		if p57 then
			if v_u_52._status == v_u_48.Status.Cancelled then
				p57()
			else
				v_u_52._cancellationHook = p57
			end
		end
		return v_u_52._status == v_u_48.Status.Cancelled
	end
	v_u_52._thread = coroutine.create(function()
		-- upvalues: (ref) v_u_47, (copy) v_u_52, (copy) p_u_50, (copy) v_u_55, (copy) v_u_56, (copy) v_u_58
		local v59, _, v60 = v_u_47(v_u_52._source, p_u_50, v_u_55, v_u_56, v_u_58)
		if not v59 then
			v_u_56(v60[1])
		end
	end)
	task.spawn(v_u_52._thread)
	return v_u_52
end
function v_u_48.new(p61) -- name: new
	-- upvalues: (copy) v_u_48
	return v_u_48._new(debug.traceback(nil, 2), p61)
end
function v_u_48.__tostring(p62) -- name: __tostring
	return string.format("Promise(%s)", p62._status)
end
function v_u_48.defer(p_u_63) -- name: defer
	-- upvalues: (copy) v_u_48, (copy) v_u_47
	local v_u_64 = debug.traceback(nil, 2)
	return v_u_48._new(v_u_64, function(p_u_65, p_u_66, p_u_67)
		-- upvalues: (ref) v_u_48, (ref) v_u_47, (copy) v_u_64, (copy) p_u_63
		local v_u_68 = nil
		v_u_68 = v_u_48._timeEvent:Connect(function()
			-- upvalues: (ref) v_u_68, (ref) v_u_47, (ref) v_u_64, (ref) p_u_63, (copy) p_u_65, (copy) p_u_66, (copy) p_u_67
			v_u_68:Disconnect()
			local v69, _, v70 = v_u_47(v_u_64, p_u_63, p_u_65, p_u_66, p_u_67)
			if not v69 then
				p_u_66(v70[1])
			end
		end)
	end)
end
v_u_48.async = v_u_48.defer
function v_u_48.resolve(...) -- name: resolve
	-- upvalues: (copy) v_u_38, (copy) v_u_48
	local v_u_71, v_u_72 = v_u_38(...)
	return v_u_48._new(debug.traceback(nil, 2), function(p73)
		-- upvalues: (copy) v_u_72, (copy) v_u_71
		local v74 = v_u_72
		local v75 = v_u_71
		p73(unpack(v74, 1, v75))
	end)
end
function v_u_48.reject(...) -- name: reject
	-- upvalues: (copy) v_u_38, (copy) v_u_48
	local v_u_76, v_u_77 = v_u_38(...)
	return v_u_48._new(debug.traceback(nil, 2), function(_, p78)
		-- upvalues: (copy) v_u_77, (copy) v_u_76
		local v79 = v_u_77
		local v80 = v_u_76
		p78(unpack(v79, 1, v80))
	end)
end
function v_u_48._try(p81, p_u_82, ...) -- name: _try
	-- upvalues: (copy) v_u_38, (copy) v_u_48
	local v_u_83, v_u_84 = v_u_38(...)
	return v_u_48._new(p81, function(p85)
		-- upvalues: (copy) p_u_82, (copy) v_u_84, (copy) v_u_83
		local v86 = v_u_84
		local v87 = v_u_83
		p85(p_u_82(unpack(v86, 1, v87)))
	end)
end
function v_u_48.try(p88, ...) -- name: try
	-- upvalues: (copy) v_u_48
	return v_u_48._try(debug.traceback(nil, 2), p88, ...)
end
function v_u_48._all(p89, p_u_90, p_u_91) -- name: _all
	-- upvalues: (copy) v_u_48
	if type(p_u_90) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.all"), 3)
	end
	for v92, v93 in pairs(p_u_90) do
		if v_u_48.is(v93) then
			continue
		end
		error(string.format("Non-promise value passed into %s at index %s", "Promise.all", (tostring(v92))), 3)
	end
	if #p_u_90 == 0 or p_u_91 == 0 then
		return v_u_48.resolve({})
	else
		return v_u_48._new(p89, function(p_u_94, p_u_95, p96)
			-- upvalues: (copy) p_u_91, (copy) p_u_90
			local v_u_97 = {}
			local v_u_98 = {}
			local v_u_99 = 0
			local v_u_100 = 0
			local v_u_101 = false
			local function v_u_104(p102, ...) -- name: resolveOne
				-- upvalues: (ref) v_u_101, (ref) v_u_99, (ref) p_u_91, (copy) v_u_97, (ref) p_u_90, (copy) p_u_94, (copy) v_u_98
				if not v_u_101 then
					v_u_99 = v_u_99 + 1
					if p_u_91 == nil then
						v_u_97[p102] = ...
					else
						v_u_97[v_u_99] = ...
					end
					if v_u_99 >= (p_u_91 or #p_u_90) then
						v_u_101 = true
						p_u_94(v_u_97)
						for _, v103 in ipairs(v_u_98) do
							v103:cancel()
						end
					end
				end
			end
			p96(function() -- name: cancel
				-- upvalues: (copy) v_u_98
				for _, v105 in ipairs(v_u_98) do
					v105:cancel()
				end
			end)
			local v_u_106 = v_u_101
			for v_u_107, v108 in ipairs(p_u_90) do
				v_u_98[v_u_107] = v108:andThen(function(...)
					-- upvalues: (copy) v_u_104, (copy) v_u_107
					v_u_104(v_u_107, ...)
				end, function(...)
					-- upvalues: (ref) v_u_100, (ref) p_u_91, (ref) p_u_90, (copy) v_u_98, (ref) v_u_106, (copy) p_u_95
					v_u_100 = v_u_100 + 1
					if p_u_91 == nil or #p_u_90 - v_u_100 < p_u_91 then
						for _, v109 in ipairs(v_u_98) do
							v109:cancel()
						end
						v_u_106 = true
						p_u_95(...)
					end
				end)
			end
			if v_u_106 then
				for _, v110 in ipairs(v_u_98) do
					v110:cancel()
				end
			end
		end)
	end
end
function v_u_48.all(...) -- name: all
	-- upvalues: (copy) v_u_48
	local v111 = { ... }
	local v112 = v111[1]
	if type(v112) == "table" and not v_u_48.is(v111[1]) then
		v111 = v111[1]
	end
	return v_u_48._all(debug.traceback(nil, 2), v111)
end
function v_u_48.fold(p113, p_u_114, p115) -- name: fold
	-- upvalues: (copy) v_u_48
	local v116 = type(p113) == "table"
	assert(v116, "Bad argument #1 to Promise.fold: must be a table")
	local v117
	if type(p_u_114) == "function" then
		v117 = true
	elseif type(p_u_114) == "table" then
		local v118 = getmetatable(p_u_114)
		if v118 then
			local v119 = rawget(v118, "__call")
			v117 = type(v119) == "function"
		else
			v117 = false
		end
	else
		v117 = false
	end
	assert(v117, "Bad argument #2 to Promise.fold: must be a function")
	local v_u_120 = v_u_48.resolve(p115)
	return v_u_48.each(p113, function(p_u_121, p_u_122)
		-- upvalues: (ref) v_u_120, (copy) p_u_114
		v_u_120 = v_u_120:andThen(function(p123)
			-- upvalues: (ref) p_u_114, (copy) p_u_121, (copy) p_u_122
			return p_u_114(p123, p_u_121, p_u_122)
		end)
	end):andThen(function()
		-- upvalues: (ref) v_u_120
		return v_u_120
	end)
end
function v_u_48.some(p124, p125) -- name: some
	-- upvalues: (copy) v_u_48
	local v126 = type(p125) == "number"
	assert(v126, "Bad argument #2 to Promise.some: must be a number")
	return v_u_48._all(debug.traceback(nil, 2), p124, p125)
end
function v_u_48.any(p127) -- name: any
	-- upvalues: (copy) v_u_48
	return v_u_48._all(debug.traceback(nil, 2), p127, 1):andThen(function(p128)
		return p128[1]
	end)
end
function v_u_48.allSettled(p_u_129) -- name: allSettled
	-- upvalues: (copy) v_u_48
	if type(p_u_129) ~= "table" then
		error(string.format("Please pass a list of promises to %s", "Promise.allSettled"), 2)
	end
	for v130, v131 in pairs(p_u_129) do
		if v_u_48.is(v131) then
			continue
		end
		error(string.format("Non-promise value passed into %s at index %s", "Promise.allSettled", (tostring(v130))), 2)
	end
	if #p_u_129 == 0 then
		return v_u_48.resolve({})
	else
		return v_u_48._new(debug.traceback(nil, 2), function(p_u_132, _, p133)
			-- upvalues: (copy) p_u_129
			local v_u_134 = {}
			local v_u_135 = {}
			local v_u_136 = 0
			local function v_u_138(p137, ...) -- name: resolveOne
				-- upvalues: (ref) v_u_136, (copy) v_u_134, (ref) p_u_129, (copy) p_u_132
				v_u_136 = v_u_136 + 1
				v_u_134[p137] = ...
				if v_u_136 >= #p_u_129 then
					p_u_132(v_u_134)
				end
			end
			p133(function()
				-- upvalues: (copy) v_u_135
				for _, v139 in ipairs(v_u_135) do
					v139:cancel()
				end
			end)
			for v_u_140, v141 in ipairs(p_u_129) do
				v_u_135[v_u_140] = v141:finally(function(...)
					-- upvalues: (copy) v_u_138, (copy) v_u_140
					v_u_138(v_u_140, ...)
				end)
			end
		end)
	end
end
function v_u_48.race(p_u_142) -- name: race
	-- upvalues: (copy) v_u_48
	local v143 = type(p_u_142) == "table"
	local v144 = string.format
	assert(v143, v144("Please pass a list of promises to %s", "Promise.race"))
	for v145, v146 in pairs(p_u_142) do
		local v147 = v_u_48.is(v146)
		local v148 = string.format
		local v149 = tostring(v145)
		assert(v147, v148("Non-promise value passed into %s at index %s", "Promise.race", v149))
	end
	return v_u_48._new(debug.traceback(nil, 2), function(p_u_150, p_u_151, p152)
		-- upvalues: (copy) p_u_142
		local v_u_153 = {}
		local v_u_154 = false
		if not p152(function(...)
			-- upvalues: (copy) v_u_153, (ref) v_u_154, (copy) p_u_151
			for _, v155 in ipairs(v_u_153) do
				v155:cancel()
			end
			v_u_154 = true
			return p_u_151(...)
		end) then
			local v_u_156 = v_u_154
			for v157, v158 in ipairs(p_u_142) do
				v_u_153[v157] = v158:andThen(function(...)
					-- upvalues: (copy) v_u_153, (ref) v_u_156, (copy) p_u_150
					for _, v159 in ipairs(v_u_153) do
						v159:cancel()
					end
					v_u_156 = true
					return p_u_150(...)
				end, function(...)
					-- upvalues: (copy) v_u_153, (ref) v_u_156, (copy) p_u_151
					for _, v160 in ipairs(v_u_153) do
						v160:cancel()
					end
					v_u_156 = true
					return p_u_151(...)
				end)
			end
			if v_u_156 then
				for _, v161 in ipairs(v_u_153) do
					v161:cancel()
				end
			end
		end
	end)
end
function v_u_48.each(p_u_162, p_u_163) -- name: each
	-- upvalues: (copy) v_u_48, (ref) v_u_12
	local v164 = type(p_u_162) == "table"
	local v165 = string.format
	assert(v164, v165("Please pass a list of promises to %s", "Promise.each"))
	local v166
	if type(p_u_163) == "function" then
		v166 = true
	elseif type(p_u_163) == "table" then
		local v167 = getmetatable(p_u_163)
		if v167 then
			local v168 = rawget(v167, "__call")
			v166 = type(v168) == "function"
		else
			v166 = false
		end
	else
		v166 = false
	end
	local v169 = string.format
	assert(v166, v169("Please pass a handler function to %s!", "Promise.each"))
	return v_u_48._new(debug.traceback(nil, 2), function(p170, p171, p172)
		-- upvalues: (copy) p_u_162, (ref) v_u_48, (ref) v_u_12, (copy) p_u_163
		local v173 = {}
		local v_u_174 = {}
		local v_u_175 = false
		p172(function()
			-- upvalues: (ref) v_u_175, (copy) v_u_174
			v_u_175 = true
			for _, v176 in ipairs(v_u_174) do
				v176:cancel()
			end
		end)
		local v177 = v_u_175
		local v178 = {}
		for v179, v180 in ipairs(p_u_162) do
			if v_u_48.is(v180) then
				if v180:getStatus() == v_u_48.Status.Cancelled then
					for _, v181 in ipairs(v_u_174) do
						v181:cancel()
					end
					return p171(v_u_12.new({
						["error"] = "Promise is cancelled",
						["kind"] = nil,
						["context"] = nil,
						["kind"] = v_u_12.Kind.AlreadyCancelled,
						["context"] = string.format("The Promise that was part of the array at index %d passed into Promise.each was already cancelled when Promise.each began.\n\nThat Promise was created at:\n\n%s", v179, v180._source)
					}))
				end
				if v180:getStatus() == v_u_48.Status.Rejected then
					for _, v182 in ipairs(v_u_174) do
						v182:cancel()
					end
					return p171(select(2, v180:await()))
				end
				local v183 = v180:andThen(function(...)
					return ...
				end)
				table.insert(v_u_174, v183)
				v178[v179] = v183
			else
				v178[v179] = v180
			end
		end
		for v184, v187 in ipairs(v178) do
			if v_u_48.is(v187) then
				local v186, v187 = v187:await()
				if not v186 then
					for _, v188 in ipairs(v_u_174) do
						v188:cancel()
					end
					return p171(v187)
				end
			end
			if v177 then
				return
			end
			local v189 = v_u_48.resolve(p_u_163(v187, v184))
			table.insert(v_u_174, v189)
			local v190, v191 = v189:await()
			if not v190 then
				for _, v192 in ipairs(v_u_174) do
					v192:cancel()
				end
				return p171(v191)
			end
			v173[v184] = v191
		end
		p170(v173)
	end)
end
function v_u_48.is(p193) -- name: is
	-- upvalues: (copy) v_u_48
	if type(p193) ~= "table" then
		return false
	end
	local v194 = getmetatable(p193)
	if v194 == v_u_48 then
		return true
	end
	if v194 ~= nil then
		if type(v194) == "table" then
			local v195 = rawget(v194, "__index")
			if type(v195) == "table" then
				local v196 = rawget(v194, "__index")
				local v197 = rawget(v196, "andThen")
				local v198
				if type(v197) == "function" then
					v198 = true
				else
					local v199 = type(v197) == "table" and getmetatable(v197)
					if v199 then
						local v200 = rawget(v199, "__call")
						v198 = type(v200) == "function"
					else
						v198 = false
					end
				end
				if v198 then
					return true
				end
			end
		end
		return false
	end
	local v201 = p193.andThen
	if type(v201) == "function" then
		return true
	end
	local v202 = type(v201) == "table" and getmetatable(v201)
	if v202 then
		local v203 = rawget(v202, "__call")
		if type(v203) == "function" then
			return true
		end
	end
	return false
end
function v_u_48.promisify(p_u_204) -- name: promisify
	-- upvalues: (copy) v_u_48
	return function(...)
		-- upvalues: (ref) v_u_48, (copy) p_u_204
		return v_u_48._try(debug.traceback(nil, 2), p_u_204, ...)
	end
end
local v_u_205 = nil
local v_u_206 = nil
function v_u_48.delay(p207) -- name: delay
	-- upvalues: (copy) v_u_48, (ref) v_u_206, (ref) v_u_205
	local v208 = type(p207) == "number"
	assert(v208, "Bad argument #1 to Promise.delay, must be a number.")
	local v_u_209 = (p207 < 0.016666666666666666 or p207 == (1 / 0)) and 0.016666666666666666 or p207
	return v_u_48._new(debug.traceback(nil, 2), function(p210, _, p211)
		-- upvalues: (ref) v_u_48, (ref) v_u_209, (ref) v_u_206, (ref) v_u_205
		local v212 = v_u_48._getTime()
		local v213 = v212 + v_u_209
		local v_u_214 = {
			["resolve"] = p210,
			["startTime"] = v212,
			["endTime"] = v213
		}
		if v_u_206 == nil then
			v_u_205 = v_u_214
			v_u_206 = v_u_48._timeEvent:Connect(function()
				-- upvalues: (ref) v_u_48, (ref) v_u_205, (ref) v_u_206
				local v215 = v_u_48._getTime()
				while v_u_205 ~= nil and v_u_205.endTime < v215 do
					local v216 = v_u_205
					v_u_205 = v216.next
					if v_u_205 == nil then
						v_u_206:Disconnect()
						v_u_206 = nil
					else
						v_u_205.previous = nil
					end
					v216.resolve(v_u_48._getTime() - v216.startTime)
				end
			end)
		elseif v_u_205.endTime < v213 then
			local v217 = v_u_205
			local v218 = v217.next
			while v218 ~= nil and v218.endTime < v213 do
				local v219 = v218.next
				v217 = v218
				v218 = v219
			end
			v217.next = v_u_214
			v_u_214.previous = v217
			if v218 ~= nil then
				v_u_214.next = v218
				v218.previous = v_u_214
			end
		else
			v_u_214.next = v_u_205
			v_u_205.previous = v_u_214
			v_u_205 = v_u_214
		end
		p211(function()
			-- upvalues: (copy) v_u_214, (ref) v_u_205, (ref) v_u_206
			local v220 = v_u_214.next
			if v_u_205 == v_u_214 then
				if v220 == nil then
					v_u_206:Disconnect()
					v_u_206 = nil
				else
					v220.previous = nil
				end
				v_u_205 = v220
			else
				local v221 = v_u_214.previous
				v221.next = v220
				if v220 ~= nil then
					v220.previous = v221
				end
			end
		end)
	end)
end
local function v226(p222, p_u_223, p_u_224) -- name: timeout
	-- upvalues: (copy) v_u_48, (ref) v_u_12
	local v_u_225 = debug.traceback(nil, 2)
	return v_u_48.race({ v_u_48.delay(p_u_223):andThen(function()
			-- upvalues: (ref) v_u_48, (copy) p_u_224, (ref) v_u_12, (copy) p_u_223, (copy) v_u_225
			return v_u_48.reject(p_u_224 == nil and v_u_12.new({
				["kind"] = nil,
				["error"] = "Timed out",
				["context"] = nil,
				["kind"] = v_u_12.Kind.TimedOut,
				["context"] = string.format("Timeout of %d seconds exceeded.\n:timeout() called at:\n\n%s", p_u_223, v_u_225)
			}) or p_u_224)
		end), p222 })
end
v_u_48.prototype.timeout = v226
function v_u_48.prototype.getStatus(p227) -- name: getStatus
	return p227._status
end
local function v252(p_u_228, p_u_229, p_u_230, p_u_231) -- name: _andThen
	-- upvalues: (copy) v_u_48, (copy) v_u_47, (ref) v_u_12
	p_u_228._unhandledRejection = false
	return v_u_48._new(p_u_229, function(p_u_232, p_u_233)
		-- upvalues: (copy) p_u_230, (copy) p_u_229, (ref) v_u_47, (copy) p_u_231, (copy) p_u_228, (ref) v_u_48, (ref) v_u_12
		local v234
		if p_u_230 then
			local v_u_235 = p_u_229
			local v_u_236 = p_u_230
			v234 = function(...)
				-- upvalues: (ref) v_u_47, (copy) v_u_235, (copy) v_u_236, (copy) p_u_232, (copy) p_u_233
				local v237, v238, v239 = v_u_47(v_u_235, v_u_236, ...)
				if v237 then
					p_u_232(unpack(v239, 1, v238))
				else
					p_u_233(v239[1])
				end
			end
		else
			v234 = p_u_232
		end
		local v240
		if p_u_231 then
			local v_u_241 = p_u_229
			local v_u_242 = p_u_231
			v240 = function(...)
				-- upvalues: (ref) v_u_47, (copy) v_u_241, (copy) v_u_242, (copy) p_u_232, (copy) p_u_233
				local v243, v244, v245 = v_u_47(v_u_241, v_u_242, ...)
				if v243 then
					p_u_232(unpack(v245, 1, v244))
				else
					p_u_233(v245[1])
				end
			end
		else
			v240 = p_u_233
		end
		if p_u_228._status == v_u_48.Status.Started then
			local v246 = p_u_228._queuedResolve
			table.insert(v246, v234)
			local v247 = p_u_228._queuedReject
			table.insert(v247, v240)
			return
		elseif p_u_228._status == v_u_48.Status.Resolved then
			local v248 = p_u_228._values
			local v249 = p_u_228._valuesLength
			v234(unpack(v248, 1, v249))
			return
		elseif p_u_228._status == v_u_48.Status.Rejected then
			local v250 = p_u_228._values
			local v251 = p_u_228._valuesLength
			v240(unpack(v250, 1, v251))
		elseif p_u_228._status == v_u_48.Status.Cancelled then
			p_u_233(v_u_12.new({
				["error"] = "Promise is cancelled",
				["kind"] = nil,
				["context"] = nil,
				["kind"] = v_u_12.Kind.AlreadyCancelled,
				["context"] = "Promise created at\n\n" .. p_u_229
			}))
		end
	end, p_u_228)
end
v_u_48.prototype._andThen = v252
function v_u_48.prototype.andThen(p253, p254, p255) -- name: andThen
	local v256
	if p254 == nil or type(p254) == "function" then
		v256 = true
	elseif type(p254) == "table" then
		local v257 = getmetatable(p254)
		if v257 then
			local v258 = rawget(v257, "__call")
			v256 = type(v258) == "function"
		else
			v256 = false
		end
	else
		v256 = false
	end
	local v259 = string.format
	assert(v256, v259("Please pass a handler function to %s!", "Promise:andThen"))
	local v260
	if p255 == nil or type(p255) == "function" then
		v260 = true
	elseif type(p255) == "table" then
		local v261 = getmetatable(p255)
		if v261 then
			local v262 = rawget(v261, "__call")
			v260 = type(v262) == "function"
		else
			v260 = false
		end
	else
		v260 = false
	end
	local v263 = string.format
	assert(v260, v263("Please pass a handler function to %s!", "Promise:andThen"))
	return p253:_andThen(debug.traceback(nil, 2), p254, p255)
end
function v_u_48.prototype.andThenAsync(p264, p265, p266) -- name: andThenAsync
	-- upvalues: (copy) v_u_38, (copy) v_u_48
	local v267
	if p265 == nil or type(p265) == "function" then
		v267 = true
	elseif type(p265) == "table" then
		local v268 = getmetatable(p265)
		if v268 then
			local v269 = rawget(v268, "__call")
			v267 = type(v269) == "function"
		else
			v267 = false
		end
	else
		v267 = false
	end
	local v270 = string.format
	assert(v267, v270("Please pass a handler function to %s!", "Promise:andThenAsync"))
	local v271
	if p266 == nil or type(p266) == "function" then
		v271 = true
	elseif type(p266) == "table" then
		local v272 = getmetatable(p266)
		if v272 then
			local v273 = rawget(v272, "__call")
			v271 = type(v273) == "function"
		else
			v271 = false
		end
	else
		v271 = false
	end
	local v274 = string.format
	assert(v271, v274("Please pass a handler function to %s!", "Promise:andThenAsync"))
	return p264:_andThen(debug.traceback(nil, 2), function(...)
		-- upvalues: (ref) v_u_38, (ref) v_u_48
		local v_u_275, v_u_276 = v_u_38(...)
		return v_u_48.defer(function(p277)
			-- upvalues: (copy) v_u_276, (copy) v_u_275
			local v278 = v_u_276
			local v279 = v_u_275
			p277(unpack(v278, 1, v279))
		end)
	end, function(...)
		-- upvalues: (ref) v_u_38, (ref) v_u_48
		local v_u_280, v_u_281 = v_u_38(...)
		return v_u_48.defer(function(_, p282)
			-- upvalues: (copy) v_u_281, (copy) v_u_280
			local v283 = v_u_281
			local v284 = v_u_280
			p282(unpack(v283, 1, v284))
		end)
	end):andThen(p265, p266)
end
function v_u_48.prototype.catch(p285, p286) -- name: catch
	local v287
	if p286 == nil or type(p286) == "function" then
		v287 = true
	elseif type(p286) == "table" then
		local v288 = getmetatable(p286)
		if v288 then
			local v289 = rawget(v288, "__call")
			v287 = type(v289) == "function"
		else
			v287 = false
		end
	else
		v287 = false
	end
	local v290 = string.format
	assert(v287, v290("Please pass a handler function to %s!", "Promise:catch"))
	return p285:_andThen(debug.traceback(nil, 2), nil, p286)
end
function v_u_48.prototype.tap(p291, p_u_292) -- name: tap
	-- upvalues: (copy) v_u_48, (copy) v_u_38
	local v293
	if type(p_u_292) == "function" then
		v293 = true
	elseif type(p_u_292) == "table" then
		local v294 = getmetatable(p_u_292)
		if v294 then
			local v295 = rawget(v294, "__call")
			v293 = type(v295) == "function"
		else
			v293 = false
		end
	else
		v293 = false
	end
	local v296 = string.format
	assert(v293, v296("Please pass a handler function to %s!", "Promise:tap"))
	return p291:_andThen(debug.traceback(nil, 2), function(...)
		-- upvalues: (copy) p_u_292, (ref) v_u_48, (ref) v_u_38
		local v297 = p_u_292(...)
		if not v_u_48.is(v297) then
			return ...
		end
		local v_u_298, v_u_299 = v_u_38(...)
		return v297:andThen(function()
			-- upvalues: (copy) v_u_299, (copy) v_u_298
			local v300 = v_u_299
			local v301 = v_u_298
			return unpack(v300, 1, v301)
		end)
	end)
end
function v_u_48.prototype.andThenCall(p302, p_u_303, ...) -- name: andThenCall
	-- upvalues: (copy) v_u_38
	local v304
	if type(p_u_303) == "function" then
		v304 = true
	elseif type(p_u_303) == "table" then
		local v305 = getmetatable(p_u_303)
		if v305 then
			local v306 = rawget(v305, "__call")
			v304 = type(v306) == "function"
		else
			v304 = false
		end
	else
		v304 = false
	end
	local v307 = string.format
	assert(v304, v307("Please pass a handler function to %s!", "Promise:andThenCall"))
	local v_u_308, v_u_309 = v_u_38(...)
	return p302:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_303, (copy) v_u_309, (copy) v_u_308
		local v310 = v_u_309
		local v311 = v_u_308
		return p_u_303(unpack(v310, 1, v311))
	end)
end
function v_u_48.prototype.andThenReturn(p312, ...) -- name: andThenReturn
	-- upvalues: (copy) v_u_38
	local v_u_313, v_u_314 = v_u_38(...)
	return p312:_andThen(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_314, (copy) v_u_313
		local v315 = v_u_314
		local v316 = v_u_313
		return unpack(v315, 1, v316)
	end)
end
function v_u_48.prototype.cancel(p317) -- name: cancel
	-- upvalues: (copy) v_u_48
	if p317._status == v_u_48.Status.Started then
		p317._status = v_u_48.Status.Cancelled
		if p317._cancellationHook then
			p317._cancellationHook()
		end
		coroutine.close(p317._thread)
		if p317._parent then
			p317._parent:_consumerCancelled(p317)
		end
		for v318 in pairs(p317._consumers) do
			v318:cancel()
		end
		p317:_finalize()
	end
end
function v_u_48.prototype._consumerCancelled(p319, p320) -- name: _consumerCancelled
	-- upvalues: (copy) v_u_48
	if p319._status == v_u_48.Status.Started then
		p319._consumers[p320] = nil
		if next(p319._consumers) == nil then
			p319:cancel()
		end
	end
end
function v_u_48.prototype._finally(p_u_321, p_u_322, p_u_323, p_u_324) -- name: _finally
	-- upvalues: (copy) v_u_48, (copy) v_u_47
	if not p_u_324 then
		p_u_321._unhandledRejection = false
	end
	return v_u_48._new(p_u_322, function(p_u_325, p_u_326)
		-- upvalues: (copy) p_u_323, (copy) p_u_322, (ref) v_u_47, (copy) p_u_324, (copy) p_u_321, (ref) v_u_48
		local v_u_327
		if p_u_323 then
			local v_u_328 = p_u_322
			local v_u_329 = p_u_323
			v_u_327 = function(...)
				-- upvalues: (ref) v_u_47, (copy) v_u_328, (copy) v_u_329, (copy) p_u_325, (copy) p_u_326
				local v330, v331, v332 = v_u_47(v_u_328, v_u_329, ...)
				if v330 then
					p_u_325(unpack(v332, 1, v331))
				else
					p_u_326(v332[1])
				end
			end
		else
			v_u_327 = p_u_325
		end
		local v333 = p_u_324 and function(...)
			-- upvalues: (ref) p_u_321, (ref) v_u_48, (copy) p_u_325, (copy) v_u_327
			if p_u_321._status == v_u_48.Status.Rejected then
				return p_u_325(p_u_321)
			else
				return v_u_327(...)
			end
		end or v_u_327
		if p_u_321._status == v_u_48.Status.Started then
			local v334 = p_u_321._queuedFinally
			table.insert(v334, v333)
		else
			v333(p_u_321._status)
		end
	end, p_u_321)
end
function v_u_48.prototype.finally(p335, p336) -- name: finally
	local v337
	if p336 == nil or type(p336) == "function" then
		v337 = true
	elseif type(p336) == "table" then
		local v338 = getmetatable(p336)
		if v338 then
			local v339 = rawget(v338, "__call")
			v337 = type(v339) == "function"
		else
			v337 = false
		end
	else
		v337 = false
	end
	local v340 = string.format
	assert(v337, v340("Please pass a handler function to %s!", "Promise:finally"))
	return p335:_finally(debug.traceback(nil, 2), p336)
end
function v_u_48.prototype.finallyCall(p341, p_u_342, ...) -- name: finallyCall
	-- upvalues: (copy) v_u_38
	local v343
	if type(p_u_342) == "function" then
		v343 = true
	elseif type(p_u_342) == "table" then
		local v344 = getmetatable(p_u_342)
		if v344 then
			local v345 = rawget(v344, "__call")
			v343 = type(v345) == "function"
		else
			v343 = false
		end
	else
		v343 = false
	end
	local v346 = string.format
	assert(v343, v346("Please pass a handler function to %s!", "Promise:finallyCall"))
	local v_u_347, v_u_348 = v_u_38(...)
	return p341:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_342, (copy) v_u_348, (copy) v_u_347
		local v349 = v_u_348
		local v350 = v_u_347
		return p_u_342(unpack(v349, 1, v350))
	end)
end
function v_u_48.prototype.finallyReturn(p351, ...) -- name: finallyReturn
	-- upvalues: (copy) v_u_38
	local v_u_352, v_u_353 = v_u_38(...)
	return p351:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_353, (copy) v_u_352
		local v354 = v_u_353
		local v355 = v_u_352
		return unpack(v354, 1, v355)
	end)
end
function v_u_48.prototype.done(p356, p357) -- name: done
	local v358
	if p357 == nil or type(p357) == "function" then
		v358 = true
	elseif type(p357) == "table" then
		local v359 = getmetatable(p357)
		if v359 then
			local v360 = rawget(v359, "__call")
			v358 = type(v360) == "function"
		else
			v358 = false
		end
	else
		v358 = false
	end
	local v361 = string.format
	assert(v358, v361("Please pass a handler function to %s!", "Promise:done"))
	return p356:_finally(debug.traceback(nil, 2), p357, true)
end
function v_u_48.prototype.doneCall(p362, p_u_363, ...) -- name: doneCall
	-- upvalues: (copy) v_u_38
	local v364
	if type(p_u_363) == "function" then
		v364 = true
	elseif type(p_u_363) == "table" then
		local v365 = getmetatable(p_u_363)
		if v365 then
			local v366 = rawget(v365, "__call")
			v364 = type(v366) == "function"
		else
			v364 = false
		end
	else
		v364 = false
	end
	local v367 = string.format
	assert(v364, v367("Please pass a handler function to %s!", "Promise:doneCall"))
	local v_u_368, v_u_369 = v_u_38(...)
	return p362:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) p_u_363, (copy) v_u_369, (copy) v_u_368
		local v370 = v_u_369
		local v371 = v_u_368
		return p_u_363(unpack(v370, 1, v371))
	end, true)
end
function v_u_48.prototype.doneReturn(p372, ...) -- name: doneReturn
	-- upvalues: (copy) v_u_38
	local v_u_373, v_u_374 = v_u_38(...)
	return p372:_finally(debug.traceback(nil, 2), function()
		-- upvalues: (copy) v_u_374, (copy) v_u_373
		local v375 = v_u_374
		local v376 = v_u_373
		return unpack(v375, 1, v376)
	end, true)
end
function v_u_48.prototype.awaitStatus(p377) -- name: awaitStatus
	-- upvalues: (copy) v_u_48
	p377._unhandledRejection = false
	if p377._status == v_u_48.Status.Started then
		local v_u_378 = coroutine.running()
		p377:finally(function()
			-- upvalues: (copy) v_u_378
			task.spawn(v_u_378)
		end)
		coroutine.yield()
	end
	if p377._status == v_u_48.Status.Resolved then
		local v379 = p377._status
		local v380 = p377._values
		local v381 = p377._valuesLength
		return v379, unpack(v380, 1, v381)
	end
	if p377._status ~= v_u_48.Status.Rejected then
		return p377._status
	end
	local v382 = p377._status
	local v383 = p377._values
	local v384 = p377._valuesLength
	return v382, unpack(v383, 1, v384)
end
local function v_u_386(p385, ...) -- name: awaitHelper
	-- upvalues: (copy) v_u_48
	return p385 == v_u_48.Status.Resolved, ...
end
function v_u_48.prototype.await(p387) -- name: await
	-- upvalues: (copy) v_u_386
	return v_u_386(p387:awaitStatus())
end
local function v_u_389(p388, ...) -- name: expectHelper
	-- upvalues: (copy) v_u_48
	if p388 ~= v_u_48.Status.Resolved then
		error(... == nil and "Expected Promise rejected with no value." or ..., 3)
	end
	return ...
end
function v_u_48.prototype.expect(p390) -- name: expect
	-- upvalues: (copy) v_u_389
	return v_u_389(p390:awaitStatus())
end
v_u_48.prototype.awaitValue = v_u_48.prototype.expect
function v_u_48.prototype._unwrap(p391) -- name: _unwrap
	-- upvalues: (copy) v_u_48
	if p391._status == v_u_48.Status.Started then
		error("Promise has not resolved or rejected.", 2)
	end
	local v392 = p391._status == v_u_48.Status.Resolved
	local v393 = p391._values
	local v394 = p391._valuesLength
	return v392, unpack(v393, 1, v394)
end
local function v403(p_u_395, ...) -- name: _resolve
	-- upvalues: (copy) v_u_48, (ref) v_u_12, (copy) v_u_38
	if p_u_395._status == v_u_48.Status.Started then
		if v_u_48.is((...)) then
			if select("#", ...) > 1 then
				local v396 = string.format("When returning a Promise from andThen, extra arguments are discarded! See:\n\n%s", p_u_395._source)
				warn(v396)
			end
			local v_u_397 = ...
			local v399 = v_u_397:andThen(function(...)
				-- upvalues: (copy) p_u_395
				p_u_395:_resolve(...)
			end, function(...)
				-- upvalues: (copy) v_u_397, (ref) v_u_12, (copy) p_u_395
				local v398 = v_u_397._values[1]
				if v_u_397._error then
					v398 = v_u_12.new({
						["error"] = nil,
						["kind"] = nil,
						["context"] = "[No stack trace available as this Promise originated from an older version of the Promise library (< v2)]",
						["error"] = v_u_397._error,
						["kind"] = v_u_12.Kind.ExecutionError
					})
				end
				if v_u_12.isKind(v398, v_u_12.Kind.ExecutionError) then
					return p_u_395:_reject(v398:extend({
						["error"] = "This Promise was chained to a Promise that errored.",
						["trace"] = "",
						["context"] = nil,
						["context"] = string.format("The Promise at:\n\n%s\n...Rejected because it was chained to the following Promise, which encountered an error:\n", p_u_395._source)
					}))
				end
				p_u_395:_reject(...)
			end)
			if v399._status == v_u_48.Status.Cancelled then
				p_u_395:cancel()
			elseif v399._status == v_u_48.Status.Started then
				p_u_395._parent = v399
				v399._consumers[p_u_395] = true
			end
		else
			p_u_395._status = v_u_48.Status.Resolved
			local v400, v401 = v_u_38(...)
			p_u_395._valuesLength = v400
			p_u_395._values = v401
			for _, v402 in ipairs(p_u_395._queuedResolve) do
				coroutine.wrap(v402)(...)
			end
			p_u_395:_finalize()
			return
		end
	else
		if v_u_48.is((...)) then
			(...):_consumerCancelled(p_u_395)
		end
		return
	end
end
v_u_48.prototype._resolve = v403
function v_u_48.prototype._reject(p_u_404, ...) -- name: _reject
	-- upvalues: (copy) v_u_48, (copy) v_u_38
	if p_u_404._status == v_u_48.Status.Started then
		p_u_404._status = v_u_48.Status.Rejected
		local v405, v406 = v_u_38(...)
		p_u_404._valuesLength = v405
		p_u_404._values = v406
		local v407 = p_u_404._queuedReject
		if next(v407) == nil then
			local v_u_408 = tostring((...))
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_48, (copy) p_u_404, (copy) v_u_408
				v_u_48._timeEvent:Wait()
				if p_u_404._unhandledRejection then
					local v409 = string.format("Unhandled Promise rejection:\n\n%s\n\n%s", v_u_408, p_u_404._source)
					for _, v410 in ipairs(v_u_48._unhandledRejectionCallbacks) do
						local v411 = task.spawn
						local v412 = p_u_404
						local v413 = p_u_404._values
						local v414 = p_u_404._valuesLength
						v411(v410, v412, unpack(v413, 1, v414))
					end
					if not v_u_48.TEST then
						warn(v409)
					end
				else
					return
				end
			end)()
		else
			for _, v415 in ipairs(p_u_404._queuedReject) do
				coroutine.wrap(v415)(...)
			end
		end
		p_u_404:_finalize()
	end
end
local v_u_416 = {}
local v_u_417 = nil
local function v_u_420() -- name: closeThreads
	-- upvalues: (ref) v_u_417, (ref) v_u_416
	v_u_417 = nil
	local v418 = v_u_416
	v_u_416 = {}
	for _, v419 in v418 do
		coroutine.close(v419)
	end
end
local function v425(p421) -- name: _finalize
	-- upvalues: (copy) v_u_48, (ref) v_u_5, (ref) v_u_416, (ref) v_u_417, (copy) v_u_420
	for _, v422 in ipairs(p421._queuedFinally) do
		coroutine.wrap(v422)(p421._status)
	end
	p421._queuedFinally = nil
	p421._queuedReject = nil
	p421._queuedResolve = nil
	if not v_u_48.TEST then
		p421._parent = nil
		p421._consumers = nil
	end
	if v_u_5 then
		local v423 = v_u_416
		local v424 = p421._thread
		table.insert(v423, v424)
		if not v_u_417 then
			v_u_417 = task.defer(v_u_420)
			return
		end
	else
		task.defer(coroutine.close, p421._thread)
	end
end
v_u_48.prototype._finalize = v425
local function v430(p426, p427) -- name: now
	-- upvalues: (copy) v_u_48, (ref) v_u_12
	local v428 = debug.traceback(nil, 2)
	if p426._status == v_u_48.Status.Resolved then
		return p426:_andThen(v428, function(...)
			return ...
		end)
	end
	local v429 = v_u_48.reject
	if p427 == nil then
		p427 = v_u_12.new({
			["kind"] = nil,
			["error"] = "This Promise was not resolved in time for :now()",
			["context"] = nil,
			["kind"] = v_u_12.Kind.NotResolvedInTime,
			["context"] = ":now() was called at:\n\n" .. v428
		}) or p427
	end
	return v429(p427)
end
v_u_48.prototype.now = v430
function v_u_48.retry(p_u_431, p_u_432, ...) -- name: retry
	-- upvalues: (copy) v_u_48
	local v433
	if type(p_u_431) == "function" then
		v433 = true
	elseif type(p_u_431) == "table" then
		local v434 = getmetatable(p_u_431)
		if v434 then
			local v435 = rawget(v434, "__call")
			v433 = type(v435) == "function"
		else
			v433 = false
		end
	else
		v433 = false
	end
	assert(v433, "Parameter #1 to Promise.retry must be a function")
	local v436 = type(p_u_432) == "number"
	assert(v436, "Parameter #2 to Promise.retry must be a number")
	local v_u_437 = { ... }
	local v_u_438 = select("#", ...)
	return v_u_48.resolve(p_u_431(...)):catch(function(...)
		-- upvalues: (copy) p_u_432, (ref) v_u_48, (copy) p_u_431, (copy) v_u_437, (copy) v_u_438
		if p_u_432 <= 0 then
			return v_u_48.reject(...)
		end
		local v439 = v_u_437
		local v440 = v_u_438
		return v_u_48.retry(p_u_431, p_u_432 - 1, unpack(v439, 1, v440))
	end)
end
function v_u_48.retryWithDelay(p_u_441, p_u_442, p_u_443, ...) -- name: retryWithDelay
	-- upvalues: (copy) v_u_48
	local v444
	if type(p_u_441) == "function" then
		v444 = true
	elseif type(p_u_441) == "table" then
		local v445 = getmetatable(p_u_441)
		if v445 then
			local v446 = rawget(v445, "__call")
			v444 = type(v446) == "function"
		else
			v444 = false
		end
	else
		v444 = false
	end
	assert(v444, "Parameter #1 to Promise.retry must be a function")
	local v447 = type(p_u_442) == "number"
	assert(v447, "Parameter #2 (times) to Promise.retry must be a number")
	local v448 = type(p_u_443) == "number"
	assert(v448, "Parameter #3 (seconds) to Promise.retry must be a number")
	local v_u_449 = { ... }
	local v_u_450 = select("#", ...)
	return v_u_48.resolve(p_u_441(...)):catch(function(...)
		-- upvalues: (copy) p_u_442, (ref) v_u_48, (copy) p_u_443, (copy) p_u_441, (copy) v_u_449, (copy) v_u_450
		if p_u_442 <= 0 then
			return v_u_48.reject(...)
		end
		v_u_48.delay(p_u_443):await()
		local v451 = v_u_449
		local v452 = v_u_450
		return v_u_48.retryWithDelay(p_u_441, p_u_442 - 1, p_u_443, unpack(v451, 1, v452))
	end)
end
function v_u_48.fromEvent(p_u_453, p454) -- name: fromEvent
	-- upvalues: (copy) v_u_48
	local v_u_455 = p454 or function()
		return true
	end
	return v_u_48._new(debug.traceback(nil, 2), function(p_u_456, _, p457)
		-- upvalues: (copy) p_u_453, (ref) v_u_455
		local v_u_458 = nil
		local v_u_459 = false
		local function v460() -- name: disconnect
			-- upvalues: (ref) v_u_458
			v_u_458:Disconnect()
			v_u_458 = nil
		end
		v_u_458 = p_u_453:Connect(function(...)
			-- upvalues: (ref) v_u_455, (copy) p_u_456, (ref) v_u_458, (ref) v_u_459
			local v461 = v_u_455(...)
			if v461 == true then
				p_u_456(...)
				if v_u_458 then
					v_u_458:Disconnect()
					v_u_458 = nil
				else
					v_u_459 = true
				end
			else
				if type(v461) ~= "boolean" then
					error("Promise.fromEvent predicate should always return a boolean")
				end
				return
			end
		end)
		if v_u_459 and v_u_458 then
			return v460()
		end
		p457(v460)
	end)
end
function v_u_48.onUnhandledRejection(p_u_462) -- name: onUnhandledRejection
	-- upvalues: (copy) v_u_48
	local v463 = v_u_48._unhandledRejectionCallbacks
	table.insert(v463, p_u_462)
	return function()
		-- upvalues: (ref) v_u_48, (copy) p_u_462
		local v464 = table.find(v_u_48._unhandledRejectionCallbacks, p_u_462)
		if v464 then
			table.remove(v_u_48._unhandledRejectionCallbacks, v464)
		end
	end
end
return v_u_48