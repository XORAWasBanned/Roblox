-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.withGuiObjectProps
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
require(v1.Components.Types)
local v5 = require(v1.Utility.Flags)
local v_u_6 = require(v1.Utility.getTestIdTag)
local v_u_7 = require(v1.Utility.indexBindable)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = v5.FoundationGuiObjectInputSinkProperty
if v_u_9 then
	local v10 = game.GetEngineFeature
	local v11 = game
	v_u_9 = pcall(v10, v11, "GuiObjectInputSink")
end
return function(p12, p13) -- name: withGuiObjectProps
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6
	if type(p13) == "table" then
		p13.AutoLocalize = p12.AutoLocalize
		p13.AutomaticSize = p12.AutomaticSize
		local v14
		if p12.backgroundStyle then
			v14 = v_u_7(p12.backgroundStyle, "Color3")
		else
			v14 = nil
		end
		p13.BackgroundColor3 = v14
		local v15
		if p12.backgroundStyle then
			v15 = v_u_7(p12.backgroundStyle, "Transparency")
		else
			v15 = nil
		end
		p13.BackgroundTransparency = v15
		p13.BorderSizePixel = p12.BorderSizePixel
		p13.BorderColor3 = p12.BorderColor3
		p13.BorderMode = p12.BorderMode
		p13.ClipsDescendants = p12.ClipsDescendants
		if v_u_9 then
			p13.InputSink = p12.InputSink
		end
		p13.Rotation = p12.Rotation
		p13.SizeConstraint = p12.SizeConstraint
		if p12.selection then
			p13.Selectable = p12.selection.Selectable
			p13.SelectionImageObject = p12.selection.SelectionImageObject
			p13.SelectionOrder = p12.selection.SelectionOrder
			p13.NextSelectionDown = p12.selection.NextSelectionDown
			p13.NextSelectionLeft = p12.selection.NextSelectionLeft
			p13.NextSelectionRight = p12.selection.NextSelectionRight
			p13.NextSelectionUp = p12.selection.NextSelectionUp
		end
		if p12.selectionGroup ~= nil then
			local v16 = p12.selectionGroup
			if type(v16) == "boolean" or v_u_4.isBinding(p12.selectionGroup) then
				p13.SelectionGroup = p12.selectionGroup
			else
				local v17 = p12.selectionGroup
				p13.SelectionGroup = true
				p13.SelectionBehaviorUp = v17.SelectionBehaviorUp
				p13.SelectionBehaviorDown = v17.SelectionBehaviorDown
				p13.SelectionBehaviorLeft = v17.SelectionBehaviorLeft
				p13.SelectionBehaviorRight = v17.SelectionBehaviorRight
			end
		end
		p13.Size = p12.Size
	end
	local v18 = v_u_8(p12, p13)
	v18[v_u_3.Change.AbsoluteSize] = p12.onAbsoluteSizeChanged
	v18.onAbsoluteSizeChanged = nil
	v18[v_u_3.Change.AbsolutePosition] = p12.onAbsolutePositionChanged
	v18.onAbsolutePositionChanged = nil
	local v19 = v_u_6(v18.testId)
	if v18[v_u_3.Tag] and v19 then
		local v20 = v_u_3.Tag
		v18[v20] = v18[v20] .. " " .. v19
	else
		v18[v_u_3.Tag] = v18[v_u_3.Tag] or v19
	end
	v18.testId = nil
	return v18
end