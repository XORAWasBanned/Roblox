-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.ext.gfm.strikethrough.StrikethroughExtension
local v_u_1 = script:FindFirstAncestor("CommonMark")
require(v_u_1.Extension)
local v_u_2 = require(v_u_1.ext.gfm.strikethrough.internal.StrikethroughDelimiterProcessor)
local v_u_3 = {}
local v_u_4 = {}
v_u_4.__index = v_u_4
local function v_u_11(p5) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v_u_6 = p5._requireTwoTildes
	return {
		["extendParser"] = function(p7) -- name: extendParser
			-- upvalues: (ref) v_u_2, (copy) v_u_6
			p7:customDelimiterProcessor(v_u_2.new(v_u_6))
		end,
		["extendHtmlRenderer"] = function(p8) -- name: extendHtmlRenderer
			-- upvalues: (ref) v_u_1
			local v_u_9 = require(v_u_1.ext.gfm.strikethrough.internal.StrikethroughHtmlNodeRenderer)
			p8:nodeRendererFactory({
				["create"] = function(_, p10) -- name: create
					-- upvalues: (copy) v_u_9
					return v_u_9.new(p10)
				end
			})
		end
	}
end
function v_u_3.create() -- name: create
	-- upvalues: (copy) v_u_3
	return v_u_3.builder():build()
end
function v_u_3.builder() -- name: builder
	-- upvalues: (copy) v_u_4
	return v_u_4.new()
end
function v_u_4.new() -- name: new
	-- upvalues: (copy) v_u_4
	local v12 = v_u_4
	return setmetatable({
		["_requireTwoTildes"] = false
	}, v12)
end
function v_u_4.requireTwoTildes(p13, p14) -- name: requireTwoTildes
	p13._requireTwoTildes = p14
	return p13
end
function v_u_4.build(p15) -- name: build
	-- upvalues: (copy) v_u_11
	return v_u_11(p15)
end
v_u_3.Builder = v_u_4
return v_u_3