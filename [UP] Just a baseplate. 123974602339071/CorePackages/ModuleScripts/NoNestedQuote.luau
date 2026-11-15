-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.NoNestedQuote
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.CommonMark).Internal.BlockQuoteParser.Factory.new()
local v3 = {}
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new() -- name: new
	-- upvalues: (copy) v_u_4
	local v5 = v_u_4
	return setmetatable({}, v5)
end
function v_u_4.tryStart(_, p6, p7) -- name: tryStart
	-- upvalues: (copy) v_u_2
	local v8 = v_u_2:tryStart(p6, p7)
	if v8 ~= nil then
		local v9 = p7:getMatchedBlockParser():getBlock()
		while true do
			local v10
			if v9 == nil then
				v10 = false
				break
			end
			if v9.kind == "BlockQuote" then
				v10 = true
				break
			end
			v9 = v9:getParent()
		end
		if not v10 then
			return v8
		end
	end
	return nil
end
v3.Factory = v_u_4
function v3.extension() -- name: extension
	-- upvalues: (copy) v_u_4
	return {
		["extendParser"] = function(p11) -- name: extendParser
			-- upvalues: (ref) v_u_4
			p11:customBlockParserFactory(v_u_4.new())
		end
	}
end
return v3