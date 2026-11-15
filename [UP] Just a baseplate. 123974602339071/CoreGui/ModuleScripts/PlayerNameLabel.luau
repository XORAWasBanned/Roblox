-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.PlayerNameLabel
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v3 = script.Parent.Parent
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_7 = require(v3.Colors)
local v_u_8 = require(v1.Workspace.Packages.RobloxTranslator)
local v9 = require(v1.Workspace.Packages.VerifiedBadges)
local v_u_10 = require(v1.Workspace.Packages.UserLib)
local v_u_11 = require(v3.Components.InspectAndBuyContext)
local v12 = v_u_4.PureComponent:extend("PlayerNameLabel")
local v_u_13 = v9.emoji.verified
function v12.render(p14) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_8, (copy) v_u_13, (copy) v_u_4, (copy) v_u_11, (copy) v_u_7, (copy) v_u_6
	local v15 = p14.props.locale
	local v_u_16 = p14.props.view
	local v17 = p14.props.playerName
	local v18 = p14.props.playerId
	local v19 = tonumber(v18)
	if v19 then
		v19 = v_u_2:GetPlayerByUserId(v19)
	end
	local v20
	if v19 then
		v20 = v_u_10.Utils.isPlayerVerified(v19)
	else
		v20 = false
	end
	local v_u_21
	if v17 == "" then
		v_u_21 = ""
	elseif v20 then
		v_u_21 = v_u_8:FormatByKeyForLocale("InGame.InspectMenu.Label.VerifiedAvatar", v15, {
			["PLAYER_NAME"] = v17,
			["VERIFIED_BADGE"] = v_u_13
		})
	else
		v_u_21 = v_u_8:FormatByKeyForLocale("InGame.InspectMenu.Label.Avatar", v15, {
			["PLAYER_NAME"] = v17
		})
	end
	local v25 = {
		["render"] = function(p22) -- name: render
			-- upvalues: (copy) v_u_16, (ref) v_u_4, (ref) v_u_7, (ref) v_u_21, (ref) v_u_6
			local v23 = p22[v_u_16]
			local v24 = v23.AvatarHeadShotSize + v23.BorderPaddingSize * 2 + 10
			return v_u_4.createElement("TextLabel", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["TextColor3"] = nil,
				["TextScaled"] = true,
				["Text"] = nil,
				["TextSize"] = 36,
				["Font"] = nil,
				["TextXAlignment"] = nil,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, -v24, 0, v23.TopSizeY),
				["TextColor3"] = v_u_7.White,
				["Text"] = v_u_21,
				["Font"] = v_u_6.default:getBlack(),
				["TextXAlignment"] = Enum.TextXAlignment.Left
			}, {
				["TextSizeConstraint"] = v_u_4.createElement("UITextSizeConstraint", {
					["MaxTextSize"] = 36
				})
			})
		end
	}
	return v_u_4.createElement(v_u_11.Consumer, v25)
end
return v5.UNSTABLE_connect2(function(p26, _)
	return {
		["view"] = p26.view,
		["playerName"] = p26.playerName,
		["playerId"] = p26.playerId,
		["locale"] = p26.locale
	}
end)(v12)