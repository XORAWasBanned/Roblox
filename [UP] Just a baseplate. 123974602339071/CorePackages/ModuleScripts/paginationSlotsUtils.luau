-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.paginationSlotsUtils
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.PaginationDirection)
local v_u_3 = {
	[v_u_2.First] = "first",
	[v_u_2.Backward] = "back",
	[v_u_2.Forward] = "forward",
	[v_u_2.Last] = "last"
}
return {
	["NAV_SLOT_IDS"] = v_u_3,
	["getPageSlotId"] = function(p4) -- name: getPageSlotId
		return ("page-%*"):format(p4)
	end,
	["getPaginationSelectableSlotOrder"] = function(p5) -- name: getPaginationSelectableSlotOrder
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v6 = {}
		if p5.hasFirstLastButtons and not p5.isFirstDisabled then
			local v7 = v_u_3[v_u_2.First]
			table.insert(v6, v7)
		end
		if not p5.isBackDisabled then
			local v8 = v_u_3[v_u_2.Backward]
			table.insert(v6, v8)
		end
		if p5.pageSlots then
			for _, v9 in p5.pageSlots do
				if v9 == "ellipsis" or v9 == p5.currentPage then
					continue
				end
				local v10 = ("page-%*"):format(v9)
				table.insert(v6, v10)
			end
		end
		if not p5.isForwardDisabled then
			local v11 = v_u_3[v_u_2.Forward]
			table.insert(v6, v11)
		end
		if p5.hasFirstLastButtons and not p5.isLastDisabled then
			local v12 = v_u_3[v_u_2.Last]
			table.insert(v6, v12)
		end
		return v6
	end,
	["getVisiblePageSlots"] = function(p13, p14) -- name: getVisiblePageSlots
		if p14 <= 7 then
			local v15 = {}
			for v16 = 1, p14 do
				table.insert(v15, v16)
			end
			return v15
		end
		local v17 = {}
		if p13 > 4 then
			if p14 - 4 + 1 <= p13 then
				table.insert(v17, 1)
				table.insert(v17, "ellipsis")
				for v18 = p14 - 4, p14 do
					table.insert(v17, v18)
				end
				return v17
			end
			table.insert(v17, 1)
			table.insert(v17, "ellipsis")
			for v19 = p13 - 1, p13 + 1 do
				table.insert(v17, v19)
			end
			table.insert(v17, "ellipsis")
			table.insert(v17, p14)
			return v17
		end
		table.insert(v17, 1)
		table.insert(v17, 2)
		table.insert(v17, 3)
		table.insert(v17, 4)
		table.insert(v17, 5)
		table.insert(v17, "ellipsis")
		table.insert(v17, p14)
		return v17
	end
}