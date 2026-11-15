-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioWidgets.WidgetsProvider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Flags)
require(v1.Utility.Plugin.StudioUri)
local v_u_5 = require(v1.Providers.Plugin.usePlugin)
local v_u_6 = require(script.Parent.WidgetManager)
local v_u_7 = require(script.Parent.WidgetsContext)
require(script.Parent.Types)
return function(p8) -- name: WidgetsProvider
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_7
	local v_u_9 = v_u_5()
	if v_u_9 == nil then
		error("WidgetsProvider must be used within a Plugin context")
	end
	local v_u_10 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_9
		return v_u_6.new(v_u_9:GetPluginComponent("Widgets"))
	end, { v_u_9 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_10
		return function()
			-- upvalues: (ref) v_u_10
			v_u_10:destroy()
		end
	end, { v_u_10 })
	local v_u_13 = v_u_3.useCallback(function(p11, p12)
		-- upvalues: (copy) v_u_10
		v_u_10:register(p11, p12)
	end, { v_u_10 })
	local v_u_16 = v_u_3.useCallback(function(p14, p15)
		-- upvalues: (copy) v_u_10
		v_u_10:deregister(p14, p15)
	end, { v_u_10 })
	local v_u_17
	if v_u_4.FoundationPopoverPluginAnchorRefresh then
		v_u_17 = v_u_3.useCallback(function(p18)
			-- upvalues: (copy) v_u_10
			return v_u_10:refreshAsync(p18)
		end, { v_u_10 })
	else
		v_u_17 = nil
	end
	local v_u_19 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_10
		return v_u_10:nextId()
	end, { v_u_10 })
	local v22 = {
		["value"] = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_13, (copy) v_u_16, (ref) v_u_4, (copy) v_u_17, (copy) v_u_19
			local v20 = {
				["register"] = v_u_13,
				["deregister"] = v_u_16
			}
			local v21
			if v_u_4.FoundationPopoverPluginAnchorRefresh then
				v21 = v_u_17
			else
				v21 = nil
			end
			v20.refreshAsync = v21
			v20.nextId = v_u_19
			return v20
		end, {
			v_u_13,
			v_u_16,
			v_u_17,
			v_u_19
		})
	}
	return v_u_3.createElement(v_u_7.Provider, v22, p8.children)
end