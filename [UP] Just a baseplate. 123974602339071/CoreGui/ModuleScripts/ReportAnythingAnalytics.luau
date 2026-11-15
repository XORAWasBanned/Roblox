-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics
local v_u_1 = game:GetService("EventIngestService")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.Cryo)
require(v2.Workspace.Packages.TnSAvatarIdentification)
local v_u_4 = require(v2.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local v_u_5 = {
	["EventType"] = {
		["AvatarsIdentified"] = "ReportAnythingAvatarsIdentified"
	},
	["Context"] = {
		["LegacyMenu"] = "ReportAbuseLegacyMenu"
	}
}
local v_u_6 = {
	["previewBackCount"] = 0,
	["previewAttachCount"] = 0,
	["retakeCount"] = 0,
	["retakeAbandon"] = false,
	["highlightSceneCount"] = 0,
	["annotationBackCount"] = 0,
	["annotationPlaceCount"] = 0,
	["annotationUndoCount"] = 0,
	["annotationRedoCount"] = 0,
	["annotationNext"] = false
}
local v_u_7 = nil
return {
	["incrementPreviewBack"] = function() -- name: incrementPreviewBack
		-- upvalues: (ref) v_u_6
		local v8 = v_u_6
		v8.previewBackCount = v8.previewBackCount + 1
	end,
	["incrementPreviewAttach"] = function() -- name: incrementPreviewAttach
		-- upvalues: (ref) v_u_6
		local v9 = v_u_6
		v9.previewAttachCount = v9.previewAttachCount + 1
	end,
	["incrementRetake"] = function() -- name: incrementRetake
		-- upvalues: (ref) v_u_6
		local v10 = v_u_6
		v10.retakeCount = v10.retakeCount + 1
	end,
	["setRetakeAbandon"] = function() -- name: setRetakeAbandon
		-- upvalues: (ref) v_u_6
		v_u_6.retakeAbandon = true
	end,
	["incrementHighlightScene"] = function() -- name: incrementHighlightScene
		-- upvalues: (ref) v_u_6
		local v11 = v_u_6
		v11.highlightSceneCount = v11.highlightSceneCount + 1
	end,
	["incrementAnnotationBack"] = function() -- name: incrementAnnotationBack
		-- upvalues: (ref) v_u_6
		local v12 = v_u_6
		v12.annotationBackCount = v12.annotationBackCount + 1
	end,
	["incrementAnnotationPlace"] = function() -- name: incrementAnnotationPlace
		-- upvalues: (ref) v_u_6
		local v13 = v_u_6
		v13.annotationPlaceCount = v13.annotationPlaceCount + 1
	end,
	["incrementAnnotationUndo"] = function() -- name: incrementAnnotationUndo
		-- upvalues: (ref) v_u_6
		local v14 = v_u_6
		v14.annotationUndoCount = v14.annotationUndoCount + 1
	end,
	["incrementAnnotationRedo"] = function() -- name: incrementAnnotationRedo
		-- upvalues: (ref) v_u_6
		local v15 = v_u_6
		v15.annotationRedoCount = v15.annotationRedoCount + 1
	end,
	["setAnnotationNext"] = function() -- name: setAnnotationNext
		-- upvalues: (ref) v_u_6
		v_u_6.annotationNext = true
	end,
	["getAccumulatedParameters"] = function() -- name: getAccumulatedParameters
		-- upvalues: (ref) v_u_6
		return v_u_6
	end,
	["emitAvatarsIdentifiedStats"] = function(p16) -- name: emitAvatarsIdentifiedStats
		-- upvalues: (copy) v_u_3, (ref) v_u_7, (copy) v_u_4, (copy) v_u_1, (copy) v_u_5
		local v17 = v_u_3.Dictionary.join(p16, {
			["duration"] = p16.duration * 1000000
		})
		if not v_u_7 then
			v_u_7 = v_u_4.new(v_u_1)
		end
		v_u_7:sendEventDeferred(v_u_5.Context.LegacyMenu, v_u_5.EventType.AvatarsIdentified, v17)
	end,
	["clear"] = function() -- name: clear
		-- upvalues: (ref) v_u_6
		v_u_6 = {
			["previewBackCount"] = 0,
			["previewAttachCount"] = 0,
			["retakeCount"] = 0,
			["retakeAbandon"] = false,
			["highlightSceneCount"] = 0,
			["annotationBackCount"] = 0,
			["annotationPlaceCount"] = 0,
			["annotationUndoCount"] = 0,
			["annotationRedoCount"] = 0,
			["annotationNext"] = false
		}
	end
}