-- Path: CoreGui.RobloxGui.Modules.InGameWhatsNew.createInGameScopeActions
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.WhatsNew)
local v_u_3 = require(v1.Workspace.Packages.InExperienceSideSheet)
return function() -- name: createInGameScopeActions
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v_u_4 = v_u_3.toggleSideSheet
	local v5 = v_u_2.scopeActions.createScopeActions()
	v5:register("OpenTiltMenu", function()
		-- upvalues: (copy) v_u_4
		v_u_4(true)
	end)
	v5:register("CloseTiltMenu", function()
		-- upvalues: (copy) v_u_4
		v_u_4(false)
	end)
	v5:bindOpenState({
		["openActionKey"] = "OpenTiltMenu",
		["closeActionKey"] = "CloseTiltMenu",
		["getIsOpen"] = nil,
		["getIsOpen"] = v_u_3.getSideSheetVisibility
	})
	return v5
end