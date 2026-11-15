-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.PublishInfoList
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Workspace.Packages.ItemDetails).ItemInfoList
local v_u_4 = require(v1.Workspace.Packages.Localization).Hooks.useLocalization
local v5 = game:GetService("HttpRbxApiService")
local v6 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_7 = require(v6.Modules.Common.httpRequest)(v5)
local v_u_8 = require(v1.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local v_u_9 = game:GetService("Players").LocalPlayer
return function(p10) -- name: PublishInfoList
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3
	local v_u_11 = v_u_2.useRef(false)
	local v12 = v_u_9
	assert(v12, "LocalPlayer must not be nil")
	local v13 = v_u_9.Name
	local v14, v_u_15 = v_u_2.useState(nil)
	local v16 = p10.typeName
	local v17 = p10.LayoutOrder
	local v18 = v_u_4({
		["creatorText"] = "Feature.Catalog.Label.Filter.Creator",
		["attributionText"] = "Feature.Catalog.Label.Attribution",
		["typeText"] = "Feature.Catalog.Label.CategoryType"
	})
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_11, (ref) v_u_8, (ref) v_u_7, (copy) v_u_15
		v_u_11.current = true
		v_u_8(v_u_7, game.GameId):andThen(function(p19)
			-- upvalues: (ref) v_u_11, (ref) v_u_15
			if v_u_11.current and p19.Name then
				v_u_15(p19.Name)
			end
		end)
		return function()
			-- upvalues: (ref) v_u_11
			v_u_11.current = false
		end
	end, {})
	local v20 = v_u_2.createElement
	local v21 = v_u_3
	local v22 = {
		["rowData"] = {
			{
				["infoName"] = nil,
				["infoData"] = nil,
				["hasVerifiedBadge"] = nil,
				["isLoading"] = nil,
				["Selectable"] = false,
				["infoName"] = v18.creatorText,
				["infoData"] = v13,
				["hasVerifiedBadge"] = v_u_9.HasVerifiedBadge,
				["isLoading"] = v13 == nil
			},
			{
				["infoName"] = nil,
				["infoData"] = nil,
				["isLoading"] = nil,
				["Selectable"] = false,
				["infoName"] = v18.attributionText,
				["infoData"] = v14,
				["isLoading"] = v14 == nil
			},
			{
				["infoName"] = nil,
				["infoData"] = nil,
				["isLoading"] = nil,
				["Selectable"] = false,
				["infoName"] = v18.typeText,
				["infoData"] = v16,
				["isLoading"] = v16 == nil
			}
		},
		["LayoutOrder"] = v17
	}
	return v20(v21, v22)
end