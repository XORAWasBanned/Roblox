-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Components.AnnotationModal
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("GuiService")
local v3 = v_u_1:WaitForChild("RobloxGui")
local v4 = script:FindFirstAncestor("AbuseReportMenu")
local v5 = game:GetService("CorePackages")
local v_u_6 = require(v5.Packages.Roact)
local v7 = v3.Modules.Chrome
local v_u_8 = require(v5.Workspace.Packages.Chrome).Enabled
local v_u_9
if v_u_8() then
	v_u_9 = require(v7.Service)
else
	v_u_9 = nil
end
require(v4.Components.Types)
local v_u_10 = require(v4.Components.Constants)
local v_u_11 = require(v4.ReportAnything.Components.ScreenshotFlowStepHandlerContainer)
require(v4.ReportAnything.Utility.ReportAnythingAnalytics)
local v_u_12 = require(v5.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v_u_13 = {
	["annotationPageHandle"] = nil,
	["annotationPageFrame"] = nil,
	["annotationPageScreenGui"] = nil
}
local function v_u_15() -- name: unmountAnnotationPage
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_13, (copy) v_u_6
	if v_u_12 then
		local v14
		if v_u_12 then
			v14 = v_u_8()
		else
			v14 = v_u_8
		end
		if v14 then
			v_u_9:setHideShortcutBar("AnnotationModal", false)
		end
	end
	if v_u_13.annotationPageHandle ~= nil then
		v_u_6.unmount(v_u_13.annotationPageHandle)
		v_u_13.annotationPageHandle = nil
	end
	if v_u_13.annotationPageScreenGui ~= nil then
		v_u_13.annotationPageFrame.Parent = nil
		v_u_13.annotationPageFrame = nil
		v_u_13.annotationPageScreenGui = nil
	end
end
return {
	["mountAnnotationPage"] = function(p16, p_u_17, p18, p19, p_u_20) -- name: mountAnnotationPage
		-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_13, (copy) v_u_1, (copy) v_u_10, (copy) v_u_6, (copy) v_u_11, (copy) v_u_15
		if v_u_12 then
			local v21
			if v_u_12 then
				v21 = v_u_8()
			else
				v21 = v_u_8
			end
			if v21 then
				v_u_9:setHideShortcutBar("AnnotationModal", true)
			end
		end
		local v22, _ = v_u_2:GetGuiInset()
		if not v_u_13.annotationPageScreenGui then
			local v23 = Instance.new("ScreenGui")
			v23.Name = "AnnotationPageContents"
			v23.DisplayOrder = 7
			v23.Enabled = true
			v23.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			v23.Parent = v_u_1:FindFirstChild(v_u_10.AbuseReportMenuPlaceholderFrame, true)
			v_u_13.annotationPageScreenGui = v23
			local v24 = Instance.new("Frame")
			v24.BackgroundTransparency = 1
			v24.Position = UDim2.new(0, 0, 0, -v22.Y)
			v24.Size = UDim2.new(1, 0, 1, v22.Y)
			v24.Parent = v_u_13.annotationPageScreenGui
			v_u_13.annotationPageFrame = v24
		end
		local v29 = v_u_6.createElement(v_u_11, {
			["screenshot"] = nil,
			["entryPoint"] = nil,
			["backAction"] = nil,
			["dismissAction"] = nil,
			["finishAnnotationAction"] = nil,
			["restartAction"] = nil,
			["skipAnnotationAction"] = nil,
			["setAnnotationCircleRadius"] = nil,
			["setAnnotationAreaDimensions"] = nil,
			["initialAnnotationPoints"] = nil,
			["initialPageNumber"] = 1,
			["viewportInfo"] = nil,
			["reportAnythingAnalytics"] = nil,
			["screenshot"] = p19.screenshotContentId,
			["entryPoint"] = p16,
			["backAction"] = function() -- name: backAction
				-- upvalues: (ref) v_u_15
				v_u_15()
			end,
			["dismissAction"] = function() -- name: dismissAction
				-- upvalues: (ref) v_u_15
				v_u_15()
			end,
			["finishAnnotationAction"] = function(p25) -- name: finishAnnotationAction
				-- upvalues: (ref) v_u_15, (copy) p_u_20, (ref) v_u_10
				v_u_15()
				p_u_20({
					["type"] = v_u_10.ReportAnythingActions.SetAnnotationPoints,
					["annotationPoints"] = p25
				})
				p_u_20({
					["type"] = v_u_10.ReportAnythingActions.CompleteAttachment
				})
			end,
			["restartAction"] = function() -- name: restartAction
				-- upvalues: (ref) v_u_15, (copy) p_u_20, (ref) v_u_10, (copy) p_u_17
				v_u_15()
				p_u_20({
					["type"] = v_u_10.ReportAnythingActions.ClearAll
				})
				p_u_17()
			end,
			["skipAnnotationAction"] = function() -- name: skipAnnotationAction
				-- upvalues: (ref) v_u_15, (copy) p_u_20, (ref) v_u_10
				v_u_15()
				p_u_20({
					["type"] = v_u_10.ReportAnythingActions.CompleteAttachment
				})
			end,
			["setAnnotationCircleRadius"] = function(p26) -- name: setAnnotationCircleRadius
				-- upvalues: (copy) p_u_20, (ref) v_u_10
				p_u_20({
					["type"] = v_u_10.ReportAnythingActions.SetAnnotationCircleRadius,
					["radius"] = p26
				})
			end,
			["setAnnotationAreaDimensions"] = function(p27, p28) -- name: setAnnotationAreaDimensions
				-- upvalues: (copy) p_u_20, (ref) v_u_10
				p_u_20({
					["type"] = v_u_10.ReportAnythingActions.SetAnnotationAreaDimensions,
					["width"] = p27,
					["height"] = p28
				})
			end,
			["initialAnnotationPoints"] = {},
			["viewportInfo"] = p19.identificationResults.avatarIDStats.viewportInfo,
			["reportAnythingAnalytics"] = p18
		})
		p_u_20({
			["type"] = v_u_10.ReportAnythingActions.SetAnnotationOptionSeen
		})
		v_u_13.annotationPageHandle = v_u_6.mount(v29, v_u_13.annotationPageFrame, "AnnotationFlow")
	end,
	["unmountAnnotationPage"] = v_u_15
}