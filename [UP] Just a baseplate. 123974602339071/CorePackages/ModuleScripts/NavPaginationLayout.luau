-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Pagination.Nav.NavPaginationLayout
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Components.View)
require(v1.Enums.PaginationDirection)
require(v1.Enums.PaginationSize)
local v_u_5 = require(v1.Utility.withCommonProps)
local v_u_6 = require(script.Parent.NavControls)
require(script.Parent.Parent.usePaginationSelectionChain)
return v_u_3.memo(v_u_3.forwardRef(function(p7, p8) -- name: NavPaginationLayout
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
	local v9 = v_u_3.createElement
	local v10 = v_u_4
	local v11 = v_u_5(p7, {
		["tag"] = "row align-y-center gap-small auto-xy",
		["ref"] = nil,
		["ref"] = p8
	})
	local v12 = {
		["LeftNav"] = v_u_3.createElement(v_u_6, {
			["side"] = "start",
			["size"] = nil,
			["LayoutOrder"] = 1,
			["isFirstDisabled"] = nil,
			["isBackDisabled"] = nil,
			["isForwardDisabled"] = nil,
			["isLastDisabled"] = nil,
			["onDirectionActivated"] = nil,
			["hasFirstLastButtons"] = nil,
			["testId"] = nil,
			["selection"] = nil,
			["size"] = p7.size,
			["isFirstDisabled"] = p7.isFirstDisabled,
			["isBackDisabled"] = p7.isBackDisabled,
			["isForwardDisabled"] = p7.isForwardDisabled,
			["isLastDisabled"] = p7.isLastDisabled,
			["onDirectionActivated"] = p7.onDirectionActivated,
			["hasFirstLastButtons"] = p7.hasFirstLastButtons,
			["testId"] = p7.testId,
			["selection"] = p7.selection
		}),
		["PageContent"] = p7.pageContent,
		["RightNav"] = v_u_3.createElement(v_u_6, {
			["side"] = "end",
			["size"] = nil,
			["LayoutOrder"] = nil,
			["isFirstDisabled"] = nil,
			["isBackDisabled"] = nil,
			["isForwardDisabled"] = nil,
			["isLastDisabled"] = nil,
			["onDirectionActivated"] = nil,
			["hasFirstLastButtons"] = nil,
			["testId"] = nil,
			["selection"] = nil,
			["size"] = p7.size,
			["LayoutOrder"] = p7.pageContent and 3 or 2,
			["isFirstDisabled"] = p7.isFirstDisabled,
			["isBackDisabled"] = p7.isBackDisabled,
			["isForwardDisabled"] = p7.isForwardDisabled,
			["isLastDisabled"] = p7.isLastDisabled,
			["onDirectionActivated"] = p7.onDirectionActivated,
			["hasFirstLastButtons"] = p7.hasFirstLastButtons,
			["testId"] = p7.testId,
			["selection"] = p7.selection
		})
	}
	return v9(v10, v11, v12)
end))