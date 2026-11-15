-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAvatarPrompt.AvatarParts.AvatarItemCard
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v4 = require(v1.Packages.Foundation)
local v_u_5 = v4.Utility.normalizeFontFace
local v_u_6 = v4.Utility.Flags.FoundationFontFaceMigration
local v_u_7 = v3.Core.Style.useStyle
local v_u_8 = require(script.Parent.AvatarPartViewport)
local v_u_9 = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagSingleUploadMakeupSupport)
return function(p10) -- name: AvatarItemCard
	-- upvalues: (copy) v_u_7, (copy) v_u_9, (copy) v_u_2, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5
	local v11 = v_u_7()
	local v12 = v11.Font
	local v13 = v11.Theme
	local v14 = p10.asset
	local v15 = v12.CaptionHeader
	local v16 = v13.TextEmphasis.Color
	if v_u_9() then
		local v17 = typeof(v14) == "table" or v14:IsA("MeshPart") or (v14:IsA("Accessory") or v14:IsA("Decal"))
		assert(v17, "Assert that asset is a table, MeshPart, Accessory, or Decal")
	else
		local v18 = typeof(v14) == "table" and true or (v14:IsA("MeshPart") or v14:IsA("Accessory"))
		assert(v18, "Assert that asset is a table, MeshPart, or Accessory")
	end
	local v19 = p10.bodyName
	local v20 = p10.partName
	local v21 = nil
	local v22
	if v_u_9() then
		if v19 and v20 then
			v21 = v19 .. "\'s " .. v20
		else
			v21 = v20 or v21
		end
		v22 = v21 ~= nil
	else
		if v19 == nil then
			v22 = false
		else
			v22 = v20 ~= nil
		end
		if v19 and v20 then
			v21 = v19 .. "\'s " .. v20
		end
	end
	local v23 = v_u_2.createElement
	local v24 = "Frame"
	local v25 = {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1),
		["LayoutOrder"] = p10.LayoutOrder
	}
	local v26 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 5)
		})
	}
	local v27 = v_u_2.createElement
	local v28 = v_u_8
	local v29 = {
		["asset"] = nil,
		["assetType"] = nil,
		["LayoutOrder"] = 1,
		["viewportSize"] = nil,
		["asset"] = v14
	}
	local v30
	if v_u_9() then
		v30 = p10.assetType
	else
		v30 = nil
	end
	v29.assetType = v30
	v29.viewportSize = p10.viewportSize
	v26.AvatarPartViewport = v27(v28, v29)
	if v22 then
		local v31 = v_u_2.createElement
		local v32 = "TextLabel"
		local v33 = {
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Size"] = nil,
			["TextColor3"] = nil,
			["TextWrapped"] = true,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = nil,
			["TextTruncate"] = nil,
			["Text"] = v21,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Size"] = UDim2.new(1, 0, 0, 50),
			["TextColor3"] = v16
		}
		local v34
		if v_u_6 then
			v34 = nil
		else
			v34 = v15.Font
		end
		v33.Font = v34
		local v35
		if v_u_6 then
			v35 = v_u_5(v11.Tokens.Typography.CaptionLarge.Font)
		else
			v35 = nil
		end
		v33.FontFace = v35
		v33.TextSize = v15.RelativeSize * v12.BaseSize
		v33.TextTruncate = Enum.TextTruncate.AtEnd
		v22 = v31(v32, v33)
	end
	v26.TitleText = v22
	return v23(v24, v25, v26)
end