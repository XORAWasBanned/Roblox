-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationCommon.PlayerIcon
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Cryo)
local v_u_4 = require(v1.Packages.Roact)
local v_u_5 = require(v1.Packages.React)
local v6 = require(v1.Packages.RoactRodux)
local v7 = require(v1.Packages.UIBlox)
local v_u_8 = require(v1.Packages.Foundation)
local v9 = require(v1.Packages.t)
local v10 = require(v2.Modules.Interfaces.playerInterface)
local v11 = script.Parent.Parent
local v12 = v11.Connection
local v_u_13 = require(v12.LayoutValues).WithLayoutValues
local v14 = require(v1.Workspace.Packages.PlayerList)
local v_u_15 = v14.Common.useLayoutValues
local v16 = require(v1.Workspace.Packages.SharedFlags)
local v_u_17 = v16.FFlagEnableBlackbirdCheck
local v_u_18 = v16.FFlagHidePremiumIconography
local v_u_19 = v16.FFlagCoreUiMigrateUIBloxToFoundation
local v20 = v11.Parent
local v21 = require(v20.Flags.FFlagPlayerListReduceRerenders)
local v_u_22 = v14.Flags.FFlagPlayerListFoundationSubscriptionIcon
local v_u_23 = v7.Core.ImageSet.ImageSetLabel
local v_u_24 = v_u_4.PureComponent:extend("PlayerIcon")
local v25 = v9.strictInterface
local v26 = {
	["player"] = v10,
	["layoutOrder"] = v9.optional(v9.integer),
	["isSmallTouchDevice"] = v9.optional(v9.boolean),
	["playerIconInfo"] = v9.strictInterface({
		["isPlaceOwner"] = v9.boolean,
		["avatarIcon"] = v9.optional(v9.table),
		["specialGroupIcon"] = v9.optional(v9.table)
	}),
	["playerRelationship"] = v9.strictInterface({
		["isBlocked"] = v9.boolean,
		["friendStatus"] = v9.enum(Enum.FriendStatus),
		["isFollowing"] = v9.boolean,
		["isFollower"] = v9.boolean
	}),
	["layoutValues"] = v9.optional(v9.table)
}
v_u_24.validateProps = v25(v26)
local function v_u_37(p27, p28, p29, p30) -- name: getIconImage
	-- upvalues: (copy) v_u_17, (copy) v_u_18
	local v31 = p27.FriendIcons[p30.friendStatus]
	local v32
	if p30.isBlocked then
		v32 = p27.BlockedIcon
	else
		v32 = v31 or nil
	end
	if v32 then
		return v32
	end
	if p29.isPlaceOwner then
		return p27.PlaceOwnerIcon
	end
	if p27.CustomPlayerIcons[p28.UserId] then
		return p27.CustomPlayerIcons[p28.UserId]
	end
	if p29.specialGroupIcon then
		return p29.specialGroupIcon
	end
	if p30.isFollowing then
		return p27.FollowingIcon
	end
	local v33 = p28.MembershipType == Enum.MembershipType.Premium
	if v_u_17 then
		local v34 = game:GetEngineFeature("ReadHasRobloxSubscriptionLua")
		if v34 then
			v34 = p28.HasRobloxSubscription
		end
		if v34 then
			return p27.SubscriptionIcon
		end
		local v35 = not v_u_18 and (v33 and p27.MembershipIcons[p28.MembershipType])
		if v35 then
			return v35
		end
	else
		local v36 = v33 and p27.MembershipIcons[p28.MembershipType]
		if v36 then
			return v36
		end
	end
	return ""
