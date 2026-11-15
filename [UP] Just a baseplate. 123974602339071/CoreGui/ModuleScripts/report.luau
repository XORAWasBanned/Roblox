-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.report
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v3 = v2.Rodux
local v_u_4 = v2.Cryo
local v5 = script.Parent.Parent
local v6 = require(v5.Actions.OpenReportDialog)
local v7 = require(v5.Actions.CloseReportDialog)
local v8 = require(v5.Actions.OpenReportSentDialog)
local v9 = require(v5.Actions.CloseReportSentDialog)
local v10 = require(v5.Actions.SetCurrentPage)
return v3.createReducer({
	["dialogOpen"] = false,
	["reportSentOpen"] = false,
	["userId"] = nil,
	["userName"] = nil
}, {
	[v6.name] = function(p11, p12)
		return {
			["dialogOpen"] = true,
			["reportSentOpen"] = nil,
			["userId"] = nil,
			["userName"] = nil,
			["reportSentOpen"] = p11.reportSentOpen,
			["userId"] = p12.userId,
			["userName"] = p12.userName
		}
	end,
	[v10.name] = function(p13, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p13, {
			["dialogOpen"] = false
		})
	end,
	[v7.name] = function(p14, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p14, {
			["dialogOpen"] = false
		})
	end,
	[v8.name] = function(p15, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p15, {
			["reportSentOpen"] = true
		})
	end,
	[v9.name] = function(p16, _)
		-- upvalues: (copy) v_u_4
		return v_u_4.Dictionary.join(p16, {
			["reportSentOpen"] = false
		})
	end
})