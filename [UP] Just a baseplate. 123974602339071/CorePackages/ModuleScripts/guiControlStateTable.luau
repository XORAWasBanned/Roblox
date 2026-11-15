-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Control.guiControlStateTable
local v1 = script:FindFirstAncestor("Foundation")
local v2 = script.Parent
local v3 = require(v1.Enums.ControlState)
require(v1.Enums.ControlStateEvent)
require(v2.StateTable.StateTable)
local v4 = {}
local v5 = {
	["Idle"] = {
		["nextState"] = v3.Default
	},
	["Enabled"] = {
		["nextState"] = v3.Default
	},
	["Disabled"] = {
		["nextState"] = v3.Disabled
	}
}
v4.Initialize = v5
local v6 = {
	["PrimaryPressed"] = {
		["nextState"] = v3.Pressed
	},
	["PointerHover"] = {
		["nextState"] = v3.Hover
	},
	["SelectionGained"] = {
		["nextState"] = v3.Selected
	},
	["Disabled"] = {
		["nextState"] = v3.Disabled
	}
}
v4.Default = v6
local v7 = {
	["SelectionGained"] = {
		["nextState"] = v3.Selected
	},
	["PrimaryPressed"] = {
		["nextState"] = v3.Pressed
	},
	["PointerHoverEnd"] = {
		["nextState"] = v3.Default
	},
	["Disabled"] = {
		["nextState"] = v3.Disabled
	}
}
v4.Hover = v7
local v8 = {
	["SelectionGained"] = {
		["nextState"] = v3.SelectedPressed
	},
	["PrimaryReleasedHover"] = {
		["nextState"] = v3.Hover
	},
	["PrimaryReleased"] = {
		["nextState"] = v3.Default
	},
	["Disabled"] = {
		["nextState"] = v3.Disabled
	}
}
v4.Pressed = v8
local v9 = {
	["SelectionLost"] = {
		["nextState"] = v3.Default
	},
	["PrimaryPressed"] = {
		["nextState"] = v3.SelectedPressed
	},
	["Disabled"] = {
		["nextState"] = v3.Disabled
	}
}
v4.Selected = v9
local v10 = {
	["SelectionLost"] = {
		["nextState"] = v3.Default
	},
	["PrimaryReleasedHover"] = {
		["nextState"] = v3.Selected
	},
	["PrimaryReleased"] = {
		["nextState"] = v3.Selected
	},
	["Disabled"] = {
		["nextState"] = v3.Disabled
	}
}
v4.SelectedPressed = v10
local v11 = {
	["Enabled"] = {
		["nextState"] = v3.Default
	}
}
v4.Disabled = v11
return v4