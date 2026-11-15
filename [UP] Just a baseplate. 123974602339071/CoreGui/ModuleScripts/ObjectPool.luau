-- Path: CoreGui.RobloxGui.Modules.Common.ObjectPool
local v1 = {}
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.GetInstance(p3, p4) -- name: GetInstance
	if p3.InstancePoolsByClass[p4] == nil then
		p3.InstancePoolsByClass[p4] = {}
	end
	local v5 = #p3.InstancePoolsByClass[p4]
	if v5 <= 0 then
		return Instance.new(p4)
	end
	local v6 = p3.InstancePoolsByClass[p4][v5]
	table.remove(p3.InstancePoolsByClass[p4])
	return v6
end
function v_u_2.ReturnInstance(p7, p8) -- name: ReturnInstance
	if p7.InstancePoolsByClass[p8.ClassName] == nil then
		p7.InstancePoolsByClass[p8.ClassName] = {}
	end
	if #p7.InstancePoolsByClass[p8.ClassName] < p7.PoolSizePerType then
		local v9 = p7.InstancePoolsByClass[p8.ClassName]
		table.insert(v9, p8)
	else
		p8:Destroy()
	end
end
function v1.new(p10) -- name: new
	-- upvalues: (copy) v_u_2
	local v11 = v_u_2
	local v12 = setmetatable({}, v11)
	v12.InstancePoolsByClass = {}
	v12.Name = "ObjectPool"
	v12.PoolSizePerType = p10
	return v12
end
return v1