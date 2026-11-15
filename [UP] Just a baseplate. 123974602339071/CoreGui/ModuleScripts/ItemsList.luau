-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.ItemsList
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v1.Packages.RoactGamepad)
local v5 = require(v1.Packages.RoactRodux)
local v6 = require(v1.Packages.t)
local v7 = require(v1.Packages.UIBlox)
local v_u_8 = require(v1.Packages.Foundation).Skeleton
local v_u_9 = v7.App.Container.VerticalScrollViewWithMargin
local v_u_10 = v7.Style.withStyle
local v_u_11 = v7.App.Indicator.EmptyState
local v_u_12 = require(script.ListSection)
local v13 = script.Parent.Parent
local v_u_14 = require(v13.GetAssetsDifference)
local v_u_15 = require(v13.Actions.AddAnalyticsInfo)
v2:WaitForChild("RobloxGui")
local v_u_16 = require(v1.Workspace.Packages.RobloxTranslator)
local v17 = v_u_3.PureComponent:extend("ItemsList")
v17.validateProps = v6.strictInterface({
	["humanoidDescription"] = v6.optional(v6.instanceOf("HumanoidDescription")),
	["loadingFailed"] = v6.boolean,
	["retryLoadDescription"] = v6.callback,
	["itemListScrollableUpdated"] = v6.optional(v6.callback),
	["addAnalyticsInfo"] = v6.callback
})
function v17.init(p_u_18) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_14
	p_u_18:setState({
		["canvasSizeY"] = 0,
		["loading"] = true,
		["addedAssetNames"] = nil,
		["removedAssetNames"] = nil
	})
	p_u_18.mounted = false
	p_u_18.frameRef = v_u_3.createRef()
	local v19, v20 = v_u_3.createBinding(false)
	p_u_18.topGradientVisibleBinding = v19
	p_u_18.updateTopGradientVisibleBinding = v20
	local v21, v22 = v_u_3.createBinding(false)
	p_u_18.bottomGradientVisibleBinding = v21
	p_u_18.updateBottomGradientVisibleBinding = v22
	p_u_18.addedSectionRef = v_u_3.createRef()
	p_u_18.removedSectionRef = v_u_3.createRef()
	p_u_18.noChangedAssetsRef = v_u_3.createRef()
	p_u_18.lastWasScrollable = nil
	function p_u_18.checkIsScrollable()
		-- upvalues: (copy) p_u_18
		local v23 = p_u_18.frameRef:getValue()
		if v23 then
			if p_u_18.props.itemListScrollableUpdated then
				local v24 = p_u_18.state.canvasSizeY > v23.AbsoluteSize.Y
				if v24 ~= p_u_18.lastWasScrollable then
					p_u_18.lastWasScrollable = v24
					p_u_18.props.itemListScrollableUpdated(v24, v23.AbsoluteSize.Y)
				end
			end
		else
			return
		end
	end
	function p_u_18.onContentSizeChanged(p25)
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["canvasSizeY"] = p25.AbsoluteContentSize.Y
		})
	end
	function p_u_18.firstEntryPositionChanged(p26)
		-- upvalues: (copy) p_u_18
		local v27 = p_u_18.frameRef:getValue()
		if v27 then
			if p26.AbsolutePosition.Y < v27.AbsolutePosition.Y then
				p_u_18.updateTopGradientVisibleBinding(true)
			else
				p_u_18.updateTopGradientVisibleBinding(false)
			end
		else
			return
		end
	end
	function p_u_18.lastEntryPositionChanged(p28)
		-- upvalues: (copy) p_u_18
		local v29 = p_u_18.frameRef:getValue()
		if v29 then
			if p28.AbsolutePosition.Y + p28.AbsoluteSize.Y > v29.AbsolutePosition.Y + v29.AbsoluteSize.Y then
				p_u_18.updateBottomGradientVisibleBinding(true)
			else
				p_u_18.updateBottomGradientVisibleBinding(false)
			end
		else
			return
		end
	end
	function p_u_18.loadAssetNames()
		-- upvalues: (ref) v_u_14, (copy) p_u_18
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_14, (ref) p_u_18
			v_u_14(p_u_18.props.humanoidDescription):andThen(function(p30)
				-- upvalues: (ref) p_u_18
				if p_u_18.mounted then
					p_u_18.props.addAnalyticsInfo(p30.addedAssetIds, p30.removedAssetIds)
					p_u_18:setState({
						["loading"] = false,
						["addedAssetNames"] = nil,
						["removedAssetNames"] = nil,
						["addedAssetNames"] = p30.addedNames,
						["removedAssetNames"] = p30.removedNames
					})
				end
			end, function(_)
				-- upvalues: (ref) p_u_18
				if p_u_18.mounted then
					p_u_18:setState({
						["loading"] = false
					})
				end
			end)
		end)()
	end
	function p_u_18.onRetryLoading()
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["loading"] = true
		})
		if p_u_18.props.humanoidDescription then
			p_u_18.loadAssetNames()
		else
			p_u_18.props.retryLoadDescription()
		end
	end
