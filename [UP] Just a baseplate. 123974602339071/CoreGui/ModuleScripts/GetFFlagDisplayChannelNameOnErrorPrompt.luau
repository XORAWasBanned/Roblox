-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagDisplayChannelNameOnErrorPrompt
-- https://lua.expert

game:DefineFastFlag("DisplayChannelNameOnErrorPrompt", false)

return function() -- line: 3
    return game:GetFastFlag("DisplayChannelNameOnErrorPrompt")
end
