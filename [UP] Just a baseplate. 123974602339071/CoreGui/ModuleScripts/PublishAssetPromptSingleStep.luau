-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAssetPromptSingleStep
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ExperienceAuthService")
local v3 = game:GetService("Players")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = require(v1.Packages.t)
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v8 = require(v1.Packages.UIBlox)
local v9 = require(v1.Packages.Foundation)
local v_u_10 = v9.Utility.normalizeFontFace
local v_u_11 = v9.Utility.Flags.FoundationFontFaceMigration
local v_u_12 = v8.Style.withStyle
local v_u_13 = v8.App.Dialog.Alert.InteractiveAlert
local v_u_14 = v8.App.Button.Enum.ButtonType
local v_u_15 = v8.App.Button.IconButton
local v_u_16 = require(v1.Packages.RoactGamepad)
local v_u_17 = v3.LocalPlayer
local v_u_18 = require(script.Parent.Common.NameTextBox)
local v_u_19 = require(script.Parent.AssetDescriptionTextBox)
local v_u_20 = require(script.Parent.ImagePreview)
local v_u_21 = require(script.Parent.ObjectViewport)
local v_u_22 = require(script.Parent.Common.PreviewViewport)
local v_u_23 = require(script.Parent.EmoteThumbnailView)
local v_u_24 = require(script.Parent.EmoteThumbnailEditor)
local v_u_25 = require(script.Parent.EmoteThumbnailParameters)
local v_u_26 = require(script.Parent.Parent.Actions.CloseOpenPrompt)
local v27 = v8.App.ImageSet.Images
local v_u_28 = v27["icons/actions/previewExpand"]
local v_u_29 = v27["icons/actions/edit/edit"]
local v_u_30 = {
	[Enum.AssetType.TShirtAccessory] = true,
	[Enum.AssetType.ShirtAccessory] = true,
	[Enum.AssetType.PantsAccessory] = true,
	[Enum.AssetType.JacketAccessory] = true,
	[Enum.AssetType.SweaterAccessory] = true,
	[Enum.AssetType.ShortsAccessory] = true,
	[Enum.AssetType.LeftShoeAccessory] = true,
	[Enum.AssetType.RightShoeAccessory] = true,
	[Enum.AssetType.DressSkirtAccessory] = true,
	[Enum.AssetType.HairAccessory] = true
}
local v_u_31 = game:DefineFastFlag("SendConsentDeniedOnCancel", false)
local v_u_32 = game:GetEngineFeature("EnableEmotePublish")
local v_u_33 = game:GetEngineFeature("EnableImagePublish")
local v34 = v_u_4.PureComponent:extend("PublishAssetPromptSingleStep")
v34.validateProps = v6.strictInterface({
	["screenSize"] = v6.Vector2,
	["assetInstance"] = v6.Instance,
	["assetType"] = v6.enum(Enum.AssetType),
	["guid"] = v6.any,
	["scopes"] = v6.any,
	["closePrompt"] = v6.callback
})
function v34.getDefaultText(p35) -- name: getDefaultText
	-- upvalues: (copy) v_u_7, (copy) v_u_17
	return p35.props.assetType ~= Enum.AssetType.Model and "" or v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.PackagesDefaultName", {
		["RBX_NAME"] = v_u_17 and v_u_17.Name or ""
	})
