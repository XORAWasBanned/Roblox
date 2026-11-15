-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = require(v2.Packages.Roact)
local v_u_5 = require(v2.Packages.Rodux)
local v_u_6 = require(v2.Packages.RoactRodux)
local v_u_7 = require(v2.Packages.t)
require(v2.Packages.UIBlox)
local v8 = require(script.Dependencies)
local v_u_9 = v8.Localization
local v_u_10 = require(v8.LocalizationProvider)
local v_u_11 = require(v8.playerInterface)
local v_u_12 = require(script.Resources.Constants)
local v_u_13 = require(script.GlobalConfig)
local v_u_14 = require(script.Reducers)
local v_u_15 = require(script.Components.TrustAndSafetyApp)
local v_u_16 = require(script.TrustAndSafetyAppPolicy)
require(script.Actions.OpenReportDialog)
require(script.Actions.OpenReportMenu)
local v_u_17 = require(script.Actions.BeginReportFlow)
local v_u_18 = require(script.Actions.SetVoiceReportingFlow)
local v_u_19 = require(script.Utility.SessionUtility)
local v_u_20 = require(script.Thunks.FetchPlaceInfo)
local v_u_40 = {
	["getInstance"] = function(p21) -- name: getInstance
		if not p21._initialized then
			p21:initialize()
			p21._initialized = true
		end
		return p21
	end,
	["initialize"] = function(p22) -- name: initialize
		-- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_20, (copy) v_u_6, (copy) v_u_16, (copy) v_u_10, (copy) v_u_15, (copy) v_u_1
		if v_u_13.propValidation then
			v_u_4.setGlobalConfig({
				["propValidation"] = true
			})
		end
		if v_u_13.elementTracing then
			v_u_4.setGlobalConfig({
				["elementTracing"] = true
			})
		end
		p22.store = p22:createStore()
		p22.store:dispatch(v_u_20(game.GameId))
		p22.localization = p22:createLocalization()
		local v23 = v_u_4.createElement
		local v24 = v_u_6.StoreProvider
		local v25 = {
			["store"] = p22.store
		}
		local v26 = {}
		local v27 = v_u_4.createElement
		local v28 = v_u_16.Provider
		local v29 = {
			["policy"] = { v_u_16.Mapper }
		}
		local v30 = {
			["LocalizationProvider"] = v_u_4.createElement(v_u_10, {
				["localization"] = p22.localization
			}, {
				["TrustAndSafety"] = v_u_4.createElement(v_u_15)
			})
		}
		v26.PolicyProvider = v27(v28, v29, v30)
		p22.root = v23(v24, v25, v26)
		p22.element = v_u_4.mount(p22.root, v_u_1, "TrustAndSafety")
	end,
	["createStore"] = function(_) -- name: createStore
		-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_13
		local v31 = v_u_14
		local v32 = { v_u_5.thunkMiddleware }
		if v_u_13.logStore then
			local v33 = v_u_5.loggerMiddleware
			table.insert(v32, v33)
		end
		return v_u_5.Store.new(v31, nil, v32)
	end,
	["createLocalization"] = function(_) -- name: createLocalization
		-- upvalues: (copy) v_u_3, (copy) v_u_9
		local v34 = v_u_3.RobloxLocaleId
		local v_u_35 = v_u_9.new(v34)
		v_u_3:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_35
			v_u_35:SetLocale(v_u_3.RobloxLocaleId)
		end)
		return v_u_35
	end,
	["openReportDialog"] = function(p36, p37, p38) -- name: openReportDialog
		-- upvalues: (copy) v_u_18, (copy) v_u_17
		p36.store:dispatch(v_u_18(true))
		p36.store:dispatch(v_u_17(p37, p38))
	end,
	["openReportMenu"] = function(p39) -- name: openReportMenu
		-- upvalues: (copy) v_u_18, (copy) v_u_17
		p39.store:dispatch(v_u_18(true))
		p39.store:dispatch(v_u_17())
	end
}
return {
	["openReportDialogForPlayer"] = function(p41, p42) -- name: openReportDialogForPlayer
		-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_19, (copy) v_u_40, (copy) v_u_12
		local v43 = v_u_11(p41)
		if v43 then
			v43 = v_u_7.instanceIsA("Player")(p41)
		end
		assert(v43)
		v_u_19.startAbuseReportSession(p42)
		v_u_40:getInstance():openReportDialog(v_u_12.ReportType.Player, p41)
	end,
	["openReportDialogForPlace"] = function(p44) -- name: openReportDialogForPlace
		-- upvalues: (copy) v_u_19, (copy) v_u_40, (copy) v_u_12
		v_u_19.startAbuseReportSession(p44)
		v_u_40:getInstance():openReportDialog(v_u_12.ReportType.Place)
	end,
	["openReportMenu"] = function(p45) -- name: openReportMenu
		-- upvalues: (copy) v_u_19, (copy) v_u_40
		v_u_19.startAbuseReportSession(p45)
		v_u_40:getInstance():openReportMenu()
	end
}