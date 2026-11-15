-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.Components.InlineLayout.InlineLayoutElements.InlineSpanElement
local v1 = script:FindFirstAncestor("Components").Parent
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Dash)
local v5 = require(v1.Utils.InlineElementType)
require(v1.Components.InlineLayout.InlineLayoutElements.RenderableInlineElement)
local v_u_6 = require(v1.Components.InlineLayout.InlineLayoutElements.HardBreakElement)
local v_u_7 = require(v1.Utils.isInlineElement)
local v_u_8 = require(v1.Utils.renderInMeasuredFrame)
local v_u_9 = {}
v_u_9.__index = v_u_9
v_u_9.__type = v5
local function v_u_16(p10, p11) -- name: getSplitPoint
	local v12 = 0
	for v13, v14 in p10 do
		local v15 = v14:getWidth()
		if p11 < v12 + v15 then
			return v13, p11 - v12
		end
		v12 = v12 + v15
	end
	return -1, -1
end
function v_u_9.new(p17, p18, p19, p20) -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_6
	local v21 = v_u_9
	local v22 = setmetatable({}, v21)
	v22.WrapperElement = p17
	v22.wrapperElementProps = p18
	v22.Elements = {}
	v22.startingIndex = p20 or 1
	for _, v23 in p19 do
		if v_u_7(v23) and v23 ~= v_u_6 then
			local v24 = v22.Elements
			table.insert(v24, v23)
		else
			warn("InlineSpanElement: invalid element provided. Only non inline elements, excluding HardBreakElement, are allowed.")
		end
	end
	if #v22.Elements == 0 then
		warn("InlineSpanElement: no elements provided")
	end
	local v25
	if #v22.Elements > 0 then
		v25 = v22.Elements[#v22.Elements].canForceSplit
	else
		v25 = false
	end
	v22.canForceSplit = v25
	return v22
end
function v_u_9.getWidth(p26) -- name: getWidth
	-- upvalues: (copy) v_u_4
	return v_u_4.sum(v_u_4.map(p26.Elements, function(p27)
		return p27:getWidth()
	end))
end
function v_u_9._splitChildAtIndex(p28, p29, p30) -- name: _splitChildAtIndex
	local v31, v32 = p28.Elements[p29]:split(p30, false)
	return v31, v32, v31:getWidth() <= p30
end
function v_u_9.split(p33, p34, p35) -- name: split
	-- upvalues: (copy) v_u_16, (copy) v_u_9
	local v36 = {}
	local v37 = {}
	local v38, v39 = v_u_16(p33.Elements, p34)
	if v38 == -1 then
		return p33, nil
	else
		local v40 = v38 + 1
		local v41, v42, v43 = p33:_splitChildAtIndex(v38, v39)
		if not v43 then
			local v44 = p33.Elements[v38]
			if v38 > 1 then
				v42 = v44
				v41 = nil
			elseif v44.canForceSplit and p35 then
				v41, v42 = v44:split(v39, true)
			end
		end
		if v38 > 1 then
			table.move(p33.Elements, 1, v38 - 1, 1, v36)
		end
		if v41 then
			table.insert(v36, v41)
			v40 = v40 - 1
		end
		if v42 then
			table.insert(v37, v42)
		end
		if v38 < #p33.Elements then
			table.move(p33.Elements, v38 + 1, #p33.Elements, #v37 + 1, v37)
		end
		local v45 = v_u_9.new(p33.WrapperElement, p33.wrapperElementProps, v36, p33.startingIndex)
		if #v37 > 0 then
			return v45, v_u_9.new(p33.WrapperElement, p33.wrapperElementProps, v37, v40)
		else
			return v45, nil
		end
	end
end
function v_u_9.trimStart(p46) -- name: trimStart
	-- upvalues: (copy) v_u_9
	for v47, v48 in p46.Elements do
		local v49
		if v48.trimStart then
			v49 = v48:trimStart()
		else
			v49 = v48
		end
		if v49 == v48 and v47 == 1 then
			return p46
		end
		if v49 == nil then
			continue
		end
		local v50 = { v49 }
		table.move(p46.Elements, v47 + 1, #p46.Elements, 2, v50)
		return v_u_9.new(p46.WrapperElement, p46.wrapperElementProps, v50, p46.startingIndex + v47 - 1)
	end
	return nil
end
function v_u_9.render(p_u_51, p_u_52, p53) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_3
	local v56 = v_u_4.map(p_u_51.Elements, function(p54, p55)
		-- upvalues: (ref) v_u_8, (copy) p_u_52, (copy) p_u_51
		return v_u_8(p54:render(("%*-%*"):format(p_u_52, p_u_51.startingIndex + p55 - 1), p55), p54:getWidth(), p55)
	end)
	return v_u_3.createElement(p_u_51.WrapperElement, v_u_4.join(p_u_51.wrapperElementProps, {
		["id"] = p_u_52,
		["LayoutOrder"] = p53
	}), v56)
end
return v_u_9