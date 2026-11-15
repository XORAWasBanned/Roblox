-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Analytics.OcclusionMetricsManager
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = require(v2.Packages.React)
local v5 = require(v2.Workspace.Packages.RoactUtils)
local v_u_6 = require(v2.Packages.Signals)
local v_u_7 = v5.Hooks.RoactRodux.useSelector
local v_u_8 = require(v1.Unibar.Constants)
local v_u_9 = require(v2.Workspace.Packages.CoreGuiCommon)
local v_u_10 = v_u_9.Flags.FFlagTopBarSignalizeKeepOutAreas
local v_u_11 = require(v2.Workspace.Packages.SharedFlags).GetFIntLuaUIOcclusionMetricsReportingPeriodSeconds()
local v_u_12 = game:GetEngineFeature("GuiServiceSendUIOcclusionMetricsForQueryRegion")
return function() -- name: OcclusionMetricsManager
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_11
	if v_u_12 then
		local v_u_13 = nil
		local v_u_14 = v_u_4.useRef({
			["id"] = v_u_8.UNIBAR_KEEP_OUT_AREA_ID,
			["position"] = Vector2.new(),
			["size"] = Vector2.new()
		})
		if v_u_10 then
			local v_u_15 = v_u_9.Stores.GetKeepOutAreasStore(false)
			v_u_13 = v_u_6.createEffect(function(_)
				-- upvalues: (copy) v_u_14, (copy) v_u_15, (ref) v_u_8
				v_u_14.current = v_u_15.getKeepOutAreas(false)[v_u_8.UNIBAR_KEEP_OUT_AREA_ID]
			end)
		else
			local v_u_17 = v_u_7(function(p16)
				-- upvalues: (ref) v_u_8
				return p16.displayOptions.keepOutAreas[v_u_8.UNIBAR_KEEP_OUT_AREA_ID]
			end)
			v_u_4.useEffect(function()
				-- upvalues: (copy) v_u_14, (copy) v_u_17
				v_u_14.current = v_u_17
			end, { v_u_17 })
		end
		v_u_4.useEffect(function()
			-- upvalues: (copy) v_u_14, (ref) v_u_3, (ref) v_u_11, (ref) v_u_10, (ref) v_u_13
			local v_u_23 = task.spawn(function()
				-- upvalues: (ref) v_u_14, (ref) v_u_3, (ref) v_u_11
				while true do
					if v_u_14.current then
						local v18 = v_u_14.current
						local v19 = v18.position + v_u_3:GetGuiInset()
						local v20 = v_u_3
						local v21 = UDim2.fromOffset(v19.X, v19.Y)
						local v22 = v18.size
						v20:SendUIOcclusionMetricsForQueryRegion(v21, UDim2.fromOffset(v22.X, v22.Y), "currentSizeTR")
					end
					task.wait(v_u_11)
				end
			end)
			return function()
				-- upvalues: (copy) v_u_23, (ref) v_u_10, (ref) v_u_13
				task.cancel(v_u_23)
				if v_u_10 then
					v_u_13()
				end
			end
		end, {})
	end
end