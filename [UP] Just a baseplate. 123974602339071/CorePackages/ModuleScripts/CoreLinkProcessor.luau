-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.CoreLinkProcessor
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.InlineParserContext)
require(v1.parser.beta.LinkInfo)
require(v1.parser.beta.LinkProcessor)
local v_u_2 = require(v1.parser.beta.LinkResult)
local v_u_3 = require(v1.node.Nodes)
require(v1.parser.beta.Scanner)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6) -- name: new
	-- upvalues: (copy) v_u_4
	local v7 = {
		["_linkEnabled"] = p5 ~= false,
		["_imageEnabled"] = p6 ~= false
	}
	local v8 = v_u_4
	return setmetatable(v7, v8)
end
local function v_u_15(p9, p10, p11, p12, p13) -- name: process
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v14 = p10:marker()
	if v14 == nil or (v14.literal ~= "!" or not p9._imageEnabled) then
		if p9._linkEnabled then
			return v_u_2.wrapTextIn(v_u_3.Link(p12, p13), p11:position())
		else
			return v_u_2.none()
		end
	else
		return v_u_2.wrapTextIn(v_u_3.Image(p12, p13), p11:position()):includeMarker()
	end
end
function v_u_4.process(p16, p17, p18, p19) -- name: process
	-- upvalues: (copy) v_u_15, (copy) v_u_2
	if p17:destination() == nil then
		local v20 = p17:label()
		if v20 == nil or v20 == "" then
			v20 = p17:text()
		end
		local v21 = p19:getDefinition("LinkReferenceDefinition", v20)
		if v21 == nil then
			return v_u_2.none()
		else
			return v_u_15(p16, p17, p18, v21.destination, v21.title)
		end
	else
		return v_u_15(p16, p17, p18, p17:destination(), p17:title())
	end
end
return v_u_4