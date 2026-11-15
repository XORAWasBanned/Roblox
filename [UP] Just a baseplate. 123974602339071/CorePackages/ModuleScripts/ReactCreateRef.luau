-- Path: CorePackages.Packages._Index.React.React.ReactCreateRef
local v1 = script.Parent.Parent
local v_u_2 = require(v1.ReactGlobals)
local v3 = require(v1.Shared).ReactFeatureFlags.enableAllocationTrims
local v_u_4 = require(script.Parent["ReactBinding.roblox"])
local v12 = {
	["createRef"] = function()
		-- upvalues: (copy) v_u_4, (copy) v_u_2
		local v_u_5, _ = v_u_4.create(nil)
		local v6 = {}
		if v_u_2.__DEV__ then
			v_u_5._source = debug.traceback("Ref created at:", 1)
		end
		local v11 = {
			["__index"] = function(_, p7) -- name: __index
				-- upvalues: (copy) v_u_5
				if p7 == "current" then
					return v_u_5:getValue()
				else
					return v_u_5[p7]
				end
			end,
			["__newindex"] = function(_, p8, p9) -- name: __newindex
				-- upvalues: (ref) v_u_4, (copy) v_u_5
				if p8 == "current" then
					v_u_4.update(v_u_5, p9)
				end
				v_u_5[p8] = p9
			end,
			["__tostring"] = function(_) -- name: __tostring
				-- upvalues: (copy) v_u_5
				local v10 = v_u_5
				return string.format("Ref(%s)", (tostring(v10:getValue())))
			end
		}
		setmetatable(v6, v11)
		return v6
	end
}
local function v_u_17(p13, p14, p15) -- name: refNewIndex
	-- upvalues: (copy) v_u_4
	local v16 = getmetatable(p13).__index
	v16[p14] = p15
	if p14 == "current" then
		v_u_4.update(v16, p15)
	end
end
local function v_u_21(p18) -- name: refToString
	local v19 = string.format
	local v20 = getmetatable(p18).__index
	return v19("Ref(%s)", (tostring(v20:getValue())))
end
local function v24() -- name: createRefWithoutClosures
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_17, (copy) v_u_21
	local v22
	if v_u_2.__DEV__ then
		v22 = debug.traceback("Ref created at:", 1)
	else
		v22 = nil
	end
	local v23 = {
		["__index"] = v_u_4.createWithoutUpdater(nil, v22),
		["__newindex"] = v_u_17,
		["__tostring"] = v_u_21
	}
	return setmetatable({}, v23)
end
if v3 then
	v12.createRef = v24
end
return v12