-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.SelectInSceneReportMenu
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.App.Text.StyledTextLabel
local v_u_5 = v3.App.Button.Button
local v_u_6 = v3.App.Button.Enum.ButtonType
local v_u_7 = v3.App.Button.Enum.StandardButtonSize
local v_u_8 = v3.Core.Style.useStyle
local v_u_9 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_10 = require(v1.Packages.Cryo)
local v_u_11 = require(v1.Workspace.Packages.InGameAssetReporting).HighlightModeVariants
local v_u_12
if require(v1.Workspace.Packages.SharedFlags).FFlagHighlightModePreciseSelectionEnabled then
	local v13 = game:GetService("LocalizationService")
	v_u_12 = require(v1.Workspace.Packages.InExperienceLocales).Localization.new(v13.RobloxLocaleId)
else
	v_u_12 = nil
end
local function v_u_24(p14, p_u_15)
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (ref) v_u_12, (copy) v_u_10, (copy) v_u_2, (copy) v_u_4
	local v16 = { v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"), v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3") }
	local v17 = p14 ~= v_u_11.Default and { v_u_12:Format("Feature.ReportAbuse.Label.SelectInSceneDescriptionPrecise1"), v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"), v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3") } or v16
	local v20 = v_u_10.List.map(v17, function(p18, p19)
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) p_u_15
		return v_u_2.createElement(v_u_4, {
			["text"] = "\226\128\162 " .. p18,
			["fontStyle"] = p_u_15.Font.Body,
			["colorStyle"] = p_u_15.Theme.TextEmphasis,
			["layoutOrder"] = p19,
			["automaticSize"] = Enum.AutomaticSize.XY
		})
	end)
	local v21 = {
		["Layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 30)
		})
	}
	for v22, v23 in ipairs(v20) do
		v21["Subheading" .. v22] = v23
	end
	return v_u_2.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["LayoutOrder"] = 1,
		["AutomaticSize"] = Enum.AutomaticSize.XY,
		["Position"] = UDim2.new(0.5, 0, 0, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0)
	}, v21)
end
return function(p_u_25) -- name: SelectInSceneReportMenu
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_4, (copy) v_u_9, (copy) v_u_24, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v26 = v_u_8()
	local v27 = v_u_2.createElement
	local v28 = "Frame"
	local v29 = {
		["BackgroundTransparency"] = 1,
		["AutomaticSize"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["Size"] = UDim2.new(1, 0, 0, 0)
	}
	local v30 = {
		["Layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, 30)
		}),
		["Padding"] = v_u_2.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 15)
		}),
		["Title"] = v_u_2.createElement(v_u_4, {
			["text"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["layoutOrder"] = 0,
			["automaticSize"] = nil,
			["text"] = v_u_9:FormatByKey("Feature.ReportAbuse.Heading.ReportUsingSelectInScene"),
			["fontStyle"] = v26.Font.Header1,
			["colorStyle"] = v26.Theme.TextEmphasis,
			["automaticSize"] = Enum.AutomaticSize.XY
		})
	}
	local v31
	if p_u_25.variant then
		v31 = v_u_24(p_u_25.variant, v26)
	else
		local v32 = v_u_2.createElement
		local v33 = {
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["LayoutOrder"] = 1,
			["AutomaticSize"] = Enum.AutomaticSize.XY,
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0.5, 0)
		}
		local v34 = {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 30)
			}),
			["Subheading1"] = v_u_2.createElement(v_u_4, {
				["text"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["layoutOrder"] = 0,
				["automaticSize"] = nil,
				["text"] = "\226\128\162 " .. v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription1"),
				["fontStyle"] = v26.Font.Body,
				["colorStyle"] = v26.Theme.TextEmphasis,
				["automaticSize"] = Enum.AutomaticSize.XY
			}),
			["Subheading2"] = v_u_2.createElement(v_u_4, {
				["text"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["layoutOrder"] = 1,
				["automaticSize"] = nil,
				["text"] = "\226\128\162 " .. v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription2"),
				["fontStyle"] = v26.Font.Body,
				["colorStyle"] = v26.Theme.TextEmphasis,
				["automaticSize"] = Enum.AutomaticSize.XY
			}),
			["Subheading3"] = v_u_2.createElement(v_u_4, {
				["text"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["layoutOrder"] = 2,
				["automaticSize"] = nil,
				["text"] = "\226\128\162 " .. v_u_9:FormatByKey("Feature.ReportAbuse.Label.SelectInSceneDescription3"),
				["fontStyle"] = v26.Font.Body,
				["colorStyle"] = v26.Theme.TextEmphasis,
				["automaticSize"] = Enum.AutomaticSize.XY
			})
		}
		v31 = v32("Frame", v33, v34)
	end
	v30.SubheadingFrame = v31
	v30.EnterSelectInSceneButton = v_u_2.createElement(v_u_5, {
		["text"] = nil,
		["buttonType"] = nil,
		["standardSize"] = nil,
		["layoutOrder"] = 2,
		["position"] = nil,
		["anchorPoint"] = nil,
		["fitContent"] = true,
		["onActivated"] = nil,
		["text"] = v_u_9:FormatByKey("Feature.ReportAbuse.Action.EnterSceneReporting"),
		["buttonType"] = v_u_6.PrimarySystem,
		["standardSize"] = v_u_7.Small,
		["position"] = UDim2.new(0.5, 0, 0, 0),
		["anchorPoint"] = Vector2.new(0.5, 0),
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) p_u_25
			local v35 = game:GetService("SafetyService")
			local v_u_36 = game:GetService("ExperienceStateCaptureService")
			if game:GetEngineFeature("ExperienceStateCaptureIsInBackground") then
				local v_u_37 = nil
				v_u_37 = v_u_36:GetPropertyChangedSignal("IsInBackground"):Connect(function()
					-- upvalues: (ref) v_u_37, (copy) v_u_36, (ref) p_u_25
					if v_u_37.Connected then
						if not v_u_36.IsInBackground then
							p_u_25.hideReportTab()
							v_u_37:Disconnect()
						end
					end
				end)
			end
			v35.IsCaptureModeForReport = true
			v_u_36:ToggleCaptureMode()
		end
	})
	return v27(v28, v29, v30)
end