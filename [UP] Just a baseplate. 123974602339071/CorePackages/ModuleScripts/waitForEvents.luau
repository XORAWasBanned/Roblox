-- Path: CorePackages.Packages._Index.FocusNavigationUtils.FocusNavigationUtils.waitForEvents
return function() -- name: waitForEvents
	task.defer(coroutine.running())
	coroutine.yield()
end