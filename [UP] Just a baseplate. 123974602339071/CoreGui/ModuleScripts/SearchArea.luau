-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.SearchArea
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = v2.Modules.Settings.Pages.ShareGame
local v_u_6 = require(v2.Modules.Settings.Flags.GetFFlagShareGameSearchBoxFocusAnalytics)
local v_u_7 = require(v5.Components.SearchBox)
local v_u_8 = require(v5.Components.IconButton)
local v9 = require(v5.Constants)
local v_u_10 = require(v1.Workspace.Packages.AppCommonLib).Text
local v11 = require(v2.Modules.Settings.Theme)
local v_u_12 = require(v5.Actions.SetSearchAreaActive)
local v_u_13 = require(v5.Actions.SetSearchText)
local v14 = require(v2.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local v_u_15 = require(v5.getTranslator)()
local v_u_16 = v14:GetImagePath()
local v_u_17 = v14:GetFrame("search_large")
local v_u_18 = v11.font(Enum.Font.SourceSans)
local v_u_19 = v9.Color.GRAY3
local v_u_20 = v11.textSize(20)
local v21 = v_u_3.PureComponent:extend("SearchArea")
function v21.init(p22) -- name: init
	-- upvalues: (copy) v_u_15
	p22.state = {
		["cancelText"] = v_u_15:FormatByKey("Feature.SettingsHub.Action.CancelSearch")
	}
	p22.searchField = nil
end
function v21.render(p_u_23) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_18, (copy) v_u_20, (copy) v_u_3, (copy) v_u_8, (copy) v_u_16, (copy) v_u_17, (copy) v_u_7, (copy) v_u_6, (copy) v_u_19
	local v24 = p_u_23.props.fullWidthSearchBar
	local v25 = p_u_23.props.searchBoxMargin
	local v26 = p_u_23.props.anchorPoint
	local v27 = p_u_23.props.position
	local v28 = p_u_23.props.zIndex
	local v29 = p_u_23.props.searchAreaActive
	local v30 = p_u_23.props.size
	local v_u_31 = p_u_23.state.cancelText
	local v32 = v_u_10.GetTextWidth(v_u_31, v_u_18, v_u_20)
	local v33 = v25 + v32
	local v34 = p_u_23.props.setSearchText
	if not v24 then
		return v_u_3.createElement(v_u_7, {
			["anchorPoint"] = Vector2.new(1, 0.5),
			["position"] = UDim2.new(1, 0, 0.5, 0),
			["size"] = UDim2.new(0, 177, 0, 28),
			["zIndex"] = v28,
			["onTextChanged"] = v34,
			["searchFieldRef"] = function(p35) -- name: searchFieldRef
				-- upvalues: (copy) p_u_23
				p_u_23.searchField = p35
			end
		})
	end
	local v36 = v_u_3.createElement
	local v40 = {
		["SearchButton"] = v_u_3.createElement(v_u_8, {
			["visible"] = not v29,
			["anchorPoint"] = v26,
			["position"] = v27,
			["size"] = UDim2.new(0, 44, 0, 44),
			["zIndex"] = v28,
			["iconHorizontalAlignment"] = Enum.HorizontalAlignment.Right,
			["iconSpritePath"] = v_u_16,
			["iconSpriteFrame"] = v_u_17,
			["onClick"] = function(_) -- name: onClick
				-- upvalues: (copy) p_u_23
				p_u_23.props.setSearchAreaActive(true)
			end
		}),
		["SearchBox"] = v_u_3.createElement(v_u_7, {
			["anchorPoint"] = Vector2.new(0, 0.5),
			["position"] = UDim2.new(0, 0, 0.5, 0),
			["size"] = UDim2.new(1, -v33, 0, 28),
			["zIndex"] = v28,
			["visible"] = v29,
			["modalFocused"] = v29,
			["onTextChanged"] = v34,
			["onTextBoxFocused"] = function() -- name: onTextBoxFocused
				-- upvalues: (ref) v_u_6, (copy) p_u_23
				if v_u_6() and p_u_23.props.analytics then
					p_u_23.props.analytics:onSearchFocused()
				end
			end,
			["onTextBoxFocusLost"] = function(p37) -- name: onTextBoxFocusLost
				-- upvalues: (copy) p_u_23
				if p37 == "" then
					p_u_23.props.setSearchAreaActive(false)
				end
			end,
			["searchFieldRef"] = function(p38) -- name: searchFieldRef
				-- upvalues: (copy) p_u_23
				p_u_23.searchField = p38
			end
		}),
		["Cancel"] = v_u_3.createElement("TextButton", {
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, 0, 0.5, 0),
			["Size"] = UDim2.new(0, v32, 1, 0),
			["TextSize"] = v_u_20,
			["TextColor3"] = v_u_19,
			["Font"] = v_u_18,
			["ZIndex"] = v28,
			["Visible"] = v29,
			[v_u_3.Ref] = function(p_u_39)
				-- upvalues: (copy) v_u_31, (copy) p_u_23
				if p_u_39 then
					p_u_39.Text = v_u_31
					if not p_u_23.textConnection then
						p_u_23.textConnection = p_u_39:GetPropertyChangedSignal("Text"):connect(function()
							-- upvalues: (ref) p_u_23, (copy) p_u_39
							p_u_23:setState({
								["cancelText"] = p_u_39.Text
							})
						end)
					end
				end
			end,
			[v_u_3.Event.Activated] = function(_)
				-- upvalues: (copy) p_u_23
				p_u_23.props.setSearchAreaActive(false)
			end
		})
	}
	return v36("Frame", {
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["ZIndex"] = nil,
		["AnchorPoint"] = v26,
		["Position"] = v27,
		["Size"] = v30,
		["ZIndex"] = v28
	}, v40)
end
function v21.didUpdate(p_u_41, p42) -- name: didUpdate
	local v_u_43 = p_u_41.props.fullWidthSearchBar
	if p_u_41.searchField then
		if not p_u_41.props.isPageOpen and p42.isPageOpen then
			spawn(function()
				-- upvalues: (copy) v_u_43, (copy) p_u_41
				if v_u_43 then
					p_u_41.props.setSearchAreaActive(false)
				else
					p_u_41.searchField.Text = ""
				end
			end)
		end
		if v_u_43 then
			local v44 = p_u_41.props.searchAreaActive
			local v45 = p42.searchAreaActive
			if v44 and not v45 then
				p_u_41.searchField:CaptureFocus()
				return
			end
			if not v44 and v45 then
				p_u_41.searchField.Text = ""
			end
		end
	end
end
return v4.UNSTABLE_connect2(function(p46, _)
	return {
		["isPageOpen"] = p46.Page.IsOpen,
		["searchAreaActive"] = p46.ConversationsSearch.SearchAreaActive
	}
end, function(p_u_47)
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	return {
		["setSearchAreaActive"] = function(p48) -- name: setSearchAreaActive
			-- upvalues: (copy) p_u_47, (ref) v_u_12
			p_u_47(v_u_12(p48))
		end,
		["setSearchText"] = function(p49) -- name: setSearchText
			-- upvalues: (copy) p_u_47, (ref) v_u_13
			p_u_47(v_u_13(p49))
		end
	}
end)(v21)