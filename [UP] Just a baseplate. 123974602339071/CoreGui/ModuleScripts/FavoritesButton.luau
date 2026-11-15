-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.FavoritesButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Colors)
local v_u_7 = require(v5.Thunks.CreateFavoriteForAsset)
local v_u_8 = require(v5.Thunks.DeleteFavoriteForAsset)
local v_u_9 = require(v5.Thunks.CreateFavoriteForBundle)
local v_u_10 = require(v5.Thunks.DeleteFavoriteForBundle)
local v_u_11 = require(v5.Thunks.GetFavoriteForAsset)
local v_u_12 = require(v5.Thunks.GetFavoriteForBundle)
local v_u_13 = require(v5.Selectors.GotFavoriteForDetailsItem)
local v_u_14 = require(v5.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local v_u_15 = require(v5.Selectors.GetIsFavorite)
local v_u_16 = require(v5.UtilityFunctions)
local v_u_17 = require(v5.getSelectionImageObjectRounded)
local v_u_18 = require(script.Parent.Common.ControllerShortcutKeycodes).Favorite
local v19 = v_u_3.PureComponent:extend("FavoritesButton")
function v19.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (copy) v_u_18
	p_u_20.selectedImage = v_u_17()
	p_u_20.fetchFavoriteRetries = 0
	v_u_2:BindCoreAction("FavoriteGamepadShortcut", function(_, p21, _)
		-- upvalues: (copy) p_u_20
		if p21 ~= Enum.UserInputState.End then
			return Enum.ContextActionResult.Pass
		end
		p_u_20:activateButton()
		return Enum.ContextActionResult.Sink
	end, false, v_u_18)
end
function v19.willUpdate(p22, p23) -- name: willUpdate
	-- upvalues: (copy) v_u_16
	local v24 = p23.gotFavoriteForDetailsItem
	local v_u_25 = p22.props.getFavoriteForAsset
	local v_u_26 = p22.props.getFavoriteForBundle
	local v27 = p23 and (p23.assetInfo and not v24)
	if v27 then
		v27 = p22.fetchFavoriteRetries < 10
	end
	if v27 then
		local v_u_28 = p23.assetInfo
		local v_u_29
		if v_u_28 then
			v_u_29 = v_u_28.parentBundleId ~= nil
		else
			v_u_29 = v_u_28
		end
		coroutine.wrap(function()
			-- upvalues: (copy) v_u_29, (copy) v_u_25, (copy) v_u_28, (ref) v_u_16, (copy) v_u_26
			if v_u_29 then
				v_u_26((v_u_16.getBundleId(v_u_28)))
			else
				v_u_25(v_u_28.assetId)
			end
		end)()
		p22.fetchFavoriteRetries = p22.fetchFavoriteRetries + 1
	end
end
function v19.activateButton(p30) -- name: activateButton
	-- upvalues: (copy) v_u_16
	local v31 = p30.props.isFavorited
	local v32 = p30.props.IsDetailsItemPartOfBundleAndOffsale
	local v33 = p30.props.createFavoriteForAsset
	local v34 = p30.props.deleteFavoriteForAsset
	local v35 = p30.props.createFavoriteForBundle
	local v36 = p30.props.deleteFavoriteForBundle
	local v37 = p30.props.assetInfo
	if v31 then
		if v32 then
			v36((v_u_16.getBundleId(v37)))
		else
			v34(v37.assetId)
		end
	elseif v32 then
		v35((v_u_16.getBundleId(v37)))
	else
		v33(v37.assetId)
	end
end
function v19.willUnmount(_) -- name: willUnmount
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindCoreAction("FavoriteGamepadShortcut")
end
function v19.render(p_u_38) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	local v39 = p_u_38.props.isFavorited
	local v40 = p_u_38.props.favoriteButtonRef
	local v41 = v_u_3.createElement
	local v42 = {
		["AnchorPoint"] = Vector2.new(0.5, 0),
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, 44, 0, 44),
		["LayoutOrder"] = 1,
		["Image"] = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		["ImageColor3"] = v_u_6.White,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(5, 5, 120, 20),
		["SelectionImageObject"] = p_u_38.selectedImage,
		["Visible"] = true,
		[v_u_3.Ref] = v40,
		[v_u_3.Event.Activated] = function()
			-- upvalues: (copy) p_u_38
			p_u_38:activateButton()
		end
	}
	local v43 = {
		["FavoriteIcon"] = v_u_3.createElement("ImageLabel", {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Size"] = UDim2.new(0, 26, 0, 26),
			["Position"] = UDim2.new(0, 22, 0, 22),
			["Image"] = v39 and "rbxasset://textures/ui/InspectMenu/ico_favorite.png" or "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png",
			["ImageColor3"] = v_u_6.White
		})
	}
	return v41("ImageButton", v42, v43)
end
return v4.UNSTABLE_connect2(function(p44, _)
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (copy) v_u_14
	local v45 = p44.detailsInformation.assetId
	return {
		["view"] = p44.view,
		["assetInfo"] = p44.assets[v45],
		["bundleInfo"] = p44.bundles,
		["gotFavoriteForDetailsItem"] = v_u_13(p44),
		["isFavorited"] = v_u_15(p44),
		["IsDetailsItemPartOfBundleAndOffsale"] = v_u_14(p44)
	}
end, function(p_u_46)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12
	return {
		["createFavoriteForAsset"] = function(p47) -- name: createFavoriteForAsset
			-- upvalues: (copy) p_u_46, (ref) v_u_7
			p_u_46(v_u_7(p47))
		end,
		["deleteFavoriteForAsset"] = function(p48) -- name: deleteFavoriteForAsset
			-- upvalues: (copy) p_u_46, (ref) v_u_8
			p_u_46(v_u_8(p48))
		end,
		["createFavoriteForBundle"] = function(p49) -- name: createFavoriteForBundle
			-- upvalues: (copy) p_u_46, (ref) v_u_9
			p_u_46(v_u_9(p49))
		end,
		["deleteFavoriteForBundle"] = function(p50) -- name: deleteFavoriteForBundle
			-- upvalues: (copy) p_u_46, (ref) v_u_10
			p_u_46(v_u_10(p50))
		end,
		["getFavoriteForAsset"] = function(p51) -- name: getFavoriteForAsset
			-- upvalues: (copy) p_u_46, (ref) v_u_11
			p_u_46(v_u_11(p51))
		end,
		["getFavoriteForBundle"] = function(p52) -- name: getFavoriteForBundle
			-- upvalues: (copy) p_u_46, (ref) v_u_12
			p_u_46(v_u_12(p52))
		end
	}
end)(v19)