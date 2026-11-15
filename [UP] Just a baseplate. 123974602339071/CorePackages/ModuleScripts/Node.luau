-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.Node
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.SourceSpan)
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = table.freeze({})
function v_u_2.new(p4, p5) -- name: new
	-- upvalues: (copy) v_u_2
	local v6 = v_u_2
	return setmetatable({
		["kind"] = nil,
		["isBlock"] = nil,
		["_parent"] = nil,
		["_firstChild"] = nil,
		["_lastChild"] = nil,
		["_prev"] = nil,
		["_next"] = nil,
		["_sourceSpans"] = nil,
		["kind"] = p4,
		["isBlock"] = p5
	}, v6)
end
function v_u_2.accept(p7, p8) -- name: accept
	local v9 = p8["visit" .. p7.kind]
	if v9 == nil then
		if p7.isBlock then
			v9 = p8.visitCustomBlock
		else
			v9 = p8.visitCustomNode
		end
	end
	v9(p8, p7)
end
function v_u_2.getNext(p10) -- name: getNext
	return p10._next
end
function v_u_2.getPrevious(p11) -- name: getPrevious
	return p11._prev
end
function v_u_2.getFirstChild(p12) -- name: getFirstChild
	return p12._firstChild
end
function v_u_2.getLastChild(p13) -- name: getLastChild
	return p13._lastChild
end
function v_u_2.getParent(p14) -- name: getParent
	return p14._parent
end
function v_u_2.setParent(p15, p16) -- name: setParent
	if p15.isBlock and not p16.isBlock then
		error("Parent of block must also be block (can not be inline)")
	end
	p15._parent = p16
end
function v_u_2.appendChild(p17, p18) -- name: appendChild
	p18:unlink()
	p18:setParent(p17)
	if p17._lastChild == nil then
		p17._firstChild = p18
	else
		p17._lastChild._next = p18
		p18._prev = p17._lastChild
	end
	p17._lastChild = p18
end
function v_u_2.prependChild(p19, p20) -- name: prependChild
	p20:unlink()
	p20:setParent(p19)
	if p19._firstChild == nil then
		p19._firstChild = p20
		p19._lastChild = p20
	else
		p19._firstChild._prev = p20
		p20._next = p19._firstChild
		p19._firstChild = p20
	end
end
function v_u_2.unlink(p21) -- name: unlink
	if p21._prev == nil then
		if p21._parent ~= nil then
			p21._parent._firstChild = p21._next
		end
	else
		p21._prev._next = p21._next
	end
	if p21._next == nil then
		if p21._parent ~= nil then
			p21._parent._lastChild = p21._prev
		end
	else
		p21._next._prev = p21._prev
	end
	p21._parent = nil
	p21._next = nil
	p21._prev = nil
end
function v_u_2.insertAfter(p22, p23) -- name: insertAfter
	p23:unlink()
	p23._next = p22._next
	if p23._next ~= nil then
		p23._next._prev = p23
	end
	p23._prev = p22
	p22._next = p23
	p23._parent = p22._parent
	if p23._next == nil then
		p23._parent._lastChild = p23
	end
end
function v_u_2.insertBefore(p24, p25) -- name: insertBefore
	p25:unlink()
	p25._prev = p24._prev
	if p25._prev ~= nil then
		p25._prev._next = p25
	end
	p25._next = p24
	p24._prev = p25
	p25._parent = p24._parent
	if p25._prev == nil then
		p25._parent._firstChild = p25
	end
end
function v_u_2.getSourceSpans(p26) -- name: getSourceSpans
	-- upvalues: (copy) v_u_3
	if p26._sourceSpans == nil then
		return v_u_3
	else
		return p26._sourceSpans
	end
end
function v_u_2.setSourceSpans(p27, p28) -- name: setSourceSpans
	if #p28 == 0 then
		p27._sourceSpans = nil
	else
		p27._sourceSpans = table.clone(p28)
	end
end
function v_u_2.addSourceSpan(p29, p30) -- name: addSourceSpan
	if p29._sourceSpans == nil then
		p29._sourceSpans = {}
	end
	local v31 = p29._sourceSpans
	table.insert(v31, p30)
end
function v_u_2.toString(p32) -- name: toString
	return ("%*{%*}"):format(p32.kind, (p32:toStringAttributes()))
end
v_u_2.toStringAttributesByKind = {}
function v_u_2.toStringAttributes(p33) -- name: toStringAttributes
	-- upvalues: (copy) v_u_2
	local v34 = v_u_2.toStringAttributesByKind[p33.kind]
	return v34 == nil and "" or v34(p33)
end
return v_u_2