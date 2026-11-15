-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalAvatarGroup.InternalAvatarGroup
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactIs)
local v_u_6 = v3.Icon
local v_u_7 = require(v1.Enums.ColorNamespace)
local v_u_8 = require(v1.Components.Icon)
local v_u_9 = require(v1.Enums.IconSize)
local v_u_10 = require(v1.Components.Text)
require(v1.Components.Types)
local v_u_11 = require(v1.Components.View)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v15 = require(v1.Enums.AvatarGroupType)
require(v1.Enums.UserPresence)
local v_u_16 = require(v1.Providers.Style.PresentationContext).usePresentationContext
local v_u_17 = require(v1.Utility.getBindableValue)
local v_u_18 = require(v1.Utility.useCumulativeBackground)
local v_u_19 = {
	["type"] = nil,
	["isEllipsedOverflow"] = false,
	["max"] = (1 / 0),
	["testId"] = "--foundation-avatar-group",
	["type"] = v15.Spread
}
local function v_u_30(p20) -- name: AvatarOverflow
	-- upvalues: (copy) v_u_12, (copy) v_u_16, (copy) v_u_18, (copy) v_u_7, (copy) v_u_4, (copy) v_u_11, (copy) v_u_13, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10
	local v21 = v_u_12()
	local v22 = v_u_16()
	local v23 = v_u_18(p20.backplateStyle, p20.backgroundStyle)
	local v24 = p20.isEllipsed and "text-caption-small" or "text-caption-medium"
	local v25 = v21[v22.colorNamespace or v_u_7.Color].Content.Emphasis
	local v26 = v_u_4.createElement
	local v27 = v_u_11
	local v28 = v_u_13(p20, {
		["Size"] = nil,
		["backgroundStyle"] = nil,
		["tag"] = "row align-x-center align-y-center radius-circle",
		["Size"] = p20.Size,
		["backgroundStyle"] = v23
	})
	local v29
	if p20.isEllipsed then
		v29 = v_u_4.createElement(v_u_8, {
			["name"] = v_u_6.ThreeDotsHorizontal,
			["size"] = v_u_9.XSmall,
			["style"] = v25,
			["testId"] = ("%*--ellipses"):format(p20.testId)
		})
	else
		v29 = v_u_4.createElement(v_u_10, {
			["Text"] = ("+%*"):format(p20.count),
			["tag"] = ("auto-xy text-align-x-center %*"):format(v24),
			["textStyle"] = v25,
			["testId"] = ("%*--text"):format(p20.testId)
		})
	end
	return v26(v27, v28, v29)
end
return v_u_4.memo(v_u_4.forwardRef(function(p31, p32) -- name: InternalAvatarGroup
	-- upvalues: (copy) v_u_14, (copy) v_u_19, (copy) v_u_12, (copy) v_u_16, (copy) v_u_7, (copy) v_u_5, (copy) v_u_17, (copy) v_u_4, (copy) v_u_30, (copy) v_u_11, (copy) v_u_13
	local v33 = v_u_14(p31, v_u_19)
	local v34 = v_u_12()
	local v35 = v34[v_u_16().colorNamespace or v_u_7.Color].Shift.Shift_300
	local v36 = v33.backplateStyle or v34.Color.Surface.Surface_0
	local v37 = v33.resolvedSize
	local v38 = v37 + v33.gap
	local v39 = {}
	for v40, v41 in v33.avatars do
		local v42
		if v_u_5.isBinding(v41) or typeof(v41) == "number" or typeof(v41) ~= "table" then
			v42 = v41
		else
			v42 = v41.userId
		end
		local v43 = v_u_17
		local v44 = tostring(v43(v42))
		local v45 = UDim2.fromOffset(v38 * (v40 - 1), 0)
		local v46 = #v33.avatars - (v40 - 1)
		if v33.max < v40 then
			v39[v40] = v_u_4.createElement(v_u_30, {
				["key"] = "overflow",
				["count"] = nil,
				["isEllipsed"] = nil,
				["Size"] = nil,
				["LayoutOrder"] = nil,
				["Position"] = nil,
				["ZIndex"] = nil,
				["backgroundStyle"] = nil,
				["backplateStyle"] = nil,
				["testId"] = nil,
				["count"] = #v33.avatars - v33.max,
				["isEllipsed"] = v33.isEllipsedOverflow,
				["Size"] = UDim2.fromOffset(v37, v37),
				["LayoutOrder"] = v40,
				["Position"] = v45,
				["ZIndex"] = v46,
				["backgroundStyle"] = v35,
				["backplateStyle"] = v36,
				["testId"] = ("%*--avatar-overflow"):format(v33.testId)
			})
			break
		end
		v39[v40] = v33.renderAvatar(v41, {
			["key"] = v44,
			["LayoutOrder"] = v40,
			["Position"] = v45,
			["ZIndex"] = v46,
			["testId"] = ("%*--avatar-%*"):format(v33.testId, v44),
			["backgroundStyle"] = v35,
			["backplateStyle"] = v36
		})
	end
	return v_u_4.createElement(v_u_11, v_u_13(v33, {
		["ref"] = nil,
		["tag"] = "auto-xy",
		["ref"] = p32
	}), v39)
end))