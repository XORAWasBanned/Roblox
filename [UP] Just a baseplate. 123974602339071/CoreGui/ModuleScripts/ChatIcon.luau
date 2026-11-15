-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.ChatIcon
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("VRService")
game:GetService("AppStorageService")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = require(v1.Packages.t)
local v7 = require(v1.Packages.UIBlox)
local _ = require(v1.Workspace.Packages.AppCommonLib).Signal
local v_u_8 = v7.Core.Style.withStyle
local v_u_9 = v7.App.Indicator.Badge
local v_u_10 = v7.App.Indicator.Enum.BadgeStates
local v_u_11 = v7.App.ImageSet.Images
local v12 = v2:WaitForChild("RobloxGui")
local v_u_13 = require(v12.Modules.ChatSelector)
local v_u_14 = require(v12.Modules.TenFootInterface)
local v_u_15 = require(script.Parent.IconButton)
local v16 = script.Parent.Parent.Parent
local v_u_17 = require(v16.Analytics)
local v_u_18 = require(v16.Flags.GetFFlagEnableTopBarAnalytics)()
local v_u_19 = require(v16.Actions.SetKeepOutArea)
local v_u_20 = require(v16.Actions.RemoveKeepOutArea)
local v_u_21 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_22 = v_u_21.Flags.FFlagTopBarSignalizeKeepOutAreas
local v_u_23 = require(v16.Constants)
require(script.Parent.ChatIconFtuxTooltip)
local v_u_24 = require(v1.Workspace.Packages.ExpChat).getExperienceChatVisualConfig
game:DefineFastInt("InExperienceChatTooltipShowDelayMs", 1000)
game:DefineFastInt("InExperienceChatTooltipDismissDelayMs", 7000)
local v_u_25 = UserSettings().GameSettings
local v26 = v_u_4.PureComponent:extend("ChatIcon")
local v27 = v6.strictInterface
local v28 = {
	["layoutOrder"] = v6.integer,
	["chatVisible"] = v6.boolean,
	["unreadMessages"] = v6.integer,
	["topBarEnabled"] = v6.boolean,
	["chatEnabled"] = v6.boolean
}
local v29
if v_u_22 then
	v29 = nil
else
	v29 = v6.callback
end
v28.setKeepOutArea = v29
local v30
if v_u_22 then
	v30 = nil
else
	v30 = v6.callback
end
v28.removeKeepOutArea = v30
v26.validateProps = v27(v28)
function v26.init(p31) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_25, (copy) v_u_18, (copy) v_u_17, (copy) v_u_22, (copy) v_u_21
	p31.buttonRef = v_u_4.createRef()
	function p31.chatIconActivated()
		-- upvalues: (ref) v_u_13, (ref) v_u_25, (ref) v_u_18, (ref) v_u_17
		v_u_13:ToggleVisibility()
		v_u_25.ChatVisible = v_u_13:GetVisibility()
		if v_u_18 then
			v_u_17.default:onChatButtonActivated(v_u_25.ChatVisible)
		end
	end
	if v_u_22 then
		p31.keepOutAreasStore = v_u_21.Stores.GetKeepOutAreasStore(false)
	end
