-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.Passes
local v1 = script:FindFirstAncestor("Markdown")
require(script.Parent.Registry)
local v_u_2 = require(script.Parent.RendererNodes)
require(v1.Types)
local v_u_3 = table.freeze({
	["QUOTE"] = true
})
return {
	["isDroppable"] = function(p4) -- name: isDroppable
		-- upvalues: (copy) v_u_3
		return v_u_3[p4] == true
	end,
	["finish"] = function(p5, p6, p7) -- name: finish
		-- upvalues: (copy) v_u_2
		for v8, v9 in p5 do
			v8.text = table.concat(v9)
		end
		if p7.dropEmpty then
			local v10 = {}
			local v11 = {}
			for v12, v13 in p6 do
				if #v12.children ~= 0 then
					continue
				end
				v10[v12] = true
				v11[v13] = true
			end
			for v14 in v11 do
				local v15 = v14.children
				local v16 = 0
				for v17 = 1, #v15 do
					local v18 = v15[v17]
					if v10[v18] then
						continue
					end
					v16 = v16 + 1
					v15[v16] = v18
					v18.index = v16
					v18.offset = v_u_2.offsetAt(v14, v18, v16)
				end
				for v19 = #v15, v16 + 1, -1 do
					v15[v19] = nil
				end
			end
		end
	end
}