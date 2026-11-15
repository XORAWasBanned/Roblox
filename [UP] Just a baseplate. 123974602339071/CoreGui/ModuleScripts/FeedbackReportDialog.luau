-- Path: CoreGui.RobloxGui.Modules.Feedback.Components.FeedbackReportDialog
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ExperienceStateCaptureService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = v6.App.Container.VerticalScrollView
local v_u_8 = require(v1.Packages.Signals)
local v_u_9 = require(v1.Workspace.Packages.Display)
local v_u_10 = require(v1.Packages.ReactUtils)
local v11 = script.Parent.Parent
local v_u_12 = require(v11.Resources.Constants)
local v_u_13 = require(v11.Thunks.SendFeedbackThunk)
local v_u_14 = require(v11.Thunks.GetSourceLanguageThunk)
local v_u_15 = require(v11.Actions.SetFeedbackFlowState)
local v_u_16 = require(v11.Actions.SetFeedbackReason)
local v_u_17 = require(v11.Components.TextEntryField)
local v_u_18 = require(v11.Components.ModalDialog)
local v_u_19 = require(v11.Components.PortedComponents.ThemedTextLabel)
local v_u_20 = require(v11.Components.buildImageFeedbackFields)
local v_u_21 = require(v1.Workspace.Packages.Localization).withLocalization
local v_u_22 = v6.App.InputButton.RadioButtonList
local v_u_23 = v6.App.Button.ButtonStack
local v_u_24 = v6.App.Button.Enum.ButtonType
local v_u_25 = v6.App.Text.StyledTextLabel
local v_u_26 = v6.Core.Style.withStyle
local v27 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_28 = require(v27.Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
local v_u_29 = require(v27.Modules.Flags.GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovements)
local v_u_30 = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false)
local v_u_31 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local v32 = v_u_3.PureComponent:extend("FeedbackReportDialog")
local v33 = v5.strictInterface
local v34 = {
	["isReportDialogOpen"] = v5.boolean
}
local v35
if v_u_31 then
	v35 = nil
else
	v35 = v5.Vector2
