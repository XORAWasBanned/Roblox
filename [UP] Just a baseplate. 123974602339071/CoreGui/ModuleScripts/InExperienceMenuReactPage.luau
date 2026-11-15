-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.InExperienceMenuReactPage
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.EnumReactPage)
local v_u_7 = require(v5.Components.PortalWithFoundationStylelink)
local v_u_8 = require(v5.ReactPageSignal)
local v_u_9 = require(v5.Components.Traversal).TraversalHistoryPage
return v_u_3.memo(v_u_3.forwardRef(function(p_u_10, _) -- name: InExperienceMenuReactPage
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_9, (copy) v_u_2, (copy) v_u_7
	local v11 = v_u_8(false)
	local v_u_12 = v_u_4.useSignalState(v11.currentReactPage)
	local v13
	if v_u_12 == v_u_6.TraversalHistory then
		v13 = v_u_3.createElement(v_u_9)
	else
		v13 = nil
	end
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_12, (copy) p_u_10
		if v_u_12 then
			p_u_10.onMount()
			return p_u_10.onUnmount
		end
	end, { v_u_12 })
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_10
		local v_u_15 = v_u_2:connect(function(p14)
			-- upvalues: (ref) p_u_10
			if not p14 then
				p_u_10.onUnmount()
			end
		end)
		return function()
			-- upvalues: (copy) v_u_15
			v_u_15:Disconnect()
		end
	end, {})
	return v_u_3.createElement(v_u_7, {
		["parent"] = p_u_10.mountTo
	}, {
		["Page"] = v13
	})
end))