-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.TransparencyTweener
local v1 = {}
local v_u_2 = game:GetService("RunService")
local _ = script.Parent
local v_u_59 = {
	["__ClassName"] = "TransparencyTweener",
	["__tostring"] = function(p3)
		return p3.__ClassName .. ": " .. p3.MemoryLocation
	end,
	["__metatable"] = "The metatable is locked",
	["__index"] = function(p4, p5, _)
		-- upvalues: (copy) v_u_59
		if rawget(p4, p5) then
			return rawget(p4, p5)
		end
		local v6 = v_u_59
		if rawget(v6, p5) then
			local v7 = v_u_59
			return rawget(v7, p5)
		end
		if p5 == "Transparency" then
			return rawget(p4, "InternalLastTweenPercentage")
		end
		error(p5 .. " is not a valid member of " .. p4.__ClassName)
	end,
	["__newindex"] = function(p8, p9, p10)
		if p9 == "Transparency" then
			p8.InternalLastTweenPercentage = p10
			p8:SetPropertiesToTweenPercentage(p10)
		else
			error(p9 .. " is not a valid member of " .. p8.__ClassName)
		end
	end,
	["Dump"] = function(p11) -- name: Dump
		local v12 = tostring(p11)
		for v13, v14 in pairs(p11.TweenObjects) do
			local v15 = " | "
			if type(v13) == "table" then
				v15 = v15 .. "{{" .. v13:Dump() .. "}}"
			elseif type(v13) == "userdata" then
				v15 = v15 .. v13.Name .. "/" .. v13:GetFullName()
			end
			for v16, v17 in pairs(v14) do
				local v18 = tostring(v17)
				v15 = v15 .. " [" .. v16 .. "=" .. string.sub(v18, 1, 4) .. "]"
			end
			v12 = v12 .. v15
		end
		return v12
	end,
	["OutputTest"] = function(p19) -- name: OutputTest
		print("Test Output for {={" .. p19:Dump() .. "}=}")
		for v20, v21 in pairs(p19.TweenObjects) do
			print("TweenObject:", v20)
			for v22, v23 in pairs(v21) do
				local v24 = print
				local v25 = tostring(v23)
				v24("\t[" .. v22 .. "=" .. string.sub(v25, 1, 4) .. "] Actual:" .. v20[v22])
			end
		end
	end,
	["RegisterTweenObjectProperty"] = function(p26, p27, p28, p29) -- name: RegisterTweenObjectProperty
		local v30 = p29 or p27[p28]
		if not p26.TweenObjects[p27] then
			p26.TweenObjects[p27] = {}
		end
		p26.TweenObjects[p27][p28] = v30
		p26:SetObjectPropertyToPercentValue(p27, p28, v30, p26.InternalLastTweenPercentage)
	end,
	["UnregisterTweenObject"] = function(p31, p32) -- name: UnregisterTweenObject
		p31.TweenObjects[p32] = nil
	end,
	["SetObjectPropertyToPercentValue"] = function(_, p33, p34, p35, p36) -- name: SetObjectPropertyToPercentValue
		p33[p34] = p35 + (1 - p35) * p36
	end,
	["SetPropertiesToTweenPercentage"] = function(p37, p38) -- name: SetPropertiesToTweenPercentage
		for v39, v40 in pairs(p37.TweenObjects) do
			for v41, v42 in pairs(v40) do
				p37:SetObjectPropertyToPercentValue(v39, v41, v42, p38)
			end
		end
	end,
	["Tween"] = function(p_u_43, p_u_44, p_u_45, p46) -- name: Tween
		-- upvalues: (copy) v_u_2
		if p_u_43.Tweening then
			p_u_43.QueuedTween = { p_u_44, p_u_45, p46 }
			p_u_43.TweenIsQueued = true
			p_u_43:CancelTween()
		else
			p_u_43.Tweening = true
			local v_u_47 = p46
			if v_u_47 then
				p_u_43:SetPropertiesToTweenPercentage(v_u_47)
			else
				v_u_47 = p_u_43.InternalLastTweenPercentage
			end
			local v_u_48 = tick()
			local v_u_49 = v_u_48 + p_u_44
			local v_u_50 = p_u_45 - v_u_47
			local v_u_51 = 0
			spawn(function()
				-- upvalues: (copy) v_u_49, (copy) p_u_43, (ref) v_u_51, (copy) v_u_48, (copy) p_u_44, (ref) v_u_47, (copy) v_u_50, (ref) v_u_2, (copy) p_u_45
				local v52 = tick()
				while v52 < v_u_49 and not p_u_43.Canceled do
					local v53 = (v52 - v_u_48) / p_u_44
					local v54 = math.max(v53, 0)
					v_u_51 = math.min(v54, 1)
					local v55 = v_u_47 + v_u_50 * v_u_51
					p_u_43.InternalLastTweenPercentage = v55
					p_u_43:SetPropertiesToTweenPercentage(v55)
					v_u_2.RenderStepped:wait()
					v52 = tick()
				end
				if p_u_43.Canceled then
					p_u_43.Canceled = false
					if p_u_43.TweenIsQueued then
						p_u_43.TweenIsQueued = false
						p_u_43.Tweening = false
						local v56 = p_u_43
						local v57 = p_u_43.QueuedTween
						v56:Tween(unpack(v57))
						return
					end
				else
					p_u_43.InternalLastTweenPercentage = p_u_45
					p_u_43:SetPropertiesToTweenPercentage(p_u_45)
				end
				p_u_43.Tweening = false
			end)
		end
	end,
	["CancelTween"] = function(p58) -- name: CancelTween
		p58.Canceled = true
	end
}
function v1.new() -- name: new
	-- upvalues: (copy) v_u_59
	local v60 = {}
	v60.MemoryLocation = tostring(v60):match("[0123456789ABCDEF]+")
	v60.TweenObjects = setmetatable({}, {
		["__mode"] = "k"
	})
	v60.Transparency = nil
	v60.InternalLastTweenPercentage = 0
	v60.Tweening = false
	v60.Canceled = false
	v60.TweenIsQueued = false
	v60.QueuedTween = {}
	local v61 = v_u_59
	return setmetatable(v60, v61)
end
return v1