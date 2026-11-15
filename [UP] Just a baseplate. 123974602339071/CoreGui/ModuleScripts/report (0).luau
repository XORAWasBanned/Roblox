-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Reducers.report
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent
local v5 = require(v4.Actions.OpenReportMenu)
local v6 = require(v4.Actions.CloseReportMenu)
require(v4.Actions.OpenReportDialog)
require(v4.Actions.OpenCategoryMenu)
local v7 = require(v4.Actions.SelectReportCategory)
local v8 = require(v4.Actions.OpenReportSentDialog)
require(v4.Actions.CloseReportSentDialog)
local v9 = require(v4.Actions.SelectReportListing)
local v10 = require(v4.Actions.SetVoiceReportingFlow)
local v11 = require(v4.Actions.BeginReportFlow)
local v12 = require(v4.Actions.EndReportFlow)
local v13 = require(v4.Actions.NavigateBack)
local v_u_14 = require(v4.Resources.Constants)
return v3.createReducer({
	["currentPage"] = nil,
	["history"] = nil,
	["voiceReportingFlowEnabled"] = true,
	["reportType"] = nil,
	["beginningReportType"] = nil,
	["reportCategory"] = nil,
	["targetPlayer"] = nil,
	["beginningTimestamp"] = 0,
	["sortedUserIds"] = nil,
	["currentPage"] = v_u_14.Page.None,
	["history"] = {},
	["reportType"] = v_u_14.ReportType.Any,
	["beginningReportType"] = v_u_14.ReportType.Any,
	["reportCategory"] = v_u_14.Category.None,
	["sortedUserIds"] = {}
}, {
	[v12.name] = function(p15, _)
		-- upvalues: (copy) v_u_2, (copy) v_u_14
		return v_u_2.Dictionary.join(p15, {
			["history"] = {},
			["currentPage"] = v_u_14.Page.None,
			["targetPlayer"] = v_u_2.None,
			["reportType"] = v_u_14.ReportType.Any
		})
	end,
	[v11.name] = function(p16, p17)
		-- upvalues: (copy) v_u_14, (copy) v_u_2
		local v18 = {
			["reportCategory"] = v_u_14.Category.None,
			["beginningTimestamp"] = workspace:GetServerTimeNow(),
			["sortedUserIds"] = {},
			["history"] = { v_u_14.Page.None }
		}
		if p17.reportType == v_u_14.ReportType.Place then
			return v_u_2.Dictionary.join(p16, v18, {
				["reportType"] = p17.reportType,
				["beginningReportType"] = p17.reportType,
				["currentPage"] = v_u_14.Page.ReportForm,
				["targetPlayer"] = v_u_2.None
			})
		elseif p17.reportType == v_u_14.ReportType.Player then
			local v19 = v_u_2.Dictionary.join
			local v20 = {
				["reportType"] = p17.reportType,
				["beginningReportType"] = p17.reportType,
				["targetPlayer"] = p17.targetPlayer
			}
			local v21
			if p16.voiceReportingFlowEnabled then
				v21 = v_u_14.Page.Category
			else
				v21 = v_u_14.Page.ReportForm
			end
			v20.currentPage = v21
			return v19(p16, v18, v20)
		else
			local v22 = v_u_2.Dictionary.join
			local v23 = {
				["reportType"] = v_u_14.ReportType.Any,
				["beginningReportType"] = v_u_14.ReportType.Any,
				["targetPlayer"] = v_u_2.None
			}
			local v24
			if p16.voiceReportingFlowEnabled then
				v24 = v_u_14.Page.Category
			else
				v24 = v_u_14.Page.Listing
			end
			v23.currentPage = v24
			return v22(p16, v18, v23)
		end
	end,
	[v13.name] = function(p25, _)
		-- upvalues: (copy) v_u_2
		local v26 = p25.history[#p25.history] or p25.currentPage
		local v27 = {
			["history"] = v_u_2.List.removeIndex(p25.history, #p25.history),
			["currentPage"] = v26
		}
		return v_u_2.Dictionary.join(p25, v27)
	end,
	[v7.name] = function(p28, p29)
		-- upvalues: (copy) v_u_14, (copy) v_u_2
		local v30 = p29.reportCategory == v_u_14.Category.Experience
		local v31 = p28.beginningReportType == v_u_14.ReportType.Player
		local v32 = v_u_14.Page.Listing
		local v33 = p28.reportType
		if v30 or v31 then
			v32 = v_u_14.Page.ReportForm
			if v30 then
				v33 = v_u_14.ReportType.Place
			end
		end
		local v34 = v_u_2.List.join(p28.history, { p28.currentPage })
		return v_u_2.Dictionary.join(p28, {
			["history"] = v34,
			["currentPage"] = v32,
			["reportType"] = v33,
			["reportCategory"] = p29.reportCategory
		})
	end,
	[v9.name] = function(p35, p36)
		-- upvalues: (copy) v_u_2, (copy) v_u_14
		local v37 = v_u_2.List.join(p35.history, { p35.currentPage })
		return v_u_2.Dictionary.join(p35, {
			["sortedUserIds"] = v_u_2.List.join(p36.sortedUserIds or {}, {}),
			["history"] = v37,
			["currentPage"] = v_u_14.Page.ReportForm,
			["reportType"] = p36.reportType,
			["targetPlayer"] = p36.targetPlayer or v_u_2.None
		})
	end,
	[v5.name] = function(p38, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p38, {
			["isReportMenuOpen"] = true
		})
	end,
	[v6.name] = function(p39, _)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p39, {
			["isReportMenuOpen"] = false
		})
	end,
	[v8.name] = function(p40, p41)
		-- upvalues: (copy) v_u_2, (copy) v_u_14
		return v_u_2.Dictionary.join(p40, {
			["currentPage"] = v_u_14.Page.ReportSent,
			["reportType"] = p41.reportType,
			["targetPlayer"] = p41.targetPlayer or v_u_2.None
		})
	end,
	[v10.name] = function(p42, p43)
		-- upvalues: (copy) v_u_2
		return v_u_2.Dictionary.join(p42, {
			["voiceReportingFlowEnabled"] = p43.enable
		})
	end
})