-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ShareInviteLink
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = game:GetService("UserInputService")
local v4 = require(v1.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v7 = v2.Modules.Settings.Pages.ShareGame
local v8 = require(v1.Workspace.Packages.NotificationsCommon).ReducerDependencies
local v_u_9 = require(v7.Constants)
local v_u_10 = require(v7.Components.ShareButton)
local v_u_11 = require(v7.getTranslator)()
local v12 = require(v7.Components.ShareInviteLinkMapDispatchToProps)
local v13 = require(v7.Components.ShareInviteLinkMapStateToProps)
local v_u_14 = v8.ShareLinksRodux
local v_u_15 = v8.RoduxNetworking.Enum.NetworkStatus
local v_u_16 = require(v2.Modules.Settings.Theme)
local v17 = require(v2.Modules.Flags.GetFFlagEnableNewInviteMenu)
local v18 = v_u_5.PureComponent:extend("ShareInviteLink")
local v_u_19, v_u_20, v_u_21
if v17() then
	v_u_19 = 16
	v_u_20 = 12
	v_u_21 = 66
else
	v_u_19 = 12
	v_u_20 = 8
	v_u_21 = 69
end
local v_u_22 = Color3.fromRGB(79, 84, 95)
local v_u_23 = v_u_11:FormatByKey("Feature.SocialShare.Action.Share")
local v_u_24 = v_u_11:FormatByKey("Feature.SocialShare.Label.Copied")
local v25 = v3:GetPlatform()
v18.defaultProps = {
	["externalContentSharingProtocol"] = v4,
	["isDesktopClient"] = (v25 == Enum.Platform.Windows or v25 == Enum.Platform.OSX) and true or v25 == Enum.Platform.UWP
}
function v18.init(p_u_26) -- name: init
	p_u_26.state = {
		["showCopiedText"] = false
	}
	function p_u_26.displayShareSheet(p27)
		-- upvalues: (copy) p_u_26
		local v28 = p_u_26.props
		if v28.externalContentSharingProtocol then
			v28.externalContentSharingProtocol:shareUrl({
				["url"] = nil,
				["context"] = "V1Menu",
				["url"] = p27.shortUrl
			})
			if v28.isDesktopClient then
				p_u_26:setState({
					["showCopiedText"] = true
				})
				task.delay(1, function()
					-- upvalues: (ref) p_u_26
					p_u_26:setState({
						["showCopiedText"] = false
					})
				end)
			end
		end
	end
end
function v18.didUpdate(p29, p30) -- name: didUpdate
	-- upvalues: (copy) v_u_14
	local v31 = p29.props
	if p30.shareInviteLink == nil and p29.props.shareInviteLink ~= nil then
		local v32 = {
			["linkType"] = v_u_14.Enums.LinkType.ExperienceInvite.rawValue(),
			["linkId"] = p29.props.shareInviteLink.linkId
		}
		p29.props.analytics:linkGenerated(v32)
		p29.displayShareSheet(v31.shareInviteLink)
	end
end
function v18.render(p_u_33) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_16, (copy) v_u_22, (ref) v_u_19, (ref) v_u_20, (copy) v_u_11, (ref) v_u_21, (copy) v_u_10, (copy) v_u_24, (copy) v_u_23, (copy) v_u_15
	local v34 = p_u_33.props.size
	local v35 = p_u_33.props.layoutOrder
	local v36 = p_u_33.props.deviceLayout
	local v37 = p_u_33.props.zIndex
	local v38 = v_u_9.LayoutSpecific[v36]
	local v39 = v_u_5.createElement
	local v40 = "Frame"
	local v41 = {
		["Size"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["ZIndex"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = v34,
		["Position"] = p_u_33.props.position,
		["LayoutOrder"] = v35,
		["BackgroundColor3"] = v_u_16.color("PlayerRowFrame", v_u_22),
		["BackgroundTransparency"] = v_u_16.transparency("PlayerRowFrame", 0),
		["ZIndex"] = v37
	}
	local v42 = {
		["Corner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = v_u_16.MenuContainerCornerRadius
		}),
		["UIPadding"] = v_u_5.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v_u_19),
			["PaddingRight"] = UDim.new(0, v_u_19),
			["PaddingTop"] = UDim.new(0, v_u_20),
			["PaddingBottom"] = UDim.new(0, v_u_20)
		}),
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Title"] = v_u_5.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["TextXAlignment"] = nil,
			["LayoutOrder"] = 0,
			["Text"] = nil,
			["Size"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["Font"] = nil,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Text"] = v_u_11:FormatByKey("Feature.SocialShare.Label.ShareServerLink"),
			["Size"] = UDim2.new(1, -v_u_21, 1, 0),
			["TextSize"] = v_u_16.textSize(v38.PAGE_TITLE_TEXT_SIZE, "ShareLinkTitle"),
			["TextColor3"] = v_u_9.Color.WHITE,
			["Font"] = v_u_16.font(Enum.Font.SourceSansSemibold, "Semibold")
		})
	}
	local v43 = v_u_5.createElement
	local v44 = v_u_10
	local v46 = {
		["size"] = nil,
		["layoutOrder"] = 1,
		["onShare"] = nil,
		["text"] = nil,
		["isEnabled"] = nil,
		["size"] = UDim2.new(0, v_u_21, 1, 0),
		["onShare"] = function()
			-- upvalues: (copy) p_u_33
			local v45 = p_u_33.props
			p_u_33.props.analytics:onShareButtonClick()
			if p_u_33.props.shareInviteLink == nil then
				p_u_33.props.fetchShareInviteLink()
			else
				p_u_33.displayShareSheet(v45.shareInviteLink)
			end
		end
	}
	local v47
	if p_u_33.state.showCopiedText then
		v47 = v_u_24
	else
		v47 = v_u_23
	end
	v46.text = v47
	local v48
	if p_u_33.props.fetchShareInviteLinkNetworkStatus == v_u_15.Fetching then
		v48 = false
	else
		v48 = not p_u_33.state.showCopiedText
	end
	v46.isEnabled = v48
	v42.ShareButton = v43(v44, v46)
	return v39(v40, v41, v42)
end
return v6.connect(v13, v12)(v18)