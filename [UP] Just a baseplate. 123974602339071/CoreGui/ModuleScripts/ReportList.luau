-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.ReportList
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v4 = require(v1.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v_u_8 = v4.Cryo
local v9 = script.Parent.Parent.Parent
local v_u_10 = require(v9.Resources.Constants)
local v_u_11 = require(v9.Components.PlayerLabel)
local v_u_12 = require(v9.Components.Divider)
local v_u_13 = require(v9.Components.BarOnTopScrollingFrame)
local v_u_14 = require(script.Parent.GameLabel)
local v_u_15 = require(script.Parent.ReportButton)
local v_u_16 = require(script.Parent.Parent.Connection.FocusHandler)
local v_u_17 = require(v9.Components.ThemedTextLabel)
local v_u_18 = require(v9.Localization.withLocalization)
local v_u_19 = require(v1.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink
local v_u_20 = require(v3.Modules.TrustAndSafety)
local v21 = v_u_5.PureComponent:extend("ReportList")
local v_u_22 = require(v9.Flags.GetFFlagIGMGamepadSelectionHistory)
local v23 = v7.strictInterface
local v24 = {
	["placeName"] = v7.string,
	["players"] = v7.array(v7.union(v7.instanceIsA("Player"), v7.strictInterface({
		["UserId"] = v7.integer,
		["Name"] = v7.string
	}))),
	["canCaptureFocus"] = v7.optional(v7.boolean)
}
local v25
if v_u_22() then
	v25 = v7.optional(v7.string) or nil
else
	v25 = nil
end
v24.currentPage = v25
v24.currentZone = v_u_22() and v7.optional(v7.number) or nil
v21.validateProps = v23(v24)
local function v_u_28(p26, p27) -- name: sortPlayers
	return p26.Name:lower() < p27.Name:lower()
end
function v21.init(p29) -- name: init
	-- upvalues: (copy) v_u_5
	p29.reportGameRef = v_u_5.createRef()
end
function v21.renderListEntries(p_u_30) -- name: renderListEntries
	-- upvalues: (copy) v_u_8, (copy) v_u_28, (copy) v_u_5, (copy) v_u_22, (copy) v_u_16, (copy) v_u_10, (copy) v_u_2, (copy) v_u_14, (copy) v_u_20, (copy) v_u_15, (copy) v_u_12, (copy) v_u_11
	local v31 = v_u_8.List.sort(p_u_30.props.players, v_u_28)
	local v32 = #v31
	local v33 = 3
	local v34 = {
		["ListLayout"] = v_u_5.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
		})
	}
	if v_u_22() then
		v34.FocusHandler = v_u_5.createElement(v_u_16, {
			["isFocused"] = p_u_30.props.canCaptureFocus,
			["shouldForgetPreviousSelection"] = p_u_30.props.currentPage == v_u_10.MainPagePageKey and true or p_u_30.props.currentZone == 0,
			["didFocus"] = function(p35) -- name: didFocus
				-- upvalues: (ref) v_u_2, (copy) p_u_30
				v_u_2.SelectedCoreObject = p35 or p_u_30.reportGameRef:getValue()
			end
		})
	end
	v34.GameReport = v_u_5.createElement(v_u_14, {
		["gameId"] = game.GameId,
		["gameName"] = p_u_30.props.placeName,
		["LayoutOrder"] = 1,
		[v_u_5.Ref] = p_u_30.reportGameRef,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (ref) v_u_20, (ref) v_u_10
			v_u_20.openReportDialogForPlace(v_u_10.AnalyticsInGameMenuName)
		end
	}, {
		["ReportButton"] = v_u_5.createElement(v_u_15, {
			["LayoutOrder"] = 1
		})
	})
	if #v31 > 0 then
		v34["divider_" .. v33] = v_u_5.createElement(v_u_12, {
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Size"] = UDim2.new(1, -80, 0, 1)
		})
	end
	for v36, v_u_37 in pairs(v31) do
		v34["player_" .. v36] = v_u_5.createElement(v_u_11, {
			["username"] = nil,
			["userId"] = nil,
			["isOnline"] = true,
			["isSelected"] = false,
			["LayoutOrder"] = nil,
			["onActivated"] = nil,
			["username"] = v_u_37.Name,
			["userId"] = v_u_37.UserId,
			["LayoutOrder"] = v33,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) v_u_20, (copy) v_u_37, (ref) v_u_10
				v_u_20.openReportDialogForPlayer(v_u_37, v_u_10.AnalyticsInGameMenuName)
			end
		}, {
			["ReportButton"] = v_u_5.createElement(v_u_15, {
				["userId"] = nil,
				["userName"] = nil,
				["LayoutOrder"] = 1,
				["userId"] = v_u_37.UserId,
				["userName"] = v_u_37.Name
			})
		})
		v33 = v33 + 1
		if v36 >= v32 then
			continue
		end
		v34["divider_" .. v33] = v_u_5.createElement(v_u_12, {
			["LayoutOrder"] = v33,
			["Size"] = UDim2.new(1, -80, 0, 1)
		})
		v33 = v33 + 1
	end
	return v34