end
function v34.init(p_u_36) -- name: init
	-- upvalues: (copy) v_u_25, (copy) v_u_2, (copy) v_u_32, (copy) v_u_4
	p_u_36.assetName = p_u_36:getDefaultText()
	p_u_36.assetDescription = p_u_36:getDefaultText()
	p_u_36.isNameValid = true
	p_u_36.isDescriptionValid = true
	p_u_36:setState({
		["thumbnailParameters"] = nil,
		["showingThumbnailEditor"] = false,
		["showingAssetPreview"] = false,
		["thumbnailParameters"] = v_u_25.defaultParameters
	})
	function p_u_36.closePrompt()
		-- upvalues: (copy) p_u_36
		p_u_36.props.closePrompt()
	end
	function p_u_36.openThumbnailEditor()
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["showingThumbnailEditor"] = true
		})
	end
	function p_u_36.closeThumbnailEditor()
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["showingThumbnailEditor"] = false
		})
	end
	function p_u_36.openAssetPreview()
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["showingAssetPreview"] = true
		})
	end
	function p_u_36.closeAssetPreview()
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["showingAssetPreview"] = false
		})
	end
	function p_u_36.updateThumbnailParameters(p37)
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["thumbnailParameters"] = p37
		})
	end
	function p_u_36.denyAndClose()
		-- upvalues: (ref) v_u_2, (copy) p_u_36
		v_u_2:ScopeCheckUIComplete(p_u_36.props.guid, p_u_36.props.scopes, Enum.ScopeCheckResult.ConsentDenied, {})
		p_u_36.closePrompt()
	end
	function p_u_36.confirmAndUpload()
		-- upvalues: (copy) p_u_36, (ref) v_u_32, (ref) v_u_25, (ref) v_u_2
		if p_u_36.isNameValid then
			local v38 = {
				["assetName"] = p_u_36.assetName,
				["assetDescription"] = p_u_36.assetDescription
			}
			if v_u_32 and p_u_36.props.assetType == Enum.AssetType.EmoteAnimation then
				v38.emoteThumbnailParameters = v_u_25.encodeAsATable(p_u_36.state.thumbnailParameters)
			end
			v_u_2:ScopeCheckUIComplete(p_u_36.props.guid, p_u_36.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, v38)
			p_u_36.closePrompt()
		end
	end
	function p_u_36.onAssetNameUpdated(p39, p40)
		-- upvalues: (copy) p_u_36
		if p40 then
			p_u_36.assetName = p39
			p_u_36.isNameValid = true
		else
			p_u_36.isNameValid = false
		end
	end
	function p_u_36.onAssetDescriptionUpdated(p41, p42)
		-- upvalues: (copy) p_u_36
		p_u_36.assetDescription = p41
		p_u_36.isDescriptionValid = p42
	end
	p_u_36.nameTextBoxRef = v_u_4.createRef()
	p_u_36.descriptionTextBoxRef = v_u_4.createRef()
