-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMarkComplianceParser.PostProcessTokens
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = require(script.Parent.EmphasisParser)
local v_u_3 = require(v1.Parent.MarkdownCore).Flags
return ({
	["postProcessTokens"] = function(p4) -- name: postProcessTokens
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v5 = false
		local v6 = 1
		local v7 = {}
		for v8 = 1, #p4 do
			local v9 = p4[v8]
			local v10
			if v5 then
				v10 = v9.name == "TABLE_DIVIDER"
			else
				v10 = v5
			end
			if v_u_3.FFlagMarkdownTables and v9.isBlock then
				v5 = v9.name == "TABLE_ROW"
			end
			if not v9.isBlock and (v9.name ~= "LINE_BREAK" and not v10) then
				continue
			end
			if v6 < v8 then
				for _, v11 in v_u_2.processEmphasisRun(p4, v6, v8 - 1) do
					table.insert(v7, v11)
				end
			end
			table.insert(v7, v9)
			v6 = v8 + 1
		end
		if v6 <= #p4 then
			for _, v12 in v_u_2.processEmphasisRun(p4, v6, #p4) do
				table.insert(v7, v12)
			end
		end
		return v7
	end
}).postProcessTokens