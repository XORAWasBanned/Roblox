-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.SheetContext
local v1 = script:FindFirstAncestor("Foundation").Parent
local v2 = require(v1.React)
require(script.Parent.SheetType)
return v2.createContext({
	["sheetHeightAvailable"] = nil,
	["setSheetHeightAvailable"] = nil,
	["actionsHeight"] = nil,
	["setActionsHeight"] = nil,
	["hasActionsDivider"] = nil,
	["setHasActionsDivider"] = nil,
	["sheetContentHeight"] = nil,
	["setSheetContentHeight"] = nil,
	["safeAreaPadding"] = nil,
	["bottomPadding"] = nil,
	["innerScrollingEnabled"] = nil,
	["innerScrollY"] = nil,
	["innerScrollingRef"] = nil,
	["setInnerScrollY"] = nil,
	["hasHeader"] = nil,
	["setHasHeader"] = nil,
	["hasFullBleed"] = false,
	["fullBleedHeight"] = nil,
	["setFullBleedHeight"] = nil,
	["hasRadius"] = true,
	["closeSheet"] = nil,
	["sheetType"] = nil,
	["innerSurface"] = nil,
	["testId"] = nil,
	["closeAffordanceRef"] = nil,
	["contentStartRef"] = nil,
	["setContentStartRef"] = nil,
	["isVerticalSheetGesture"] = nil,
	["contentRevealOffset"] = nil,
	["setIsContentReversed"] = nil,
	["setSheetHeightAvailable"] = function(_) -- name: setSheetHeightAvailable
		error("No SheetContext available")
	end,
	["setActionsHeight"] = function(_) -- name: setActionsHeight
		error("No SheetContext available")
	end,
	["setHasActionsDivider"] = function(_) -- name: setHasActionsDivider
		error("No SheetContext available")
	end,
	["setSheetContentHeight"] = function(_) -- name: setSheetContentHeight
		error("No SheetContext available")
	end,
	["setInnerScrollY"] = function(_) -- name: setInnerScrollY
		error("No SheetContext available")
	end,
	["setHasHeader"] = function(_) -- name: setHasHeader
		error("No SheetContext available")
	end,
	["setFullBleedHeight"] = function(_) -- name: setFullBleedHeight
		error("No SheetContext available")
	end,
	["setContentStartRef"] = function(_) -- name: setContentStartRef end
})