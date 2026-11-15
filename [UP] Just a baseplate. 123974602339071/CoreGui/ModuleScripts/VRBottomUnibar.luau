-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.VRBottomUnibar
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Foundation)
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Workspace.Packages.VrSpatialUi)
local v_u_5 = v4.Constants.PanelType
local v_u_6 = v4.Panel3DInSpatialUI
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Chrome.ChromeShared.Unibar)
local v_u_9 = require(v7.TopBar.Components.Presentation.MenuIcon)
local v_u_10 = require(v7.TopBar.ComponentsV2.MenuIcon)
local v_u_11 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local v_u_12 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_13 = v_u_12.Flags.FFlagTopBarSignalizeKeepOutAreas
local v14 = require(v1.Workspace.Packages.InExperienceTopBar)
local v_u_15 = require(v1.Workspace.Packages.InExperienceTopBar.ExperienceAgeRatingBadge)
local v_u_16 = v14.Flags.FFlagExperienceAgeRatingBadge
local v_u_17 = require(v1.Workspace.Packages.SharedFlags).FFlagShowGameAgeRating
local v_u_18 = v_u_16 and v_u_17
local v_u_19 = v14.Flags.FFlagTopBarRefactor
local function v_u_28(p20) -- name: MenuIconWrapper
	-- upvalues: (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_19, (copy) v_u_3, (copy) v_u_10, (copy) v_u_9
	local v21
	if v_u_13 then
		v21 = v_u_12.Stores.GetKeepOutAreasStore(false)
	else
		v21 = nil
	end
	local v23 = v_u_11(function(p22)
		if p22 and p22.displayOptions then
			return p22.displayOptions.menuOpen
		else
			return false
		end
	end) and 1.5 or 1
	if v_u_19 then
		return v_u_3.createElement(v_u_10, {
			["showBadgeOver12"] = p20.showBadgeOver12
		})
	end
	local v24 = v_u_3.createElement
	local v25 = v_u_9
	local v26 = {
		["layout"] = p20.layout,
		["iconScale"] = v23,
		["showBadgeOver12"] = p20.showBadgeOver12
	}
	local v27
	if v_u_13 then
		v27 = v21.setKeepOutArea
	else
		v27 = nil
	end
	v26.onAreaChanged = v27
	return v24(v25, v26)
end
return v_u_3.memo(function(p_u_29) -- name: VRBottomUnibar
	-- upvalues: (copy) v_u_18, (copy) v_u_16, (copy) v_u_17, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_19, (copy) v_u_2, (copy) v_u_28, (copy) v_u_8, (copy) v_u_15
	local v_u_30 = v_u_18
	if v_u_30 then
		v_u_30 = p_u_29.showBadgeOver12 == true
	end
	local v_u_31, v_u_32
	if v_u_16 and v_u_17 then
		local v33, v34 = v_u_3.useBinding(true)
		v_u_31 = v33
		local v_u_35 = v34
		local v36 = { v_u_35 }
		v_u_32 = v_u_3.useCallback(function(p37)
			-- upvalues: (ref) v_u_35
			v_u_35(p37.GroupTransparency < 1)
		end, v36)
	else
		v_u_31 = nil
		v_u_32 = nil
	end
	if not v_u_6 then
		return nil
	end
	local v38 = v_u_3.createElement
	local v39 = v_u_6
	local v40 = {
		["panelType"] = v_u_5.BottomBar
	}
	local v41
	if v_u_18 then
		v41 = v_u_30
	else
		v41 = nil
	end
	v40.keepVisibleWhenTopBarHidden = v41
	local v42
	if v_u_18 then
		v42 = v_u_31
	else
		v42 = nil
	end
	v40.controlsVisible = v42
	function v40.renderFunction(p43) -- name: renderFunction
		-- upvalues: (ref) v_u_3, (ref) v_u_18, (ref) v_u_31, (ref) v_u_32, (ref) v_u_19, (ref) v_u_2, (ref) v_u_28, (copy) p_u_29, (copy) v_u_30, (ref) v_u_8, (ref) v_u_15
		local v44 = v_u_3.createElement
		local v45 = v_u_18 and "CanvasGroup" or "Frame"
		local v46 = {
			["Name"] = v_u_18 and "AnimatablePanelManagedContent" or nil
		}
		local v47
		if v_u_18 then
			v47 = v_u_31
		else
			v47 = nil
		end
		v46.Visible = v47
		v46[v_u_3.Change.GroupTransparency] = v_u_32
		v46.BackgroundTransparency = 1
		v46.BorderSizePixel = 0
		local v48
		if v_u_18 then
			v48 = UDim2.fromOffset(0, p43.Y)
		elseif v_u_19 then
			v48 = UDim2.new(1, 0, 0, 0)
		else
			v48 = UDim2.new(1, 0, 1, 0)
		end
		v46.Size = v48
		local v49
		if v_u_18 then
			v49 = Enum.AutomaticSize.X
		elseif v_u_19 then
			v49 = Enum.AutomaticSize.Y
		else
			v49 = nil
		end
		v46.AutomaticSize = v49
		local v50 = {
			["ListLayout"] = v_u_3.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 8)
			})
		}
		local v51
		if v_u_19 then
			local v52 = v_u_3.createElement
			local v53 = v_u_2.View
			local v54 = {
				["Size"] = UDim2.new(0, 0, 1, 0),
				["AutomaticSize"] = Enum.AutomaticSize.X,
				["aspectRatio"] = {
					["AspectRatio"] = 1,
					["AspectType"] = nil,
					["DominantAxis"] = nil,
					["AspectType"] = Enum.AspectType.ScaleWithParentSize,
					["DominantAxis"] = Enum.DominantAxis.Height
				}
			}
			local v55 = {}
			local v56 = v_u_3.createElement
			local v57 = v_u_28
			local v58 = {
				["layout"] = 1,
				["showBadgeOver12"] = nil
			}
			local v59 = p_u_29.showBadgeOver12
			if v59 then
				v59 = not v_u_30
			end
			v58.showBadgeOver12 = v59
			v55.MenuIcon = v56(v57, v58)
			v51 = v52(v53, v54, v55)
		else
			local v60 = v_u_3.createElement
			local v61 = "Frame"
			local v62 = {
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["Size"] = UDim2.new(0, 0, 1, 0),
				["AutomaticSize"] = Enum.AutomaticSize.X
			}
			local v63 = {}
			local v64 = v_u_3.createElement
			local v65 = v_u_28
			local v66 = {
				["layout"] = 1,
				["showBadgeOver12"] = nil
			}
			local v67 = p_u_29.showBadgeOver12
			if v67 then
				v67 = not v_u_30
			end
			v66.showBadgeOver12 = v67
			v63.MenuIcon = v64(v65, v66)
			v51 = v60(v61, v62, v63)
		end
		v50.MenuIconFrame = v51
		v50.UnibarFrame = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Size"] = UDim2.new(0, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.XY
		}, {
			["Unibar"] = v_u_3.createElement(v_u_8, {
				["layoutOrder"] = 1,
				["onAreaChanged"] = nil,
				["onMinWidthChanged"] = nil,
				["onAreaChanged"] = function() -- name: onAreaChanged end,
				["onMinWidthChanged"] = function() -- name: onMinWidthChanged end
			})
		})
		local v68 = v44(v45, v46, v50)
		if not v_u_18 then
			return v68
		end
		local v69 = v_u_3.createElement
		local v70 = "Frame"
		local v71 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 1)
		}
		local v72 = {
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 8)
			}),
			["Controls"] = v68
		}
		local v73
		if v_u_30 then
			local v74 = v_u_3.createElement
			local v75 = v_u_15
			local v76 = {
				["universeId"] = nil,
				["layoutOrder"] = 1
			}
			local v77 = game.GameId
			v76.universeId = tostring(v77)
			v73 = v74(v75, v76)
		else
			v73 = nil
		end
		v72.AgeRating = v73
		return v69(v70, v71, v72)
	end
	v40.requireCanvasGroup = not v_u_18
	return v38(v39, v40)
end)