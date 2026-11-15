-- Path: CoreGui.RobloxGui.Modules.Feedback
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = require(v2.Packages.Roact)
local v_u_5 = require(v2.Packages.Rodux)
local v_u_6 = require(v2.Packages.RoactRodux)
local v_u_7 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_8 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_9 = require(script.GlobalConfig)
local v_u_10 = require(script.Reducers)
local v_u_11 = require(script.Components.FeedbackApp)
return {
	["initialize"] = function() -- name: initialize
		-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_5, (copy) v_u_10, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_11, (copy) v_u_1
		if v_u_9.propValidation then
			v_u_4.setGlobalConfig({
				["propValidation"] = true
			})
		end
		if v_u_9.elementTracing then
			v_u_4.setGlobalConfig({
				["elementTracing"] = true
			})
		end
		local v12 = { v_u_5.thunkMiddleware }
		if v_u_9.logStore then
			local v13 = v_u_5.loggerMiddleware
			table.insert(v12, v13)
		end
		local v14 = v_u_5.Store.new(v_u_10, nil, v12)
		local v15 = v_u_4.createElement
		local v16 = v_u_6.StoreProvider
		local v17 = {
			["LocalizationProvider"] = v_u_4.createElement(v_u_8, {
				["localization"] = v_u_7.new(v_u_3.RobloxLocaleId)
			}, {
				["Feedback"] = v_u_4.createElement(v_u_11)
			})
		}
		local v18 = v15(v16, {
			["store"] = v14
		}, v17)
		v_u_4.mount(v18, v_u_1, "Feedback")
	end
}