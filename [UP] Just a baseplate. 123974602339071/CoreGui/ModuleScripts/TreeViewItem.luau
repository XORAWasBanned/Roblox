-- Path: CoreGui.RobloxGui.Modules.Stats.TreeViewItem
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3) -- name: new
	-- upvalues: (copy) v_u_1
	local v4 = {}
	local v5 = v_u_1
	setmetatable(v4, v5)
	v4._id = p2
	v4._parent = p3
	v4._children = {}
	return v4
end
function v_u_1.getValue(p6) -- name: getValue
	return p6._value
end
function v_u_1.getLabel(p7) -- name: getLabel
	return p7._label
end
function v_u_1.getChildren(p8) -- name: getChildren
	return p8._children
end
function v_u_1.getId(p9) -- name: getId
	return p9._id
end
function v_u_1.getStackDepth(p10) -- name: getStackDepth
	return p10._parent == nil and 0 or 1 + p10._parent:getStackDepth()
end
function v_u_1.setLabelAndValue(p11, p12, p13) -- name: setLabelAndValue
	p11._label = p12
	p11._value = p13
end
function v_u_1.getOrMakeChildById(p14, p15) -- name: getOrMakeChildById
	-- upvalues: (copy) v_u_1
	for _, v16 in ipairs(p14._children) do
		if v16:getId() ~= p15 then
			continue
		end
		return v16
	end
	local v17 = v_u_1.new(p15, p14)
	local v18 = p14._children
	table.insert(v18, v17)
	return v17
end
function v_u_1.removeChildren(p19) -- name: removeChildren
	if p19._children then
		for _, v20 in ipairs(p19._children) do
			v20:removeChildren()
		end
		p19._id = nil
		p19._parent = nil
		p19._children = nil
	end
end
function v_u_1.removeChild(p21, p22) -- name: removeChild
	for _, v23 in ipairs(p21._children) do
		if v23:getId() ~= p22 then
			continue
		end
		v23:removeChildren()
		return
	end
end
return v_u_1