end
function v_u_24.render(p_u_38) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_4, (copy) v_u_37, (copy) v_u_19, (copy) v_u_22, (copy) v_u_8, (copy) v_u_23
	return v_u_13(function(_)
		-- upvalues: (copy) p_u_38, (ref) v_u_4, (ref) v_u_37, (ref) v_u_19, (ref) v_u_22, (ref) v_u_8, (ref) v_u_23
		local v39 = p_u_38.props.layoutValues
		local v40 = p_u_38.props.playerIconInfo
		if v40 then
			v40 = p_u_38.props.playerIconInfo.avatarIcon
		end
		if v40 == nil then
			v40 = v39.DefaultThumbnail
		end
		if v39.IsTenFoot then
			return v_u_4.createElement("ImageLabel", {
				["LayoutOrder"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["LayoutOrder"] = p_u_38.props.layoutOrder or 1,
				["Size"] = v39.PlayerIconBackgroundSize,
				["Image"] = v39.PlayerBackgroundImage
			}, { v_u_4.createElement("ImageLabel", {
					["Size"] = nil,
					["Position"] = nil,
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["BorderSizePixel"] = 0,
					["Size"] = v39.PlayerIconSize,
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Image"] = v40
				}) })
		elseif p_u_38.props.isSmallTouchDevice then
			local v41 = v_u_37(v39, p_u_38.props.player, p_u_38.props.playerIconInfo, p_u_38.props.playerRelationship)
			if not v_u_19 and (not v_u_22 or (typeof(v41) ~= "table" or not v41.isFoundationIcon)) then
				return v_u_4.createElement(v_u_23, {
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["BorderSizePixel"] = 0,
					["AnchorPoint"] = Vector2.new(0, 0.5),
					["Position"] = UDim2.new(0, v39.PlayerNamePaddingXMobile, 0.5, 0),
					["Size"] = v39.PlayerIconSizeMobile,
					["Image"] = v41
				})
			end
			local v42
			if typeof(v41) == "table" then
				v42 = v41.name
			else
				v42 = v41
			end
			if v_u_19 then
				if typeof(v41) == "table" and v41.Image ~= nil then
					v42 = v41.Image
				end
				local v43
				if v42 == nil or v42 == "" then
					v43 = false
				else
					v43 = v42:match("^%w+://.*$") == nil
				end
				if not v43 then
					local v44 = typeof(v41) == "table" and {
						["offset"] = v41.ImageRectOffset,
						["size"] = v41.ImageRectSize
					} or nil
					return v_u_4.createElement(v_u_8.Image, {
						["Image"] = v42,
						["imageRect"] = v44,
						["Size"] = v39.PlayerIconSizeMobile,
						["AnchorPoint"] = Vector2.new(0, 0.5),
						["Position"] = UDim2.new(0, v39.PlayerNamePaddingXMobile, 0.5, 0)
					})
				end
			end
			return v_u_4.createElement(v_u_8.Icon, {
				["name"] = v42,
				["size"] = v_u_8.Enums.IconSize.Medium,
				["AnchorPoint"] = Vector2.new(0, 0.5),
				["Position"] = UDim2.new(0, v39.PlayerNamePaddingXMobile, 0.5, 0)
			})
		else
			local v45 = v_u_37(v39, p_u_38.props.player, p_u_38.props.playerIconInfo, p_u_38.props.playerRelationship)
			if not v_u_19 and (not v_u_22 or (typeof(v45) ~= "table" or not v45.isFoundationIcon)) then
				return v_u_4.createElement(v_u_23, {
					["LayoutOrder"] = nil,
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = nil,
					["BorderSizePixel"] = 0,
					["LayoutOrder"] = p_u_38.props.layoutOrder,
					["Size"] = v39.PlayerIconSize,
					["Image"] = v45
				})
			end
			local v46
			if typeof(v45) == "table" then
				v46 = v45.name
			else
				v46 = v45
			end
			if v_u_19 then
				if typeof(v45) == "table" and v45.Image ~= nil then
					v46 = v45.Image
				end
				local v47
				if v46 == nil or v46 == "" then
					v47 = false
				else
					v47 = v46:match("^%w+://.*$") == nil
				end
				if not v47 then
					local v48 = typeof(v45) == "table" and {
						["offset"] = v45.ImageRectOffset,
						["size"] = v45.ImageRectSize
					} or nil
					return v_u_4.createElement(v_u_8.Image, {
						["Image"] = v46,
						["imageRect"] = v48,
						["Size"] = v39.PlayerIconSize,
						["LayoutOrder"] = p_u_38.props.layoutOrder
					})
				end
			end
			return v_u_4.createElement(v_u_8.Icon, {
				["name"] = v46,
				["size"] = v_u_8.Enums.IconSize.Small,
				["LayoutOrder"] = p_u_38.props.layoutOrder
			})
		end
	end)
end
local function v50(p49) -- name: mapStateToProps
	return {
		["isSmallTouchDevice"] = p49.displayOptions.isSmallTouchDevice
	}
end
local function v53(p51)
	-- upvalues: (copy) v_u_15, (copy) v_u_5, (copy) v_u_24, (copy) v_u_3
	local v52 = {
		["layoutValues"] = v_u_15()
	}
	return v_u_5.createElement(v_u_24, v_u_3.Dictionary.join(p51, v52))
end
if v21 then
	return v_u_5.memo(v6.connect(v50, nil)(v53))
else
	return v6.connect(v50, nil)(v53)
end