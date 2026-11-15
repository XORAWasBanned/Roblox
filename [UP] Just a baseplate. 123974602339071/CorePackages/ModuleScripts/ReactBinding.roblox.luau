-- Path: CorePackages.Packages._Index.React.React.ReactBinding.roblox
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v3 = require(v1.LuauPolyfill)
local v_u_4 = require(v1.Shared).ReactSymbols
require(v1.Shared)
local v5 = v3.Symbol
local v_u_6 = require(script.Parent["createSignal.roblox"])
local v_u_7 = require(v1.Shared).ReactFeatureFlags.enableAllocationTrims
local v_u_8 = v5("BindingImpl")
local v_u_9 = {}
local v_u_14 = {
	["__index"] = {
		["getValue"] = function(p10) -- name: getValue
			-- upvalues: (copy) v_u_9
			return v_u_9.getValue(p10)
		end,
		["map"] = function(p11, p12) -- name: map
			-- upvalues: (copy) v_u_9
			return v_u_9.map(p11, p12)
		end
	},
	["__tostring"] = function(p13) -- name: __tostring
		return string.format("RoactBinding(%s)", (tostring(p13:getValue())))
	end
}
local v_u_23 = {
	["getValue"] = function(p15) -- name: getValue
		return p15.value
	end,
	["update"] = function(p16, p17) -- name: update
		p16.value = p17
		local v18 = p16.fire
		if v18 ~= nil then
			v18(p17)
		end
	end,
	["subscribe"] = function(p19, p20) -- name: subscribe
		-- upvalues: (copy) v_u_6
		local v21 = p19.subscribeToSignal
		if v21 == nil then
			local v22
			v21, v22 = v_u_6()
			p19.fire = v22
			p19.subscribeToSignal = v21
		end
		return v21(p20)
	end
}
local v_u_24 = {
	["__index"] = v_u_23
}
function v_u_9.update(p25, p26) -- name: update
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_24, (copy) v_u_23
	if v_u_7 then
		local v27 = p25[v_u_8]
		if getmetatable(v27) == v_u_24 then
			return v_u_23.update(v27, p26)
		else
			return v27.update(p26)
		end
	else
		return p25[v_u_8].update(p26)
	end
end
function v_u_9.subscribe(p28, p29) -- name: subscribe
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_24, (copy) v_u_23
	if v_u_7 then
		local v30 = p28[v_u_8]
		if getmetatable(v30) == v_u_24 then
			return v_u_23.subscribe(v30, p29)
		else
			return v30.subscribe(p29)
		end
	else
		return p28[v_u_8].subscribe(p29)
	end
end
function v_u_9.getValue(p31) -- name: getValue
	-- upvalues: (copy) v_u_8
	return p31[v_u_8]:getValue()
end
function v_u_9.createWithoutUpdater(p32, p33) -- name: createWithoutUpdater
	-- upvalues: (copy) v_u_24, (copy) v_u_4, (copy) v_u_8, (copy) v_u_14
	local v34 = v_u_24
	local v35 = setmetatable({
		["value"] = p32
	}, v34)
	local v36 = {
		["$$typeof"] = v_u_4.REACT_BINDING_TYPE,
		[v_u_8] = v35,
		["_source"] = p33
	}
	local v37 = v_u_14
	return setmetatable(v36, v37)
end
function v_u_9.create(p38) -- name: create
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_23, (copy) v_u_6, (copy) v_u_4, (copy) v_u_14
	if v_u_7 then
		local v39
		if v_u_2.__DEV__ then
			v39 = debug.traceback("Binding created at:", 3)
		else
			v39 = nil
		end
		local v40 = v_u_9.createWithoutUpdater(p38, v39)
		local v_u_41 = v40[v_u_8]
		return v40, function(p42)
			-- upvalues: (ref) v_u_23, (copy) v_u_41
			v_u_23.update(v_u_41, p42)
		end
	end
	local v43, v_u_44 = v_u_6()
	local v_u_46 = {
		["value"] = p38,
		["subscribe"] = v43,
		["update"] = function(p45) -- name: update
			-- upvalues: (copy) v_u_46, (copy) v_u_44
			v_u_46.value = p45
			v_u_44(p45)
		end,
		["getValue"] = function() -- name: getValue
			-- upvalues: (copy) v_u_46
			return v_u_46.value
		end
	}
	local v47
	if v_u_2.__DEV__ then
		v47 = debug.traceback("Binding created at:", 3)
	else
		v47 = nil
	end
	local v48 = {
		["$$typeof"] = v_u_4.REACT_BINDING_TYPE,
		[v_u_8] = v_u_46,
		["_source"] = v47
	}
	local v49 = v_u_14
	return setmetatable(v48, v49), v_u_46.update
