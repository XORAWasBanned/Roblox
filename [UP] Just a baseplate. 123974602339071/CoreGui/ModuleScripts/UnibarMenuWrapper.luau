-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.UnibarMenuWrapper
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.ReactUtils)
local v_u_4 = require(v2.Packages.React)
local v_u_5 = require(v1.Unibar.UnibarMenu)
local v_u_6 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v_u_7 = require(v1.Unibar.Tooltips.TooltipProvider)
local v_u_8 = require(v2.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local v_u_9 = require(v2.Workspace.Packages.UniversalAppPolicy).AppFeaturePolicies
local v_u_10 = require(v1.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
return function(p11) -- name: UnibarMenuWrapper
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10, (copy) v_u_6, (copy) v_u_5
	local v12 = v_u_4.createElement
	local v13 = v_u_3.ContextStack
	local v14 = {}
	local v15 = {}
	local v16 = {
		["policy"] = { v_u_9 }
	}
	local v17 = v_u_4.createElement(v_u_8.Provider, v16)
	local v18 = v_u_4.createElement(v_u_7)
	local v19
	if v_u_10 then
		v19 = v_u_4.createElement(v_u_6.Provider)
	else
		v19 = nil
	end
	__set_list(v15, 1, {v17, v18, v19})
	v14.providers = v15
	return v12(v13, v14, {
		["UnibarMenu"] = v_u_4.createElement(v_u_5, p11)
	})
end