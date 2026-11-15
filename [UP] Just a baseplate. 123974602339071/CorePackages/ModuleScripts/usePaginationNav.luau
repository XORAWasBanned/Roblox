-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.usePaginationNav
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Enums.PaginationDirection)
require(v1.Enums.PaginationSize)
local v_u_5 = require(v1.Utility.withCommonProps)
local v_u_6 = require(script.Parent.Nav.NavPaginationLayout)
local v_u_7 = require(script.Parent.paginationSlotsUtils)
local v_u_8 = require(script.Parent.usePaginationSelectionChain)
local function v_u_12(p_u_9, p10) -- name: useNavCallbacks
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return {
		["onDirectionActivated"] = v_u_3.useCallback(function(p11)
			-- upvalues: (ref) v_u_4, (copy) p_u_9
			if p11 == v_u_4.First then
				p_u_9.onActivated(1)
			elseif p11 == v_u_4.Last then
				if p_u_9.count ~= nil then
					p_u_9.onActivated(p_u_9.count)
					return
				end
			else
				if p11 == v_u_4.Backward then
					p_u_9.onActivated(p_u_9.page - 1)
					return
				end
				p_u_9.onActivated(p_u_9.page + 1)
			end
		end, { p_u_9.count, p_u_9.onActivated, p_u_9.page }),
		["isFirstDisabled"] = p10.isFirstDisabled or p10.isBackDisabled
	}
end
return function(p_u_13, p_u_14, p15) -- name: usePaginationNav
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_12, (copy) v_u_6, (copy) v_u_5
	local v_u_16 = p_u_14.disabledState
	local v_u_17 = v_u_8(v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_14, (copy) v_u_16
		return v_u_7.getPaginationSelectableSlotOrder({
			["hasFirstLastButtons"] = p_u_14.hasFirstLastButtons,
			["isFirstDisabled"] = v_u_16.isFirstDisabled,
			["isBackDisabled"] = v_u_16.isBackDisabled,
			["isForwardDisabled"] = v_u_16.isForwardDisabled,
			["isLastDisabled"] = v_u_16.isLastDisabled,
			["pageSlots"] = p_u_14.pageSlots,
			["currentPage"] = p_u_14.currentPage
		})
	end, {
		p_u_14.hasFirstLastButtons,
		p_u_14.currentPage,
		p_u_14.pageSlots,
		v_u_16.isBackDisabled,
		v_u_16.isFirstDisabled,
		v_u_16.isForwardDisabled,
		v_u_16.isLastDisabled
	}), {
		["NextSelectionUp"] = p_u_13.NextSelectionUp,
		["NextSelectionDown"] = p_u_13.NextSelectionDown
	}, p15)
	local v_u_18 = v_u_12(p_u_13, {
		["isBackDisabled"] = v_u_16.isBackDisabled,
		["isFirstDisabled"] = v_u_16.isFirstDisabled
	})
	return {
		["selection"] = v_u_17,
		["createLayout"] = v_u_3.useCallback(function(p19, p20)
			-- upvalues: (ref) v_u_3, (ref) v_u_6, (copy) p_u_13, (copy) v_u_16, (copy) v_u_18, (copy) v_u_17, (copy) p_u_14, (ref) v_u_5
			local v21 = v_u_3.createElement
			local v22 = v_u_6
			local v23 = v_u_5(p_u_13, {
				["pageContent"] = p19,
				["size"] = p_u_13.size,
				["isBackDisabled"] = v_u_16.isBackDisabled,
				["isFirstDisabled"] = v_u_18.isFirstDisabled,
				["isForwardDisabled"] = v_u_16.isForwardDisabled,
				["isLastDisabled"] = v_u_16.isLastDisabled,
				["onDirectionActivated"] = v_u_18.onDirectionActivated,
				["selection"] = v_u_17,
				["hasFirstLastButtons"] = p_u_14.hasFirstLastButtons,
				["testId"] = p_u_13.testId
			})
			v23.ref = p20
			return v21(v22, v23)
		end, {
			p_u_14.hasFirstLastButtons,
			v_u_16.isBackDisabled,
			v_u_16.isForwardDisabled,
			v_u_16.isLastDisabled,
			v_u_18.isFirstDisabled,
			v_u_18.onDirectionActivated,
			p_u_13,
			v_u_17
		})
	}
end