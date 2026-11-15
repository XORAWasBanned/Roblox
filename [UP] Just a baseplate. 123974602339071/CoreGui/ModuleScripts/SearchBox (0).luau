-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.SearchBox
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v2.Modules.Settings.Pages.ShareGame.Constants)
local v5 = v_u_3.Component:extend("SearchBox")
local v6 = require(v2.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local v_u_7 = v6:GetImagePath()
local v_u_8 = v6:GetFrame("search_border")
local v_u_9 = Rect.new(3, 3, 4, 4)
local v_u_10 = v6:GetFrame("search_small")
local v_u_11 = v6:GetFrame("clear")
local v12 = v2.Modules.Settings.Pages.ShareGame
local v_u_13 = require(v2.Modules.Settings.Theme)
local v_u_14 = require(v12.getTranslator)()
function v5.init(p15) -- name: init
	p15.state = {
		["isTextWritten"] = false
	}
	p15.searchField = nil
end
function v5.render(p_u_16) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10, (copy) v_u_4, (copy) v_u_14, (copy) v_u_13, (copy) v_u_7, (copy) v_u_11
	local v17 = p_u_16.props.anchorPoint
	local v_u_18 = p_u_16.props.onTextBoxFocusLost
	local v_u_19 = p_u_16.props.onTextBoxFocused
	local v20 = p_u_16.props.position
	local v_u_21 = p_u_16.props.searchFieldRef
	local v22 = p_u_16.props.size
	local v23 = p_u_16.props.visible
	local v24 = p_u_16.props.zIndex
	local v25 = p_u_16.state.isTextWritten
	local v26 = v_u_3.createElement
	local v27 = {
		["BackgroundTransparency"] = 1,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["Visible"] = nil,
		["Image"] = nil,
		["ImageRectOffset"] = nil,
		["ImageRectSize"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["ZIndex"] = nil,
		["AnchorPoint"] = v17,
		["Position"] = v20,
		["Size"] = v22,
		["Visible"] = v23,
		["Image"] = v_u_7,
		["ImageRectOffset"] = v_u_8.offset,
		["ImageRectSize"] = v_u_8.size,
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = v_u_9,
		["ZIndex"] = v24
	}
	local v30 = {
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 8),
			["PaddingRight"] = UDim.new(0, 8),
			["PaddingTop"] = UDim.new(0, 6),
			["PaddingBottom"] = UDim.new(0, 6)
		}),
		["SearchIcon"] = v_u_3.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageRectOffset"] = nil,
			["ImageRectSize"] = nil,
			["Size"] = nil,
			["ZIndex"] = nil,
			["Image"] = v_u_7,
			["ImageRectOffset"] = v_u_10.offset,
			["ImageRectSize"] = v_u_10.size,
			["Size"] = UDim2.new(0, 16, 0, 16),
			["ZIndex"] = v24
		}),
		["SearchField"] = v_u_3.createElement("TextBox", {
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 28, 0.5, 0),
			["Size"] = UDim2.new(1, -56, 1, 0),
			["ClearTextOnFocus"] = false,
			["PlaceholderColor3"] = v_u_4.Color.GRAY3,
			["PlaceholderText"] = v_u_14:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename"),
			["Text"] = "",
			["TextColor3"] = v_u_4.Color.WHITE,
			["TextWrapped"] = true,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextSize"] = v_u_13.textSize(16),
			["Font"] = v_u_13.font(Enum.Font.SourceSans),
			["ZIndex"] = v24,
			[v_u_3.Ref] = function(p28)
				-- upvalues: (copy) p_u_16, (copy) v_u_21
				p_u_16.searchField = p28
				if v_u_21 then
					v_u_21(p28)
				end
			end,
			[v_u_3.Event.Focused] = function()
				-- upvalues: (copy) v_u_19
				if v_u_19 then
					v_u_19()
				end
			end,
			[v_u_3.Event.FocusLost] = function(p29)
				-- upvalues: (copy) v_u_18
				if v_u_18 then
					v_u_18(p29.Text)
				end
			end
		}),
		["ClearButton"] = v_u_3.createElement("ImageButton", {
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(1, 0),
			["Position"] = UDim2.new(1, 0, 0, 0),
			["Size"] = UDim2.new(0, 16, 0, 16),
			["Image"] = v_u_7,
			["ImageRectOffset"] = v_u_11.offset,
			["ImageRectSize"] = v_u_11.size,
			["ZIndex"] = v24,
			["Visible"] = v25,
			[v_u_3.Event.Activated] = function()
				-- upvalues: (copy) p_u_16
				if p_u_16.searchField then
					p_u_16.searchField.Text = ""
					p_u_16.searchField:CaptureFocus()
				end
			end
		})
	}
	return v26("ImageLabel", v27, v30)
end
function v5.didMount(p_u_31) -- name: didMount
	local v_u_32 = p_u_31.searchField
	local v_u_33 = p_u_31.props.onTextChanged
	if v_u_32 then
		p_u_31.textBoxChangedConnection = v_u_32:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: (copy) v_u_32, (copy) p_u_31, (copy) v_u_33
			local v34 = v_u_32.Text
			p_u_31:setState({
				["isTextWritten"] = v34:len() > 0
			})
			v_u_33(v34)
		end)
	end
end
function v5.willUnmount(p35) -- name: willUnmount
	if p35.textBoxChangedConnection then
		p35.textBoxChangedConnection:Disconnect()
	end
end
return v5