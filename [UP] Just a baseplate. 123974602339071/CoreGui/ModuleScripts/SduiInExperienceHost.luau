-- Path: CoreGui.RobloxGui.Modules.ServerDrivenUi.SduiInExperienceHost
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("EventIngestService")
local v_u_3 = game:GetService("HttpService")
local v_u_4 = game:GetService("SessionService")
local v_u_5 = require(v1.Packages.React)
local v_u_6 = require(v1.Packages.Foundation)
local v_u_7 = require(v1.Packages.Signals)
local v_u_8 = require(v1.Workspace.Packages.Analytics).Analytics
local v_u_9 = require(v1.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local v_u_10 = require(v1.Workspace.Packages.Http).NetworkLayers.requestInternalWrapper
local v_u_11 = require(v1.Workspace.Packages.LinkingProtocol).LinkingProtocol
local v_u_12 = require(v1.Workspace.Packages.Localization).LocalizationRoactContext
local v_u_13 = require(v1.Workspace.Packages.RoactServices).RoactServices.ServiceProvider
local v_u_14 = require(v1.Workspace.Packages.RoactServiceTags)
local v_u_15 = require(v1.Packages.RoactRodux).StoreContext
local v_u_16 = require(v1.Packages.UIBlox).Core.Control.FeedbackManagerInjectionContext
local v_u_17 = require(v1.Workspace.Packages.UniversalAppPolicy).GetAppPolicyStore
local v_u_18 = require(v1.Workspace.Packages.SduiCoreSystem)
local v_u_19 = v_u_18.SduiInstrumentation
local v_u_20 = v_u_18.SduiLogger
local v_u_21 = nil
local function v_u_22() -- name: getServices
	-- upvalues: (ref) v_u_21, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_10, (copy) v_u_3, (copy) v_u_4
	if v_u_21 == nil then
		v_u_21 = {
			["appAnalytics"] = v_u_8.new(),
			["eventIngest"] = v_u_9.new(v_u_2),
			["networking"] = v_u_10(v_u_3),
			["sessionService"] = v_u_4
		}
	end
	return v_u_21
end
local function v_u_28(p23) -- name: reportRoduxUnavailable
	-- upvalues: (copy) v_u_20, (copy) v_u_18
	local v24 = v_u_20.reportError
	local v25 = v_u_18.SduiErrors.SduiErrorType.RoduxUnavailable
	local v26 = {
		["message"] = "Dispatched without a Rodux store",
		["name"] = nil
	}
	local v27
	if typeof(p23) == "table" then
		v27 = p23.type
	else
		v27 = typeof(p23)
	end
	v26.name = v27
	v24(v25, v26, "unknown")
end
local function v37(p_u_29, p_u_30) -- name: createUnavailableDependency
	-- upvalues: (copy) v_u_20
	local v36 = {
		["__index"] = function(_, p_u_31) -- name: __index
			-- upvalues: (ref) v_u_20, (copy) p_u_29, (copy) p_u_30
			return function()
				-- upvalues: (ref) v_u_20, (ref) p_u_29, (ref) p_u_30, (copy) p_u_31
				local v32 = v_u_20.reportError
				local v33 = p_u_29
				local v34 = {
					["message"] = ("%* is unavailable in experience"):format(p_u_30)
				}
				local v35 = p_u_31
				v34.name = tostring(v35)
				v32(v33, v34, "unknown")
				return nil
			end
		end
	}
	return setmetatable({}, v36)
end
local v_u_38 = v37(v_u_18.SduiErrors.SduiErrorType.NavigationUnavailable, "Navigation")
local v_u_39 = v37(v_u_18.SduiErrors.SduiErrorType.GameAnalyticsUnavailable, "GameAnalytics")
local function v_u_40() -- name: getNavigation
	-- upvalues: (copy) v_u_38
	return v_u_38
end
local function v_u_47() -- name: useTriggerFeedback
	-- upvalues: (copy) v_u_5, (copy) v_u_16
	local v41 = v_u_5.useContext(v_u_16)
	local v_u_42 = v_u_5.useRef(v41)
	v_u_42.current = v41
	return v_u_5.useCallback(function(p43, p44, p45, p46)
		-- upvalues: (copy) v_u_42
		return v_u_42.current(p43, p44, p45, p46)
	end, { v_u_42 })
end
local function v_u_54() -- name: useGlobalDependencies
	-- upvalues: (copy) v_u_5, (copy) v_u_19, (copy) v_u_12, (copy) v_u_6, (copy) v_u_47, (copy) v_u_22, (copy) v_u_28, (copy) v_u_40, (copy) v_u_39, (copy) v_u_11, (copy) v_u_20
	local v_u_48 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_19
		return v_u_19.new()
	end, {})
	local v_u_49 = v_u_5.useContext(v_u_12)
	local v_u_50 = v_u_6.Hooks.useCursor(v_u_6.Enums.CursorType.RoundedRect)
	local v_u_51 = v_u_47()
	return v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_28, (ref) v_u_40, (ref) v_u_39, (ref) v_u_11, (ref) v_u_20, (copy) v_u_50, (copy) v_u_48, (copy) v_u_49, (copy) v_u_51
		local v52 = v_u_22()
		local v53 = {
			["dispatch"] = v_u_28,
			["getNavigation"] = v_u_40,
			["appAnalytics"] = v52.appAnalytics,
			["gameAnalytics"] = v_u_39,
			["eventIngest"] = v52.eventIngest,
			["sessionService"] = v52.sessionService,
			["linkingProtocol"] = v_u_11.default,
			["logger"] = v_u_20,
			["cursors"] = {
				["tileCursor"] = v_u_50
			},
			["instrumentation"] = v_u_48,
			["localization"] = v_u_49,
			["networking"] = v52.networking,
			["triggerFeedback"] = v_u_51
		}
		return v53
	end, {
		v_u_48,
		v_u_49,
		v_u_50,
		v_u_51
	})
