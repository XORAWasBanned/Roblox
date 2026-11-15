-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InviteFriendsPage.SendInviteButton
local v_u_1 = game:GetService("RunService")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Packages.InGameMenuDependencies)
local v_u_4 = v3.Roact
local v5 = v3.UIBlox
local v6 = v3.t
local v_u_7 = require(v2.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v8 = require(v2.Packages.Foundation)
local v_u_9 = require(v2.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10
if v_u_9 then
	v_u_10 = v8.UNSTABLE.withCursorMigration
else
	v_u_10 = v5.App.SelectionImage.withSelectionCursorProvider
end
local v_u_11
if v_u_9 then
	v_u_11 = v8.Enums.CursorType
else
	v_u_11 = v5.App.SelectionImage.CursorKind
end
local v12 = script.Parent.Parent.Parent
local v_u_13 = require(v12.Resources.Constants).InviteStatus
local v_u_14 = v5.App.ImageSet.Images
local v_u_15 = v5.Core.ImageSet.ImageSetLabel
local v_u_16 = v8.Icon
local v_u_17 = v8.Enums.IconName
local v_u_18 = v8.Enums.IconVariant
local v_u_19 = v8.Enums.IconSize
local v20 = v_u_4.PureComponent:extend("SendInviteButton")
v20.validateProps = v6.strictInterface({
	["onActivated"] = v6.callback,
	["animationBegun"] = v6.callback,
	["animationEnded"] = v6.callback,
	["userInviteStatus"] = v6.optional(v6.string)
})
local v_u_50 = {
	[v_u_13.Pending] = function(p21, p22)
		local v23 = 6.283185307179586 * p21
		local v24 = math.sin(v23) * 0.375 + 0.375
		p22.sendTransparency(v24)
	end,
	[v_u_13.Success] = function(p25, p26, p27)
		local v28
		if p25 >= 0 then
			v28 = p25 <= 0.13333333333333333
		else
			v28 = false
		end
		if v28 then
			local v29 = (p25 - 0) / 0.13333333333333333
			p26.sendTransparency(v29)
			p26.successTransparency(1 - v29)
			local v30 = 0.75 + 0.75 * (1 - v29)
			p26.successSize(v30)
			return
		else
			local v31
			if p25 >= 0.13333333333333333 then
				v31 = p25 <= 0.3
			else
				v31 = false
			end
			if v31 then
				p26.sendTransparency(1)
				p26.successTransparency(0)
				local v32 = 0.75 + 0.25 * ((p25 - 0.13333333333333333) / 0.16666666666666666)
				p26.successSize(v32)
			else
				p26.successSize(1)
				p27()
			end
		end
	end,
	[v_u_13.Failed] = function(p33, p34, p35)
		local v36
		if p33 >= 0 then
			v36 = p33 <= 0.06666666666666667
		else
			v36 = false
		end
		if v36 then
			local v37 = (p33 - 0) / 0.13333333333333333
			p34.sendTransparency(v37)
		else
			local v38
			if p33 >= 0.06666666666666667 then
				v38 = p33 <= 1.7333333333333334
			else
				v38 = false
			end
			if v38 then
				p34.sendTransparency(1)
			else
				local v39
				if p33 >= 1.7333333333333334 then
					v39 = p33 <= 1.9
				else
					v39 = false
				end
				if v39 then
					local v40 = (p33 - 1.7333333333333334) / 0.16666666666666666
					p34.sendTransparency(1 - v40)
				else
					p34.sendTransparency(0)
					p35()
				end
			end
		end
		local v41
		if p33 >= 0 then
			v41 = p33 <= 0.13333333333333333
		else
			v41 = false
		end
		if v41 then
			local v42 = (p33 - 0) / 0.13333333333333333
			p34.failTransparency(1 - v42)
			return
		else
			local v43
			if p33 >= 0.13333333333333333 then
				v43 = p33 <= 1.4
			else
				v43 = false
			end
			if v43 then
				p34.failTransparency(0)
				local v44 = p33 - 0.13333333333333333
				local v45 = -0.4 * 2.71828182846 ^ (-v44 * 8)
				local v46 = v44 * 40
				local v47 = v45 * math.sin(v46)
				p34.failPos(v47)
				return
			else
				local v48
				if p33 >= 1.4 then
					v48 = p33 <= 1.5666666666666667
				else
					v48 = false
				end
				if v48 then
					p34.failPos(0)
					local v49 = (p33 - 1.4) / 0.16666666666666666
					p34.failTransparency(v49)
				else
					p34.failTransparency(1)
				end
			end
		end
	end
}
function v20.init(p51, p52) -- name: init
	-- upvalues: (copy) v_u_4, (copy) v_u_13
	local v53, v54 = v_u_4.createBinding(0)
	local v55, v56 = v_u_4.createBinding(1)
	local v57, v58 = v_u_4.createBinding(1)
	local v59, v60 = v_u_4.createBinding(1)
	local v61, v62 = v_u_4.createBinding(0)
	p51.bindings = {
		["sendTransparency"] = v53,
		["successTransparency"] = v55,
		["failTransparency"] = v57,
		["successSize"] = v59:map(function(p63)
			return UDim2.new(p63, 0, p63, 0)
		end),
		["successScale"] = v59,
		["failPos"] = v61:map(function(p64)
			return UDim2.new(p64, 0, 0, 0)
		end)
	}
	p51.updateBindings = {
		["sendTransparency"] = v54,
		["successTransparency"] = v56,
		["failTransparency"] = v58,
		["successSize"] = v60,
		["failPos"] = v62
	}
	if p52.userInviteStatus == v_u_13.Success then
		v56(0)
		v54(1)
	end
end
function v20.renderWithSelectionCursor(p_u_65, p_u_66) -- name: renderWithSelectionCursor
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_11, (copy) v_u_13, (copy) v_u_9, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_15, (copy) v_u_14
	local v_u_67 = p_u_65.props
	return v_u_7(function(p68)
		local v69 = {}
		local v70 = {
			["IconEmphasis"] = {
				["Color"] = p68.Color.Content.Emphasis.Color3,
				["Transparency"] = p68.Color.Content.Emphasis.Transparency
			}
		}
		v69.Theme = v70
		v69.IconSize = p68.Size.Size_800
		return v69
	end, function(p_u_71)
		-- upvalues: (ref) v_u_4, (copy) p_u_66, (ref) v_u_11, (copy) v_u_67, (ref) v_u_13, (copy) p_u_65, (ref) v_u_9, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_15, (ref) v_u_14
		local v72 = v_u_4.createElement
		local v73 = "TextButton"
		local v76 = {
			["Selectable"] = false,
			["Size"] = UDim2.new(0, 36, 0, 36),
			["BackgroundTransparency"] = 1,
			["Text"] = "",
			["SelectionImageObject"] = p_u_66(v_u_11.InputFields),
			[v_u_4.Event.Activated] = function()
				-- upvalues: (ref) v_u_67, (ref) v_u_13, (ref) p_u_65
				local v74 = v_u_67.userInviteStatus == v_u_13.Pending
				local v75 = v_u_67.userInviteStatus == v_u_13.Success
				if not (p_u_65.renderSteppedConnection or (v74 or v75)) then
					v_u_67.onActivated()
				end
			end
		}
		local v77 = {}
		local v78
		if v_u_9 then
			v78 = v_u_4.createElement(v_u_16, {
				["name"] = v_u_17.PersonArrowFromBottomRight,
				["variant"] = v_u_18.Regular,
				["size"] = v_u_19.XXLarge,
				["style"] = p_u_65.bindings.sendTransparency:map(function(p79)
					-- upvalues: (copy) p_u_71
					return {
						["Color3"] = p_u_71.Theme.IconEmphasis.Color,
						["Transparency"] = p79
					}
				end)
			})
		else
			v78 = v_u_4.createElement(v_u_15, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Size"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Image"] = v_u_14["icons/actions/friends/friendInvite"],
				["Size"] = UDim2.new(1, 0, 1, 0),
				["ImageColor3"] = p_u_71.Theme.IconEmphasis.Color,
				["ImageTransparency"] = p_u_65.bindings.sendTransparency
			})
		end
		v77.SendLabel = v78
		local v80
		if v_u_9 then
			v80 = v_u_4.createElement(v_u_16, {
				["name"] = v_u_17.CheckLarge,
				["variant"] = v_u_18.Filled,
				["size"] = p_u_65.bindings.successScale:map(function(p81)
					-- upvalues: (copy) p_u_71
					return p_u_71.IconSize * p81
				end),
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["style"] = p_u_65.bindings.successTransparency:map(function(p82)
					-- upvalues: (copy) p_u_71
					return {
						["Color3"] = p_u_71.Theme.IconEmphasis.Color,
						["Transparency"] = p82
					}
				end)
			})
		else
			v80 = v_u_4.createElement(v_u_15, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Size"] = nil,
				["Image"] = v_u_14["icons/status/success"],
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["ImageColor3"] = p_u_71.Theme.IconEmphasis.Color,
				["ImageTransparency"] = p_u_65.bindings.successTransparency,
				["Size"] = p_u_65.bindings.successSize
			})
		end
		v77.SuccessLabel = v80
		local v83
		if v_u_9 then
			v83 = v_u_4.createElement(v_u_16, {
				["name"] = v_u_17.TriangleExclamation,
				["variant"] = v_u_18.Filled,
				["size"] = v_u_19.XXLarge,
				["style"] = p_u_65.bindings.failTransparency:map(function(p84)
					-- upvalues: (copy) p_u_71
					return {
						["Color3"] = p_u_71.Theme.IconEmphasis.Color,
						["Transparency"] = p84
					}
				end),
				["Position"] = p_u_65.bindings.failPos
			})
		else
			v83 = v_u_4.createElement(v_u_15, {
				["BackgroundTransparency"] = 1,
				["Image"] = nil,
				["Size"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["Position"] = nil,
				["Image"] = v_u_14["icons/status/alert"],
				["Size"] = UDim2.new(1, 0, 1, 0),
				["ImageColor3"] = p_u_71.Theme.IconEmphasis.Color,
				["ImageTransparency"] = p_u_65.bindings.failTransparency,
				["Position"] = p_u_65.bindings.failPos
			})
		end
		v77.FailLabel = v83
		return v72(v73, v76, v77)
	end)
