-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ConversationEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v4 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_5 = require(v1.Packages.Roact)
local v_u_6 = require(v4.Settings.Theme)
local v7 = v4.Settings.Pages.ShareGame
local v_u_8 = require(v7.Components.ConversationDetails)
local v_u_9 = require(v7.Components.ConversationThumbnail)
local v_u_10 = require(v1.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local v_u_11 = require(v7.Components.InviteButton)
local v_u_12 = require(v7.Constants).InviteStatus
local v13 = v_u_5.PureComponent:extend("ConversationEntry")
function v13.init(p_u_14) -- name: init
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_12, (copy) v_u_2
	p_u_14.eventStream = v_u_10.new(v_u_3)
	function p_u_14.onInvite()
		-- upvalues: (copy) p_u_14, (ref) v_u_12, (ref) v_u_2
		local v15 = p_u_14.props.inviteStatus
		if not v15 or v15 == v_u_12.Failed then
			local v_u_16 = p_u_14.props.analytics
			local v_u_17 = p_u_14.props.users
			local v18 = p_u_14.props.inviteUser
			if #v_u_17 == 1 then
				local function v23(p19)
					-- upvalues: (copy) v_u_17, (ref) v_u_2, (copy) v_u_16
					if p19 then
						local v20 = {}
						for _, v21 in pairs(v_u_17) do
							local v22 = v21.id
							table.insert(v20, v22)
						end
						v_u_16:onActivatedInviteSent(v_u_2.LocalPlayer.UserId, p19.conversationId, v20)
					end
				end
				v18(v_u_17[1].id):andThen(v23, function() end)
			end
		end
	end
end
function v13.render(p24) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11
	local v25 = p24.props.visible
	local v26 = p24.props.layoutOrder
	local v27 = p24.props.zIndex
	local v28 = p24.props.size
	local v29 = p24.props.subtitle
	local v30 = p24.props.title
	local v31 = p24.props.users
	local v32 = p24.props.inviteStatus
	local v33 = p24.props.presence
	local v34 = v_u_5.createElement
	local v35 = {
		["Visible"] = v25,
		["Selectable"] = true,
		["BackgroundColor3"] = v_u_6.color("PlayerRowFrame"),
		["BackgroundTransparency"] = v_u_6.transparency("PlayerRowFrame", 1),
		["ImageTransparency"] = 0,
		["ScaleType"] = Enum.ScaleType.Stretch,
		["SliceCenter"] = Rect.new(),
		["Size"] = v28,
		["LayoutOrder"] = v26,
		["ZIndex"] = v27,
		[v_u_5.Event.Activated] = p24.onInvite
	}
	local v36 = {
		["UICorner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = v_u_6.MenuContainerCornerRadius
		}) or nil,
		["UIPadding"] = v_u_5.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 12),
			["PaddingRight"] = UDim.new(0, 12),
			["PaddingTop"] = UDim.new(0, 12),
			["PaddingBottom"] = UDim.new(0, 12)
		}),
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 12)
		}),
		["Thumbnail"] = v_u_5.createElement(v_u_9, {
			["users"] = nil,
			["size"] = nil,
			["layoutOrder"] = 0,
			["zIndex"] = nil,
			["users"] = v31,
			["size"] = UDim2.new(0, 32, 0, 32),
			["zIndex"] = v27
		}),
		["Details"] = v_u_5.createElement(v_u_8, {
			["title"] = nil,
			["subtitle"] = nil,
			["presence"] = nil,
			["size"] = nil,
			["layoutOrder"] = 1,
			["zIndex"] = nil,
			["title"] = v30,
			["subtitle"] = v29,
			["presence"] = v33,
			["size"] = UDim2.new(1, -125, 1, 0),
			["zIndex"] = v27
		}),
		["InviteButton"] = v_u_5.createElement(v_u_11, {
			["size"] = nil,
			["layoutOrder"] = 2,
			["zIndex"] = nil,
			["onInvite"] = nil,
			["inviteStatus"] = nil,
			["size"] = UDim2.new(0, 69, 1, 0),
			["zIndex"] = v27,
			["onInvite"] = p24.onInvite,
			["inviteStatus"] = v32
		})
	}
	return v34("ImageButton", v35, v36)
end
return v13