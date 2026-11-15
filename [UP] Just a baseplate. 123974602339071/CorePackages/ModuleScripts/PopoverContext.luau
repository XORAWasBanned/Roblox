-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Popover.PopoverContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Utility.Logger)
local v4 = require(v2.React)
require(v1.Utility.Plugin.StudioUri)
require(v1.Components.Types)
return v4.createContext({
	["anchor"] = nil,
	["setAnchor"] = nil,
	["anchorUri"] = nil,
	["setAnchorUri"] = nil,
	["isOpen"] = false,
	["testId"] = "",
	["setAnchor"] = function(_) -- name: setAnchor
		-- upvalues: (copy) v_u_3
		v_u_3:warning("No PopoverProvider found for Popover")
	end,
	["setAnchorUri"] = function(_) -- name: setAnchorUri
		-- upvalues: (copy) v_u_3
		v_u_3:warning("No PopoverProvider found for Popover")
	end
})