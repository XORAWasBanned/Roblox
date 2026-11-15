-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.Flags
local v1 = script:FindFirstAncestor("Foundation").Parent
local v2 = require(v1.SafeFlags)
local v3 = v2.createGetFFlag("FoundationFixColorOnScrubbableNumberInput")()
local v4 = v2.createGetFFlag("FoundationAlertLinkWrap")()
local v5
if v4 then
	v5 = v2.createGetFFlag("FoundationAlertStackTrailingOnOverflow")()
else
	v5 = v4
end
local v6 = v2.createGetFFlag("FoundationEducationalTooltipRefresh3")()
local v7 = v2.createGetFFlag("FoundationEducationalTooltipMinMediaWidth3")()
local v8 = v2.createGetFFlag("FoundationSliderCapture")()
local v9 = {
	["FoundationUsePath2DSpinner"] = v2.createGetFFlag("FoundationUsePath2DSpinner")(),
	["FoundationGuiObjectInputSinkProperty"] = v2.createGetFFlag("FoundationGuiObjectInputSinkProperty")(),
	["FoundationDisableTokenScaling"] = v2.createGetFFlag("FoundationDisableTokenScaling2")(),
	["FoundationBaseMenuContentSizing"] = v2.createGetFFlag("FoundationBaseMenuContentSizing")(),
	["FoundationPopoverPluginOverlayMeasurement"] = v2.createGetFFlag("FoundationPopoverPluginOverlayMeasurement2")(),
	["FoundationViewMemoizationChanges"] = v2.createGetFFlag("FoundationViewMemoizationChanges")(),
	["FoundationWidgetManagerSnapshotFlush"] = v2.createGetFFlag("FoundationWidgetManagerSnapshotFlush")(),
	["FoundationSegmentedControlBeta"] = v2.createGetFFlag("FoundationSegmentedControlBeta")(),
	["FoundationTooltipPressedOutside"] = v2.createGetFFlag("FoundationTooltipPressedOutside")(),
	["FoundationListItemDecoupledInput"] = v2.createGetFFlag("FoundationListItemDecoupledInput")(),
	["FoundationPopoverPluginAnchorRefresh"] = v2.createGetFFlag("FoundationPopoverPluginAnchorRefresh")(),
	["FoundationPopoverClickOutsideInGuiShadow"] = v2.createGetFFlag("FoundationPopoverClickOutsideInGuiShadow")(),
	["FoundationPopoverContentAnchorFix"] = v2.createGetFFlag("FoundationPopoverContentAnchorFix")(),
	["FoundationPopoverRecomputeContentSize"] = v2.createGetFFlag("FoundationPopoverRecomputeContentSize")(),
	["FoundationAnimatedHighlightSettling"] = v2.createGetFFlag("FoundationAnimatedHighlightSettling")(),
	["FoundationNumberInputScrubCallbackProps"] = v2.createGetFFlag("FoundationNumberInputScrubCallbackProps2")(),
	["FoundationPopoverPluginFocusable"] = v2.createGetFFlag("FoundationPopoverPluginFocusable")(),
	["FoundationProviderStableEmptyTable"] = v2.createGetFFlag("FoundationProviderStableEmptyTable")(),
	["FoundationPopoverClampMinBound"] = v2.createGetFFlag("FoundationPopoverClampMinBound")(),
	["FoundationFixColorOnScrubbableNumberInput"] = v3,
	["FoundationPluginShadowSize"] = v2.createGetFFlag("FoundationPluginShadowSize")(),
	["FoundationProgressBarBetaUpdate"] = v2.createGetFFlag("FoundationProgressBarBetaUpdate2")(),
	["FoundationCenterSheetHeightFix"] = v2.createGetFFlag("FoundationCenterSheetHeightFix")()
}
if v3 then
	v3 = v2.createGetFFlag("FoundationNumberInputScrubbingUsesOffset")()
end
v9.FoundationNumberInputScrubbingUsesOffset = v3
v9.FoundationSliderCapture = v8
v9.FoundationAlertLinkWrap = v2.createGetFFlag("FoundationAlertLinkWrap")()
if v4 then
	v4 = v2.createGetFFlag("FoundationAlertStackTrailingOnOverflow")()
end
v9.FoundationAlertStackTrailingOnOverflow = v4
v9.FoundationEducationalTooltipMinMediaWidth = v7
v9.FoundationStudioFontFaceMigration = v2.createGetFFlag("FoundationStudioFontFaceMigration")()
v9.FoundationFontFaceMigration = v2.createGetFFlag("FoundationFontFaceMigration3")()
v9.FoundationSheetReversedContent = v2.createGetFFlag("FoundationSheetReversedContent")()
v9.FoundationStatusIndicatorDesignUpdate = v2.createGetFFlag("FoundationStatusIndicatorDesignUpdate")()
v9.FoundationUnifiedScrimScrolling = v2.createGetFFlag("FoundationUnifiedScrimScrolling2")()
v9.FoundationFixChipAccessoryLayout = v2.createGetFFlag("FoundationFixChipAccessoryLayout")()
v9.FoundationRemoveDeprecatedSemanticTokens = v2.createGetFFlag("FoundationRemoveDeprecatedSemanticTokens")()
v9.FoundationBottomSheetOverlayShadow = v2.createGetFFlag("FoundationBottomSheetOverlayShadow")()
v9.FoundationCenterSheetOverlayShadow = v2.createGetFFlag("FoundationCenterSheetOverlayShadow")()
v9.FoundationDialogOverlayShadow = v2.createGetFFlag("FoundationDialogOverlayShadow")()
v9.FoundationPopoverOverlayShadow = v2.createGetFFlag("FoundationPopoverOverlayShadow")()
v9.FoundationFixTabsFitGap = v2.createGetFFlag("FoundationFixTabsFitGap")()
if v8 then
	v8 = v2.createGetFFlag("FoundationSliderRebuild")()
end
v9.FoundationSliderRebuild = v8
if v5 then
	v5 = v2.createGetFFlag("FoundationAlertUseLink")()
end
v9.FoundationAlertUseLink = v5
v9.FoundationBadgeBetaUpdate = v2.createGetFFlag("FoundationBadgeBetaUpdate4")()
v9.FoundationBadgeOverMediaAdaptive = v2.createGetFFlag("FoundationBadgeOverMediaAdaptive")()
v9.FoundationBaseMenuAccessorySizing = v2.createGetFFlag("FoundationBaseMenuAccessorySizing")()
v9.FoundationBottomSheetInternalBackdrop = v2.createGetFFlag("FoundationBottomSheetInternalBackdrop")()
v9.FoundationCenterSheetInternalBackdrop = v2.createGetFFlag("FoundationCenterSheetInternalBackdrop")()
v9.FoundationDevOnlyPropAsserts = v2.createGetFFlag("FoundationDevOnlyPropAsserts")()
v9.FoundationDialogInternalBackdrop = v2.createGetFFlag("FoundationDialogInternalBackdrop")()
if v6 then
	if v7 then
		v7 = v2.createGetFFlag("FoundationEducationalTooltipBodyOnlyContentLayout")()
	end
else
	v7 = v6
end
v9.FoundationEducationalTooltipBodyOnlyContentLayout = v7
v9.FoundationEducationalTooltipRefresh = v6
v9.FoundationSideSheetInternalBackdrop = v2.createGetFFlag("FoundationSideSheetInternalBackdrop")()
v9.FoundationTabsStableOnActivated = v2.createGetFFlag("FoundationTabsStableOnActivated")()
return v9