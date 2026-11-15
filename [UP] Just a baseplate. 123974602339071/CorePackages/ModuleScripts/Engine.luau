-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.Engine
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(script.Parent.AdapterTypes)
local v_u_3 = require(script.Parent.Children)
require(v2.CommonMark)
local v_u_4 = require(script.Parent.FlattenBlocks)
local v_u_5 = require(script.Parent.Passes)
require(script.Parent.Registry)
local v_u_6 = require(script.Parent.RendererNodes)
require(v1.Types)
local function v_u_12(p7, p8, p9, p10) -- name: append
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v11 = v_u_6.append(p8, p9, p10)
	if not v_u_6.isInline(v11) then
		p7.depths[v11] = (p7.depths[p8] or 0) + 1
		if v_u_5.isDroppable(p9) then
			p7.droppable[v11] = p8
		end
	end
	return v11
end
local function v_u_20(p13, p14, p15, p16) -- name: emitText
	-- upvalues: (copy) v_u_6
	if p15 ~= "" then
		local v17 = p13.lastText
		if v17 ~= nil and (p13.lastTextToken == p16 and p13.registry.passes.mergeText) then
			local v18 = p14.children
			if v18[#v18] == v17 then
				local v19 = p13.textParts[v17]
				if v19 == nil then
					p13.textParts[v17] = { v17.text, p15 }
				else
					table.insert(v19, p15)
				end
			end
		end
		p13.lastText = v_u_6.appendText(p14, p15)
		p13.lastTextToken = p16
	end
end
local function v_u_29(p21, p22, p23, p24, p25) -- name: childrenFrame
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	if v_u_6.holdsBlocks(p23) then
		return {
			["kind"] = "units",
			["into"] = nil,
			["units"] = nil,
			["index"] = 0,
			["into"] = p23,
			["units"] = v_u_3.units(p22, p21.registry, false)
		}
	end
	if not v_u_6.isInline(p23) then
		local v26 = p22:getFirstChild()
		while true do
			local v27
			if v26 == nil then
				v27 = false
				break
			end
			if v26.isBlock then
				v27 = true
				break
			end
			v26 = v26:getNext()
		end
		if v27 then
			return {
				["kind"] = "flatten",
				["into"] = nil,
				["node"] = nil,
				["index"] = 0,
				["inlineOnly"] = nil,
				["into"] = p23,
				["node"] = p22,
				["inlineOnly"] = p21.registry.blockInText == "drop"
			}
		end
	end
	local v28 = p22:getFirstChild()
	if not p24 then
		p21.lastToken = p21.lastToken + 1
		p24 = p21.lastToken
	end
	return {
		["kind"] = "inlines",
		["into"] = nil,
		["cursor"] = nil,
		["index"] = 0,
		["token"] = nil,
		["depth"] = nil,
		["into"] = p23,
		["cursor"] = v28,
		["token"] = p24,
		["depth"] = p21.depths[p23] or p25
	}
end
local v_u_30 = {}
v_u_30.__index = v_u_30
function v_u_30.block(p31, p32, p33) -- name: block
	-- upvalues: (copy) v_u_12
	return v_u_12(p31._run, p31.parent, p32, p33)
end
function v_u_30.append(p34, p35, p36, p37) -- name: append
	-- upvalues: (copy) v_u_12
	return v_u_12(p34._run, p35, p36, p37)
end
function v_u_30.text(p38, p39) -- name: text
	-- upvalues: (copy) v_u_6, (copy) v_u_20
	if v_u_6.holdsBlocks(p38.parent) then
		error((("ctx:text needs an inline target, not %*"):format(p38.parent.name)))
	end
	local v40 = v_u_20
	local v41 = p38._run
	local v42 = p38.parent
	local v43 = p38._token
	if v43 == nil then
		local v44 = p38._run
		v44.lastToken = v44.lastToken + 1
		v43 = v44.lastToken
		p38._token = v43
	end
	v40(v41, v42, p39, v43)
end
function v_u_30.adaptChildrenOf(p45, p46, p47) -- name: adaptChildrenOf
	-- upvalues: (copy) v_u_29
	local v48 = v_u_29(p45._run, p46, p47 or p45.parent, p45._token, p45.depth)
	if p45._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local v49 = p45._pending
	if v49 == nil then
		p45._pending = { v48 }
	else
		table.insert(v49, v48)
	end
end
function v_u_30.adaptInlinesOf(p50, p51, p52) -- name: adaptInlinesOf
	local v53 = p51:getFirstChild()
	local v54 = p50._token
	if v54 == nil then
		local v55 = p50._run
		v55.lastToken = v55.lastToken + 1
		v54 = v55.lastToken
		p50._token = v54
	end
	local v56 = {
		["kind"] = "inlines",
		["into"] = nil,
		["cursor"] = nil,
		["index"] = 0,
		["token"] = nil,
		["depth"] = nil,
		["into"] = p52,
		["cursor"] = v53,
		["token"] = v54,
		["depth"] = p50._run.depths[p52] or p50.depth
	}
	if p50._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local v57 = p50._pending
	if v57 == nil then
		p50._pending = { v56 }
	else
		table.insert(v57, v56)
	end
end
function v_u_30.flatten(p58, p59, p60, p61) -- name: flatten
	local v62 = {
		["kind"] = "flatten",
		["into"] = nil,
		["node"] = nil,
		["options"] = nil,
		["index"] = 0,
		["into"] = p60,
		["node"] = p59,
		["options"] = p61
	}
	if p58._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local v63 = p58._pending
	if v63 == nil then
		p58._pending = { v62 }
	else
		table.insert(v63, v62)
	end
end
function v_u_30.childrenOf(_, p64) -- name: childrenOf
	local v_u_65 = p64:getFirstChild()
	return function()
		-- upvalues: (ref) v_u_65
		local v66 = v_u_65
		if v66 ~= nil then
			v_u_65 = v66:getNext()
		end
		return v66
	end
end
function v_u_30.plainText(p67, p68) -- name: plainText
	local v69 = p67._run.registry
	local v70 = p68:getFirstChild()
	local v71 = {}
	while v70 ~= nil do
		local v72 = v69.inline[v70.kind] or v69.unknownInline
		local v73 = false
		if v72.form == "text" then
			local v74 = v72.text
			table.insert(v71, v74(v70))
		elseif v72.form ~= "drop" then
			local v75 = v70.kind == "HardLineBreak" and "\n" or v70.literal
			if type(v75) == "string" then
				table.insert(v71, v75)
				v73 = true
			else
				v73 = true
			end
		end
		local v76
		if v73 then
			v76 = v70:getFirstChild()
		else
			v76 = nil
		end
		if v76 == nil then
			while v70 ~= p68 and v70:getNext() == nil do
				v70 = v70:getParent()
			end
			if v70 == p68 then
				v76 = nil
			else
				v76 = v70:getNext()
			end
		end
		v70 = v76
	end
	return table.concat(v71)
end
function v_u_30.gap(p77, p78, p79) -- name: gap
	local v80 = p77._run.gaps
	table.insert(v80, {
		["kind"] = p78,
		["node"] = p79
	})
end
function v_u_30._units(p81, p82, p83) -- name: _units
	-- upvalues: (copy) v_u_3
	return v_u_3.units(p82, p81._run.registry, p83)
end
function v_u_30._flattenUnits(p84, p85, p86, p87, p88) -- name: _flattenUnits
	local v89 = {
		["kind"] = "flatten",
		["into"] = nil,
		["units"] = nil,
		["options"] = nil,
		["node"] = nil,
		["index"] = 0,
		["into"] = p86,
		["units"] = p85,
		["options"] = p87,
		["node"] = p88
	}
	if p84._closed then
		error("An adapter context schedules work only while its handler runs")
	end
	local v90 = p84._pending
	if v90 == nil then
		p84._pending = { v89 }
	else
		table.insert(v90, v89)
	end
end
local function v_u_105(p91, p92, p93, p94, p95, p96) -- name: callHandler
	-- upvalues: (copy) v_u_30
	local v97 = {
		["parent"] = nil,
		["depth"] = nil,
		["isFirstTopLevel"] = nil,
		["options"] = nil,
		["_run"] = nil,
		["_token"] = nil,
		["_pending"] = nil,
		["_closed"] = false,
		["parent"] = p94,
		["depth"] = p96
	}
	local v98
	if p94 == p91.root then
		v98 = #p94.children == 0
	else
		v98 = false
	end
	v97.isFirstTopLevel = v98
	v97.options = p91.options
	v97._run = p91
	v97._token = p95
	local v99 = v_u_30
	local v100 = setmetatable(v97, v99)
	p92(p93, v100)
	v100._closed = true
	local v101 = v100._pending
	if v101 ~= nil then
		for v102 = #v101, 1, -1 do
			local v103 = p91.stack
			local v104 = v101[v102]
			table.insert(v103, v104)
		end
	end
end
local function v_u_119(p106, p107, p108) -- name: adaptUnit
	-- upvalues: (copy) v_u_12, (copy) v_u_29, (copy) v_u_105
	local v109 = p107.block
	if v109 == nil then
		local v110 = v_u_12(p106, p108, "PARAGRAPH")
		local v111 = p106.stack
		local v112 = {
			["kind"] = "inlines",
			["into"] = nil,
			["list"] = nil,
			["index"] = 0,
			["token"] = nil,
			["depth"] = nil,
			["into"] = v110,
			["list"] = p107.inlines
		}
		p106.lastToken = p106.lastToken + 1
		v112.token = p106.lastToken
		v112.depth = p106.depths[v110]
		table.insert(v111, v112)
		return
	else
		local v113 = p106.registry
		local v114 = v113.block[v109.kind] or v113.unknownBlock
		if v114.form == "as" then
			local v115
			if v114.attributes == nil then
				v115 = nil
			else
				v115 = v114.attributes(v109)
			end
			local v116 = v_u_12(p106, p108, v114.as, v115)
			local v117 = p106.stack
			local v118 = v_u_29(p106, v109, v116, nil, p106.depths[v116])
			table.insert(v117, v118)
		elseif v114.form == "handler" then
			v_u_105(p106, v114.handler, v109, p108, nil, p106.depths[p108] or 0)
		end
	end
end
local function v_u_135(p120, p121, p122) -- name: adaptInline
	-- upvalues: (copy) v_u_20, (copy) v_u_12, (copy) v_u_105
	local v123 = p120.registry
	local v124 = v123.inline[p121.kind] or v123.unknownInline
	local v125 = v124.form
	local v126 = p122.into
	local v127 = p122.token
	if v125 == "text" then
		v_u_20(p120, v126, v124.text(p121), v127)
	elseif v125 == "style" then
		local v128 = v_u_12(p120, v126, "STYLED_TEXT", {
			["style"] = v124.style
		})
		local v129 = p121:getFirstChild()
		if v129 ~= nil then
			local v130 = p120.stack
			local v131 = {
				["kind"] = "inlines",
				["into"] = nil,
				["cursor"] = nil,
				["index"] = 0,
				["token"] = nil,
				["depth"] = nil,
				["into"] = v128,
				["cursor"] = v129,
				["token"] = v127,
				["depth"] = p122.depth
			}
			table.insert(v130, v131)
			return
		end
	elseif v125 == "children" then
		local v132 = p121:getFirstChild()
		if v132 ~= nil then
			local v133 = p120.stack
			local v134 = {
				["kind"] = "inlines",
				["into"] = nil,
				["cursor"] = nil,
				["index"] = 0,
				["token"] = nil,
				["depth"] = nil,
				["into"] = v126,
				["cursor"] = v132,
				["token"] = v127,
				["depth"] = p122.depth
			}
			table.insert(v133, v134)
			return
		end
	elseif v125 == "handler" then
		v_u_105(p120, v124.handler, p121, v126, v127, p122.depth)
	end
end
local v_u_136 = table.freeze({})
local function v_u_145(p137, p138) -- name: startFlatten
	-- upvalues: (copy) v_u_136, (copy) v_u_3, (copy) v_u_4
	local v139 = p138.options or v_u_136
	local v140 = p138.units or v_u_3.units(p138.node, p137.registry, false)
	local v141 = v139.except
	if v141 ~= nil or p138.inlineOnly then
		v140 = {}
		local v142 = {}
		local v143 = false
		for _, v144 in v140 do
			if v141 == nil or v144.block ~= v141 then
				if p138.inlineOnly and v144.block ~= nil then
					continue
				end
				table.insert(v140, v144)
				v142[v144] = v143
			else
				v143 = true
			end
		end
		p138.afterExcept = v142
	end
	p138.flattening = v_u_4.start(v140, p138.into, p137.registry, v139.drop)
end
local function v_u_155(p146, p147) -- name: finishFlatten
	-- upvalues: (copy) v_u_136, (copy) v_u_4, (copy) v_u_3
	local v148 = (p147.options or v_u_136).gap
	if v148 ~= nil then
		local v149 = v_u_4.drawnUnits(p147.flattening)
		local v150
		if #v149 > 1 then
			v150 = true
		elseif #v149 == 1 then
			v150 = not v_u_3.isParagraphLike(v149[1])
		else
			v150 = false
		end
		local v151 = p147.afterExcept
		if v151 ~= nil then
			for _, v152 in v149 do
				v150 = v150 or v151[v152] == true
			end
		end
		if v150 then
			local v153 = {
				["kind"] = v148,
				["node"] = p147.node
			}
			local v154 = p146.gaps
			table.insert(v154, v153)
		end
	end
end
local function v_u_167(p156, p157) -- name: stepFlatten
	-- upvalues: (copy) v_u_145, (copy) v_u_4, (copy) v_u_155
	if p157.flattening == nil then
		v_u_145(p156, p157)
	end
	local v158, v159 = v_u_4.resume(p157.flattening)
	if v158 == nil and v159 == nil then
		table.remove(p156.stack)
		v_u_155(p156, p157)
		return
	else
		local v160 = p157.into
		local v161 = p156.depths[v160] or 0
		if v158 == nil then
			local v162 = p156.stack
			local v163 = v159:getFirstChild()
			p156.lastToken = p156.lastToken + 1
			local v164 = {
				["kind"] = "inlines",
				["into"] = nil,
				["cursor"] = nil,
				["index"] = 0,
				["token"] = nil,
				["depth"] = nil,
				["into"] = v160,
				["cursor"] = v163,
				["token"] = p156.lastToken,
				["depth"] = v161
			}
			table.insert(v162, v164)
		else
			local v165 = p156.stack
			local v166 = {
				["kind"] = "inlines",
				["into"] = nil,
				["list"] = nil,
				["index"] = 0,
				["token"] = nil,
				["depth"] = nil,
				["into"] = v160,
				["list"] = v158
			}
			p156.lastToken = p156.lastToken + 1
			v166.token = p156.lastToken
			v166.depth = v161
			table.insert(v165, v166)
		end
	end
end
local function v_u_175(p168) -- name: drain
	-- upvalues: (copy) v_u_119, (copy) v_u_135, (copy) v_u_167
	local v169 = p168.stack
	while #v169 > 0 do
		local v170 = v169[#v169]
		local v171 = v170.kind
		if v171 == "units" then
			v170.index = v170.index + 1
			local v172 = v170.units[v170.index]
			if v172 == nil then
				table.remove(v169)
			else
				v_u_119(p168, v172, v170.into)
			end
		elseif v171 == "inlines" then
			local v173 = v170.list
			local v174
			if v173 == nil then
				v174 = v170.cursor
				if v174 ~= nil then
					v170.cursor = v174:getNext()
				end
			else
				v170.index = v170.index + 1
				v174 = v173[v170.index]
			end
			if v174 == nil then
				v169[#v169] = nil
			else
				v_u_135(p168, v174, v170)
			end
		else
			v_u_167(p168, v170)
		end
	end
end
local v176 = {}
local v_u_177 = table.freeze({})
function v176.adapt(p178, p179, p180) -- name: adapt
	-- upvalues: (copy) v_u_6, (copy) v_u_177, (copy) v_u_29, (copy) v_u_175, (copy) v_u_5
	local v181 = v_u_6.create("ROOT")
	v181.index = 1
	v181.offset = 1
	local v182 = {
		["registry"] = nil,
		["root"] = nil,
		["stack"] = nil,
		["gaps"] = nil,
		["options"] = nil,
		["lastText"] = nil,
		["lastTextToken"] = 0,
		["textParts"] = nil,
		["droppable"] = nil,
		["depths"] = nil,
		["lastToken"] = 0,
		["registry"] = p178,
		["root"] = v181,
		["stack"] = {},
		["gaps"] = {},
		["options"] = p180 or v_u_177,
		["textParts"] = {},
		["droppable"] = {},
		["depths"] = {
			[v181] = 0
		}
	}
	local v183 = v182.stack
	local v184 = v_u_29(v182, p179, v181, nil, 0)
	table.insert(v183, v184)
	v_u_175(v182)
	v_u_5.finish(v182.textParts, v182.droppable, p178.passes)
	return v181, v182.gaps
end
return v176