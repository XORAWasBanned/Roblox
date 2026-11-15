-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.TraversalBackButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TeleportService")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v4 = require(v1.Packages.Foundation)
local v_u_5 = require(v1.Packages.React)
local v_u_6 = require(v1.Packages.ReactOtter)
local v_u_7 = require(v1.Packages.SignalsReact)
local v8 = require(v1.Workspace.Packages.CoreScriptsCommon)
local v9 = require(v1.Workspace.Packages.CoreScriptsRoactCommon)
local v10 = require(v1.Workspace.Packages.DataHydration)
local v11 = require(v1.Workspace.Packages.Localization)
local v_u_12 = v4.View
local v_u_13 = v4.Hooks.useTokens
local v_u_14 = v8.SettingsShowSignal
local v15 = v9.Traversal
local v_u_16 = v10.DataHydrationTypes
local v_u_17 = v10.Game.getGameInfoStore
local v_u_18 = v15.Constants
local v_u_19 = v15.TeleportBackButton
local v_u_20 = v15.TraversalTelemetry
local _ = v15.useHistoryItems
local v_u_21 = v11.Hooks.useLocalization
local _ = v15.Flags.FFlagUseTeleportTraversalHistory
local _ = v15.Flags.FFlagUseLocalTraversalHistory
local v_u_22 = v15.Flags.FFlagAddTraversalBackButtonAnimation
local v_u_23 = game:DefineFastFlag("FixTraversalBackButtonAnimation", false)
return v_u_5.memo(function(_) -- name: TraversalBackButton
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_2, (copy) v_u_18, (copy) v_u_14, (copy) v_u_20, (copy) v_u_21, (copy) v_u_17, (copy) v_u_16, (copy) v_u_7, (copy) v_u_23, (copy) v_u_22, (copy) v_u_6, (copy) v_u_3, (copy) v_u_12, (copy) v_u_19
	local v_u_24 = v_u_13()
	local v_u_25 = v_u_5.useRef(nil)
	local v_u_26, v27 = v_u_2:GetThirdPartyTeleportInfo(false)
	if v_u_26 <= v_u_18.NO_UNIVERSE_ID or v27 <= v_u_18.NO_PLACE_ID then
		return nil
	end
	local v_u_28, v_u_29 = v_u_5.useState(false)
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_14, (copy) v_u_29
		local v_u_31 = v_u_14:connect(function(p30)
			-- upvalues: (ref) v_u_29
			v_u_29(p30)
		end)
		return function()
			-- upvalues: (copy) v_u_31
			v_u_31:Disconnect()
		end
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_28, (ref) v_u_20, (copy) v_u_26
		if v_u_28 then
			local v32 = {
				["integration_id"] = "back_button",
				["destination_universe_id"] = nil,
				["event_type"] = "impression",
				["destination_universe_id"] = v_u_26
			}
			v_u_20.sendBackButtonActionEvent(v32)
		end
	end, { v_u_28, v_u_26 })
	local v_u_33 = v_u_21({
		["defaultBackButtonText"] = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local v34 = { v_u_26, v_u_17 }
	local v39 = v_u_5.useCallback(function(p35)
		-- upvalues: (ref) v_u_17, (copy) v_u_26, (ref) v_u_16, (copy) v_u_33
		local v36 = v_u_26
		local v37 = v_u_17(p35).getAndFetchGameInfo((tostring(v36)))
		local v38 = v37.data(p35)
		if v38 and v37.status(p35) == v_u_16.DataStatus.Ready then
			return v38.name
		else
			return v_u_33.defaultBackButtonText
		end
	end, v34)
	local v_u_40 = v_u_7.useSignalState(v39)
	local v_u_41
	if v_u_23 then
		v_u_41 = v_u_5.useRef(nil)
	else
		v_u_41 = nil
	end
	local v_u_42 = v_u_24.Size.Size_2500 * 2
	local v_u_43 = nil
	local v44, v45, v46
	if v_u_22 then
		local v_u_47 = v_u_5.useRef(nil)
		local v_u_48 = v_u_5.useRef(nil)
		if v_u_23 then
			v_u_43 = v_u_5.useRef(nil)
		end
		local v_u_49 = v_u_5.useMemo(function()
			-- upvalues: (copy) v_u_24
			return {
				["duration"] = v_u_24.Time.Time_300,
				["easingStyle"] = v_u_24.Ease.StandardOut
			}
		end, { v_u_24 })
		local v50
		v44, v50 = v_u_6.useAnimatedBinding(0, function(p51)
			-- upvalues: (ref) v_u_47, (ref) v_u_23, (ref) v_u_43, (ref) v_u_48
			v_u_47.current = nil
			if v_u_23 then
				if not v_u_43.current and (v_u_48.current and p51 == 1) then
					v_u_43.current = v_u_48.current
				end
				if p51 == 0 then
					v_u_48.current = 0
					return
				end
			else
				v_u_48.current = nil
			end
		end)
		local v_u_52 = v50
		v_u_5.useEffect(function()
			-- upvalues: (copy) v_u_28, (ref) v_u_23, (ref) v_u_41, (copy) v_u_40, (ref) v_u_43, (copy) v_u_25, (ref) v_u_52, (ref) v_u_6, (copy) v_u_49
			if v_u_28 then
				if v_u_23 then
					if v_u_41.current == v_u_40 then
						v_u_52(v_u_6.ease(1, v_u_49))
					else
						v_u_43.current = nil
						v_u_41.current = v_u_40
						if v_u_25.current then
							v_u_52(v_u_6.ease(0.99, v_u_49))
						end
					end
				else
					v_u_52(v_u_6.ease(1, v_u_49))
				end
			else
				v_u_52(v_u_6.ease(0, v_u_49))
			end
			if v_u_23 and v_u_41.current == nil then
				v_u_41.current = v_u_40
			end
		end, { v_u_28, v_u_49, v_u_40 })
		v45 = v_u_5.useCallback(function(p53)
			-- upvalues: (ref) v_u_23, (ref) v_u_43, (copy) v_u_28, (copy) v_u_25, (ref) v_u_47, (ref) v_u_48, (copy) v_u_42
			if v_u_23 then
				if v_u_43.current then
					return UDim2.new(0, p53 * v_u_43.current, 0, 0)
				end
				local v54
				if v_u_28 and v_u_25.current then
					local v55 = v_u_25.current.AbsoluteSize.X
					if not v_u_47.current then
						v_u_47.current = v_u_25.current.AbsoluteSize.X
					end
					if v_u_48.current and v55 <= v_u_48.current then
						local v56 = UDim2.new
						local v57 = 0
						if not v_u_23 then
							v55 = v_u_48.current
						end
						return v56(v57, v55, 0, 0)
					end
					if v_u_47.current and v_u_47.current ~= v55 then
						v_u_48.current = v55
					end
					v54 = p53 * v_u_42
				else
					v54 = p53 * (v_u_48.current or v_u_42)
				end
				return UDim2.new(0, v54, 0, 0)
			else
				if v_u_28 and v_u_25.current then
					local v58 = v_u_25.current.AbsoluteSize.X
					if not v_u_47.current then
						v_u_47.current = v_u_25.current.AbsoluteSize.X
					end
					if v_u_48.current and v58 <= v_u_48.current then
						return UDim2.new(0, v_u_48.current, 0, 0)
					end
					if v_u_47.current and v_u_47.current ~= v58 then
						v_u_48.current = v58
					end
				end
				local v59 = p53 * v_u_42
				return UDim2.new(0, v59, 0, 0)
			end
		end, { v_u_28 })
		v46 = v_u_5.useCallback(function(p60)
			-- upvalues: (copy) v_u_28
			return p60 > 0 and true or v_u_28
		end, { v_u_28 })
	else
		v46 = nil
		v44 = nil
		v45 = nil
	end
	if not v_u_22 or v_u_3.ReducedMotion then
		if v_u_28 then
			local v61 = v_u_5.createElement
			local v62 = v_u_12
			local v63 = {
				["TraversalBackButton"] = v_u_5.createElement(v_u_19, {
					["text"] = v_u_40,
					["textLimitWidth"] = v_u_42,
					["ref"] = v_u_25
				})
			}
			v_u_28 = v61(v62, {
				["tag"] = "auto-xy shrink"
			}, v63)
		end
		return v_u_28
	end
	local v64 = v_u_5.createElement
	local v65 = v_u_12
	local v66 = {
		["tag"] = "auto-y",
		["Visible"] = nil,
		["Size"] = nil,
		["ZIndex"] = -1,
		["Visible"] = v44:map(v46),
		["Size"] = v44:map(v45)
	}
	local v67 = {
		["TraversalBackButton"] = v_u_5.createElement(v_u_19, {
			["text"] = v_u_40,
			["textLimitWidth"] = v_u_42,
			["ref"] = v_u_25
		})
	}
	return v64(v65, v66, v67)
end)