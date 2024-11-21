
local GUI = require("GUI")
local text = require("Text")
local filesystem = require("Filesystem")
local paths = require("Paths")
local system = require("System")
local fs = require("Filesystem")
local image = require("Image")
local SHA = require("SHA-256")
local component = require("Component")
local EFI = component.eeprom
local internet = require("Internet")

local module = {}

local workspace, window, localization = table.unpack({...})
local userSettings
userSettings = system.getUserSettings()

--------------------------------------------------------------------------------

module.name = "Home"
module.margin = 5
module.onTouch = function()

  local function addButton(parent, x, width, ...)
    local button = parent:addChild(GUI.button(x, 1, width, 3, 0xE1E1E1, 0x696969, 0x696969, 0xE1E1E1, ...))
    button.colors.disabled = {
      background = 0xE1E1E1,
      text = 0xB4B4B4
    }

    return button
  end

  -- Info
  local Label_Info = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Info"))
  local Button_Info = addButton(window.contentLayout, 1, 36, "Download and Install")
  Button_Info.onTouch = function()
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Info.app/Main.lua", "/tempMain.lua")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Info.app/Icon.pic", "/tempIcon.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Info.app/Localizations/English.lang", "/tempEnglish.lang")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Info.app/Localizations/Russian.lang", "/tempRussian.lang")
    local HS
    HS = paths.system.applications .. "Info.app"
    fs.makeDirectory(HS)
    fs.makeDirectory( HS .."/Localizations")
    fs.rename("/tempMain.lua", HS .. "/Main.lua")
    fs.rename("/tempIcon.pic", HS .. "/Icon.pic")
    fs.rename("/tempEnglish.lang", HS .. "/Localizations/English.lang")
    fs.rename("/tempRussian.lang", HS .. "/Localizations/Russian.lang")
  end

-- Lua
  local Label_Lua = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Lua"))
  local Button_Lua = addButton(window.contentLayout, 1, 36, "Download and Install")
  Button_Lua.onTouch = function()
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Lua.app/Main.lua", "/tempMain.lua")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Lua.app/Icon.pic", "/tempIcon.pic")
    local HS
    HS = paths.system.applications .. "Lua.app"
    fs.makeDirectory(HS)
    fs.rename("/tempMain.lua", HS .. "/Main.lua")
    fs.rename("/tempIcon.pic", HS .. "/Icon.pic")
  end

  -- Symbols
  local Label_Symbols = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Symbols"))
  local Button_Symbols = addButton(window.contentLayout, 1, 36, "Download and Install")
  Button_Symbols.onTouch = function()
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Symbols.app/Main.lua", "/tempMain.lua")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Symbols.app/Icon.pic", "/tempIcon.pic")
    local HS
    HS = paths.system.applications .. "Symbols.app"
    fs.makeDirectory(HS)
    fs.rename("/tempMain.lua", HS .. "/Main.lua")
    fs.rename("/tempIcon.pic", HS .. "/Icon.pic")
  end

  -- Weather
  local Label_Weather = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Weather"))
  local Button_Weather = addButton(window.contentLayout, 1, 36, "Download and Install")
  Button_Weather.onTouch = function()
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Main.lua", "/tempMain.lua")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Icon.pic", "/tempIcon.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Cloudy.pic", "/tempCloudy.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Foggy.pic", "/tempFoggy.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Rainy.pic", "/tempRainy.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Snowy.pic", "/tempSnowy.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Stormy.pic", "/tempStormy.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Weather.app/Sunny.pic", "/tempSunny.pic")
    local HS
    HS = paths.system.applications .. "Weather.app"
    fs.makeDirectory(HS)
    fs.rename("/tempMain.lua", HS .. "/Main.lua")
    fs.rename("/tempIcon.pic", HS .. "/Icon.pic")
    fs.rename("/tempCloudy.pic", HS .. "/Cloudy.pic")
    fs.rename("/tempFoggy.pic", HS .. "/Foggy.pic")
    fs.rename("/tempRainy.pic", HS .. "/Rainy.pic")
    fs.rename("/tempSnowy.pic", HS .. "/Snowy.pic")
    fs.rename("/tempStormy.pic", HS .. "/Stormy.pic")
    fs.rename("/tempSunny.pic", HS .. "/Sunny.pic")
  end

  -- Running String
  local Label_Running_String = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Running String"))
  local Button_Running_String = addButton(window.contentLayout, 1, 36, "Download and Install")
  Button_Running_String.onTouch = function()
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Running%20String.app/Main.lua", "/tempMain.lua")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Running%20String.app/Icon.pic", "/tempIcon.pic")
    local HS
    HS = paths.system.applications .. "Running String.app"
    fs.makeDirectory(HS)
    fs.rename("/tempMain.lua", HS .. "/Main.lua")
    fs.rename("/tempIcon.pic", HS .. "/Icon.pic")
  end

  -- Running String
  local Label_Calendar = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Calendar"))
  local Button_Calendar = addButton(window.contentLayout, 1, 36, "Download and Install")
  Button_Calendar.onTouch = function()
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Calendar.app/Main.lua", "/tempMain.lua")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Calendar.app/Icon.pic", "/tempIcon.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Calendar.app/Localizations/English.lang", "/tempEnglish.lang")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Calendar.app/Localizations/Russian.lang", "/tempRussian.lang")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Calendar.app/Icons/ArrowLeft.pic", "/tempArrowLeft.pic")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Apps/Calendar.app/Icons/ArrowRight.pic", "/tempArrowRight.pic")
    local HS
    HS = paths.system.applications .. "Calendar.app"
    fs.makeDirectory(HS)
    fs.makeDirectory( HS .."/Localizations")
    fs.makeDirectory( HS .."/Icons")
    fs.rename("/tempMain.lua", HS .. "/Main.lua")
    fs.rename("/tempIcon.pic", HS .. "/Icon.pic")
    fs.rename("/tempEnglish.lang", HS .. "/Localizations/English.lang")
    fs.rename("/tempRussian.lang", HS .. "/Localizations/Russian.lang")
    fs.rename("/tempArrowLeft.pic", HS .. "/Icons/ArrowLeft.pic")
    fs.rename("/tempArrowRight.pic", HS .. "/Icons/ArrowRight.pic")

  end


  end
--------------------------------------------------------------------------------

return module