end
function v21.didUpdate(p38, p39, _) -- name: didUpdate
	-- upvalues: (copy) v_u_22, (copy) v_u_2
	if not v_u_22() and (p38.props.canCaptureFocus and not p39.canCaptureFocus) then
		v_u_2.SelectedCoreObject = p38.reportGameRef:getValue()
	end
end
function v21.render(p_u_40) -- name: render
	-- upvalues: (copy) v_u_19, (copy) v_u_18, (copy) v_u_5, (copy) v_u_13, (copy) v_u_17
	local v_u_41 = #p_u_40.props.players * 71 + 70
	if v_u_19() then
		return v_u_18({
			["DSAFooterText"] = "CoreScripts.InGameMenu.Report.DSAFooter"
		})(function(p42)
			-- upvalues: (ref) v_u_5, (ref) v_u_13, (copy) v_u_41, (copy) p_u_40, (ref) v_u_17
			local v43 = v_u_5.createElement
			local v44 = {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["Size"] = UDim2.new(1, 0, 1, -50)
			}
			local v45 = {
				["ScrollingFrame"] = v_u_5.createElement(v_u_13, {
					["Position"] = UDim2.new(0, 0, 0, 0),
					["Size"] = UDim2.new(1, 0, 1, -50),
					["CanvasSize"] = UDim2.new(1, 0, 0, v_u_41)
				}, p_u_40:renderListEntries())
			}
			local v46 = v_u_5.createElement
			local v47 = {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 50),
				["Position"] = UDim2.new(0, 0, 1, -50)
			}
			local v48 = {
				["Padding"] = v_u_5.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, 30),
					["PaddingRight"] = UDim.new(0, 30),
					["PaddingTop"] = UDim.new(0, 20)
				}),
				["TextLabel"] = v_u_5.createElement(v_u_17, {
					["fontKey"] = "Footer",
					["themeKey"] = "TextEmphasis",
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["TextWrapped"] = true,
					["Text"] = nil,
					["TextXAlignment"] = nil,
					["AnchorPoint"] = Vector2.new(0.5, 0.5),
					["Position"] = UDim2.new(0.5, 0, 0.5, 0),
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Text"] = p42.DSAFooterText,
					["TextXAlignment"] = Enum.TextXAlignment.Center
				})
			}
			v45.EUWarning = v46("Frame", v47, v48)
			return v43("Frame", v44, v45)
		end)
	else
		return v_u_5.createElement(v_u_13, {
			["Position"] = UDim2.new(0, 0, 0, 0),
			["Size"] = UDim2.new(1, 0, 1, 0),
			["CanvasSize"] = UDim2.new(1, 0, 0, v_u_41)
		}, p_u_40:renderListEntries())
	end
end
return v6.UNSTABLE_connect2(function(p49, _)
	-- upvalues: (copy) v_u_10, (copy) v_u_22
	local v50 = p49.gameInfo.name
	local v51 = p49.menuPage == "Report" and p49.displayOptions.inputType == v_u_10.InputType.Gamepad and not (p49.report.dialogOpen or (p49.report.reportSentOpen or p49.respawn.dialogOpen))
	if v51 then
		v51 = p49.currentZone == 1
	end
	local v52 = {
		["placeName"] = v50,
		["canCaptureFocus"] = v51
	}
	local v53
	if v_u_22() then
		v53 = p49.menuPage
	else
		v53 = nil
	end
	v52.currentPage = v53
	local v54
	if v_u_22() then
		v54 = p49.currentZone
	else
		v54 = nil
	end
	v52.currentZone = v54
	return v52
end)(v21)