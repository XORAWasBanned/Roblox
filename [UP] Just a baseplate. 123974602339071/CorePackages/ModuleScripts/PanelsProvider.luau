-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.StudioPanels.PanelsProvider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.Flags)
require(v1.Utility.Plugin.StudioUri)
local v_u_5 = require(v1.Providers.Plugin.usePlugin)
local v_u_6 = require(v1.Providers.StudioWidgets.useWidgetsContext)
local v_u_7 = require(script.Parent.PanelsContext)
local v_u_8 = require(script.Parent.Managers.PopoverManager)
require(script.Parent.Types)
return function(p_u_9) -- name: PanelsProvider
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7
	local v_u_10 = v_u_5()
	if v_u_10 == nil then
		error("PanelsProvider must be used within a plugin context")
	end
	local v_u_11
	if v_u_4.FoundationPopoverPluginAnchorRefresh then
		v_u_11 = v_u_6()
	else
		v_u_11 = nil
	end
	local v_u_12 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_8, (copy) v_u_10, (copy) p_u_9
		return v_u_8.new(v_u_10, p_u_9.uriScope)
	end, { v_u_10, p_u_9.uriScope })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_12
		local v_u_13 = task.spawn(function()
			-- upvalues: (ref) v_u_12
			v_u_12:prewarmPoolAsync(2)
		end)
		return function()
			-- upvalues: (copy) v_u_13, (ref) v_u_12
			if v_u_13 then
				task.cancel(v_u_13)
			end
			v_u_12:destroy()
		end
	end, { v_u_12 })
	local v_u_23 = v_u_3.useCallback(function(p14, p15, p16, p17, p18, p19)
		-- upvalues: (ref) v_u_4, (copy) v_u_11, (copy) v_u_12
		if v_u_4.FoundationPopoverPluginAnchorRefresh then
			v_u_11.refreshAsync(p14)
		end
		local v20 = v_u_12
		local v21 = {
			["targetWidgetUri"] = p14,
			["targetAnchorPoint"] = p15.targetAnchorPoint,
			["subjectAnchorPoint"] = p15.subjectAnchorPoint,
			["offset"] = p15.offset
		}
		if not v_u_4.FoundationPopoverPluginFocusable then
			p19 = nil
		end
		local v_u_22 = v20:openAtAsync(v21, p16, p17, p18, p19)
		return v_u_22, function()
			-- upvalues: (copy) v_u_22
			v_u_22.close()
		end
	end, { v_u_12, v_u_11 })
	local v24 = {
		["value"] = v_u_3.useMemo(function()
			-- upvalues: (copy) v_u_23
			return {
				["registerPopoverAsync"] = v_u_23
			}
		end, { v_u_23 })
	}
	return v_u_3.createElement(v_u_7.Provider, v24, p_u_9.children)
end