end
function v26.render(p_u_32) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_14, (copy) v_u_3, (copy) v_u_24, (copy) v_u_11, (copy) v_u_22, (copy) v_u_23, (copy) v_u_4, (copy) v_u_15, (copy) v_u_9, (copy) v_u_10
	return v_u_8(function(_)
		-- upvalues: (copy) p_u_32, (ref) v_u_14, (ref) v_u_3, (ref) v_u_24, (ref) v_u_11, (ref) v_u_22, (ref) v_u_23, (ref) v_u_4, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10
		local v_u_33 = p_u_32.props.topBarEnabled and (p_u_32.props.chatEnabled and not v_u_14:IsEnabled())
		if v_u_33 then
			v_u_33 = not v_u_3.VREnabled
		end
		local v34 = v_u_24()
		local v35 = v34.iconSize
		local v36 = v_u_11[v34.icon.on]
		if not p_u_32.props.chatVisible then
			v36 = v_u_11[v34.icon.off]
		end
		local function v_u_38(p37)
			-- upvalues: (copy) v_u_33, (ref) v_u_22, (ref) p_u_32, (ref) v_u_23
			if v_u_33 and p37 then
				if v_u_22 then
					p_u_32.keepOutAreasStore.setKeepOutArea(v_u_23.ChatIconKeepOutAreaId, p37.AbsolutePosition, p37.AbsoluteSize)
				else
					p_u_32.props.setKeepOutArea(v_u_23.ChatIconKeepOutAreaId, p37.AbsolutePosition, p37.AbsoluteSize)
				end
			elseif v_u_22 then
				p_u_32.keepOutAreasStore.removeKeepOutArea(v_u_23.ChatIconKeepOutAreaId)
			else
				p_u_32.props.removeKeepOutArea(v_u_23.ChatIconKeepOutAreaId)
			end
		end
		local function v40(p39)
			-- upvalues: (ref) p_u_32, (copy) v_u_38
			if p39 then
				p_u_32.buttonRef.current = p39
				v_u_38(p_u_32.buttonRef.current)
			end
		end
		if p_u_32.buttonRef.current then
			v_u_38(p_u_32.buttonRef.current)
		end
		local v41 = v_u_4.createElement(v_u_15, {
			["icon"] = v36,
			["iconSize"] = v35,
			["onActivated"] = p_u_32.chatIconActivated,
			[v_u_4.Change.AbsoluteSize] = v_u_38,
			[v_u_4.Change.AbsolutePosition] = v_u_38,
			[v_u_4.Ref] = v40
		})
		local v42 = v_u_4.createElement
		local v43 = "TextButton"
		local v44 = {
			["Text"] = "",
			["Visible"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Selectable"] = false,
			["Visible"] = v_u_33,
			["Size"] = UDim2.new(0, 44, 1, 0),
			["LayoutOrder"] = p_u_32.props.layoutOrder
		}
		local v45 = {
			["Background"] = v41
		}
		local v46 = v_u_4.createElement
		local v47 = "Frame"
		local v48 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["ZIndex"] = 2,
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v49 = {}
		local v50
		if p_u_32.props.unreadMessages > 0 then
			v50 = v_u_4.createElement(v_u_9, {
				["position"] = nil,
				["anchorPoint"] = nil,
				["hasShadow"] = false,
				["value"] = nil,
				["position"] = UDim2.fromOffset(18, game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and 6 or 2),
				["anchorPoint"] = Vector2.new(0, 0),
				["value"] = game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService and v_u_10.isEmpty or p_u_32.props.unreadMessages
			})
		else
			v50 = false
		end
		v49.Badge = v50
		v45.BadgeContainer = v46(v47, v48, v49)
		return v42(v43, v44, v45)
	end)
end
return v5.UNSTABLE_connect2(function(p51) -- name: mapStateToProps
	return {
		["chatVisible"] = p51.chat.visible,
		["unreadMessages"] = p51.chat.unreadMessages,
		["topBarEnabled"] = p51.displayOptions.topbarEnabled,
		["chatEnabled"] = p51.coreGuiEnabled[Enum.CoreGuiType.Chat]
	}
end, not v_u_22 and function(p_u_52) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_22, (copy) v_u_19, (copy) v_u_20
	return v_u_22 and {} or {
		["setKeepOutArea"] = function(p53, p54, p55) -- name: setKeepOutArea
			-- upvalues: (copy) p_u_52, (ref) v_u_19
			return p_u_52(v_u_19(p53, p54, p55))
		end,
		["removeKeepOutArea"] = function(p56) -- name: removeKeepOutArea
			-- upvalues: (copy) p_u_52, (ref) v_u_20
			return p_u_52(v_u_20(p56))
		end
	}
end or nil)(v26)