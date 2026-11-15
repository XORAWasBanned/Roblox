-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.NavigateUp
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Actions.SetCurrentPage)
local v_u_3 = require(v1.Components.Pages)
return function(p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = p4:getState()
	p4:dispatch(v_u_2(v_u_3.pagesByKey[v5.menuPage].parentPage))
end