end
function v17.createEntriesList(p31) -- name: createEntriesList
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_4, (copy) v_u_12
	local v32 = {}
	if #p31.state.addedAssetNames > 0 then
		local v33 = v_u_16:FormatByKey("CoreScripts.AvatarEditorPrompts.Adding")
		local v34 = v_u_3.createElement
		local v35 = v_u_4.Focusable[v_u_12]
		local v36 = {
			["headerText"] = v33,
			["items"] = p31.state.addedAssetNames,
			["layoutOrder"] = 1,
			["isFirstSection"] = true,
			["isLastSection"] = #p31.state.removedAssetNames == 0,
			["NextSelectionDown"] = p31.removedSectionRef,
			[v_u_3.Ref] = p31.addedSectionRef
		}
		table.insert(v32, v34(v35, v36))
		if #p31.state.removedAssetNames > 0 then
			local v37 = v_u_3.createElement
			local v38 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0, 20)
			}
			table.insert(v32, v37("Frame", v38))
		end
	end
	if #p31.state.removedAssetNames > 0 then
		local v39 = v_u_16:FormatByKey("CoreScripts.AvatarEditorPrompts.Removing")
		local v40 = v_u_3.createElement
		local v41 = v_u_4.Focusable[v_u_12]
		local v42 = {
			["headerText"] = v39,
			["items"] = p31.state.removedAssetNames,
			["layoutOrder"] = 3,
			["isFirstSection"] = #p31.state.addedAssetNames == 0,
			["isLastSection"] = true,
			["NextSelectionUp"] = p31.addedSectionRef,
			[v_u_3.Ref] = p31.removedSectionRef
		}
		table.insert(v32, v40(v41, v42))
	end
	local v43
	if #p31.state.addedAssetNames == 0 then
		v43 = #p31.state.removedAssetNames == 0
	else
		v43 = false
	end
	if v43 then
		local v44 = v_u_16:FormatByKey("CoreScripts.AvatarEditorPrompts.NoChangedAssets")
		local v45 = v_u_3.createElement
		local v46 = v_u_4.Focusable[v_u_12]
		local v47 = {
			["headerText"] = v44,
			["items"] = {},
			["layoutOrder"] = 1,
			["isFirstSection"] = true,
			["isLastSection"] = true,
			[v_u_3.Ref] = p31.noChangedAssetsRef
		}
		table.insert(v32, v45(v46, v47))
	end
	return v32
