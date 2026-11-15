-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.Favorites
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_6 = require(v2.UtilityFunctions)
local v_u_7 = require(v2.Thunks.GetAssetFavoriteCount)
local v_u_8 = require(v2.Thunks.GetBundleFavoriteCount)
local v_u_9 = require(v2.Selectors.GotCurrentFavoriteCount)
local v_u_10 = require(v2.getSelectionImageObjectRegular)
local v11 = v_u_3.PureComponent:extend("Favorites")
function v11.setText(p12) -- name: setText
	-- upvalues: (copy) v_u_6
	local v13 = p12.props.assetInfo or {}
	local v14 = v13.parentBundleId ~= nil
	local v15 = p12.props.bundleInfo
	if v14 then
		local v16 = v_u_6.getBundleId(v13)
		if v15[v16] then
			p12.numFavorites = v15[v16].numFavorites
			return
		end
	elseif v13 then
		p12.numFavorites = v13.numFavorites
	end
end
function v11.init(p17) -- name: init
	-- upvalues: (copy) v_u_10
	p17.numFavorites = ""
	p17.selectionImageObject = v_u_10()
end
function v11.willUpdate(p18, p19) -- name: willUpdate
	-- upvalues: (copy) v_u_6
	local v_u_20 = p18.props.getAssetFavoriteCount
	local v_u_21 = p18.props.getBundleFavoriteCount
	if p19.assetInfo then
		local v_u_22 = p19.assetInfo
		local v_u_23 = v_u_22.parentBundleId ~= nil
		if not p19.gotCurrentFavoriteCount then
			coroutine.wrap(function()
				-- upvalues: (copy) v_u_23, (copy) v_u_20, (copy) v_u_22, (ref) v_u_6, (copy) v_u_21
				if v_u_23 then
					v_u_21((v_u_6.getBundleId(v_u_22)))
				else
					v_u_20(v_u_22.assetId)
				end
			end)()
		end
	end
end
function v11.render(p24) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	p24:setText()
	local v25 = v_u_3.createElement
	local v26 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = UDim2.new(1, 0, 0, 16)
	}
	local v27 = {
		["FavoriteIcon"] = v_u_3.createElement("ImageButton", {
			["Selectable"] = false,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/InspectMenu/ico_favorite.png",
			["SelectionImageObject"] = nil,
			["Size"] = UDim2.new(0, 16, 0, 16),
			["SelectionImageObject"] = p24.selectionImageObject
		}),
		["FavoriteText"] = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["Font"] = nil,
			["TextXAlignment"] = nil,
			["TextSize"] = 12,
			["TextColor3"] = nil,
			["Size"] = UDim2.new(1, -16, 1, 0),
			["Position"] = UDim2.new(0, 21, 0, 0),
			["Text"] = p24.numFavorites or "",
			["Font"] = v_u_5.default:getDefault(),
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextColor3"] = Color3.new(1, 1, 1)
		})
	}
	return v25("Frame", v26, v27)
end
function v11.shouldUpdate(_, p28) -- name: shouldUpdate
	return p28.detailsInformation.viewingDetails and true or false
end
return v4.UNSTABLE_connect2(function(p29, _)
	-- upvalues: (copy) v_u_9
	local v30 = p29.detailsInformation.assetId
	return {
		["detailsInformation"] = p29.detailsInformation,
		["assetInfo"] = p29.assets[v30],
		["bundleInfo"] = p29.bundles,
		["gotCurrentFavoriteCount"] = v_u_9(p29)
	}
end, function(p_u_31)
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	return {
		["getAssetFavoriteCount"] = function(p32) -- name: getAssetFavoriteCount
			-- upvalues: (copy) p_u_31, (ref) v_u_7
			p_u_31(v_u_7(p32))
		end,
		["getBundleFavoriteCount"] = function(p33) -- name: getBundleFavoriteCount
			-- upvalues: (copy) p_u_31, (ref) v_u_8
			p_u_31(v_u_8(p33))
		end
	}
end)(v11)