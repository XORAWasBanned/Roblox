-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.PromptType
local v1 = game:GetService("CorePackages")
return require(v1.Packages.enumerate)("PromptType", {
	"AllowInventoryReadAccess",
	"SaveAvatar",
	"CreateOutfit",
	"EnterOutfitName",
	"SetFavorite",
	"DeleteOutfit",
	"RenameOutfit",
	"UpdateOutfit",
	"SaveAvatarTimeout"
})