end
function v17.renderItemsList(p_u_48) -- name: renderItemsList
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_4, (copy) v_u_9
	return v_u_10(function(p49)
		-- upvalues: (copy) p_u_48, (ref) v_u_3, (ref) v_u_4, (ref) v_u_9
		local v50 = p49.Theme
		local v51 = p_u_48:createEntriesList()
		v51.Layout = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["Padding"] = UDim.new(0, 10),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			[v_u_3.Change.AbsoluteContentSize] = p_u_48.onContentSizeChanged
		})
		local v52 = v_u_3.createElement
		local v53 = v_u_4.Focusable.Frame
		local v54 = {
			["defaultChild"] = p_u_48.addedSectionRef,
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundTransparency"] = 1,
			[v_u_3.Ref] = p_u_48.frameRef
		}
		local v55 = {}
		local v56 = v_u_3.createElement
		local v57 = {
			["Visible"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Visible"] = p_u_48.topGradientVisibleBinding,
			["Size"] = UDim2.new(1, 0, 0, 30),
			["Position"] = UDim2.fromScale(0, 0),
			["BackgroundColor3"] = Color3.new(1, 1, 1)
		}
		local v58 = {
			["UIGradient"] = v_u_3.createElement("UIGradient", {
				["Rotation"] = 90,
				["Color"] = nil,
				["Transparency"] = nil,
				["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v50.BackgroundUIDefault.Color), ColorSequenceKeypoint.new(1, v50.BackgroundUIDefault.Color) }),
				["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
			})
		}
		v55.TopGradient = v56("Frame", v57, v58)
		v55.ScrollView = v_u_3.createElement(v_u_9, {
			["size"] = UDim2.fromScale(1, 1),
			["canvasSizeY"] = UDim.new(0, p_u_48.state.canvasSizeY)
		}, v51)
		local v59 = v_u_3.createElement
		local v60 = {
			["Visible"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["ZIndex"] = 2,
			["Visible"] = p_u_48.bottomGradientVisibleBinding,
			["Size"] = UDim2.new(1, 0, 0, 30),
			["Position"] = UDim2.fromScale(0, 1),
			["AnchorPoint"] = Vector2.new(0, 1),
			["BackgroundColor3"] = Color3.new(1, 1, 1)
		}
		local v61 = {
			["UIGradient"] = v_u_3.createElement("UIGradient", {
				["Rotation"] = 90,
				["Color"] = nil,
				["Transparency"] = nil,
				["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v50.BackgroundUIDefault.Color), ColorSequenceKeypoint.new(1, v50.BackgroundUIDefault.Color) }),
				["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
			})
		}
		v55.BottomGradient = v59("Frame", v60, v61)
		return v52(v53, v54, v55)
	end)
end
function v17.renderLoading(_) -- name: renderLoading
	-- upvalues: (copy) v_u_3, (copy) v_u_8
	return v_u_3.createElement(v_u_8, {
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5)
	})
end
function v17.renderFailed(p62) -- name: renderFailed
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_16
	return v_u_3.createElement(v_u_11, {
		["text"] = v_u_16:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
		["size"] = UDim2.fromScale(1, 1),
		["onActivated"] = p62.onRetryLoading
	})
end
function v17.render(p63) -- name: render
	local v64 = p63.state.loading
	if v64 then
		v64 = not p63.props.loadingFailed
	end
	if v64 then
		return p63:renderLoading()
	elseif p63.state.addedAssetNames then
		return p63:renderItemsList()
	else
		return p63:renderFailed()
	end
end
function v17.didMount(p65) -- name: didMount
	p65.mounted = true
	if p65.props.humanoidDescription then
		p65.loadAssetNames()
	end
	p65.checkIsScrollable()
end
function v17.didUpdate(p66, p67, _) -- name: didUpdate
	-- upvalues: (copy) v_u_3
	p66.checkIsScrollable()
	if p67.humanoidDescription ~= p66.props.humanoidDescription then
		p66:setState({
			["loading"] = true,
			["addedAssetNames"] = nil,
			["removedAssetNames"] = nil,
			["addedAssetNames"] = v_u_3.None,
			["removedAssetNames"] = v_u_3.None
		})
		p66.loadAssetNames()
	end
end
function v17.willUnmount(p68) -- name: willUnmount
	p68.mounted = false
end
return v5.connect(nil, function(p_u_69) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_15
	return {
		["addAnalyticsInfo"] = function(p70) -- name: addAnalyticsInfo
			-- upvalues: (copy) p_u_69, (ref) v_u_15
			return p_u_69(v_u_15(p70))
		end
	}
end)(v17)