end
v34.screenSize = v35
v34.closeDialog = v5.optional(v5.callback)
v34.reportCategory = v5.optional(v5.string)
v32.validateProps = v33(v34)
function v32.init(p_u_36) -- name: init
	-- upvalues: (copy) v_u_30, (copy) v_u_2, (copy) v_u_28, (copy) v_u_12, (copy) v_u_20, (copy) v_u_31, (copy) v_u_9, (copy) v_u_8
	if v_u_30 then
		p_u_36.state = {
			["feedbackText"] = "",
			["feedbackOriginalText"] = "",
			["feedbackIdentifier"] = "",
			["correctTranslationText"] = "",
			["additionalCommentsText"] = "",
			["numFeedbackSubmissionAttempts"] = 0,
			["isGenericSelection"] = false,
			["shouldDisplayFeedbackImage"] = false,
			["feedbackImageUri"] = "",
			["feedbackTranslatedImageUri"] = ""
		}
	else
		p_u_36.state = {
			["feedbackText"] = "",
			["feedbackOriginalText"] = "",
			["feedbackIdentifier"] = "",
			["correctTranslationText"] = "",
			["additionalCommentsText"] = "",
			["numFeedbackSubmissionAttempts"] = 0,
			["shouldDisplayFeedbackImage"] = false,
			["feedbackImageUri"] = "",
			["feedbackTranslatedImageUri"] = ""
		}
	end
	function p_u_36.calculateFieldHeight(p37, p38, p39)
		if p37 < 180 and p39 then
			return p38 * 5
		else
			return p38 * (p37 / 45 + 2)
		end
	end
	function p_u_36.resetLocalState()
		-- upvalues: (ref) v_u_30, (copy) p_u_36, (ref) v_u_2
		if v_u_30 then
			p_u_36:setState({
				["isGenericSelection"] = false
			})
		end
		p_u_36:setState({
			["shouldDisplayFeedbackImage"] = false,
			["feedbackImageUri"] = "",
			["feedbackTranslatedImageUri"] = "",
			["correctTranslationText"] = "",
			["additionalCommentsText"] = "",
			["feedbackText"] = "",
			["feedbackOriginalText"] = "",
			["feedbackIdentifier"] = ""
		})
		p_u_36.props.setFeedbackReason(0)
		v_u_2:ResetHighlight()
	end
	function p_u_36.setInstanceRelatedReportDialogState(p40)
		-- upvalues: (copy) p_u_36, (ref) v_u_30, (ref) v_u_28
		if p40:IsA("TextBox") then
			local v41 = p_u_36
			local v42 = {}
			local v43
			if p40.PlaceholderText == "" then
				v43 = p40.Text
			else
				v43 = p40.PlaceholderText
			end
			v42.feedbackText = v43
			v42.feedbackOriginalText = p40.LocalizationMatchedSourceText
			v42.feedbackIdentifier = p40.LocalizationMatchIdentifier
			v41:setState(v42)
			if v_u_30 then
				p_u_36:setState({
					["isGenericSelection"] = false
				})
				return
			end
		elseif p40:IsA("TextLabel") or p40:IsA("TextButton") then
			p_u_36:setState({
				["feedbackText"] = p40.Text,
				["feedbackOriginalText"] = p40.LocalizationMatchedSourceText,
				["feedbackIdentifier"] = p40.LocalizationMatchIdentifier
			})
			if v_u_30 then
				p_u_36:setState({
					["isGenericSelection"] = false
				})
				return
			end
		else
			if p40:IsA("ImageLabel") or p40:IsA("ImageButton") then
				local v44 = p_u_36
				local v45 = {
					["shouldDisplayFeedbackImage"] = true,
					["feedbackImageUri"] = nil,
					["feedbackTranslatedImageUri"] = nil,
					["feedbackImageUri"] = p40.Image
				}
				local v46
				if v_u_28() then
					local v47 = p40.LocalizedImageContent
					v46 = (v47 == nil or v47.SourceType ~= Enum.ContentSourceType.Uri) and "" or v47.Uri
				else
					v46 = ""
				end
				v45.feedbackTranslatedImageUri = v46
				v44:setState(v45)
				return
			end
			if p40:IsA("Decal") then
				local v48 = p_u_36
				local v49 = {
					["shouldDisplayFeedbackImage"] = true,
					["feedbackImageUri"] = nil,
					["feedbackTranslatedImageUri"] = nil,
					["feedbackImageUri"] = p40.Texture
				}
				local v50
				if v_u_28() then
					local v51 = p40.LocalizedTextureContent
					v50 = (v51 == nil or v51.SourceType ~= Enum.ContentSourceType.Uri) and "" or v51.Uri
				else
					v50 = ""
				end
				v49.feedbackTranslatedImageUri = v50
				v48:setState(v49)
				return
			end
			if p40:IsA("MeshPart") then
				if p40.TextureContent.SourceType == Enum.ContentSourceType.Uri then
					p_u_36:setState({
						["shouldDisplayFeedbackImage"] = true,
						["feedbackImageUri"] = nil,
						["feedbackImageUri"] = p40.TextureID
					})
					return
				end
				if p40.MeshContent.SourceType == Enum.ContentSourceType.Uri then
					p_u_36:setState({
						["shouldDisplayFeedbackImage"] = true,
						["feedbackImageUri"] = nil,
						["feedbackImageUri"] = p40.MeshId
					})
					return
				end
				local v52 = p40:FindFirstChildOfClass("SurfaceAppearance")
				if v52 and v52.ColorMap then
					p_u_36:setState({
						["shouldDisplayFeedbackImage"] = true,
						["feedbackImageUri"] = nil,
						["feedbackImageUri"] = v52.ColorMap
					})
					return
				end
			elseif v_u_30 then
				p_u_36:setState({
					["feedbackText"] = nil,
					["feedbackOriginalText"] = nil,
					["feedbackIdentifier"] = "",
					["isGenericSelection"] = true,
					["feedbackText"] = p40.ClassName,
					["feedbackOriginalText"] = p40.ClassName
				})
			end
		end
	end
	v_u_2.ItemSelectedInCaptureMode:Connect(function(p53)
		-- upvalues: (copy) p_u_36, (ref) v_u_12
		p_u_36.resetLocalState()
		p_u_36.setInstanceRelatedReportDialogState(p53)
		p_u_36.props.setFeedbackFlowState(v_u_12.State.CurrentlyLeavingFeedback)
	end)
	function p_u_36.onCorrectTranslationTextChanged(p54)
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["correctTranslationText"] = p54
		})
	end
	function p_u_36.onAdditionalCommentsTextChanged(p55)
		-- upvalues: (copy) p_u_36
		p_u_36:setState({
			["additionalCommentsText"] = p55
		})
	end
	function p_u_36.onSubmitFeedback()
		-- upvalues: (copy) p_u_36, (ref) v_u_12, (ref) v_u_28, (ref) v_u_20
		p_u_36:setState({
			["numFeedbackSubmissionAttempts"] = p_u_36.state.numFeedbackSubmissionAttempts + 1
		})
		local v56 = v_u_12.ContentType.Text
		local v57 = p_u_36.state.feedbackOriginalText
		local v58 = p_u_36.state.feedbackText
		local v59 = p_u_36.state.feedbackIdentifier
		if v_u_28() and p_u_36.state.shouldDisplayFeedbackImage then
			local v60 = v_u_20(game.GameId, p_u_36.state.feedbackImageUri, p_u_36.state.feedbackTranslatedImageUri)
			if not v60 then
				p_u_36.props.setFeedbackFlowState(v_u_12.State.Default)
				p_u_36.resetLocalState()
				return
			end
			v57 = v60.source
			v56 = v_u_12.ContentType.Image
			v59 = v60.identifier
			v58 = v60.translation
		end
		p_u_36.props.sendFeedback(v56, v57, v58, v59, p_u_36.state.correctTranslationText, p_u_36.state.additionalCommentsText, p_u_36.props.feedbackReason, p_u_36.state.numFeedbackSubmissionAttempts)
		p_u_36.props.setFeedbackFlowState(v_u_12.State.Default)
		p_u_36.resetLocalState()
	end
	function p_u_36.onCancel()
		-- upvalues: (copy) p_u_36, (ref) v_u_12
		p_u_36.props.setFeedbackFlowState(v_u_12.State.Default)
		p_u_36.resetLocalState()
	end
	if v_u_31 then
		local v_u_61 = v_u_9.GetDisplayStore(false).getViewportSize
		p_u_36.disposeScreenSize = v_u_8.createEffect(function(p62)
			-- upvalues: (copy) p_u_36, (copy) v_u_61
			p_u_36:setState({
				["screenSize"] = v_u_61(p62)
			})
		end)
	end
