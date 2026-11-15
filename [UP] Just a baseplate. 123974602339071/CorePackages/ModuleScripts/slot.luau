-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.wry.context.slot
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v5 = v3.Boolean
local v_u_6 = require(v1.utilities.common.makeUniqueId).uuid
local v7 = {}
local v_u_8 = nil
local v_u_9 = {}
local v_u_10 = 1
local function v45() -- name: makeSlotClass
	-- upvalues: (copy) v_u_4, (ref) v_u_10, (copy) v_u_6, (ref) v_u_8, (copy) v_u_9
	local v_u_11 = {}
	v_u_11.__index = v_u_11
	function v_u_11.new() -- name: new
		-- upvalues: (copy) v_u_11, (ref) v_u_4, (ref) v_u_10, (ref) v_u_6
		local v12 = v_u_11
		local v13 = setmetatable({}, v12)
		v13.id = v_u_4.join({
			"slot",
			v_u_10,
			DateTime.now().UnixTimestampMillis,
			v_u_6()
		}, ":")
		v_u_10 = v_u_10 + 1
		return v13
	end
	function v_u_11.hasValue(p14) -- name: hasValue
		-- upvalues: (ref) v_u_8, (ref) v_u_9
		local v15 = v_u_8
		while v15 do
			if v15.slots[p14.id] then
				local v16 = v15.slots[p14.id]
				if v16 ~= v_u_9 then
					if v15 ~= v_u_8 then
						v_u_8.slots[p14.id] = v16
					end
					return true
				end
				break
			end
			v15 = v15.parent
		end
		if v_u_8 then
			v_u_8.slots[p14.id] = v_u_9
		end
		return false
	end
	function v_u_11.getValue(p17) -- name: getValue
		-- upvalues: (ref) v_u_8
		if p17:hasValue() then
			return v_u_8.slots[p17.id]
		else
			return nil
		end
	end
	function v_u_11.withValue(p18, p19, p_u_20, p_u_21, p_u_22) -- name: withValue
		-- upvalues: (ref) v_u_8
		local v23 = v_u_8
		v_u_8 = {
			["parent"] = v23,
			["slots"] = {
				[p18.id] = p19
			}
		}
		local v25, v26, v27 = pcall(function()
			-- upvalues: (copy) p_u_20, (copy) p_u_22, (copy) p_u_21
			local v24 = p_u_21 or {}
			return p_u_20(p_u_22, table.unpack(v24)), true
		end)
		v_u_8 = v23
		if v27 then
			return v26
		end
		if not v25 then
			error(v26)
		end
		return nil
	end
	function v_u_11.bind(p_u_28) -- name: bind
		-- upvalues: (ref) v_u_8
		local v_u_29 = v_u_8
		return function(p30, ...)
			-- upvalues: (ref) v_u_8, (copy) v_u_29, (copy) p_u_28
			local v31 = v_u_8
			v_u_8 = v_u_29
			local v32 = p_u_28
			local v33 = table.unpack
			local v34, v35 = pcall(v32, p30, v33({ ... }))
			v_u_8 = v31
			if not v34 then
				error(v35)
			end
			return v35
		end
	end
	function v_u_11.noContext(p_u_36, p_u_37, p_u_38) -- name: noContext
		-- upvalues: (ref) v_u_8
		if not v_u_8 then
			return p_u_36(p_u_38, table.unpack(p_u_37 or {}))
		end
		local v39 = v_u_8
		local function v41()
			-- upvalues: (ref) v_u_8, (copy) p_u_36, (copy) p_u_38, (copy) p_u_37
			v_u_8 = nil
			local v40 = p_u_37 or {}
			return p_u_36(p_u_38, table.unpack(v40)), true
		end
		local v42, v43, v44 = pcall(v41)
		v_u_8 = v39
		if v44 then
			return v43
		end
		if not v42 then
			error(v43)
		end
		return nil
	end
	return v_u_11
end
local v_u_46 = v5.toJSBoolean(v_u_4["@wry/context:Slot"]) and v_u_4["@wry/context:Slot"]
if not v_u_46 then
	v_u_46 = v45()
	pcall(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_46
		v_u_4["@wry/context:Slot"] = v_u_46
	end)
end
v7.Slot = v_u_46
return v7