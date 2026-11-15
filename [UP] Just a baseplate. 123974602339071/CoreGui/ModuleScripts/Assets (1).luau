-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Resources.Assets
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies).UIBlox
local v3 = require(script.Parent.Images)
local v4 = v2.App.ImageSet.Images
local v5 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v6 = game:DefineFastFlag("FixInGameMenuMoreButtonIcon", false)
local v7 = {}
local v8 = {
	["RobloxLogo"] = v3["LuaApp/graphic/ic_logo"],
	["CloseButton"] = "rbxasset://textures/ui/TopBar/close.png",
	["RespawnIcon"] = v3["InGameMenu/Icons/RespawnIcon"],
	["ReportIcon"] = v5 and "icons/actions/feedback" or v3["LuaApp/icons/GameDetails/feedback"],
	["CloseModal"] = v5 and "icons/navigation/close" or v3["LuaApp/icons/navigation/close"],
	["NavigateBack"] = v5 and "icons/navigation/pushBack" or v3["LuaApp/icons/navigation/pushBack"],
	["NavigateForward"] = v3["LuaApp/icons/navigation/pushRight"],
	["SendInvite"] = v3["LuaApp/icons/GameDetails/invite"],
	["InviteSuccess"] = v3["LuaApp/icons/status_progress"],
	["InviteMenu"] = v3["InGameMenu/Icons/MenuFriends"],
	["InviteFail"] = v3["LuaApp/graphic/ic_alert"],
	["ControlsMenu"] = v3["InGameMenu/Icons/MenuControls"],
	["Gamepad"] = "rbxasset://textures/ui/InGameMenu/GenericController.png",
	["GamepadXbox"] = "rbxasset://textures/ui/InGameMenu/XboxController.png",
	["GamepadQuest"] = "rbxassetid://13262267483",
	["KeyBorder"] = v3["InGameMenu/Icons/KeyBorder"],
	["Mouse1Press"] = v3["InGameMenu/Graphic/ClickLeft"],
	["Mouse2Press"] = v3["InGameMenu/Graphic/ClickRight"],
	["MouseWheelScroll"] = v3["InGameMenu/Graphic/WheelScroll"],
	["UpArrow"] = v3["InGameMenu/Icons/ArrowUp"],
	["DownArrow"] = v3["InGameMenu/Icons/ArrowDown"],
	["LeftArrow"] = v3["InGameMenu/Icons/ArrowLeft"],
	["RightArrow"] = v3["InGameMenu/Icons/ArrowRight"],
	["ScrollTop"] = "rbxasset://textures/ui/InGameMenu/ScrollTop.png",
	["ScrollMid"] = "rbxasset://textures/ui/InGameMenu/ScrollMiddle.png",
	["ScrollBottom"] = "rbxasset://textures/ui/InGameMenu/ScrollBottom.png",
	["RadialGlow"] = "rbxasset://textures/ui/InGameMenu/BackgroundGlow.png",
	["PlayersMenu"] = v3["InGameMenu/Icons/MenuPlayers"],
	["AddFriend"] = v3["LuaApp/graphic/actions_friends_addfriend"],
	["CancelFriendRequest"] = v3["InGameMenu/Icons/CancelFriendRequest"],
	["UnFriend"] = v3["InGameMenu/Icons/UnFriend"],
	["Friends"] = v3["InGameMenu/Icons/Friends"]
}
local v9
if v6 then
	v9 = v4["icons/common/more"]
else
	v9 = v3["LuaApp/icons/GameDetails/more"]
end
v8.MoreActions = v9
v8.ViewAvatar = v3["InGameMenu/Icons/ViewAvatar"]
v8.RoundedRectImageKey = "component_assets/circle_17"
v8.RoundedRect = {
	["ScaleType"] = Enum.ScaleType.Slice,
	["SliceCenter"] = Rect.new(8, 8, 9, 9),
	["Image"] = v4["component_assets/circle_17"]
}
v8.RoundedRectBorder = {
	["ScaleType"] = Enum.ScaleType.Slice,
	["SliceCenter"] = Rect.new(8, 8, 9, 9),
	["Image"] = v4["component_assets/circle_17_stroke_1"]
}
v8.WhiteSquare = {
	["ScaleType"] = nil,
	["SliceCenter"] = nil,
	["Image"] = "rbxasset://textures/ui/InGameMenu/WhiteSquare.png",
	["ScaleType"] = Enum.ScaleType.Stretch,
	["SliceCenter"] = Rect.new(0, 0, 0, 0)
}
v8.Circle = v5 and "component_assets/circle_29" or v4["component_assets/circle_29"]
v8.CircleCutout = "rbxasset://textures/ui/InGameMenu/CircleCutout.png"
v8.QuarterCircle = "rbxasset://textures/ui/InGameMenu/QuarterCircle.png"
v8.ExpandArrow = v3["InGameMenu/Icons/ExpandArrow"]
v8.SelectedCheck = v3["InGameMenu/Icons/SelectedCheck"]
v8.SuccessTick = v3["LuaApp/icons/status_progress"]
v8.RetryIcon = v3["LuaApp/icons/common_refresh"]
v8.ClearIcon = v3["InGameMenu/Icons/Clear"]
v8.SearchIcon = v3["LuaApp/icons/ic-search-new"]
v8.GameSettings = v3["InGameMenu/Icons/GameSettings"]
v8.Shadow = {
	["ScaleType"] = nil,
	["SliceCenter"] = nil,
	["Size"] = 8,
	["Image"] = nil,
	["ScaleType"] = Enum.ScaleType.Slice,
	["SliceCenter"] = Rect.new(12, 12, 40, 40),
	["Image"] = v3["InGameMenu/9Slice/DropShadow"]
}
v8.ToggleOutline = {
	["Image"] = v3["InGameMenu/9Slice/ToggleOutline"],
	["ScaleType"] = Enum.ScaleType.Slice,
	["SliceCenter"] = Rect.new(18, 18, 18, 18)
}
v8.ToggleFill = {
	["Image"] = v3["InGameMenu/9Slice/ToggleFill"],
	["ScaleType"] = Enum.ScaleType.Slice,
	["SliceCenter"] = Rect.new(18, 18, 18, 18)
}
v8.ToggleKnob = v3["InGameMenu/Graphic/SliderButton"]
v8.SliderHover = v3["InGameMenu/Graphic/sliderHover"]
v8.SliderCircle = {
	["Image"] = v3["InGameMenu/9Slice/sliderCircle"],
	["SliceCenter"] = Rect.new(8, 8, 9, 9),
	["ScaleType"] = Enum.ScaleType.Slice
}
v8.SliderButton = v3["InGameMenu/Graphic/SliderButton"]
v8.PlaceholderGameIcon = v5 and "icons/imageUnavailable" or v4["icons/imageUnavailable"]
v7.Images = v8
return v7