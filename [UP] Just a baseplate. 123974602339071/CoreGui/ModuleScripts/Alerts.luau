-- Path: CoreGui.RobloxGui.Modules.Shell.Alerts
local v1 = game:GetService("CoreGui")
game:GetService("CorePackages")
local v2 = v1:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local v3 = require(v2:FindFirstChild("LocalizedStrings"))
local v4 = {
	["Default"] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 0,
		["Title"] = v3:LocStringUA("Xbox.Old.AlertOccurredTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.DefaultAlertPhrase")
	},
	["UnlockedUGC"] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 101,
		["Title"] = v3:LocStringUA("Xbox.Old.UnlockedUGCTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.UnlockedUGCPhrase")
	}
}
local v5 = {
	["Controller"] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 201,
		["Title"] = v3:LocStringUA("Xbox.Old.ControllerLostConnectionTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ControllerLostConnectionPhrase")
	},
	["ActiveUser"] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 202,
		["Title"] = v3:LocStringUA("Xbox.Old.ActiveUserLostConnectionTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ActiveUserLostConnectionPhrase")
	}
}
v4.LostConnection = v5
v4.PlayMyPlaceMoreGames = {
	["Title"] = nil,
	["Msg"] = nil,
	["Id"] = 301,
	["Title"] = v3:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesTitle"),
	["Msg"] = v3:LocStringUA("Xbox.Old.PlayMyPlaceMoreGamesPhrase")
}
v4.CrossPlatformPlayWelcome = {
	["Title"] = nil,
	["Msg"] = nil,
	["Id"] = 401,
	["Title"] = v3:LocStringUA("Xbox.Old.CPPWelcomeTitle"),
	["Msg"] = v3:LocStringUA("Xbox.Old.CPPWelcomePhrase")
}
local v6 = {
	[0] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1001,
		["Title"] = v3:LocStringUA("Xbox.Old.AlertOccurredTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthUnknownPhrase")
	},
	[1] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1002,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthSignedOutPhrase")
	},
	[2] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1003,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
	},
	[3] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1004,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase")
	},
	[4] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1005,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthUnlinkTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthUnlinkPhrase")
	},
	[5] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1006,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
	},
	[6] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1007,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
	},
	[7] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1008,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
	}
}
v4.Reauthentication = v6
local v7 = {
	[0] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1001,
		["Title"] = v3:LocStringUA("Xbox.Old.AlertOccurredTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthUnknownPhrase")
	},
	[1] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1002,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthSignedOutPhrase")
	},
	[2] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1003,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthSignedOutTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthInvalidSessionPhrase")
	},
	[3] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1004,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthUnlinkTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthUnlinkPhrase")
	},
	[4] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1005,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
	},
	[5] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1006,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthRemovedTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthRemovedPhrase")
	},
	[6] = nil,
	[7] = {
		["Title"] = nil,
		["Msg"] = nil,
		["Id"] = 1007,
		["Title"] = v3:LocStringUA("Xbox.Old.ReauthMaintenanceTitle"),
		["Msg"] = v3:LocStringUA("Xbox.Old.ReauthMaintenancePhrase")
	}
}
v4.SignOut = v7
v4.PlatformLink = {
	["Title"] = nil,
	["Msg"] = nil,
	["Id"] = 1201,
	["Title"] = v3:LocStringUA("Xbox.Old.PlatformLinkInfoTitle"),
	["Msg"] = v3:LocStringUA("Xbox.Old.PlatformLinkInfoMessage")
}
return v4