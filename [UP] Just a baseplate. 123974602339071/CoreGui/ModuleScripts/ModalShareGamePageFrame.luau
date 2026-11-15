-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ModalShareGamePageFrame
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v_u_1:WaitForChild("RobloxGui")
local v4 = v_u_1.RobloxGui.Modules
local v_u_5 = require(v2.Packages.Roact)
local v6 = require(v2.Packages.RoactRodux)
local v7 = v4.Settings.Pages.ShareGame
local v_u_8 = require(v7.Constants)
local v_u_9 = require(v2.Workspace.Packages.GameInvite).GameInviteEvents
local v_u_10 = require(v7.Components.Header)
local v_u_11 = require(v7.Components.ConversationList)
local v_u_12 = require(v7.Components.ErrorToaster)
local v_u_13 = require(v7.Components.BackButton)
local v_u_14 = require(v2.Workspace.Packages.AppCommonLib).Text
local v_u_15 = require(v3.Modules.Settings.Theme)
local v_u_16 = require(v4.Flags.GetFFlagEnableNewInviteMenu)
local v_u_17 = require(v4.Flags.GetFFlagEnableNewInviteSendEndpoint)
local v_u_18 = UDim.new(0.8, 320)
local v_u_19 = UDim.new(0.7, 500)
local v_u_20 = UDim.new(0.8, 440)
local v_u_21 = Color3.fromRGB(41, 41, 41)
local v22 = v_u_5.PureComponent:extend("ModalShareGamePageFrame")
v22.defaultProps = {
	["isVisible"] = true
}
function v22.init(p_u_23) -- name: init
	-- upvalues: (copy) v_u_8, (copy) v_u_15, (copy) v_u_14, (copy) v_u_5
	p_u_23.state = {
		["promptMessageFitsFrame"] = true
	}
	function p_u_23.onCustomTextAreaSizeChange(p24)
		-- upvalues: (copy) p_u_23, (ref) v_u_8, (ref) v_u_15, (ref) v_u_14
		local v25 = p_u_23.props.deviceLayout
		local v26 = v_u_8.LayoutSpecific[v25]
		local v27 = p_u_23.props.promptMessage
		local v28 = v_u_15.textSize(v26.PAGE_TITLE_TEXT_SIZE)
		local v29 = p_u_23
		local v30 = {}
		if v27 then
			v27 = v_u_14.GetTextWidth(v27, v_u_15.font(Enum.Font.SourceSans), v28) < p24.AbsoluteSize.X
		end
		v30.promptMessageFitsFrame = v27
		v29:setState(v30)
	end
	p_u_23.customTextAreaRef = v_u_5.createRef()
	function p_u_23.onClosePage()
		-- upvalues: (copy) p_u_23
		p_u_23.props.closePage()
		if p_u_23.props.onAfterClosePage then
			p_u_23.props.onAfterClosePage()
		end
	end
end
function v22.didMount(p31) -- name: didMount
	-- upvalues: (copy) v_u_16, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9
	if v_u_16() and p31.customTextAreaRef.current then
		p31.onCustomTextAreaSizeChange(p31.customTextAreaRef.current)
	end
	if v_u_17() and (p31.props.promptMessage and p31.props.analytics) then
		p31.props.analytics:sendEvent(v_u_8.Triggers.DeveloperMultiple, v_u_9.CustomTextShown)
	end