end
function v34.renderMiddle(p_u_43, p_u_44) -- name: renderMiddle
	-- upvalues: (copy) v_u_12, (copy) v_u_32, (copy) v_u_33, (copy) v_u_4, (copy) v_u_16, (copy) v_u_20, (copy) v_u_21, (copy) v_u_23, (copy) v_u_15, (copy) v_u_28, (copy) v_u_29, (copy) v_u_11, (copy) v_u_10, (copy) v_u_18, (copy) v_u_19
	return v_u_12(function(p45)
		-- upvalues: (ref) v_u_32, (copy) p_u_43, (ref) v_u_33, (ref) v_u_4, (ref) v_u_16, (ref) v_u_20, (ref) v_u_21, (ref) v_u_23, (ref) v_u_15, (ref) v_u_28, (ref) v_u_29, (ref) v_u_11, (ref) v_u_10, (copy) p_u_44, (ref) v_u_18, (ref) v_u_19
		local v46 = p45.Font
		local v47 = p45.Theme
		local v48 = v_u_32
		if v48 then
			if p_u_43.props.assetType == Enum.AssetType.EmoteAnimation then
				v48 = p_u_43.props.assetInstance:IsA("AnimationClip")
			else
				v48 = false
			end
		end
		local v49 = v_u_33
		if v49 then
			if p_u_43.props.assetType == Enum.AssetType.Image then
				v49 = p_u_43.props.assetInstance:IsA("Decal")
			else
				v49 = false
			end
		end
		local v50 = v_u_4.createElement
		local v51 = v_u_16.Focusable.Frame
		local v52 = {
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 150),
			["defaultChild"] = p_u_43.nameTextBoxRef,
			[v_u_4.Ref] = p_u_43.middleContentRef
		}
		local v53 = {
			["UISizeConstraint"] = v_u_4.createElement("UISizeConstraint", {
				["MinSize"] = Vector2.new(200, 200)
			})
		}
		local v54 = v_u_4.createElement
		local v55 = "Frame"
		local v56 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, -50)
		}
		local v57 = {}
		local v58 = v_u_4.createElement
		local v59 = "Frame"
		local v60 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0.4, 0, 1, 0)
		}
		local v61 = {}
		local v62
		if v49 then
			v62 = v_u_4.createElement(v_u_20, {
				["imageContent"] = nil,
				["autoRotateSeconds"] = 6,
				["imageContent"] = p_u_43.props.assetInstance.TextureContent
			})
		else
			v62 = nil
		end
		v61.ImagePreview = v62
		local v63
		if v48 or v49 then
			v63 = nil
		else
			v63 = v_u_4.createElement(v_u_21, {
				["model"] = p_u_43.props.assetInstance
			}) or nil
		end
		v61.ObjectViewport = v63
		local v64
		if v48 then
			v64 = v_u_4.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.fromScale(1, 1)
			}, {
				["AspectRatioConstraint"] = v_u_4.createElement("UIAspectRatioConstraint", {
					["AspectRatio"] = 1,
					["AspectType"] = nil,
					["DominantAxis"] = nil,
					["AspectType"] = Enum.AspectType.FitWithinMaxSize,
					["DominantAxis"] = Enum.DominantAxis.Width
				}),
				["EmoteThumbnailView"] = v_u_4.createElement(v_u_23, {
					["animationClip"] = p_u_43.props.assetInstance,
					["thumbnailParameters"] = p_u_43.state.thumbnailParameters
				}),
				["PreviewButton"] = v_u_4.createElement(v_u_15, {
					["position"] = nil,
					["anchorPoint"] = nil,
					["icon"] = nil,
					["size"] = nil,
					["showBackground"] = true,
					["onActivated"] = nil,
					["position"] = UDim2.new(1, -2, 1, -2),
					["anchorPoint"] = Vector2.new(1, 1),
					["icon"] = v_u_28,
					["size"] = UDim2.new(0, 30, 0, 30),
					["onActivated"] = p_u_43.openAssetPreview
				}),
				["EditButton"] = v_u_4.createElement(v_u_15, {
					["position"] = nil,
					["anchorPoint"] = nil,
					["icon"] = nil,
					["size"] = nil,
					["showBackground"] = true,
					["onActivated"] = nil,
					["position"] = UDim2.new(0, 2, 1, -2),
					["anchorPoint"] = Vector2.new(0, 1),
					["icon"] = v_u_29,
					["size"] = UDim2.new(0, 30, 0, 30),
					["onActivated"] = p_u_43.openThumbnailEditor
				})
			}) or nil
		else
			v64 = nil
		end
		v61.EmoteThumbnailParent = v64
		v57.ViewportParent = v58(v59, v60, v61)
		local v65 = v_u_4.createElement
		local v66 = "Frame"
		local v67 = {
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0.6, -10, 1, 0),
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.fromScale(1, 0)
		}
		local v68 = {}
		local v69 = v_u_4.createElement
		local v70 = "TextLabel"
		local v71 = {
			["Size"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["Text"] = nil,
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 15)
		}
		local v72
		if v_u_11 then
			v72 = nil
		else
			v72 = v46.Body.Font
		end
		v71.Font = v72
		local v73
		if v_u_11 then
			v73 = v_u_10(p45.Tokens.Typography.BodyLarge.Font)
		else
			v73 = nil
		end
		v71.FontFace = v73
		v71.Text = p_u_44.name
		v71.TextColor3 = v47.TextDefault.Color
		v71.TextXAlignment = Enum.TextXAlignment.Left
		v68.NameLabel = v69(v70, v71)
		v68.NameInput = v_u_4.createElement(v_u_18, {
			["Size"] = UDim2.new(1, 0, 0, 30),
			["Position"] = UDim2.new(0, 0, 0, 15),
			["onNameUpdated"] = p_u_43.onAssetNameUpdated,
			["nameTextBoxRef"] = p_u_43.nameTextBoxRef,
			["NextSelectionDown"] = p_u_43.descriptionTextBoxRef,
			["defaultName"] = p_u_43.assetName
		})
		local v74 = v_u_4.createElement
		local v75 = "TextLabel"
		local v76 = {
			["Size"] = nil,
			["Position"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = 12,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 15),
			["Position"] = UDim2.new(0, 0, 0, 60)
		}
		local v77
		if v_u_11 then
			v77 = nil
		else
			v77 = v46.Body.Font
		end
		v76.Font = v77
		local v78
		if v_u_11 then
			v78 = v_u_10(p45.Tokens.Typography.BodyLarge.Font)
		else
			v78 = nil
		end
		v76.FontFace = v78
		v76.Text = p_u_44.description
		v76.TextColor3 = v47.TextDefault.Color
		v76.TextXAlignment = Enum.TextXAlignment.Left
		v68.DescriptionLabel = v74(v75, v76)
		v68.DescriptionInput = v_u_4.createElement(v_u_19, {
			["Size"] = UDim2.new(1, 0, 0, 80),
			["Position"] = UDim2.new(0, 0, 0, 75),
			["onAssetDescriptionUpdated"] = p_u_43.onAssetDescriptionUpdated,
			["descriptionTextBoxRef"] = p_u_43.descriptionTextBoxRef,
			["NextSelectionUp"] = p_u_43.nameTextBoxRef,
			["defaultDescription"] = p_u_43.assetDescription
		})
		v57.NameDescriptionFields = v65(v66, v67, v68)
		v53.TopSection = v54(v55, v56, v57)
		local v79 = v_u_4.createElement
		local v80 = "TextLabel"
		local v81 = {
			["Size"] = nil,
			["TextYAlignment"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["TextWrapped"] = true,
			["Size"] = UDim2.new(1, 0, 0, 50),
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["Text"] = p_u_44.disclaimer
		}
		local v82
		if v_u_11 then
			v82 = nil
		else
			v82 = v46.Body.Font
		end
		v81.Font = v82
		local v83
		if v_u_11 then
			v83 = v_u_10(p45.Tokens.Typography.BodyLarge.Font)
		else
			v83 = nil
		end
		v81.FontFace = v83
		v81.TextColor3 = v47.TextEmphasis.Color
		v81.AnchorPoint = Vector2.new(0, 1)
		v81.Position = UDim2.fromScale(0, 1)
		v53.Disclaimer = v79(v80, v81)
		return v50(v51, v52, v53)
	end)
