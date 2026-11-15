-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.PlayerProfile.PlayerProfile
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.SignalsReact)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Hooks.useTokens
local v_u_7 = v5.Enums.IconName
local v_u_8 = v5.Enums.Visibility
local v_u_9 = v5.IconButton
local v_u_10 = v5.ScrollView
local v_u_11 = v5.Text
local v_u_12 = v5.View
local v_u_13 = require(v1.Workspace.Packages.RobloxAppEnums)
local v_u_14 = require(v1.Workspace.Packages.RobloxAppHooks).useDeviceOrientation
local v_u_15 = require(v1.Workspace.Packages.Responsive)
local v_u_16 = v_u_15.useBreakpointXOrLarger
local v_u_17 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local v_u_18 = require(v1.Workspace.Packages.PeopleService)
local v_u_19 = require(v1.Workspace.Packages.ProfilePlatform.Enums)
local v_u_20 = require(v1.Workspace.Packages.ProfilePlatform.CurrentlyWearing)
local v_u_21 = require(v1.Workspace.Packages.ProfilePlatform.getProfilePlatform)
local v_u_22 = require(v1.Workspace.Packages.ProfilePlatform.useDynamicSizeMargin)
local v_u_23 = require(v1.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local v_u_24 = require(v1.Workspace.Packages.ProfilePlatform.FFlagProfilePlatformGracefulVisibility)
local v_u_25 = require(script.Parent.AddConnectionButton)
local v_u_26 = require(script.Parent.ProfileHeader)
return v_u_3.memo(function(p_u_27)
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_23, (copy) v_u_18, (copy) v_u_2, (copy) v_u_4, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (copy) v_u_13, (copy) v_u_22, (copy) v_u_17, (copy) v_u_19, (copy) v_u_24, (copy) v_u_21, (copy) v_u_12, (copy) v_u_9, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_26, (copy) v_u_25, (copy) v_u_20
	local v28 = v_u_6()
	local v29 = v_u_3.useContext(v_u_23)
	local v_u_30 = v29.profileId
	local v_u_31 = v29.profileType
	local v32 = v_u_3.useMemo(function()
		-- upvalues: (ref) v_u_18
		return v_u_18.getService("FriendStatusStore")
	end, {})
	local v33 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_27, (ref) v_u_2
		if p_u_27.userId then
			return v_u_2:GetPlayerByUserId(p_u_27.userId)
		else
			return nil
		end
	end, { p_u_27.userId })
	local v34 = v_u_4.useSignalState(v32.getShouldShowFriendButton(p_u_27.userId, v33))
	local v35 = v_u_14()
	local v36 = v_u_16(v_u_15.Keys.Medium)
	local v37 = v35 == v_u_13.DeviceOrientationMode.Portrait
	if v37 then
		v37 = not v36
	end
	local v38, v39 = v_u_22()
	local v40, v_u_41 = v_u_3.useState(true)
	local v42, v_u_43 = v_u_3.useState(false)
	local v_u_44 = v_u_17()
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_24, (copy) v_u_44, (ref) v_u_21, (copy) v_u_30, (copy) v_u_31, (copy) v_u_41, (copy) v_u_43
		local v45 = {
			{
				["component"] = v_u_19.Components.CurrentlyWearing
			},
			{
				["component"] = v_u_19.Components.UserProfileHeader
			}
		}
		if v_u_24 then
			local v46 = {
				["component"] = v_u_19.Components.Friends
			}
			table.insert(v45, v46)
		end
		local v47 = {
			["profileId"] = nil,
			["profileType"] = nil,
			["components"] = nil,
			["includeComponentOrdering"] = false,
			["onlyEssentialComponents"] = nil,
			["profileId"] = v_u_30,
			["profileType"] = v_u_31,
			["components"] = v45,
			["onlyEssentialComponents"] = not v_u_24 and true or nil
		}
		v_u_44(v_u_21.API(v47)):andThen(function(_)
			-- upvalues: (ref) v_u_41, (ref) v_u_43
			v_u_41(false)
			v_u_43(false)
		end):catch(function(_)
			-- upvalues: (ref) v_u_41, (ref) v_u_43
			v_u_41(false)
			v_u_43(true)
		end)
	end, { v_u_30, v_u_31 })
	if v40 then
		return nil
	end
	if v42 then
		return v_u_3.createElement(v_u_12, {
			["tag"] = "size-full col"
		}, {
			["BackBar"] = v_u_3.createElement(v_u_12, {
				["tag"] = "size-full-0 auto-y row padding-xsmall",
				["LayoutOrder"] = 1
			}, {
				["BackButton"] = v_u_3.createElement(v_u_9, {
					["icon"] = v_u_7.ChevronLargeLeft,
					["onActivated"] = p_u_27.closePage
				})
			}),
			["ErrorMessage"] = v_u_3.createElement(v_u_11, {
				["tag"] = "size-full-0 auto-y content-default text-title-medium",
				["Text"] = "Error loading profile",
				["LayoutOrder"] = 2
			})
		})
	end
	local v48 = v_u_3.createElement
	local v49 = v_u_12
	local v50 = {
		["tag"] = "size-full padding-bottom-medium",
		["onAbsoluteSizeChanged"] = nil,
		["onAbsoluteSizeChanged"] = v39
	}
	local v51 = {
		["BackBar"] = v_u_3.createElement(v_u_12, {
			["tag"] = "size-full-0 auto-y row padding-xsmall",
			["LayoutOrder"] = 1
		}, {
			["BackButton"] = v_u_3.createElement(v_u_9, {
				["icon"] = v_u_7.ChevronLargeLeft,
				["onActivated"] = p_u_27.closePage
			})
		})
	}
	local v52 = v_u_3.createElement
	local v53 = v_u_10
	local v54 = {
		["tag"] = "size-full",
		["scroll"] = nil,
		["layout"] = nil,
		["padding"] = nil,
		["LayoutOrder"] = 2,
		["scroll"] = {
			["scrollBarVisibility"] = v_u_8.Auto,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["CanvasSize"] = UDim2.fromScale(1, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.ScrollBar
		},
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v28.Padding.XXLarge)
		},
		["padding"] = {
			["top"] = UDim.new(0, 48)
		}
	}
	local v55 = {}
	local v56 = v_u_3.createElement
	local v57 = v_u_12
	local v58 = {
		["tag"] = nil,
		["LayoutOrder"] = 1,
		["tag"] = {
			["size-full-0 auto-y"] = true,
			["col gap-xxlarge"] = v37
		}
	}
	local v59 = {
		["ProfileHeader"] = v_u_3.createElement(v_u_26, {
			["profileId"] = nil,
			["layoutOrder"] = 1,
			["profileId"] = v_u_30
		})
	}
	local v60
	if v34 then
		local v61 = v_u_3.createElement
		local v62 = v_u_12
		local v63 = {
			["tag"] = nil,
			["padding"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["ZIndex"] = 2,
			["LayoutOrder"] = 2
		}
		local v64 = {
			["size-full-0 auto-y"] = v37
		}
		local v65 = not v37
		if v65 then
			v65 = not v36
		end
		v64["size-2500-2200 row align-y-center"] = v65
		v64["size-3000-2200 row align-y-center"] = not v37 and v36
		v63.tag = v64
		v63.padding = v37 and {
			["left"] = UDim.new(0, v38),
			["right"] = UDim.new(0, v38)
		} or nil
		v63.AnchorPoint = Vector2.new(1, 0)
		v63.Position = UDim2.new(1, -v38, 0, 0)
		v60 = v61(v62, v63, {
			["AddConnectionButton"] = v_u_3.createElement(v_u_25, {
				["userId"] = p_u_27.userId
			})
		})
	else
		v60 = nil
	end
	v59.AddConnectionButtonContainer = v60
	v55.ProfileHeaderContainer = v56(v57, v58, v59)
	v55.CurrentlyWearingCarousel = v_u_3.createElement(v_u_20, {
		["layoutOrder"] = 3
	})
	v51.ScrollView = v52(v53, v54, v55)
	return v48(v49, v50, v51)
end)