end
function v22.render(p32) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_18, (copy) v_u_8, (copy) v_u_19, (copy) v_u_15, (copy) v_u_5, (copy) v_u_21, (copy) v_u_1, (copy) v_u_12, (copy) v_u_10, (copy) v_u_13, (copy) v_u_11
	local v33 = p32.props.analytics
	local v34 = p32.props.deviceLayout
	local v35 = p32.props.zIndex
	local v36 = p32.props.searchAreaActive
	local v37 = p32.props.searchText
	local v38 = p32.props.isVisible
	local v39 = v_u_16()
	local v40
	if v39 then
		v40 = v_u_20
	else
		v40 = v_u_18
	end
	local v41 = v39 and p32.props.deviceInfo
	if v41 then
		v41 = p32.props.deviceInfo.DeviceLayout == v_u_8.DeviceLayout.PHONE_LANDSCAPE
	end
	local v42 = Vector2.new(0.5, 0.5)
	local v43 = UDim2.new(v40.Scale, 0, v_u_19.Scale, 0)
	local v44 = Vector2.new(v40.Offset, v_u_19.Offset)
	local v45 = UDim2.new(0.5, 0, 0.425, 0)
	if v41 then
		v42 = Vector2.new(0.5, 1)
		v43 = UDim2.new(v40.Scale, 0, 1, 0)
		v44 = Vector2.new(v40.Offset, (1 / 0))
		v45 = UDim2.new(0.5, 0, 1, 4)
	end
	local v46 = v_u_8.LayoutSpecific[v34]
	local v47 = p32.props.promptMessage
	local v48 = v_u_15.textSize(v46.PAGE_TITLE_TEXT_SIZE)
	local v49
	if v39 then
		if v47 then
			v49 = p32.state.promptMessageFitsFrame
		else
			v49 = v47
		end
	else
		v49 = v39
	end
	local v50 = not v49 and 10 or v48 + 10
	local v51 = not v39 and 60 or 40 + v50
	local v52 = v_u_5.createElement
	local v53 = "ImageButton"
	local v54 = {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = "rbxasset://textures/ui/LuaChat/9-slice/btn-control-sm.png",
		["ImageColor3"] = nil,
		["ImageTransparency"] = 0.1,
		["Modal"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["AnchorPoint"] = v42,
		["ImageColor3"] = v_u_21,
		["Modal"] = v38,
		["Position"] = v45,
		["Size"] = v43,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(Vector2.new(3, 3), Vector2.new(3, 3))
	}
	local v55 = {
		["sizeConstraint"] = v_u_5.createElement("UISizeConstraint", {
			["MaxSize"] = v44
		}),
		["uiPadding2"] = v_u_5.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 15),
			["PaddingRight"] = UDim.new(0, 15),
			["PaddingBottom"] = UDim.new(0, 15)
		})
	}
	local v56 = v_u_5.createElement
	local v57 = "Frame"
	local v58 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["ZIndex"] = v35
	}
	local v59 = {
		["toasterPortal"] = v_u_5.createElement(v_u_5.Portal, {
			["target"] = v_u_1
		}, {
			["Toaster"] = v_u_5.createElement(v_u_12)
		}),
		["Layout"] = v_u_5.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v60
	if v39 then
		v60 = v_u_5.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 10)
		})
	else
		v60 = nil
	end
	v59.Padding = v60
	v59.Header = v_u_5.createElement(v_u_10, {
		["deviceLayout"] = nil,
		["size"] = nil,
		["layoutOrder"] = 0,
		["zIndex"] = nil,
		["closePage"] = nil,
		["searchAreaActive"] = nil,
		["toggleSearchIcon"] = true,
		["iconType"] = nil,
		["deviceLayout"] = v34,
		["size"] = UDim2.new(1, 0, 0, v39 and 40 or 60),
		["zIndex"] = v35,
		["closePage"] = p32.onClosePage,
		["searchAreaActive"] = v36,
		["iconType"] = v_u_13.IconType.Cross
	})
	if v39 then
		v39 = v_u_5.createElement("TextLabel", {
			["Size"] = UDim2.new(1, 0, 0, v50),
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["TextSize"] = v48,
			["TextColor3"] = v_u_8.Color.WHITE,
			["Font"] = v_u_15.font(Enum.Font.SourceSans),
			["BackgroundTransparency"] = 1,
			["Text"] = not v49 and "" or v47,
			[v_u_5.Change.AbsoluteSize] = p32.onCustomTextAreaSizeChange,
			[v_u_5.Ref] = p32.customTextAreaRef
		})
	end
	v59.CustomText = v39
	v59.ConversationList = v_u_5.createElement(v_u_11, {
		["analytics"] = nil,
		["size"] = nil,
		["topPadding"] = 10,
		["layoutOrder"] = 1,
		["zIndex"] = nil,
		["searchText"] = nil,
		["entryHeight"] = 62,
		["entryPadding"] = 18,
		["isVisible"] = nil,
		["trigger"] = nil,
		["inviteMessageId"] = nil,
		["launchData"] = nil,
		["analytics"] = v33,
		["size"] = UDim2.new(1, 0, 1, -v51),
		["zIndex"] = v35,
		["searchText"] = v37,
		["isVisible"] = v38,
		["trigger"] = v_u_8.Triggers.DeveloperMultiple,
		["inviteMessageId"] = p32.props.inviteMessageId,
		["launchData"] = p32.props.launchData
	})
	v55.content = v56(v57, v58, v59)
	return v52(v53, v54, v55)
end
return v6.connect(function(p61)
	return {
		["deviceInfo"] = p61.DeviceInfo
	}
end)(v22)