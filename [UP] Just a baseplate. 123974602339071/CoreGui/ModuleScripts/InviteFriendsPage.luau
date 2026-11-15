-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InviteFriendsPage
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("Players")
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.t
local v7 = v4.RoactRodux
local v_u_8 = v4.Cryo
local v9 = script.Parent.Parent
local v_u_10 = require(v9.Resources.Constants)
local v_u_11 = require(v9.Utility.Promise)
local v_u_12 = require(v9.Localization.withLocalization)
local v_u_13 = require(v9.Components.Page)
local v_u_14 = require(v9.Components.ThemedTextLabel)
local v_u_15 = require(v9.Components.PageNavigationWatcher)
local v_u_16 = require(v9.Components.Connection.FocusHandler)
local v_u_17 = require(v9.Components.Connection.RootedConnection)
local v_u_18 = require(script.InviteFriendsList)
local v_u_19 = require(script.AddFriendsNow)
local v_u_20 = require(script.LoadingFriendsError)
local v_u_21 = require(v9.Flags.GetFFlagIGMGamepadSelectionHistory)
local v22 = v_u_5.PureComponent:extend("InviteFriendsPage")
v22.validateProps = v6.strictInterface({
	["pageTitle"] = v6.string,
	["canCaptureFocus"] = v6.optional(v6.boolean),
	["PlayersService"] = v6.union(v6.Instance, v6.table),
	["menuPage"] = v_u_21() and v6.string or nil
})
v22.defaultProps = {
	["PlayersService"] = v3
}
function v22.init(p23) -- name: init
	-- upvalues: (copy) v_u_5
	p23.backButtonRef = v_u_5.createRef()
	p23.searchBoxRef = v_u_5.createRef()
	p23.state = {
		["loadingFriends"] = true,
		["loadingFriendsError"] = false,
		["friends"] = nil,
		["friends"] = {}
	}
end
function v22.renderLoadingPage(_) -- name: renderLoadingPage
	-- upvalues: (copy) v_u_12, (copy) v_u_5, (copy) v_u_14
	return v_u_12({
		["loading"] = "CoreScripts.InGameMenu.InviteFriends.Loading"
	})(function(p24)
		-- upvalues: (ref) v_u_5, (ref) v_u_14
		return v_u_5.createElement(v_u_14, {
			["Size"] = nil,
			["Text"] = nil,
			["fontKey"] = "Header1",
			["themeKey"] = "TextEmphasis",
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Text"] = p24.loading
		})
	end)
end
function v22.renderError(p_u_25) -- name: renderError
	-- upvalues: (copy) v_u_5, (copy) v_u_20
	return v_u_5.createElement(v_u_20, {
		["onRetry"] = function() -- name: onRetry
			-- upvalues: (copy) p_u_25
			p_u_25:setState({
				["loadingFriends"] = true,
				["loadingFriendsError"] = false
			})
			p_u_25:loadFriends()
		end,
		["canCaptureFocus"] = p_u_25.props.canCaptureFocus
	})
end
function v22.renderNoFriends(p26) -- name: renderNoFriends
	-- upvalues: (copy) v_u_5, (copy) v_u_19
	return v_u_5.createElement(v_u_19, {
		["canCaptureFocus"] = p26.props.canCaptureFocus
	})
end
local function v_u_30(p27, p28) -- name: sortFriends
	if p27.IsOnline == p28.IsOnline then
		return p27.Username:lower() < p28.Username:lower()
	end
	local v29 = p27.IsOnline
	if v29 then
		v29 = not p28.IsOnline
	end
	return v29
end
function v22.renderFriends(p31) -- name: renderFriends
	-- upvalues: (copy) v_u_5, (copy) v_u_18
	return v_u_5.createElement(v_u_18, {
		["friends"] = p31.state.friends,
		["canCaptureFocus"] = p31.props.canCaptureFocus,
		["searchBoxRef"] = p31.searchBoxRef
	})
