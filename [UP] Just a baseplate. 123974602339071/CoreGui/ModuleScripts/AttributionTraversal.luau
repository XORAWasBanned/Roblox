-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.AttributionTraversal
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = require(v1.Packages.React)
local v_u_5 = v3.App.Text.StyledTextLabel
local v_u_6 = v3.App.Dialog.Alert.InteractiveAlert
local v_u_7 = v3.App.Button.Enum.ButtonType
local v_u_8 = v3.Core.ImageSet.ImageSetLabel
local v_u_9 = v3.Core.Style.useStyle
local v_u_10 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local v_u_11 = require(v1.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local v_u_12 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_13 = require(v2.RobloxGui.Modules.Common.Hooks.useScreenSize)
local v_u_14 = require(v1.Workspace.Packages.ExperienceService).ExperienceService
local v15 = script.Parent.Parent
local v_u_16 = require(v15.Actions.CloseOverlay)
return function(p_u_17) -- name: AttributionTraversal
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_9, (copy) v_u_4, (copy) v_u_16, (copy) v_u_14, (copy) v_u_10, (copy) v_u_6, (copy) v_u_12, (copy) v_u_8, (copy) v_u_5, (copy) v_u_7
	local v_u_18 = v_u_11()
	local v19 = v_u_13()
	local v_u_20 = v_u_9()
	local v21 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_18, (ref) v_u_16
		v_u_18(v_u_16())
	end, { v_u_18 })
	local v22 = v_u_4.useCallback(function()
		-- upvalues: (copy) p_u_17, (ref) v_u_14, (copy) v_u_18, (ref) v_u_16
		v_u_14:LaunchExperience({
			["placeId"] = p_u_17.rootPlaceId
		})
		v_u_18(v_u_16())
	end, { v_u_18, p_u_17.rootPlaceId })
	local v_u_24 = v_u_10(function(p23)
		return p23.locale
	end)
	local v_u_25 = v_u_20.Theme
	local v_u_26 = v_u_20.Font
	local v_u_27 = p_u_17.name or ""
	local v28 = v_u_4.createElement
	local v29 = v_u_6
	local v45 = {
		["title"] = nil,
		["middleContent"] = nil,
		["buttonStackInfo"] = nil,
		["isMiddleContentFocusable"] = false,
		["screenSize"] = nil,
		["title"] = v_u_12:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToExperience", v_u_24),
		["middleContent"] = function() -- name: middleContent
			-- upvalues: (ref) v_u_4, (copy) v_u_20, (copy) v_u_25, (ref) v_u_8, (copy) p_u_17, (ref) v_u_5, (ref) v_u_12, (copy) v_u_24, (copy) v_u_27, (copy) v_u_26
			local v30 = v_u_4.createElement
			local v31 = {
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y
			}
			local v32 = {
				["UIListLayout"] = v_u_4.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["Padding"] = UDim.new(0, v_u_20.Tokens.Size.Size_300)
				})
			}
			local v33 = v_u_4.createElement
			local v34 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = 1,
				["ClipsDescendants"] = true,
				["Size"] = UDim2.fromOffset(150, 150),
				["BackgroundColor3"] = v_u_25.BackgroundContrast.Color
			}
			local v35 = {}
			local v36 = v_u_4.createElement
			local v37 = v_u_8
			local v38 = {
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["Image"] = nil,
				["Size"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundTransparency"] = 1,
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.fromScale(0.5, 0.5)
			}
			local v39 = string.format
			local v40 = p_u_17.universeId
			v38.Image = v39("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", tostring(v40), 150, 150)
			v38.Size = UDim2.fromScale(1, 1)
			local v41 = {
				["RoundCorner"] = v_u_4.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, v_u_20.Tokens.Radius.Medium)
				})
			}
			v35.ExperienceThumbnail = v36(v37, v38, v41)
			v32.ExperienceThumbnailFrame = v33("Frame", v34, v35)
			local v42 = v_u_4.createElement
			local v43 = v_u_5
			local v44 = {
				["text"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["layoutOrder"] = 2,
				["automaticSize"] = nil,
				["size"] = nil,
				["textXAlignment"] = nil,
				["lineHeight"] = 1,
				["text"] = v_u_12:FormatByKeyForLocale("InGame.InspectMenu.Attribution.GoToDescription", v_u_24, {
					["EXPERIENCE_NAME"] = v_u_27
				}),
				["fontStyle"] = v_u_26.Body,
				["colorStyle"] = v_u_25.TextDefault,
				["automaticSize"] = Enum.AutomaticSize.Y,
				["size"] = UDim2.fromScale(1, 0),
				["textXAlignment"] = Enum.TextXAlignment.Center
			}
			v32.BodyText = v42(v43, v44)
			return v30("Frame", v31, v32)
		end
	}
	local v46 = {}
	local v47 = {}
	local v48 = {
		["props"] = nil,
		["isDefaultChild"] = true,
		["props"] = {
			["onActivated"] = nil,
			["text"] = nil,
			["layoutOrder"] = 0,
			["onActivated"] = v21,
			["text"] = v_u_12:FormatByKeyForLocale("InGame.InspectMenu.Action.Cancel", v_u_24)
		}
	}
	local v49 = {
		["buttonType"] = nil,
		["props"] = nil,
		["isDefaultChild"] = false,
		["buttonType"] = v_u_7.PrimaryContextual,
		["props"] = {
			["onActivated"] = nil,
			["text"] = nil,
			["layoutOrder"] = 2,
			["onActivated"] = v22,
			["text"] = v_u_12:FormatByKeyForLocale("InGame.InspectMenu.Action.Go", v_u_24)
		}
	}
	__set_list(v47, 1, {v48, v49})
	v46.buttons = v47
	v45.buttonStackInfo = v46
	v45.screenSize = v19
	return v28(v29, v45)
end