end
function v32.renderContents(p_u_63, p_u_64) -- name: renderContents
	-- upvalues: (copy) v_u_26, (copy) v_u_28, (copy) v_u_29, (copy) v_u_10, (copy) v_u_3, (copy) v_u_25, (copy) v_u_19, (copy) v_u_30, (copy) v_u_17, (copy) v_u_22
	return v_u_26(function(p65)
		-- upvalues: (copy) p_u_63, (copy) p_u_64, (ref) v_u_28, (ref) v_u_29, (ref) v_u_10, (ref) v_u_3, (ref) v_u_25, (ref) v_u_19, (ref) v_u_30, (ref) v_u_17, (ref) v_u_22
		local v66 = p65.Theme
		local v67 = p65.Font
		local v68 = not (p_u_63.state.shouldDisplayFeedbackImage or p_u_63.state.isGenericSelection)
		if v68 then
			if p_u_63.state.feedbackOriginalText == nil then
				v68 = false
			else
				v68 = p_u_63.state.feedbackOriginalText ~= ""
			end
		end
		local v69 = {
			p_u_64.untranslated,
			p_u_64.accuracyIssue,
			p_u_64.spellingOrGrammarIssue,
			p_u_64.inappropriateOrDerogatory
		}
		if v_u_28() and p_u_63.state.shouldDisplayFeedbackImage then
			local v70 = p_u_64.imageQuality
			table.insert(v69, v70)
		end
		local v71
		if v_u_29() then
			local v72 = v_u_10.createNextOrder()
			v71 = {
				["SelectedTextHeader"] = v72(),
				["SelectedTextLabel"] = v72(),
				["OriginalTextHeader"] = v72(),
				["OriginalTextLabel"] = v72(),
				["CorrectTranslationHeader"] = v72(),
				["CorrectTranslationTextEntryField"] = v72(),
				["TranslationProblemsHeader"] = v72(),
				["TranslationProblemsListFrame"] = v72(),
				["AdditionalCommentsHeader"] = v72(),
				["AdditionalCommentsTextEntryField"] = v72()
			}
		else
			v71 = {
				["SelectedTextHeader"] = 1,
				["SelectedTextLabel"] = 2,
				["TranslationProblemsHeader"] = 3,
				["TranslationProblemsListFrame"] = 4,
				["CorrectTranslationHeader"] = 5,
				["CorrectTranslationTextEntryField"] = 6,
				["AdditionalCommentsHeader"] = 7,
				["AdditionalCommentsTextEntryField"] = 8
			}
		end
		local v73 = v_u_3.createFragment
		local v74 = {
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top
			})
		}
		local v75 = v_u_3.createElement
		local v76 = v_u_25
		local v77 = {
			["text"] = nil,
			["size"] = nil,
			["textTruncate"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["richText"] = true,
			["layoutOrder"] = nil,
			["fluidSizing"] = true,
			["automaticSize"] = nil
		}
		local v78
		if p_u_63.state.shouldDisplayFeedbackImage then
			v78 = p_u_64.imageSelectionHeader
		else
			v78 = p_u_64.textSelectionHeader
		end
		v77.text = v78
		v77.size = UDim2.new(1, 0, 0, 72)
		v77.textTruncate = Enum.TextTruncate.AtEnd
		v77.textXAlignment = Enum.TextXAlignment.Left
		v77.textYAlignment = Enum.TextYAlignment.Center
		v77.fontStyle = v67.Header2
		v77.colorStyle = v66.TextEmphasis
		v77.layoutOrder = v71.SelectedTextHeader
		v77.automaticSize = Enum.AutomaticSize.X
		v74.SelectedTextHeader = v75(v76, v77)
		local v79
		if p_u_63.state.shouldDisplayFeedbackImage then
			local v80 = v_u_3.createElement
			local v81 = "ImageLabel"
			local v82 = {
				["LayoutOrder"] = nil,
				["Size"] = nil,
				["Image"] = nil,
				["ScaleType"] = nil,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = v71.SelectedTextLabel,
				["Size"] = UDim2.new(1, 0, 0, 72)
			}
			local v83
			if p_u_63.state.feedbackTranslatedImageUri == nil or p_u_63.state.feedbackTranslatedImageUri == "" then
				v83 = p_u_63.state.feedbackImageUri
			else
				v83 = p_u_63.state.feedbackTranslatedImageUri
			end
			v82.Image = v83
			v82.ScaleType = Enum.ScaleType.Fit
			v79 = v80(v81, v82)
		else
			local v84 = v_u_3.createElement
			local v85 = v_u_19
			local v86 = {
				["LayoutOrder"] = nil,
				["fontKey"] = "Body",
				["themeKey"] = "TextDefault",
				["Size"] = nil,
				["Text"] = nil,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["LayoutOrder"] = v71.SelectedTextLabel
			}
			local v87 = UDim2.new
			local v88 = p_u_63.calculateFieldHeight
			local v89 = p_u_63.state.feedbackText
			v86.Size = v87(1, 0, 0, v88(string.len(v89), 14, false))
			local v90
			if v_u_30 then
				local v91
				if p_u_63.state.isGenericSelection then
					v91 = p_u_64.genericSelectionWrapper
				else
					v91 = p_u_63.state.feedbackText
				end
				v90 = v91 or ""
			else
				v90 = p_u_63.state.feedbackText or ""
			end
			v86.Text = v90
			v86.TextXAlignment = Enum.TextXAlignment.Left
			v79 = v84(v85, v86)
		end
		v74.SelectedTextLabel = v79
		local v92
		if v_u_29() and v68 then
			v92 = v_u_3.createElement(v_u_25, {
				["text"] = nil,
				["size"] = nil,
				["textTruncate"] = nil,
				["textXAlignment"] = nil,
				["textYAlignment"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["richText"] = true,
				["layoutOrder"] = nil,
				["fluidSizing"] = true,
				["automaticSize"] = nil,
				["text"] = p_u_64.originalTextHeader,
				["size"] = UDim2.new(1, 0, 0, 72),
				["textTruncate"] = Enum.TextTruncate.AtEnd,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["textYAlignment"] = Enum.TextYAlignment.Center,
				["fontStyle"] = v67.Header2,
				["colorStyle"] = v66.TextEmphasis,
				["layoutOrder"] = v71.OriginalTextHeader,
				["automaticSize"] = Enum.AutomaticSize.X
			})
		else
			v92 = nil
		end
		v74.OriginalTextHeader = v92
		local v93
		if v_u_29() and v68 then
			local v94 = v_u_3.createElement
			local v95 = v_u_19
			local v96 = {
				["LayoutOrder"] = nil,
				["fontKey"] = "Body",
				["themeKey"] = "TextDefault",
				["Size"] = nil,
				["Text"] = nil,
				["TextWrapped"] = true,
				["TextXAlignment"] = nil,
				["LayoutOrder"] = v71.OriginalTextLabel
			}
			local v97 = UDim2.new
			local v98 = p_u_63.calculateFieldHeight
			local v99 = p_u_63.state.feedbackOriginalText
			v96.Size = v97(1, 0, 0, v98(string.len(v99), 14, false))
			v96.Text = p_u_63.state.feedbackOriginalText or ""
			v96.TextXAlignment = Enum.TextXAlignment.Left
			v93 = v94(v95, v96)
		else
			v93 = nil
		end
		v74.OriginalTextLabel = v93
		v74.CorrectTranslationHeader = v_u_3.createElement(v_u_25, {
			["text"] = nil,
			["size"] = nil,
			["textTruncate"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["richText"] = true,
			["layoutOrder"] = nil,
			["fluidSizing"] = true,
			["automaticSize"] = nil,
			["text"] = p_u_64.correctTranslationHeader,
			["size"] = UDim2.new(1, 0, 0, 72),
			["textTruncate"] = Enum.TextTruncate.AtEnd,
			["textXAlignment"] = Enum.TextXAlignment.Left,
			["textYAlignment"] = Enum.TextYAlignment.Center,
			["fontStyle"] = v67.Header2,
			["colorStyle"] = v66.TextEmphasis,
			["layoutOrder"] = v71.CorrectTranslationHeader,
			["automaticSize"] = Enum.AutomaticSize.X
		})
		local v100 = v_u_3.createElement
		local v101 = v_u_17
		local v102 = {
			["LayoutOrder"] = nil,
			["enabled"] = true,
			["text"] = nil,
			["textChanged"] = nil,
			["maxTextLength"] = nil,
			["autoFocusOnEnabled"] = false,
			["PlaceholderText"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = v71.CorrectTranslationTextEntryField,
			["text"] = p_u_63.state.correctTranslationText,
			["textChanged"] = p_u_63.onCorrectTranslationTextChanged
		}
		local v103 = p_u_63.state.correctTranslationText
		local v104 = string.len(v103)
		v102.maxTextLength = math.max(v104, 180)
		v102.PlaceholderText = p_u_64.correctTranslationPlaceholder
		local v105 = UDim2.new
		local v106 = p_u_63.calculateFieldHeight
		local v107 = p_u_63.state.correctTranslationText
		v102.Size = v105(1, 0, 0, v106(string.len(v107), 14, true))
		v74.CorrectTranslationTextEntryField = v100(v101, v102)
		v74.TranslationProblemsHeader = v_u_3.createElement(v_u_25, {
			["text"] = nil,
			["size"] = nil,
			["textTruncate"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["richText"] = true,
			["layoutOrder"] = nil,
			["fluidSizing"] = true,
			["automaticSize"] = nil,
			["text"] = p_u_64.problemDropdownSelectionHeader,
			["size"] = UDim2.new(1, 0, 0, 72),
			["textTruncate"] = Enum.TextTruncate.AtEnd,
			["textXAlignment"] = Enum.TextXAlignment.Left,
			["textYAlignment"] = Enum.TextYAlignment.Center,
			["fontStyle"] = v67.Header2,
			["colorStyle"] = v66.TextEmphasis,
			["layoutOrder"] = v71.TranslationProblemsHeader,
			["automaticSize"] = Enum.AutomaticSize.X
		})
		v74.TranslationProblemsListFrame = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, #v69 * 40),
			["LayoutOrder"] = v71.TranslationProblemsListFrame
		}, {
			["RadioButtonList"] = v_u_3.createElement(v_u_22, {
				["radioButtons"] = v69,
				["onActivated"] = function(p108) -- name: onActivated
					-- upvalues: (ref) p_u_63
					p_u_63.props.setFeedbackReason(p108)
				end,
				["currentValue"] = p_u_63.props.feedbackReason,
				["elementSize"] = UDim2.new(1, 0, 0, 40)
			})
		})
		v74.AdditionalCommentsHeader = v_u_3.createElement(v_u_25, {
			["text"] = nil,
			["size"] = nil,
			["textTruncate"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["richText"] = true,
			["layoutOrder"] = nil,
			["fluidSizing"] = true,
			["automaticSize"] = nil,
			["text"] = p_u_64.additionalCommentsHeader,
			["size"] = UDim2.new(1, 0, 0, 72),
			["textTruncate"] = Enum.TextTruncate.AtEnd,
			["textXAlignment"] = Enum.TextXAlignment.Left,
			["textYAlignment"] = Enum.TextYAlignment.Center,
			["fontStyle"] = v67.Header2,
			["colorStyle"] = v66.TextEmphasis,
			["layoutOrder"] = v71.AdditionalCommentsHeader,
			["automaticSize"] = Enum.AutomaticSize.X
		})
		v74.AdditionalCommentsTextEntryField = v_u_3.createElement(v_u_17, {
			["LayoutOrder"] = nil,
			["enabled"] = true,
			["text"] = nil,
			["textChanged"] = nil,
			["maxTextLength"] = 180,
			["autoFocusOnEnabled"] = false,
			["PlaceholderText"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = v71.AdditionalCommentsTextEntryField,
			["text"] = p_u_63.state.additionalCommentsText,
			["textChanged"] = p_u_63.onAdditionalCommentsTextChanged,
			["PlaceholderText"] = p_u_64.additionalCommentsPlaceholder,
			["Size"] = UDim2.new(1, 0, 0, 90)
		})
		return v73(v74)
	end)
end
function v32.render(p_u_109) -- name: render
	-- upvalues: (copy) v_u_29, (copy) v_u_21, (copy) v_u_3, (copy) v_u_18, (copy) v_u_12, (copy) v_u_31, (copy) v_u_7, (copy) v_u_28, (copy) v_u_23, (copy) v_u_24
	local v110 = {
		["mainHeader"] = "CoreScripts.Feedback.FeedbackReportDialog.MainHeader",
		["cancel"] = "CoreScripts.Feedback.FeedbackReportDialog.Cancel",
		["submitFeedback"] = "CoreScripts.Feedback.FeedbackReportDialog.SubmitFeedback",
		["untranslated"] = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.Untranslated",
		["accuracyIssue"] = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.AccuracyIssue",
		["spellingOrGrammarIssue"] = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.SpellingOrGrammarIssue",
		["inappropriateOrDerogatory"] = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.InappropriateOrDerogatory",
		["imageQuality"] = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.ImageQuality",
		["textSelectionHeader"] = "CoreScripts.Feedback.FeedbackReportDialog.TextSelectionHeader",
		["correctTranslationHeader"] = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationHeader",
		["correctTranslationPlaceholder"] = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationPlaceholder",
		["additionalCommentsHeader"] = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsHeader",
		["additionalCommentsPlaceholder"] = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsPlaceholder",
		["problemDropdownSelectionHeader"] = "CoreScripts.Feedback.FeedbackReportDialog.ProblemDropdownSelectionHeader",
		["genericSelectionWrapper"] = nil,
		["imageSelectionHeader"] = "CoreScripts.Feedback.FeedbackReportDialog.ImageSelectionHeader",
		["genericSelectionWrapper"] = {
			"CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationObjectPlaceholder",
			["ObjectType"] = p_u_109.state.feedbackText
		}
	}
	if v_u_29() then
		v110.originalTextHeader = {
			"CoreScripts.Feedback.FeedbackReportDialog.OriginalTextHeader",
			["SourceLanguage"] = p_u_109.props.sourceLanguageName
		}
	end
	return v_u_21(v110)(function(p111)
		-- upvalues: (ref) v_u_3, (ref) v_u_18, (copy) p_u_109, (ref) v_u_12, (ref) v_u_31, (ref) v_u_7, (ref) v_u_29, (ref) v_u_28, (ref) v_u_23, (ref) v_u_24
		local v112 = v_u_3.createElement
		local v113 = v_u_18
		local v114 = {
			["visible"] = nil,
			["screenSize"] = nil,
			["titleText"] = nil,
			["showCloseButton"] = true,
			["contents"] = nil,
			["actionButtons"] = nil,
			["onDismiss"] = nil,
			["onBackButtonActivated"] = nil,
			["visible"] = p_u_109.props.feedbackFlowState == v_u_12.State.CurrentlyLeavingFeedback
		}
		local v115
		if v_u_31 then
			v115 = p_u_109.state.screenSize
		else
			v115 = p_u_109.props.screenSize
		end
		v114.screenSize = v115
		v114.titleText = p111.mainHeader
		local v116 = v_u_3.createElement
		local v117 = v_u_7
		local v118 = {
			["useAutomaticCanvasSize"] = false,
			["canvasSizeY"] = nil
		}
		local v119
		if v_u_29() then
			local v120 = UDim.new
			local v121 = p_u_109.calculateFieldHeight
			local v122 = p_u_109.state.feedbackText
			local v123 = 600 + v121(string.len(v122), 14, false) * 2 + 72
			local v124 = p_u_109.calculateFieldHeight
			local v125 = p_u_109.state.feedbackOriginalText
			v119 = v120(0, v123 + v124(string.len(v125), 14, false) + (v_u_28() and p_u_109.state.shouldDisplayFeedbackImage and 40 or 0))
		else
			local v126 = UDim.new
			local v127 = p_u_109.calculateFieldHeight
			local v128 = p_u_109.state.feedbackText
			v119 = v126(0, 600 + v127(string.len(v128), 14, false) * 2 + (v_u_28() and p_u_109.state.shouldDisplayFeedbackImage and 40 or 0))
		end
		v118.canvasSizeY = v119
		v114.contents = v116(v117, v118, v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 1)
		}, {
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 24),
				["PaddingRight"] = UDim.new(0, 24)
			}),
			["Contents"] = p_u_109:renderContents(p111)
		}))
		local v129 = v_u_3.createElement
		local v130 = v_u_23
		local v131 = {
			["buttonHeight"] = 36,
			["buttons"] = nil
		}
		local v132 = {}
		local v133 = {
			["buttonType"] = v_u_24.Secondary,
			["props"] = {
				["onActivated"] = p_u_109.onCancel,
				["text"] = p111.cancel
			}
		}
		local v134 = {
			["buttonType"] = v_u_24.PrimarySystem
		}
		local v135 = {}
		local v136
		if v_u_29() then
			v136 = p_u_109.state.correctTranslationText:match("%S") == nil
		else
			v136 = false
		end
		v135.isDisabled = v136
		v135.onActivated = p_u_109.onSubmitFeedback
		v135.text = p111.submitFeedback
		v134.props = v135
		__set_list(v132, 1, {v133, v134})
		v131.buttons = v132
		v114.actionButtons = v129(v130, v131)
		v114.onDismiss = p_u_109.onCancel
		local v137
		if p_u_109.props.canNavigateBack then
			v137 = p_u_109.navigateBack
		else
			v137 = nil
		end
		v114.onBackButtonActivated = v137
		return v112(v113, v114)
	end)
