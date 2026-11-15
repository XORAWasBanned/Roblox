-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.util.LinkScanner
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.beta.Scanner)
local v2 = string.byte
local v_u_3 = {}
for v4 = 1, 32 do
	v_u_3[v2("!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~", v4)] = true
end
local v_u_7 = {
	["scanLinkLabelContent"] = function(p5) -- name: scanLinkLabelContent
		-- upvalues: (copy) v_u_3
		while p5:hasNext() do
			local v6 = p5:peek()
			if v6 == 92 then
				p5:next()
				if v_u_3[p5:peek()] ~= true then
					continue
				end
				p5:next()
			else
				if v6 == 93 then
					return true
				end
				if v6 == 91 then
					return false
				end
				p5:next()
			end
		end
		return true
	end
}
local function v_u_12(p8) -- name: scanLinkDestinationWithBalancedParens
	-- upvalues: (copy) v_u_3
	local v9 = true
	local v10 = 0
	while p8:hasNext() do
		local v11 = p8:peek()
		if v11 == 32 then
			return not v9
		end
		if v11 == 92 then
			p8:next()
			if v_u_3[p8:peek()] == true then
				p8:next()
			end
		elseif v11 == 40 then
			v10 = v10 + 1
			if v10 > 32 then
				return false
			end
			p8:next()
		elseif v11 == 41 then
			if v10 == 0 then
				return true
			end
			v10 = v10 - 1
			p8:next()
		else
			if v11 < 32 or v11 == 127 then
				return not v9
			end
			p8:next()
		end
		v9 = false
	end
	return true
end
function v_u_7.scanLinkDestination(p13) -- name: scanLinkDestination
	-- upvalues: (copy) v_u_3, (copy) v_u_12
	if not p13:hasNext() then
		return false
	end
	if not p13:nextChar(60) then
		return v_u_12(p13)
	end
	while p13:hasNext() do
		local v14 = p13:peek()
		if v14 == 92 then
			p13:next()
			if v_u_3[p13:peek()] ~= true then
				continue
			end
			p13:next()
		else
			if v14 == 10 or v14 == 60 then
				return false
			end
			if v14 == 62 then
				p13:next()
				return true
			end
			p13:next()
		end
	end
	return false
end
function v_u_7.scanLinkTitle(p15) -- name: scanLinkTitle
	-- upvalues: (copy) v_u_7
	if not p15:hasNext() then
		return false
	end
	local v16 = p15:peek()
	local v17
	if v16 == 34 then
		v17 = 34
	elseif v16 == 39 then
		v17 = 39
	else
		if v16 ~= 40 then
			return false
		end
		v17 = 41
	end
	p15:next()
	if not v_u_7.scanLinkTitleContent(p15, v17) then
		return false
	end
	if not p15:hasNext() then
		return false
	end
	p15:next()
	return true
end
function v_u_7.scanLinkTitleContent(p18, p19) -- name: scanLinkTitleContent
	-- upvalues: (copy) v_u_3
	while p18:hasNext() do
		local v20 = p18:peek()
		if v20 == 92 then
			p18:next()
			if v_u_3[p18:peek()] ~= true then
				continue
			end
			p18:next()
		else
			if v20 == p19 then
				return true
			end
			if p19 == 41 and v20 == 40 then
				return false
			end
			p18:next()
		end
	end
	return true
end
return v_u_7