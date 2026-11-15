-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.CapturesPageWrapper
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1:WaitForChild("RobloxGui").Modules
local v4 = require(v2.Workspace.Packages.RobloxTranslator)
local v5 = require(v3.Settings.SettingsPageFactory)
local v6 = require(v2.Workspace.Packages.Chrome).Enabled()
local v7 = require(v2.Packages.BuilderIcons)
local v8 = v7.Migration.uiblox
local v9 = require(v2.Packages.Foundation)
local v_u_10 = require(script.Parent.Parent.Flags.GetFFlagFixIGMTabTransitions)
local v11 = require(script.Parent.Parent.Flags.FFlagIGMChangeCapturesToGallery)
local v12 = require(script.Parent.Parent.Flags.FFlagIGMChangeGalleryHeaderIcon)
local v13 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_14 = v5:CreateNewPage()
v_u_14.TabHeader.Name = "CapturesTab"
local v15
if v12 then
	v15 = {
		["name"] = "image",
		["variant"] = nil,
		["variant"] = v9.Enums.IconVariant.Regular
	}
elseif v6 then
	v15 = v8["icons/controls/cameraOff"]
else
	v15 = v8["icons/controls/screenshot"]
end
v_u_14.TabHeader.TabLabel.Icon.Text = v15.name
v_u_14.TabHeader.TabLabel.Icon.FontFace = v7.Font[v15.variant]
v_u_14.TabHeader.TabLabel.Title.AutoLocalize = false
if v11 then
	v_u_14.TabHeader.TabLabel.Title.Text = v4:FormatByKey("Feature.Captures.Title.Gallery")
else
	v_u_14.TabHeader.TabLabel.Title.Text = v4:FormatByKey("Feature.SettingsHub.Label.Captures")
end
v_u_14.PageListLayout.Parent = nil
v_u_14.ShouldShowBottomBar = not v13
v_u_14.ShouldShowHubBar = true
v_u_14.Page.Name = "Captures"
v_u_14.Page.Size = UDim2.fromScale(1, 0)
local v16 = v_u_14.Page:FindFirstChildWhichIsA("UIPadding")
if v16 then
	v16:Destroy()
end
function v_u_14.ConnectHubToApp(_, p17, p_u_18, p_u_19) -- name: ConnectHubToApp
	-- upvalues: (copy) v_u_14, (copy) v_u_10
	v_u_14:SetHub(p17)
	local v_u_20 = p_u_18.AbsoluteSize.Y - 20
	v_u_14.Page.Size = UDim2.new(1, 0, 0, v_u_20)
	p_u_18:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: (ref) v_u_20, (copy) p_u_18, (ref) v_u_14
		v_u_20 = p_u_18.AbsoluteSize.Y - 20
		v_u_14.Page.Size = UDim2.new(1, 0, 0, v_u_20)
	end)
	local v_u_21 = v_u_14.Display
	function v_u_14.Display(_, ...) -- name: Display
		-- upvalues: (copy) p_u_19, (copy) v_u_21, (ref) v_u_14
		p_u_19.openMenu()
		v_u_21(v_u_14, ...)
	end
	v_u_14.Hidden.Event:Connect(function()
		-- upvalues: (ref) v_u_10, (copy) p_u_19
		if not v_u_10() then
			p_u_19.closeMenu()
		end
	end)
	local v_u_22 = v_u_14.Hide
	function v_u_14.Hide(_, ...) -- name: Hide
		-- upvalues: (ref) v_u_10, (copy) p_u_19, (copy) v_u_22, (ref) v_u_14
		if v_u_10() then
			p_u_19.closeMenu()
		end
		v_u_22(v_u_14, ...)
	end
end
return v_u_14