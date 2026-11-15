-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.AssetList
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = script.Parent.Parent
local v_u_4 = require(v1.Packages.Roact)
local v_u_5 = require(v1.Packages.Cryo)
local v6 = require(v1.Packages.RoactRodux)
local v_u_7 = require(v1.Packages.Foundation).Skeleton
local v8 = require(v1.Workspace.Packages.PlayerList)
local v_u_9 = require(v3.Components.AssetCard)
local v_u_10 = require(v3.Components.InspectAndBuyContext)
local v_u_11 = require(v3.Actions.SetAssetFromBundleInfo)
local v_u_12 = v8.Flags.FFlagAddNewPlayerListMobileFocusNav
local v_u_13 = v_u_4.PureComponent:extend("AssetList")
function v_u_13.calculateCanvasSize(p14, p15, p16, p17) -- name: calculateCanvasSize
	local v18 = p14.gridFrameRef.current
	local v19 = p14.props.view
	local v20 = p14.props.views[v19]
	if v18 then
		local v21 = v20.TopSizeY + 15
		local v22 = p16 / p15
		local v23 = math.ceil(v22) * (p17 + 10) + v21
		v18.Parent.CanvasSize = UDim2.new(1, 0, 0, v23)
	end
end
function v_u_13.init(p24) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_12
	local v25 = p24.props.view
	local v26 = p24.props.views[v25]
	p24.gridFrameRef = v_u_4.createRef()
	local v27 = {
		["assetCardSizeX"] = v26.AssetCardMaxSizeX,
		["assetCardSizeY"] = v26.AssetCardMaxSizeY
	}
	local v28
	if v_u_12 then
		v28 = false
	else
		v28 = nil
	end
	v27.assetCardsLoaded = v28
	p24.state = v27
end
function v_u_13.render(p_u_29) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12
	local v30 = p_u_29.props.view
	local v31 = p_u_29.props.views[v30]
	local v32 = p_u_29.props.assets
	local v33 = v31.MaxAssetCardsPerRow
	local v34 = p_u_29.state.assetCardSizeX
	local v35 = p_u_29.state.assetCardSizeY
	local v36 = {
		["UIGridLayout"] = v_u_4.createElement("UIGridLayout", {
			["CellPadding"] = UDim2.new(0, 10, 0, 10),
			["CellSize"] = UDim2.new(0, v34, 0, v35),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["FillDirectionMaxCells"] = v33
		})
	}
	local v37 = 0
	for _, v38 in pairs(v32) do
		v37 = v37 + 1
		v36[v38.assetId] = v_u_4.createElement(v_u_9, {
			["assetInfo"] = v38,
			["assetCardSizeX"] = v34
		})
	end
	if v37 == 0 then
		for v39 = 1, 30 do
			v36[v39] = v_u_4.createElement(v_u_7, {
				["Size"] = UDim2.new(1, 0, 0, v34)
			})
		end
	elseif v_u_12 then
		p_u_29:setState({
			["assetCardsLoaded"] = true
		})
	end
	p_u_29:calculateCanvasSize(v33, v37, v35)
	return v_u_4.createElement("Frame", {
		["Size"] = UDim2.new(1, -(2 * v31.BorderPaddingSize), 1, 0),
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 3,
		[v_u_4.Ref] = p_u_29.gridFrameRef,
		[v_u_4.Change.AbsoluteSize] = function(_)
			-- upvalues: (copy) p_u_29
			spawn(function()
				-- upvalues: (ref) p_u_29
				p_u_29:resize()
			end)
		end
	}, v36)
end
function v_u_13.didMount(p40) -- name: didMount
	p40:resize()
	p40.mounted = true
end
function v_u_13.updateAssetsFromBundles(p41) -- name: updateAssetsFromBundles
	-- upvalues: (copy) v_u_5
	local v42 = p41.props.bundles
	local v43 = p41.props.assetBundles
	local v44 = p41.props.assets
	local v45 = v_u_5.Dictionary.keys(v44)
	if v42 and not v_u_5.isEmpty(v42) then
		local v46 = 1
		for _, v47 in pairs(v42) do
			local v48 = v47.assetIds
			for v49 = 1, #v48 do
				local v50 = v48[v49]
				local v51 = tostring(v50)
				if not table.find(v45, v51) then
					continue
				end
				local v52 = v43[v51] or {}
				if #v52 ~= 1 and (v46 ~= 1 or (#v52 <= 1 or (not v44[v51] or v44[v51].parentBundleId ~= nil))) then
					continue
				end
				p41.props.dispatchSetAssetFromBundleInfo(v51, v47)
			end
			v46 = v46 + 1
		end
	end
end
function v_u_13.didUpdate(p53, p54) -- name: didUpdate
	-- upvalues: (copy) v_u_12, (copy) v_u_2
	if p53.props.view ~= p54.view then
		p53:resize()
	end
	if p53.mounted and (p53.props.gamepadEnabled and (not p53.props.detailsInformation.viewingDetails and p53.props.visible)) and (not v_u_12 or p53.state.assetCardsLoaded) then
		v_u_2.SelectedCoreObject = p53.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject")
	end
	if p53.props.assetBundles ~= p54.assetBundles or p53.props.bundles ~= p54.bundles then
		p53:updateAssetsFromBundles()
	end
end
function v_u_13.willUnmount(p55) -- name: willUnmount
	p55.mounted = false
end
function v_u_13.resize(p56) -- name: resize
	local v57 = p56.gridFrameRef.current
	local v58 = p56.props.view
	local v59 = p56.props.views[v58]
	if v57 then
		local v60 = v59.MaxAssetCardsPerRow
		local v61 = (v57.AbsoluteSize.X - 10 * (v60 - 1)) / v60
		local v62 = math.floor(v61)
		local v63 = v59.AssetCardMaxSizeX
		local v64 = math.min(v62, v63)
		local v65 = v62 / 0.68
		local v66 = v59.AssetCardMaxSizeY
		local v67 = math.min(v65, v66)
		if p56.state.assetCardSizeX ~= v64 or p56.state.assetCardSizeY ~= v67 then
			p56:setState({
				["assetCardSizeX"] = v64,
				["assetCardSizeY"] = v67
			})
		end
	end
end
return v6.connect(function(p68, _)
	return {
		["view"] = p68.view,
		["visible"] = p68.visible,
		["assets"] = p68.assets,
		["bundles"] = p68.bundles,
		["assetBundles"] = p68.assetBundles,
		["detailsInformation"] = p68.detailsInformation,
		["gamepadEnabled"] = p68.gamepadEnabled
	}
end, function(p_u_69)
	-- upvalues: (copy) v_u_11
	return {
		["dispatchSetAssetFromBundleInfo"] = function(p70, p71) -- name: dispatchSetAssetFromBundleInfo
			-- upvalues: (copy) p_u_69, (ref) v_u_11
			p_u_69(v_u_11(p70, p71))
		end
	}
end)(function(p_u_72) -- name: AssetListWrapper
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_13
	local v75 = {
		["render"] = function(p73) -- name: render
			-- upvalues: (ref) v_u_5, (copy) p_u_72, (ref) v_u_4, (ref) v_u_13
			local v74 = v_u_5.Dictionary.join(p_u_72, {
				["views"] = p73
			})
			return v_u_4.createElement(v_u_13, v74)
		end
	}
	return v_u_4.createElement(v_u_10.Consumer, v75)
end)