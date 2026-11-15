-- Path: CoreGui.RobloxGui.Modules.ErrorReporting.createCoreScriptSentryReporter
-- https://lua.expert

local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local SentryReporter = require(CorePackages.Workspace.Packages.ErrorReporters).SentryReporter

local function createCoreScriptSentryReporter(p1) -- line: 23
    -- upvalues: HttpService (copy), RunService (copy), SentryReporter (copy)
    local v1 = p1.runService or RunService
    local v2 = false

    local function processErrorReport(p2) -- line: 30
        -- upvalues: p1 (copy)
        local v3 = p1.processErrorReportMethod(p2)

        v3:addCustomMetadata({
            CoreScripts = v3.attributes
        })

        return v3
    end

    local function v4() -- line: 38
        -- upvalues: p1 (copy), v2 (ref), processErrorReport (copy), v1 (copy), HttpService (copy), SentryReporter (copy)
        v2 = v1:IsStudio()

        return SentryReporter.new({
            disableDevelopmentLogging = true,
            httpService = HttpService,
            processErrorReportMethod = processErrorReport,
            dsn = p1.dsn,
            environment = v2 and "development" or "production",
            release = v1:GetCoreScriptVersion() or "unknown"
        })
    end

    local ok, result = pcall(v4)

    if ok then
        return result
    end

    if v2 then
        warn(("[CoreScriptSentryReporter] Failed to initialize: %s"):format((tostring(result))))
    end

    return nil
end

return createCoreScriptSentryReporter
