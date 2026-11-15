-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.PlayerNameTag
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.t)
local v_u_5 = require(v1.Workspace.Packages.VerifiedBadges)
local v_u_6 = require(v1.Workspace.Packages.UserLib)
local v_u_7 = require(v1.Packages.Cryo)
local v_u_8 = require(v1.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local v9 = script.Parent.Parent.Parent
local v10 = v9.Components.Connection
local v_u_11 = require(v10.LayoutValues).WithLayoutValues
local v_u_12 = require(v9.Hooks.usePlayerCombinedName)
local v13 = require(v9.createShallowEqualAndTables)
local v14 = require(v9.Flags.FFlagPlayerListReduceRerenders)
local v_u_15 = require(v1.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge
local v_u_16 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local v17 = require(v2.Modules.Interfaces.playerInterface)
local v_u_18 = v_u_3.PureComponent:extend("PlayerNameTag")
local v19 = v4.strictInterface
local v20 = {
	["player"] = v17,
	["isTitleEntry"] = v4.boolean,
	["isHovered"] = v4.boolean,
	["layoutOrder"] = v4.integer,
	["name"] = v4.union(v4.string, v4.table),
	["hasVerifiedBadge"] = v4.optional(v4.boolean),
	["textStyle"] = v4.strictInterface({
		["Color"] = v4.Color3,
		["Transparency"] = v4.number,
		["StrokeColor"] = v4.optional(v4.Color3),
		["StrokeTransparency"] = v4.optional(v4.number)
	}),
	["textFont"] = v4.strictInterface({
		["Size"] = v4.number,
		["MinSize"] = v4.number,
		["Font"] = v4.enum(Enum.Font),
		["FontFace"] = v4.optional(v4.typeof("Font"))
	})
}
v_u_18.validateProps = v19(v20)
function v_u_18.render(p_u_21) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_16, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5, (copy) v_u_8
	return v_u_11(function(p22)
		-- upvalues: (copy) p_u_21, (ref) v_u_16, (ref) v_u_6, (ref) v_u_3, (ref) v_u_5, (ref) v_u_8
		local v23 = p22.IconUnSelectedColor
		if p_u_21.props.isHovered then
			v23 = p22.IconSelectedColor
		end
		local v24 = p_u_21.props.textFont.Font
		local v25 = p_u_21.props.textFont.FontFace
		local v26 = p_u_21.props.textFont.Size
		local v27 = {}
		local v28 = p_u_21.props.player.PlatformName
		local v29
		if v_u_16 then
			v29 = p_u_21.props.hasVerifiedBadge
		else
			v29 = v_u_6.Utils.isPlayerVerified(p_u_21.props.player)
		end
		if p22.IsTenFoot and v28 ~= "" then
			v27.VerticalLayout = v_u_3.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Vertical,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 10)
			})
			v27.PlayerPlatformName = v_u_3.createElement("TextLabel", {
				["Position"] = nil,
				["Size"] = nil,
				["TextXAlignment"] = nil,
				["Font"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextStrokeColor3"] = nil,
				["TextStrokeTransparency"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = nil,
				["LayoutOrder"] = 2,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["Size"] = UDim2.new(1, 0, 0.35, 0),
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Font"] = Enum.Font.SourceSans,
				["TextSize"] = v26,
				["TextColor3"] = p_u_21.props.textStyle.Color,
				["TextTransparency"] = p_u_21.props.textStyle.Transparency,
				["TextStrokeColor3"] = p_u_21.props.textStyle.StrokeColor,
				["TextStrokeTransparency"] = p_u_21.props.textStyle.StrokeTransparency,
				["Text"] = v28
			})
			local v30 = v_u_3.createElement
			local v31 = "Frame"
			local v32 = {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 2,
				["Size"] = UDim2.new(1, 0, 0.45, 0)
			}
			local v33 = {
				["Layout"] = v_u_3.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["Padding"] = UDim.new(0, 6)
				}),
				["RobloxIcon"] = v_u_3.createElement("ImageButton", {
					["Size"] = nil,
					["Image"] = nil,
					["BackgroundTransparency"] = 1,
					["Selectable"] = false,
					["ImageColor3"] = nil,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.new(0, 24, 0, 24),
					["Image"] = p22.RobloxIconImage,
					["ImageColor3"] = v23
				})
			}
			local v34 = v_u_3.createElement
			local v35 = v_u_5.EmojiWrapper
			local v36 = {
				["emoji"] = nil,
				["layoutOrder"] = 2,
				["mockIsEnrolled"] = true,
				["size"] = nil,
				["automaticSize"] = nil,
				["verticalAlignment"] = nil,
				["emoji"] = not v29 and "" or v_u_5.emoji.verified,
				["size"] = UDim2.new(1, -30, 0, 0),
				["automaticSize"] = Enum.AutomaticSize.Y,
				["verticalAlignment"] = Enum.VerticalAlignment.Center
			}
			local v37 = {}
			local v38 = v_u_3.createElement
			local v39 = "TextLabel"
			local v40 = {
				["AutomaticSize"] = nil,
				["ClipsDescendants"] = false,
				["Size"] = nil,
				["Font"] = nil,
				["FontFace"] = nil,
				["Text"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextStrokeColor3"] = nil,
				["TextStrokeTransparency"] = nil,
				["TextTruncate"] = nil,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["AutomaticSize"] = Enum.AutomaticSize.X,
				["Size"] = UDim2.fromScale(0, 1)
			}
			if v_u_8 then
				v24 = nil
			end
			v40.Font = v24
			if not v_u_8 then
				v25 = nil
			end
			v40.FontFace = v25
			v40.Text = p_u_21.props.name
			v40.TextSize = v26
			v40.TextColor3 = p_u_21.props.textStyle.Color
			v40.TextTransparency = p_u_21.props.textStyle.Transparency
			v40.TextStrokeColor3 = p_u_21.props.textStyle.StrokeColor
			v40.TextStrokeTransparency = p_u_21.props.textStyle.StrokeTransparency
			v40.TextTruncate = Enum.TextTruncate.AtEnd
			v40.TextXAlignment = Enum.TextXAlignment.Left
			v37.PlayerName = v38(v39, v40)
			v33.PlayerNameContainer = v34(v35, v36, v37)
			v27.RobloxNameFrame = v30(v31, v32, v33)
		else
			local v41 = v_u_3.createElement
			local v42 = v_u_5.EmojiWrapper
			local v43 = {
				["emoji"] = nil,
				["anchorPoint"] = nil,
				["position"] = nil,
				["mockIsEnrolled"] = true,
				["verticalAlignment"] = nil,
				["automaticSize"] = nil,
				["size"] = nil,
				["emoji"] = not v29 and "" or v_u_5.emoji.verified,
				["anchorPoint"] = Vector2.new(0, 0.5),
				["position"] = UDim2.fromScale(0, 0.5),
				["verticalAlignment"] = Enum.VerticalAlignment.Center,
				["automaticSize"] = Enum.AutomaticSize.X,
				["size"] = UDim2.new(0, 0, 0, v26)
			}
			local v44 = {}
			local v45 = v_u_3.createElement
			local v46 = "TextLabel"
			local v47 = {
				["AutomaticSize"] = nil,
				["Size"] = nil,
				["Font"] = nil,
				["FontFace"] = nil,
				["Text"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextTransparency"] = nil,
				["TextTruncate"] = nil,
				["TextScaled"] = false,
				["TextStrokeColor3"] = nil,
				["TextStrokeTransparency"] = nil,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["AutomaticSize"] = Enum.AutomaticSize.X,
				["Size"] = UDim2.fromScale(0, 1)
			}
			if v_u_8 then
				v24 = nil
			end
			v47.Font = v24
			if not v_u_8 then
				v25 = nil
			end
			v47.FontFace = v25
			v47.Text = p_u_21.props.name
			v47.TextSize = v26
			v47.TextColor3 = p_u_21.props.textStyle.Color
			v47.TextTransparency = p_u_21.props.textStyle.Transparency
			v47.TextTruncate = Enum.TextTruncate.AtEnd
			v47.TextStrokeColor3 = p_u_21.props.textStyle.StrokeColor
			v47.TextStrokeTransparency = p_u_21.props.textStyle.StrokeTransparency
			v47.TextXAlignment = Enum.TextXAlignment.Left
			v44.PlayerName = v45(v46, v47)
			v27.PlayerNameContainer = v41(v42, v43, v44)
		end
		return v_u_3.createElement("Frame", {
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = p_u_21.props.layoutOrder,
			["Size"] = p22.PlayerNameSize
		}, v27)
	end)
end
local function v57(p48) -- name: PlayerNameTagContainer
	-- upvalues: (copy) v_u_12, (copy) v_u_16, (copy) v_u_15, (copy) v_u_3, (copy) v_u_18, (copy) v_u_7
	local v49 = v_u_12
	local v50 = p48.player.UserId
	local v51 = v49(tostring(v50), p48.player.DisplayName)
	local v52
	if v_u_16 then
		v52 = v_u_15(p48.player)
	else
		v52 = nil
	end
	local v53 = v_u_3.createElement
	local v54 = v_u_18
	local v55 = v_u_7.Dictionary.join
	local v56 = {
		["name"] = v51
	}
	if not v_u_16 then
		v52 = nil
	end
	v56.hasVerifiedBadge = v52
	return v53(v54, v55(p48, v56))
end
if v14 then
	return v_u_3.memo(v57, v13({ "textFont" }))
else
	return v57
end