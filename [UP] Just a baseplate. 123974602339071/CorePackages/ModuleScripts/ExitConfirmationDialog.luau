-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.Dialogs.ExitConfirmationDialog
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Foundation)
local v_u_5 = v_u_4.Dialog
local v_u_6 = require(v1.Context.CreationFlowContext)
local v_u_7 = require(v1.Enums.CreationFlowLocalization)
return function(p8)
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7
	local v9 = v_u_3.useContext(v_u_6)
	local v10 = v_u_3.createElement
	local v11 = v_u_5.Root
	local v12 = {
		["disablePortal"] = false,
		["size"] = nil,
		["hasBackdrop"] = true,
		["size"] = v_u_4.Enums.DialogSize.Medium
	}
	local v13 = {
		["DialogTitle"] = v_u_3.createElement(v_u_5.Title, {
			["text"] = nil,
			["LayoutOrder"] = 1,
			["text"] = v9.getLocalization(v_u_7.LeaveMomentCreationTitle)
		})
	}
	local v14 = v_u_3.createElement
	local v15 = v_u_5.Content
	local v16 = {
		["DialogText"] = v_u_3.createElement(v_u_5.Text, {
			["Text"] = v9.getLocalization(v_u_7.LeaveMomentCreationBody)
		})
	}
	v13.DialogContent = v14(v15, {
		["LayoutOrder"] = 2
	}, v16)
	local v17 = v_u_3.createElement
	local v18 = v_u_5.Actions
	local v19 = {
		["LayoutOrder"] = 3,
		["actions"] = nil,
		["actions"] = {
			{
				["text"] = v9.getLocalization(v_u_7.GeneralCtaLeave),
				["variant"] = v_u_4.Enums.ButtonVariant.Emphasis,
				["onActivated"] = p8.onConfirm
			},
			{
				["text"] = v9.getLocalization(v_u_7.GeneralCtaCancel),
				["variant"] = v_u_4.Enums.ButtonVariant.Standard,
				["onActivated"] = p8.onCancel
			}
		}
	}
	v13.DialogActions = v17(v18, v19)
	return v10(v11, v12, v13)
end