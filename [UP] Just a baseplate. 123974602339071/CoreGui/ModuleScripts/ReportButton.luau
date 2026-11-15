-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ReportPage.ReportButton
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v4 = v2.RoactRodux
local v5 = v2.t
local v6 = v2.UIBlox
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.GlobalConfig)
local v_u_9 = require(v7.Resources.Assets)
local v_u_10 = require(v7.Actions.OpenReportDialog)
local v_u_11 = v6.Core.ImageSet.ImageSetButton
local v12 = require(v1.Packages.Foundation)
local v_u_13 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_14
if v_u_13 then
	v_u_14 = v12.UNSTABLE.withCursorMigration
else
	v_u_14 = v6.App.SelectionImage.withSelectionCursorProvider
end
local v_u_15
if v_u_13 then
	v_u_15 = v12.Enums.CursorType
else
	v_u_15 = v6.App.SelectionImage.CursorKind
end
local v_u_16 = v12.Image
local v_u_17 = v5.strictInterface({
	["userId"] = v5.optional(v5.integer),
	["userName"] = v5.optional(v5.string),
	["LayoutOrder"] = v5.integer,
	["dispatchOpenReportDialog"] = v5.callback
})
return v4.UNSTABLE_connect2(nil, function(p_u_18)
	-- upvalues: (copy) v_u_10
	return {
		["dispatchOpenReportDialog"] = function(p19, p20) -- name: dispatchOpenReportDialog
			-- upvalues: (copy) p_u_18, (ref) v_u_10
			p_u_18(v_u_10(p19, p20))
		end
	}
end)(function(p_u_21) -- name: ReportButton
	-- upvalues: (copy) v_u_8, (copy) v_u_17, (copy) v_u_14, (copy) v_u_13, (copy) v_u_3, (copy) v_u_16, (copy) v_u_9, (copy) v_u_15, (copy) v_u_11
	if v_u_8.propValidation then
		local v22 = v_u_17
		assert(v22(p_u_21))
	end
	return v_u_14(function(p23)
		-- upvalues: (ref) v_u_13, (ref) v_u_3, (ref) v_u_16, (ref) v_u_9, (copy) p_u_21, (ref) v_u_15, (ref) v_u_11
		if not v_u_13 then
			return v_u_3.createElement(v_u_11, {
				["Selectable"] = false,
				["Image"] = v_u_9.Images.ReportIcon,
				["Size"] = UDim2.new(0, 36, 0, 36),
				["ImageColor3"] = Color3.fromRGB(255, 255, 255),
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = p_u_21.LayoutOrder,
				["SelectionImageObject"] = p23(v_u_15.RoundedRectNoInset),
				[v_u_3.Event.Activated] = function()
					-- upvalues: (ref) p_u_21
					p_u_21.dispatchOpenReportDialog(p_u_21.userId, p_u_21.userName)
				end
			})
		end
		local v24 = v_u_3.createElement
		local v25 = v_u_16
		local v26 = {
			["Image"] = v_u_9.Images.ReportIcon,
			["Size"] = UDim2.new(0, 36, 0, 36),
			["backgroundStyle"] = {
				["Transparency"] = 1
			},
			["imageStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0,
				["Color3"] = Color3.fromRGB(255, 255, 255)
			},
			["LayoutOrder"] = p_u_21.LayoutOrder,
			["selection"] = {
				["Selectable"] = false,
				["SelectionImageObject"] = nil,
				["SelectionImageObject"] = p23(v_u_15.RoundedRectNoInset)
			},
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_21
				p_u_21.dispatchOpenReportDialog(p_u_21.userId, p_u_21.userName)
			end
		}
		return v24(v25, v26)
	end)
end)