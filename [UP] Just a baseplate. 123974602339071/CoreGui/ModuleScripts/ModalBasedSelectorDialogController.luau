-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Components.ModalBasedSelectorDialogController
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("GuiService")
local v3 = script:FindFirstAncestor("AbuseReportMenu")
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Packages.Roact)
local v_u_6 = require(v3.Components.Constants)
local v_u_7 = require(v3.Components.ModalBaseSelectorDialog)
local v_u_8 = require(v3.Flags.FFlagHideShortcutsOnReportDropdown)
local v_u_9 = require(v4.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_10, v_u_11, v_u_12
if v_u_9 then
	v_u_10 = require(v4.Workspace.Packages.AppCommonLib).isSpatial
	local v13 = require(v4.Workspace.Packages.VrSpatialUi)
	v_u_11 = v13.UIManager
	v_u_12 = v13.Constants.PanelType
else
	v_u_10 = nil
	v_u_11 = nil
	v_u_12 = nil
end
local v_u_14 = {
	["modalSelectorHandle"] = nil,
	["modalSelectorFrame"] = nil,
	["modalSelectorScreenGui"] = nil
}
return {
	["mountModalSelector"] = function(p15, p16, p17, p18, p19, p20) -- name: mountModalSelector
		-- upvalues: (copy) v_u_2, (copy) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (copy) v_u_14, (copy) v_u_1, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_7
		local v21, _ = v_u_2:GetGuiInset()
		if v_u_9 and v_u_10() then
			local v22 = v_u_11.getInstance():getPanelObject(v_u_12.MoreMenu)
			local v23 = Instance.new("Frame")
			v23.BackgroundTransparency = 1
			v23.Position = UDim2.new(0, 0, 0, 0)
			v23.Size = UDim2.new(1, 0, 1, 0)
			v23.ZIndex = 10
			v23.Parent = v22
			v_u_14.modalSelectorFrame = v23
		elseif not v_u_14.modalSelectorScreenGui then
			local v24 = Instance.new("ScreenGui")
			v24.Name = "ModalSelectorDialogGui"
			v24.DisplayOrder = 7
			v24.Enabled = true
			v24.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			v24.Parent = v_u_1:FindFirstChild(v_u_6.AbuseReportMenuPlaceholderFrame, true)
			v_u_14.modalSelectorScreenGui = v24
			local v25 = Instance.new("Frame")
			v25.BackgroundTransparency = 1
			v25.Position = UDim2.new(0, 0, 0, -v21.Y)
			v25.Size = UDim2.new(1, 0, 1, v21.Y)
			v25.Parent = v_u_14.modalSelectorScreenGui
			v_u_14.modalSelectorFrame = v25
		end
		if v_u_8 and p20 ~= nil then
			p20()
		end
		local v26 = v_u_5.createElement(v_u_7, {
			["isShown"] = true,
			["cellData"] = nil,
			["viewportHeight"] = nil,
			["viewportWidth"] = nil,
			["onSelect"] = nil,
			["onClose"] = nil,
			["cellData"] = p17,
			["viewportHeight"] = p15,
			["viewportWidth"] = p16,
			["onSelect"] = p18,
			["onClose"] = p19
		})
		v_u_14.modalSelectorHandle = v_u_5.mount(v26, v_u_14.modalSelectorFrame, "ModalSelectorDialog")
	end,
	["unmountModalSelector"] = function() -- name: unmountModalSelector
		-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_9
		if v_u_14.modalSelectorHandle ~= nil then
			v_u_5.unmount(v_u_14.modalSelectorHandle)
			v_u_14.modalSelectorHandle = nil
		end
		if v_u_9 then
			if v_u_14.modalSelectorFrame ~= nil then
				v_u_14.modalSelectorFrame.Parent = nil
				v_u_14.modalSelectorFrame = nil
			end
			if v_u_14.modalSelectorScreenGui ~= nil then
				v_u_14.modalSelectorScreenGui = nil
				return
			end
		elseif v_u_14.modalSelectorScreenGui ~= nil then
			v_u_14.modalSelectorFrame.Parent = nil
			v_u_14.modalSelectorFrame = nil
			v_u_14.modalSelectorScreenGui = nil
		end
	end
}