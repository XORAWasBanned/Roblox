-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.Util
local v1 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v2 = require(v1:WaitForChild("ChatConstants")).StandardPriority
local v_u_3 = v2 == nil and 10 or v2
local v4 = {}
v4.__index = v4
local v_u_5 = {}
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.RebuildProcessCommandsPriorities(p7) -- name: RebuildProcessCommandsPriorities
	p7.RegisteredPriorites = {}
	for v8, v9 in pairs(p7.FunctionMap) do
		local v10 = true
		for _, _ in pairs(v9) do
			v10 = false
		end
		if v10 then
			continue
		end
		local v11 = p7.RegisteredPriorites
		table.insert(v11, v8)
	end
	table.sort(p7.RegisteredPriorites, function(p12, p13)
		return p13 < p12
	end)
end
function v_u_6.HasFunction(p14, p15) -- name: HasFunction
	return p14.RegisteredFunctions[p15] ~= nil
end
function v_u_6.RemoveFunction(p16, p17) -- name: RemoveFunction
	local v18 = p16.RegisteredFunctions[p17]
	p16.RegisteredFunctions[p17] = nil
	p16.FunctionMap[v18][p17] = nil
	p16:RebuildProcessCommandsPriorities()
end
function v_u_6.AddFunction(p19, p20, p21, p22) -- name: AddFunction
	-- upvalues: (ref) v_u_3
	if p22 == nil then
		p22 = v_u_3
	end
	if p19.RegisteredFunctions[p20] then
		error(p20 .. " is already in use!")
	end
	p19.RegisteredFunctions[p20] = p22
	if p19.FunctionMap[p22] == nil then
		p19.FunctionMap[p22] = {}
	end
	p19.FunctionMap[p22][p20] = p21
	p19:RebuildProcessCommandsPriorities()
end
function v_u_6.GetIterator(p_u_23) -- name: GetIterator
	local v_u_24 = 1
	local v_u_25 = nil
	local v_u_26 = nil
	return function()
		-- upvalues: (ref) v_u_24, (copy) p_u_23, (ref) v_u_25, (ref) v_u_26
		while v_u_24 <= #p_u_23.RegisteredPriorites do
			local v27 = p_u_23.RegisteredPriorites[v_u_24]
			local v28, v29 = next(p_u_23.FunctionMap[v27], v_u_25)
			v_u_25 = v28
			v_u_26 = v29
			if v_u_25 ~= nil then
				return v_u_25, v_u_26, v27
			end
			v_u_24 = v_u_24 + 1
		end
	end
end
function v_u_5.new() -- name: new
	-- upvalues: (copy) v_u_6
	local v30 = v_u_6
	local v31 = setmetatable({}, v30)
	v31.RegisteredFunctions = {}
	v31.RegisteredPriorites = {}
	v31.FunctionMap = {}
	return v31
end
function v4.NewSortedFunctionContainer(_) -- name: NewSortedFunctionContainer
	-- upvalues: (copy) v_u_5
	return v_u_5.new()
end
return v4