end
function v34.renderAlertLocalized(p_u_84, p_u_85) -- name: renderAlertLocalized
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_31, (copy) v_u_14, (copy) v_u_32, (copy) v_u_24, (copy) v_u_22
	local v86 = v_u_4.createElement
	local v87 = v_u_13
	local v88 = {
		["title"] = nil,
		["buttonStackInfo"] = nil,
		["middleContent"] = nil,
		["screenSize"] = nil,
		["defaultChildRef"] = nil,
		["isMiddleContentFocusable"] = true,
		["title"] = p_u_85.title
	}
	local v89 = {}
	local v90 = {}
	local v91 = {
		["props"] = nil,
		["isDefaultChild"] = true
	}
	local v92 = {}
	local v93
	if v_u_31 then
		v93 = p_u_84.denyAndClose
	else
		v93 = p_u_84.closePrompt
	end
	v92.onActivated = v93
	v92.text = p_u_85.cancel
	v91.props = v92
	__set_list(v90, 1, {v91, {
	["buttonType"] = nil,
	["props"] = nil,
	["isDefaultChild"] = false,
	["buttonType"] = v_u_14.PrimarySystem,
	["props"] = {
		["onActivated"] = nil,
		["text"] = nil,
		["isDelayedInput"] = true,
		["enableInputDelayed"] = true,
		["delayInputSeconds"] = 6,
		["onActivated"] = p_u_84.confirmAndUpload,
		["text"] = p_u_85.submit
	}
}})
	v89.buttons = v90
	v88.buttonStackInfo = v89
	function v88.middleContent() -- name: middleContent
		-- upvalues: (copy) p_u_84, (copy) p_u_85
		return p_u_84:renderMiddle(p_u_85)
	end
	v88.screenSize = p_u_84.props.screenSize
	v88.defaultChildRef = p_u_84.props.defaultChildRef
	local v94 = v86(v87, v88)
	if not v_u_32 then
		return v94
	end
	local v95 = v_u_4.createFragment
	local v96 = {
		["Prompt"] = v94
	}
	local v97
	if p_u_84.state.showingThumbnailEditor then
		v97 = v_u_4.createElement(v_u_24, {
			["animationClip"] = p_u_84.props.assetInstance,
			["initialThumbnailParameters"] = p_u_84.state.thumbnailParameters,
			["screenSize"] = p_u_84.props.screenSize,
			["updateThumbnailCallback"] = p_u_84.updateThumbnailParameters,
			["closePromptCallback"] = p_u_84.closeThumbnailEditor
		}) or nil
	else
		v97 = nil
	end
	v96.ThumbnailEditor = v97
	local v98
	if p_u_84.state.showingAssetPreview then
		v98 = v_u_4.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 0,
			["Size"] = UDim2.new(0.5, 0, 0.5, 0),
			["BackgroundColor3"] = Color3.new(0.2, 0.2, 0.2),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5)
		}, {
			["PreviewViewport"] = v_u_4.createElement(v_u_22, {
				["asset"] = p_u_84.props.assetInstance,
				["closePreviewView"] = p_u_84.closeAssetPreview
			})
		}) or nil
	else
		v98 = nil
	end
	v96.PreviewFrame = v98
	return v95(v96)
