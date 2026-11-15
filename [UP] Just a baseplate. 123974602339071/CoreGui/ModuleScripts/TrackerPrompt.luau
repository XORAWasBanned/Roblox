-- Path: CoreGui.RobloxGui.Modules.Tracker.TrackerPrompt
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("HttpService")
local v_u_4 = game:GetService("GuiService")
game:GetService("ContentProvider")
local v5 = require(v1.Packages.UIBlox)
local v_u_6 = v5.App.ImageSet.Images
local v_u_7 = v5.App.Dialog.Toast
local v8 = v2:WaitForChild("RobloxGui")
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_10 = require(v8.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_11 = require(v1.Packages.Roact)
local v12 = require(v1.Packages.t)
local v_u_13 = require(v8.Modules.Tracker.TrackerPromptType)
local v14 = game:DefineFastFlag("TrackerPromptNewCopyForCameraPerformanceEnabled", false)
local v_u_15 = game:DefineFastString("CameraUnavailableUrl", "https://help.roblox.com/hc/articles/17877687557396")
local v16 = v_u_11.PureComponent:extend("TrackerPrompt")
v16.validateProps = v12.strictInterface({
	["promptType"] = v12.optional(v12.string)
})
local v_u_17 = {
	[v_u_13.None] = "",
	[v_u_13.VideoNoPermission] = v_u_9:FormatByKey("Feature.FaceChat.Heading.UnableToAccessCamera"),
	[v_u_13.NotAvailable] = v_u_9:FormatByKey("Feature.FaceChat.Heading.NotAvailable"),
	[v_u_13.FeatureDisabled] = v_u_9:FormatByKey("Feature.FaceChat.Heading.FacialAnimation")
}
local v18 = v_u_13.LODCameraRecommendDisable
local v19
if v14 then
	v19 = v_u_9:FormatByKey("Feature.FaceChat.Heading.LowPerformanceDetected")
else
	v19 = v_u_9:FormatByKey("Feature.FaceChat.Heading.VideoPerformancePromptDisable")
end
v_u_17[v18] = v19
v_u_17[v_u_13.NoDynamicHeadEquipped] = v_u_9:FormatByKey("Feature.FaceChat.Heading.PromptNoDynamicHeadEquipped")
v_u_17[v_u_13.VideoUnsupported] = v_u_9:FormatByKey("Feature.FaceChat.Heading.VideoUnsupported")
v_u_17[v_u_13.UnsupportedDevice] = v_u_9:FormatByKey("Feature.FaceChat.Heading.NotAvailable")
v_u_17[v_u_13.CameraUnavailable] = v_u_9:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable")
local v_u_20 = {
	[v_u_13.None] = "",
	[v_u_13.VideoNoPermission] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.UnableToAccessCamera"),
	[v_u_13.NotAvailable] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.NotAvailable"),
	[v_u_13.FeatureDisabled] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.FeatureDisabled"),
	[v_u_13.LODCameraRecommendDisable] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.VideoPerformancePromptDisable"),
	[v_u_13.NoDynamicHeadEquipped] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.PromptNoDynamicHeadEquipped"),
	[v_u_13.VideoUnsupported] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.VideoUnsupported"),
	[v_u_13.UnsupportedDevice] = v_u_9:FormatByKey("Feature.FaceChat.Subtitle.UnsupportedDevice"),
	[v_u_13.CameraUnavailable] = v_u_9:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.CameraUnavailable")
}
local function v_u_25(p21) -- name: openWebview
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_4
	local v22 = v_u_3
	local v23 = {
		["title"] = nil,
		["presentationStyle"] = 2,
		["visible"] = true,
		["url"] = nil
	}
	local v24
	if game:GetEngineFeature("SetWebViewTitle") then
		v24 = v_u_9:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable")
	else
		v24 = nil
	end
	v23.title = v24
	v23.url = p21
	v_u_4:BroadcastNotification(v22:JSONEncode(v23), 20)
end
function v16.init(p26) -- name: init
	p26.promptType = p26.props.promptType
end
function v16.render(p_u_27) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_7, (copy) v_u_6, (copy) v_u_17, (copy) v_u_20, (copy) v_u_25, (copy) v_u_15, (copy) v_u_10
	p_u_27.promptType = p_u_27.props.promptType
	local v28 = v_u_11.createElement
	local v29 = "Frame"
	local v30 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v31 = {}
	local v32
	if p_u_27.promptType == v_u_13.None then
		v32 = false
	else
		local v33 = v_u_11.createElement
		local v34 = v_u_7
		local v35 = {
			["duration"] = 8,
			["toastContent"] = nil,
			["toastContent"] = {
				["iconImage"] = v_u_6["icons/status/alert"],
				["toastTitle"] = v_u_17[p_u_27.promptType],
				["toastSubtitle"] = v_u_20[p_u_27.promptType],
				["onDismissed"] = function() -- name: onDismissed end,
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) p_u_27, (ref) v_u_13, (ref) v_u_25, (ref) v_u_15
					if p_u_27.promptType == v_u_13.CameraUnavailable then
						v_u_25(v_u_15)
					end
				end
			}
		}
		v32 = v33(v34, v35)
	end
	v31.Toast = v32
	local v36 = v_u_10({
		["TrackerPrompt"] = v28(v29, v30, v31)
	})
	return v_u_11.createElement("ScreenGui", {
		["AutoLocalize"] = false,
		["DisplayOrder"] = 10,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["ZIndexBehavior"] = nil,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}, {
		["Content"] = v36
	})
end
return v16