end
function v32.didMount(p138) -- name: didMount
	-- upvalues: (copy) v_u_29
	if v_u_29() and p138.props.sourceLanguageName == "" then
		p138.props.getSourceLanguageName()
	end
end
function v32.willUnmount(p139) -- name: willUnmount
	-- upvalues: (copy) v_u_31
	if v_u_31 then
		p139.disposeScreenSize()
	end
end
return v4.connect(function(p140)
	-- upvalues: (copy) v_u_31, (copy) v_u_29
	local v141 = {}
	local v142
	if v_u_31 then
		v142 = nil
	else
		v142 = p140.displayOptions.screenSize
	end
	v141.screenSize = v142
	v141.feedbackFlowState = p140.feedbackFlowState.feedbackFlowState
	v141.feedbackReason = p140.feedbackFlowState.feedbackReason
	local v143
	if v_u_29() then
		v143 = p140.common.sourceLanguageName
	else
		v143 = nil
	end
	v141.sourceLanguageName = v143
	return v141
end, function(p_u_144)
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_16, (copy) v_u_29, (copy) v_u_14
	return {
		["sendFeedback"] = function(p145, p146, p147, p148, p149, p150, p151, p152) -- name: sendFeedback
			-- upvalues: (copy) p_u_144, (ref) v_u_13
			p_u_144(v_u_13(p145, p146, p147, p148, p149, p150, p151, p152))
		end,
		["setFeedbackFlowState"] = function(p_u_153) -- name: setFeedbackFlowState
			-- upvalues: (copy) p_u_144, (ref) v_u_15
			p_u_144(function(p154)
				-- upvalues: (ref) v_u_15, (copy) p_u_153
				p154:dispatch(v_u_15(p_u_153))
			end)
		end,
		["setFeedbackReason"] = function(p_u_155) -- name: setFeedbackReason
			-- upvalues: (copy) p_u_144, (ref) v_u_16
			p_u_144(function(p156)
				-- upvalues: (ref) v_u_16, (copy) p_u_155
				p156:dispatch(v_u_16(p_u_155))
			end)
		end,
		["getSourceLanguageName"] = function() -- name: getSourceLanguageName
			-- upvalues: (ref) v_u_29, (copy) p_u_144, (ref) v_u_14
			if v_u_29() then
				p_u_144(v_u_14())
			end
		end
	}
end)(v32)