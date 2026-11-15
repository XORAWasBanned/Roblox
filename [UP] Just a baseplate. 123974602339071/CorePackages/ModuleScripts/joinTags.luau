-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.joinTags
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.Dash).forEachArgs
local v_u_3 = table.concat
return function(...) -- name: joinTags
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_4 = {}
	v_u_2(function(p5)
		-- upvalues: (copy) v_u_4
		if typeof(p5) == "string" then
			local v6 = v_u_4
			table.insert(v6, p5)
		elseif typeof(p5) == "table" then
			for v7, v8 in p5 do
				if not v8 then
					continue
				end
				local v9 = v_u_4
				table.insert(v9, v7)
			end
		end
	end, ...)
	return v_u_3(v_u_4, " ")
end