end
function v22.render(p_u_32) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_17, (copy) v_u_16, (copy) v_u_21, (copy) v_u_2, (copy) v_u_13
	local v_u_33 = p_u_32.state
	local v_u_34 = {
		["Watcher"] = v_u_5.createElement(v_u_15, {
			["desiredPage"] = "InviteFriends",
			["onNavigateTo"] = nil,
			["onNavigateTo"] = function() -- name: onNavigateTo
				-- upvalues: (copy) p_u_32
				p_u_32:loadFriends()
			end
		})
	}
	if v_u_33.loadingFriends then
		v_u_34.Loading = p_u_32:renderLoadingPage()
	elseif v_u_33.loadingFriendsError then
		v_u_34.ErrorLoading = p_u_32:renderError()
	elseif #v_u_33.friends == 0 then
		v_u_34.NoFriends = p_u_32:renderNoFriends()
	else
		v_u_34.FriendsList = p_u_32:renderFriends()
	end
	local v41 = {
		["render"] = function(p35) -- name: render
			-- upvalues: (ref) v_u_5, (ref) v_u_16, (ref) v_u_21, (copy) p_u_32, (copy) v_u_33, (ref) v_u_2, (ref) v_u_13, (copy) v_u_34
			local v36 = v_u_5.createElement
			local v37 = v_u_16
			local v38 = {
				["shouldForgetPreviousSelection"] = v_u_21() and p_u_32.props.menuPage ~= "InviteFriends" and true or nil
			}
			local v39 = p_u_32.props.canCaptureFocus
			if v39 then
				local v40 = v_u_33.loadingFriends
				if not v40 then
					p35 = v40
				end
			else
				p35 = v39
			end
			v38.isFocused = p35
			function v38.didFocus() -- name: didFocus
				-- upvalues: (ref) v_u_2, (ref) p_u_32
				v_u_2.SelectedCoreObject = p_u_32.backButtonRef:getValue()
			end
			return v36(v37, v38, {
				["Page"] = v_u_5.createElement(v_u_13, {
					["pageTitle"] = p_u_32.props.pageTitle,
					["buttonRef"] = p_u_32.backButtonRef,
					["NextSelectionDown"] = p_u_32.searchBoxRef
				}, v_u_34)
			})
		end
	}
	return v_u_5.createElement(v_u_17, v41)
end
function v22.didMount(p42) -- name: didMount
	p42.mounted = true
	p42:loadFriends()
end
function v22.loadFriends(p_u_43) -- name: loadFriends
	-- upvalues: (copy) v_u_11, (copy) v_u_8, (copy) v_u_30
	v_u_11.new(function(p_u_44, p_u_45)
		-- upvalues: (copy) p_u_43, (ref) v_u_8, (ref) v_u_30
		coroutine.wrap(function()
			-- upvalues: (ref) p_u_43, (copy) p_u_45, (ref) v_u_8, (ref) v_u_30, (copy) p_u_44
			local v_u_46 = p_u_43.props.PlayersService.LocalPlayer
			local function v47()
				-- upvalues: (ref) p_u_43, (copy) v_u_46
				return p_u_43.props.PlayersService:GetFriendsAsync(v_u_46.UserId)
			end
			local v48, v_u_49 = pcall(v47)
			if v48 then
				local v50 = {}
				for _, v51 in ipairs(v_u_49:GetCurrentPage()) do
					v50[#v50 + 1] = {
						["IsOnline"] = nil,
						["Id"] = nil,
						["Username"] = nil,
						["DisplayName"] = nil,
						["itemRef"] = nil,
						["IsOnline"] = v51.IsOnline,
						["Id"] = v51.Id,
						["Username"] = v51.Username,
						["DisplayName"] = v51.DisplayName
					}
				end
				if v_u_49.IsFinished then
					p_u_44((v_u_8.List.sort(v50, v_u_30)))
				else
					if pcall(function()
						-- upvalues: (copy) v_u_49
						v_u_49:AdvanceToNextPageAsync()
					end) then
						break
					end
					p_u_45("Error loading friends")
				end
			else
				p_u_45("Error loading friends")
				return
			end
		end)()
	end):andThen(function(p52)
		-- upvalues: (copy) p_u_43
		if p_u_43.mounted then
			p_u_43:setState({
				["loadingFriends"] = false,
				["friends"] = nil,
				["friends"] = p52
			})
		end
	end):catch(function()
		-- upvalues: (copy) p_u_43
		if p_u_43.mounted then
			p_u_43:setState({
				["loadingFriends"] = false,
				["loadingFriendsError"] = true
			})
		end
	end)
end
function v22.willUnmount(p53) -- name: willUnmount
	p53.mounted = false
end
return v7.connect(function(p54, _)
	-- upvalues: (copy) v_u_10, (copy) v_u_21
	local v55 = p54.menuPage == "InviteFriends" and (p54.isMenuOpen and (p54.displayOptions.inputType == v_u_10.InputType.Gamepad and not p54.respawn.dialogOpen))
	if v55 then
		v55 = p54.currentZone == 1
	end
	return {
		["canCaptureFocus"] = v55,
		["menuPage"] = v_u_21() and p54.menuPage or nil
	}
end)(v22)