end
local function v_u_58() -- name: useScopedDependencies
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_28
	local v_u_55 = v_u_5.useContext(v_u_15)
	local v_u_57 = v_u_5.useCallback(function(p56)
		-- upvalues: (copy) v_u_55, (ref) v_u_28
		if v_u_55 then
			v_u_55:dispatch(p56)
		else
			v_u_28(p56)
		end
	end, { v_u_55 })
	return v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_57
		return {
			["dispatch"] = v_u_57
		}
	end, { v_u_57 })
end
return v_u_5.memo(function(p_u_59) -- name: SduiInExperienceHost
	-- upvalues: (copy) v_u_54, (copy) v_u_58, (copy) v_u_5, (copy) v_u_18, (copy) v_u_6, (copy) v_u_17, (copy) v_u_7, (copy) v_u_22, (copy) v_u_13, (copy) v_u_14
	local v_u_60 = v_u_54()
	local v_u_61 = v_u_58()
	local v62, v_u_63 = v_u_5.useState(false)
	v_u_5.useLayoutEffect(function()
		-- upvalues: (ref) v_u_18, (copy) v_u_60, (copy) p_u_59, (copy) v_u_61, (copy) v_u_63
		local v64 = v_u_18.getSduiServiceDependenciesStore()
		v64.setDependencies(v_u_60)
		local v65 = v64.setScopedDependencies(p_u_59.surfaceKey, v_u_61)
		v_u_63(true)
		return v65
	end, { v_u_60, v_u_61, p_u_59.surfaceKey })
	local v_u_66 = v_u_6.Hooks.useTokens()
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_18, (copy) v_u_66
		v_u_18.getSduiTokensStore().setTokens(v_u_66)
	end, { v_u_66 })
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_7, (ref) v_u_18
		local v_u_67 = v_u_17(false).getAppPolicy
		return v_u_7.createEffect(function(p68)
			-- upvalues: (ref) v_u_18, (copy) v_u_67
			v_u_18.getSduiPolicyStore().setAppPolicy(v_u_67(p68))
		end)
	end, {})
	if not v62 then
		return nil
	end
	local v69 = v_u_22()
	local v70 = v_u_5.createElement
	local v71 = v_u_13
	local v72 = {
		["services"] = {
			[v_u_14.RoactNetworking] = v69.networking,
			[v_u_14.AppEventIngestService] = v69.eventIngest,
			[v_u_14.RoactAnalytics] = v69.appAnalytics,
			[v_u_14.AppSessionService] = v69.sessionService
		}
	}
	return v70(v71, v72, {
		["Children"] = v_u_5.createElement(v_u_5.Fragment, nil, p_u_59.children)
	})
end)