end
function v_u_9.map(p_u_50, p_u_51) -- name: map
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_9, (copy) v_u_8, (copy) v_u_14
	if v_u_2.__DEV__ then
		local v52
		if typeof(p_u_50) == "table" then
			v52 = p_u_50["$$typeof"] == v_u_4.REACT_BINDING_TYPE
		else
			v52 = false
		end
		assert(v52, "Expected `self` to be a binding")
		local v53 = typeof(p_u_51) == "function"
		assert(v53, "Expected arg #1 to be a function")
	end
	local v56 = {
		["subscribe"] = function(p_u_54) -- name: subscribe
			-- upvalues: (ref) v_u_9, (copy) p_u_50, (copy) p_u_51
			return v_u_9.subscribe(p_u_50, function(p55)
				-- upvalues: (copy) p_u_54, (ref) p_u_51
				p_u_54(p_u_51(p55))
			end)
		end,
		["update"] = function(_) -- name: update
			error("Bindings created by Binding:map(fn) cannot be updated directly", 2)
		end,
		["getValue"] = function() -- name: getValue
			-- upvalues: (copy) p_u_51, (copy) p_u_50
			return p_u_51(p_u_50:getValue())
		end
	}
	local v57
	if v_u_2.__DEV__ then
		v57 = debug.traceback("Mapped binding created at:", 3)
	else
		v57 = nil
	end
	local v58 = {
		["$$typeof"] = v_u_4.REACT_BINDING_TYPE,
		[v_u_8] = v56,
		["_source"] = v57
	}
	local v59 = v_u_14
	return setmetatable(v58, v59)
end
function v_u_9.join(p_u_60) -- name: join
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_9, (copy) v_u_8, (copy) v_u_14
	if v_u_2.__DEV__ then
		local v61 = typeof(p_u_60) == "table"
		assert(v61, "Expected arg #1 to be of type table")
		for v62, v63 in p_u_60 do
			if typeof(v63) == "table" and v63["$$typeof"] == v_u_4.REACT_BINDING_TYPE then
				continue
			end
			local v64 = ("Expected arg #1 to contain only bindings, but key %q had a non-binding value"):format((tostring(v62)))
			error(v64, 2)
		end
	end
	local v65 = {}
	local function v_u_69() -- name: getValue
		-- upvalues: (copy) p_u_60
		local v66 = {}
		for v67, v68 in pairs(p_u_60) do
			v66[v67] = v68:getValue()
		end
		return v66
	end
	function v65.subscribe(p_u_70) -- name: subscribe
		-- upvalues: (copy) p_u_60, (ref) v_u_9, (copy) v_u_69
		local v_u_71 = {}
		for v72, v73 in p_u_60 do
			v_u_71[v72] = v_u_9.subscribe(v73, function(_)
				-- upvalues: (copy) p_u_70, (ref) v_u_69
				p_u_70((v_u_69()))
			end)
		end
		return function()
			-- upvalues: (ref) v_u_71
			if v_u_71 ~= nil then
				for _, v74 in v_u_71 do
					v74()
				end
				v_u_71 = nil
			end
		end
	end
	function v65.update(_) -- name: update
		error("Bindings created by joinBindings(...) cannot be updated directly", 2)
	end
	function v65.getValue() -- name: getValue
		-- upvalues: (copy) v_u_69
		return v_u_69()
	end
	local v75
	if v_u_2.__DEV__ then
		v75 = debug.traceback("Joined binding created at:", 2)
	else
		v75 = nil
	end
	local v76 = {
		["$$typeof"] = v_u_4.REACT_BINDING_TYPE,
		[v_u_8] = v65,
		["_source"] = v75
	}
	local v77 = v_u_14
	return setmetatable(v76, v77)
end
return v_u_9