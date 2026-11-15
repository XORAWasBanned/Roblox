-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.Children
local v1 = script:FindFirstAncestor("Markdown").Parent
require(v1.CommonMark)
require(script.Parent.Registry)
return {
	["units"] = function(p2, p3, p4) -- name: units
		local v5 = {}
		local v6 = nil
		local v7 = { p2:getFirstChild() }
		local v8 = v6
		local v9 = 1
		while v9 > 0 do
			local v10 = v7[v9]
			if v10 == nil then
				v7[v9] = nil
				v9 = v9 - 1
				if v8 == nil then
					continue
				end
				table.insert(v5, {
					["inlines"] = v8
				})
				v6 = nil
				v8 = v6
			else
				v7[v9] = v10:getNext()
				if v10.isBlock then
					local v11 = p4 and v10.kind == "ListItem" and "handler" or (p3.block[v10.kind] or p3.unknownBlock).form
					if v11 == "drop" then
						continue
					end
					if v11 == "children" then
						if v8 ~= nil then
							table.insert(v5, {
								["inlines"] = v8
							})
							v6 = nil
							v8 = v6
						end
						v9 = v9 + 1
						v7[v9] = v10:getFirstChild()
					else
						if v8 ~= nil then
							table.insert(v5, {
								["inlines"] = v8
							})
							v6 = nil
							v8 = v6
						end
						table.insert(v5, {
							["block"] = v10
						})
					end
				elseif v8 == nil then
					v6 = { v10 }
					v8 = v6
				else
					table.insert(v8, v10)
				end
			end
		end
		return v5
	end,
	["isList"] = function(p12) -- name: isList
		local v13 = p12.block
		local v14
		if v13 == nil then
			v14 = false
		else
			v14 = v13.kind == "BulletList" and true or v13.kind == "OrderedList"
		end
		return v14
	end,
	["isParagraphLike"] = function(p15) -- name: isParagraphLike
		local v16 = p15.block
		return v16 == nil and true or v16.kind == "Paragraph"
	end
}