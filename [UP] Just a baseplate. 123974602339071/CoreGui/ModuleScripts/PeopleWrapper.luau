-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.PeopleWrapper
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("CorePackages")
local v3 = game:GetService("LocalizationService")
local v4 = v1:WaitForChild("RobloxGui")
local v5 = v4.Modules
local v_u_6 = require(v_u_2.Packages.React)
local v_u_7 = require(v_u_2.Packages.ReactRoblox)
local v8 = require(v5.Settings.Flags.FFlagRefactorPeoplePage)
local v_u_9 = require(v5.Settings.Flags.FFlagRelocateMobileMenuButtons)
local v_u_10 = require(v5.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local v11 = v4.Modules.Chrome
local v_u_12 = require(v_u_2.Workspace.Packages.Chrome).Enabled()
local v_u_13
if v_u_12 then
	v_u_13 = require(v11.ChromeShared.Service.LocalStore)
else
	v_u_13 = nil
end
local v14 = require(v_u_2.Workspace.Packages.InExperienceLocales).Localization
local v_u_15 = require(v_u_2.Workspace.Packages.Localization).LocalizationProvider
local v16 = require(v_u_2.Packages.Signals)
local v_u_17 = require(v_u_2.Packages.SignalsReact)
local v_u_18 = require(v5.Settings.SettingsPageFactory)
local v_u_19 = require(v_u_2.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v_u_20 = v14.new(v3.RobloxLocaleId)
local v_u_21 = require(v_u_2.Packages.BuilderIcons)
local v_u_22 = require(v5.Settings.Components.Blocking.BlockingModalScreen)
local v_u_23 = v_u_21.Migration.uiblox
local v24 = require(v_u_2.Workspace.Packages.PeopleService)
local v_u_25 = require(v_u_2.Workspace.Packages.InExperienceSideSheet)
local v_u_26 = v_u_25.Flags.FFlagSideSheetOpenPeoplePage
local v27 = require(v_u_2.Workspace.Packages.FocusNavigationUtils)
local v_u_28 = v27.FocusRoot
local v_u_29 = v27.FocusNavigableSurfaceIdentifierEnum
local v_u_30 = require(v_u_2.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local v_u_31
if v8() then
	v_u_31 = require(v_u_2.Workspace.Packages.PeopleReactView).Constants
else
	v_u_31 = nil
end
local v32 = v24.getService("Flags")
local v_u_33 = v32.GetFFlagAddPeoplePageCardLayout
local v_u_34 = v32.GetFFlagPeoplePageLazyRenderCards
local v_u_35 = v32.FFlagEnablePeopleListLazyRender
local v_u_36 = v32.FFlagPeopleCardsEnableVirtualizedGrid
local v_u_37 = v32.FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local v_u_38 = v32.FFlagPeoplePageFlipVolumePopoverToFitViewport
local v_u_39 = v32.FFlagPeoplePageDismissCardMenuOnScrollOutOfView
local v_u_40 = nil
local v_u_41, v_u_42 = v16.createSignal(false)
local function v_u_44(p43) -- name: PeopleFocusRoot
	-- upvalues: (copy) v_u_6, (copy) v_u_28, (copy) v_u_29
	return v_u_6.createElement(v_u_28, {
		["surfaceIdentifier"] = nil,
		["isAutoFocusRoot"] = false,
		["surfaceIdentifier"] = v_u_29.RouterView
	}, p43.children)
end
local function v81() -- name: createPeoplePage
	-- upvalues: (copy) v_u_2, (copy) v_u_18, (ref) v_u_31, (copy) v_u_23, (copy) v_u_21, (copy) v_u_20, (copy) v_u_9, (copy) v_u_10, (ref) v_u_40, (copy) v_u_34, (copy) v_u_35, (copy) v_u_36, (copy) v_u_37, (copy) v_u_38, (copy) v_u_39, (copy) v_u_17, (copy) v_u_41, (copy) v_u_26, (copy) v_u_25, (copy) v_u_6, (copy) v_u_30, (copy) v_u_15, (copy) v_u_44, (copy) v_u_22, (copy) v_u_12, (copy) v_u_33, (copy) v_u_13, (copy) v_u_7, (copy) v_u_42, (copy) v_u_19
	local v45 = require(v_u_2.Workspace.Packages.PeopleReactView)
	local v_u_46 = v45.PeopleReactView
	local v_u_47 = v45.SideSheetFocusContext
	local v48 = require(v_u_2.Workspace.Packages.PeopleService)
	local v_u_49 = v_u_18:CreateNewPage()
	v_u_49.TabHeader.Name = v_u_31.PEOPLEPAGE.TAB_HEADER.NAME
	v_u_49.Page.Name = v_u_31.PEOPLEPAGE.PAGE_ID
	local v50 = v_u_23[v_u_31.PEOPLEPAGE.TAB_HEADER.ICON]
	v_u_49.TabHeader.TabLabel.Icon.Text = v50.name
	v_u_49.TabHeader.TabLabel.Icon.FontFace = v_u_21.Font[v50.variant]
	v_u_49.TabHeader.TabLabel.Title.Text = v_u_20:Format(v_u_31.PEOPLEPAGE.TAB_HEADER.TEXT)
	local v_u_51 = v48.getService("SettingsHubService")
	v_u_51.register(v_u_49)
	function v_u_49.CreateMenuButtonsContainer(_) -- name: CreateMenuButtonsContainer
		-- upvalues: (copy) v_u_51
		v_u_51.setShowMenuButtonsContainer(true)
	end
	if v_u_9 and v_u_10 == 2 then
		function v_u_49.UnmountMenuButtonsContainer(_) -- name: UnmountMenuButtonsContainer
			-- upvalues: (copy) v_u_51
			v_u_51.setShowMenuButtonsContainer(false)
		end
	end
	local function v_u_77() -- name: createReactTree
		-- upvalues: (ref) v_u_40, (ref) v_u_34, (ref) v_u_35, (ref) v_u_36, (ref) v_u_37, (ref) v_u_38, (ref) v_u_39, (copy) v_u_49, (ref) v_u_17, (ref) v_u_41, (ref) v_u_26, (ref) v_u_25, (ref) v_u_6, (ref) v_u_30, (ref) v_u_15, (ref) v_u_20, (ref) v_u_44, (copy) v_u_46, (ref) v_u_22, (ref) v_u_12, (ref) v_u_33, (ref) v_u_13, (ref) v_u_31, (copy) v_u_47, (ref) v_u_7
		if not v_u_40 then
			local v_u_52
			if v_u_34() or (v_u_35 or (v_u_36 or (v_u_37 or (v_u_38 or v_u_39)))) then
				v_u_52 = v_u_49.Page:FindFirstAncestorWhichIsA("ScrollingFrame")
			else
				v_u_52 = nil
			end
			local function v76() -- name: PeopleConditionalView
				-- upvalues: (ref) v_u_17, (ref) v_u_41, (ref) v_u_26, (ref) v_u_25, (ref) v_u_6, (ref) v_u_30, (ref) v_u_15, (ref) v_u_20, (ref) v_u_44, (ref) v_u_46, (ref) v_u_22, (ref) v_u_34, (ref) v_u_35, (ref) v_u_36, (ref) v_u_37, (ref) v_u_38, (ref) v_u_39, (copy) v_u_52, (ref) v_u_12, (ref) v_u_33, (ref) v_u_13, (ref) v_u_31, (ref) v_u_47
				local v53 = v_u_17.useSignalState(v_u_41)
				local v54
				if v_u_26 then
					v54 = v_u_17.useSignalState(v_u_25.getSideSheetVisibility)
				else
					v54 = false
				end
				local v55
				if v_u_26 then
					v55 = v_u_17.useSignalState(v_u_25.getDidSideSheetOpenWithPeoplePage)
				else
					v55 = false
				end
				local v56
				if v53 then
					local v57 = v_u_6.createElement
					local v58 = v_u_30
					local v59 = {}
					local v60 = {}
					local v61 = v_u_6.createElement
					local v62 = v_u_15
					local v63 = {
						["localization"] = v_u_20
					}
					local v64 = {}
					local v65 = v_u_6.createElement
					local v66 = v_u_44
					local v67 = {}
					local v68 = {}
					local v69 = v_u_6.createElement
					local v70 = v_u_46
					local v71 = {
						["blockingModalScreen"] = v_u_22,
						["blockingFlags"] = {}
					}
					local v72
					if v_u_34() or (v_u_35 or (v_u_36 or (v_u_37 or (v_u_38 or v_u_39)))) then
						v72 = v_u_52
					else
						v72 = nil
					end
					v71.scrollingFrame = v72
					v71.chromeEnabled = v_u_12
					local v73
					if v_u_33() and v_u_13 then
						v73 = v_u_13.getUniversesExposedTo
					else
						v73 = nil
					end
					v71.getUniversesExposedTo = v73
					local v74
					if v_u_33() and v_u_13 then
						v74 = v_u_13.addUniverseToExposureList
					else
						v74 = nil
					end
					v71.addUniverseToExposureList = v74
					local v75
					if v_u_26 and (v54 and v55) then
						v75 = v_u_31.PEOPLEPAGE.PEOPLE_CARDS.SIDE_SHEET_MINIMUM_CARD_WIDTH
					else
						v75 = nil
					end
					v71.minimumCardWidth = v75
					v68.PeopleReactView = v69(v70, v71)
					v64.FocusRoot = v65(v66, v67, v68)
					v60.LocalizationProvider = v61(v62, v63, v64)
					v56 = v57(v58, v59, v60)
				else
					v56 = nil
				end
				if v_u_26 and v56 then
					v56 = v_u_6.createElement(v_u_47.Provider, {
						["value"] = v54 and v55
					}, {
						["People"] = v56
					})
				end
				return v56
			end
			v_u_40 = v_u_7.createRoot(v_u_49.Page)
			if v_u_40 then
				v_u_40:render(v_u_6.createElement(v76))
			end
		end
	end
	v_u_49.Displayed.Event:Connect(function()
		-- upvalues: (ref) v_u_41, (copy) v_u_77, (ref) v_u_42, (copy) v_u_49
		if not v_u_41(false) then
			v_u_77()
			v_u_42(true)
		end
		local v78 = v_u_49.Page:FindFirstAncestor("MenuContainer")
		local v79 = v78 and v78:FindFirstChild("BottomButtonFrame", true)
		if v79 then
			v79.SelectionBehaviorUp = Enum.SelectionBehavior.Escape
		end
	end)
	v_u_19:connect(function(p80)
		-- upvalues: (ref) v_u_42
		if not p80 then
			v_u_42(false)
		end
	end)
	v_u_49.Page.Size = UDim2.new(1, 0, 0, 0)
	v_u_49.Page.AutomaticSize = Enum.AutomaticSize.Y
	return v_u_49
end
if v8() then
	return v81()
else
	return require(v5.Settings.Pages.Players)
end