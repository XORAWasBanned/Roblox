-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.renderer.html.HtmlWriter
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.util.Escaping)
require(v1.internal.port.LinkedHashMap)
local v_u_3 = string.byte
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5) -- name: new
	-- upvalues: (copy) v_u_4
	local v6 = {
		["_buffer"] = nil,
		["_n"] = nil,
		["_lastChar"] = 0,
		["_buffer"] = p5,
		["_n"] = #p5
	}
	local v7 = v_u_4
	return setmetatable(v6, v7)
end
function v_u_4.raw(p8, p9) -- name: raw
	p8:append(p9)
end
function v_u_4.text(p10, p11) -- name: text
	-- upvalues: (copy) v_u_2
	p10:append(v_u_2.escapeHtml(p11))
end
function v_u_4.tag(p12, p13, p14, p15) -- name: tag
	-- upvalues: (copy) v_u_2
	p12:append("<")
	p12:append(p13)
	if p14 ~= nil and not p14:isEmpty() then
		for v16, v17 in p14:entrySet() do
			p12:append(" ")
			p12:append(v_u_2.escapeHtml(v16))
			if v17 == nil then
				continue
			end
			p12:append("=\"")
			p12:append(v_u_2.escapeHtml(v17))
			p12:append("\"")
		end
	end
	if p15 then
		p12:append(" /")
	end
	p12:append(">")
end
function v_u_4.line(p18) -- name: line
	if p18._lastChar ~= 0 and p18._lastChar ~= 10 then
		p18:append("\n")
	end
end
function v_u_4.append(p19, p20) -- name: append
	-- upvalues: (copy) v_u_3
	p19._n = p19._n + 1
	p19._buffer[p19._n] = p20
	local v21 = #p20
	if v21 ~= 0 then
		p19._lastChar = v_u_3(p20, v21)
	end
end
return v_u_4