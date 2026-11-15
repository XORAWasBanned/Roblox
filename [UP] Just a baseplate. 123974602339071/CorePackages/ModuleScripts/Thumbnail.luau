-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Banner.Subcomponents.Thumbnail
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
require(v2.BuilderIcons)
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Avatar)
local v_u_5 = require(v1.Components.Icon)
local v_u_6 = require(v1.Components.Image)
require(v1.Components.Types)
local v_u_7 = require(v1.Components.View)
local v_u_8 = require(v1.Providers.Style.useTokens)
local v_u_9 = require(v1.Enums.AvatarSize)
local v_u_10 = require(v1.Enums.CardDensity)
local v_u_11 = require(v1.Enums.IconSize)
require(v1.Enums.UserPresence)
return function(p12) -- name: Thumbnail
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (copy) v_u_11, (copy) v_u_7
	local v13 = v_u_8()
	local v14
	if p12.density == v_u_10.Compact then
		v14 = v13.Size.Size_1200
	else
		v14 = v13.Size.Size_1600
	end
	local v15 = p12.thumbnail
	local v16
	if v15.type == "Avatar" then
		local v17 = v_u_3.createElement
		local v18 = v_u_4
		local v19 = {
			["userId"] = v15.userId
		}
		local v20
		if p12.density == v_u_10.Compact then
			v20 = v_u_9.Large
		else
			v20 = v_u_9.XLarge
		end
		v19.size = v20
		v19.userPresence = v15.userPresence
		v19.testId = ("%*--thumbnail-avatar"):format(p12.testId)
		v16 = v17(v18, v19)
	elseif v15.type == "Image" then
		v16 = v_u_3.createElement(v_u_6, {
			["Image"] = nil,
			["ScaleType"] = nil,
			["tag"] = "size-full radius-medium",
			["testId"] = nil,
			["Image"] = v15.image,
			["ScaleType"] = Enum.ScaleType.Crop,
			["testId"] = ("%*--thumbnail-image"):format(p12.testId)
		})
	elseif v15.type == "Icon" then
		local v21 = v_u_3.createElement
		local v22 = v_u_5
		local v23 = {}
		local v24 = v15.icon
		local v25
		if typeof(v24) == "table" then
			v25 = v15.icon.name
		else
			v25 = v15.icon
		end
		v23.name = v25
		local v26 = v15.icon
		local v27
		if typeof(v26) == "table" then
			v27 = v15.icon.variant
		else
			v27 = nil
		end
		v23.variant = v27
		v23.size = v_u_11.Large
		v23.testId = ("%*--thumbnail-icon"):format(p12.testId)
		v16 = v21(v22, v23)
	else
		v16 = v_u_3.createElement(v_u_7, {
			["tag"] = "align-x-center align-y-center size-full clip",
			["testId"] = nil,
			["testId"] = ("%*--thumbnail-slot"):format(p12.testId)
		}, v15.children)
	end
	return v_u_3.createElement(v_u_7, {
		["tag"] = "align-x-center align-y-center",
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["testId"] = nil,
		["Size"] = UDim2.fromOffset(v14, v14),
		["LayoutOrder"] = p12.LayoutOrder,
		["testId"] = ("%*--thumbnail"):format(p12.testId)
	}, {
		["Content"] = v16
	})
end