end
local function v_u_101(p99) -- name: GetLocalizedStringsForAssetType
	-- upvalues: (copy) v_u_7, (copy) v_u_30
	local v100 = {
		["name"] = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		["description"] = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
		["invalidName"] = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidName"),
		["invalidDescription"] = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription"),
		["cancel"] = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.Cancel"),
		["submit"] = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.Submit")
	}
	if v_u_30[p99] == true then
		v100.title = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextClothing")
		v100.disclaimer = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerAvatar")
		return v100
	end
	if p99 == Enum.AssetType.EmoteAnimation then
		v100.title = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextEmote")
		v100.disclaimer = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerEmote")
		return v100
	end
	if p99 == Enum.AssetType.Model then
		v100.title = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextModel")
		v100.disclaimer = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel")
		return v100
	end
	if p99 ~= Enum.AssetType.Package then
		if p99 == Enum.AssetType.Image then
			v100.title = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextImage")
			v100.disclaimer = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerImage")
		end
		return v100
	end
	v100.title = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.TitleTextPackage")
	v100.disclaimer = v_u_7:FormatByKey("CoreScripts.PublishAssetPrompt.DisclaimerModel")
	return v100
end
function v34.render(p102) -- name: render
	-- upvalues: (copy) v_u_101
	return p102:renderAlertLocalized((v_u_101(p102.props.assetType)))
end
return v5.connect(function(p103) -- name: mapStateToProps
	return {
		["assetInstance"] = p103.promptRequest.promptInfo.assetInstance,
		["assetType"] = p103.promptRequest.promptInfo.assetType,
		["guid"] = p103.promptRequest.promptInfo.guid,
		["scopes"] = p103.promptRequest.promptInfo.scopes
	}
end, function(p_u_104) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_26
	return {
		["closePrompt"] = function() -- name: closePrompt
			-- upvalues: (copy) p_u_104, (ref) v_u_26
			return p_u_104(v_u_26())
		end
	}
end)(v34)