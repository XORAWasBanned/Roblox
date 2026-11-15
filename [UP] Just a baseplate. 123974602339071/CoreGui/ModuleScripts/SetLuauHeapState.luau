-- Path: CoreGui.RobloxGui.Modules.DevConsole.Actions.SetLuauHeapState
local v1 = require(script.Parent.Parent.Action)
require(script.Parent.Parent.Components.LuauHeap.LuauHeapTypes)
return v1(script.Name, function(p2, p3)
	return {
		["isClientState"] = p2,
		["sessionState"] = p3
	}
end)