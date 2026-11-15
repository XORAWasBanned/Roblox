-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dropdown.markSelectedItem
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.BaseMenu)
require(v1.Components.Types)
local function v_u_11(p2, p3) -- name: markSelectedItem
	-- upvalues: (copy) v_u_11
	if p3 == nil then
		return p2, nil
	end
	local v4 = {}
	local v5 = nil
	for _, v7 in p2 do
		if v7.id then
			if v7.id == p3 then
				local v7 = table.clone(v7)
				v7.isChecked = true
				v5 = v7
			end
			table.insert(v4, v7)
		else
			if not v7.items then
				continue
			end
			local v8, v9 = v_u_11(v7.items, p3)
			local v10 = {
				["title"] = v7.title,
				["items"] = v8
			}
			table.insert(v4, v10)
			v5 = v5 or v9
		end
	end
	return v4, v5
end
return v_u_11