end
function v20.render(p_u_85) -- name: render
	-- upvalues: (copy) v_u_10
	return v_u_10(function(p86)
		-- upvalues: (copy) p_u_85
		return p_u_85:renderWithSelectionCursor(p86)
	end)
end
function v20.didUpdate(p87, p88) -- name: didUpdate
	-- upvalues: (copy) v_u_50
	if p87.props.userInviteStatus and p87.props.userInviteStatus ~= p88.userInviteStatus then
		p87:playAnimation(v_u_50[p87.props.userInviteStatus])
	end
end
function v20.didMount(p89) -- name: didMount
	-- upvalues: (copy) v_u_50
	if p89.props.userInviteStatus then
		p89:playAnimation(v_u_50[p89.props.userInviteStatus])
	end
end
function v20.playAnimation(p_u_90, p91) -- name: playAnimation
	-- upvalues: (copy) v_u_1
	p_u_90.animationStartTime = tick()
	p_u_90.animationFunction = p91
	if not p_u_90.renderSteppedConnection then
		p_u_90.renderSteppedConnection = v_u_1.RenderStepped:Connect(function()
			-- upvalues: (copy) p_u_90
			p_u_90.animationFunction(tick() - p_u_90.animationStartTime, p_u_90.updateBindings, function()
				-- upvalues: (ref) p_u_90
				p_u_90:stopAnimation()
			end)
		end)
		p_u_90.props.animationBegun()
	end
end
function v20.stopAnimation(p92) -- name: stopAnimation
	if p92.renderSteppedConnection then
		p92.renderSteppedConnection:Disconnect()
		p92.renderSteppedConnection = nil
		p92.props.animationEnded()
	end
end
function v20.willUnmount(p93) -- name: willUnmount
	p93:stopAnimation()
end
return v20