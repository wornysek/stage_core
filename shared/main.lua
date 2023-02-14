Debug = function(debugText, debugType)
  debugType = debugType or "info"

  if debugText and SETTINGS.DEBUG[debugType] then
    return print(string.format(SETTINGS.DEBUG[debugType], debugText))
  end
end