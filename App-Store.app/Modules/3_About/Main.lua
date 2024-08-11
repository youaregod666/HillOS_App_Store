
local GUI = require("GUI")
local text = require("Text")
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

local currentScriptDirectory2 = fs.path(system.getCurrentScript())

--------------------------------------------------------------------------------

module.name = "About"
module.margin = 3
module.onTouch = function()

  local function addButton(parent, x, width, ...)
    local button = parent:addChild(GUI.button(x, 1, width, 3, 0xE1E1E1, 0x696969, 0x696969, 0xE1E1E1, ...))
    button.colors.disabled = {
      background = 0xE1E1E1,
      text = 0xB4B4B4
    }

    return button
  end
  local AppVersion
  AppVersion = "0.0.0.11"

  local function flashEFI(url)
    internet.download(url, "/tempEFI.lua")
    EFI.set(fs.read("/tempEFI.lua"))
    EFI.setLabel("HillOS BIOS")
    fs.remove("/tempEFI.lua")
  end


  local Label_Info = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "Version: " .. AppVersion))
  local Button_Info = addButton(window.contentLayout, 1, 36, "Check For Updates")
  Button_Info.onTouch = function()
    --GUI.alert("This Does Nothing Right Now")
    internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Version.txt", "/VerTemp.temp")
    local VersionThing2
    VersionThing2 = fs.read("/VerTemp.temp")
    if AppVersion == VersionThing2 then
    else
      internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/App-Store.app/Main.lua", currentScriptDirectory2 .."Main.lua")
      internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/App-Store.app/Icon.pic", currentScriptDirectory2 .."Icon.pic")
      internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Version.txt", currentScriptDirectory2 .."Modules/3_About/Main.lua")
      internet.download("https://raw.githubusercontent.com/youaregod666/HillOS_App_Store/main/Version.txt", currentScriptDirectory2 .."Modules/3_About/Icon.pic")
    end

  end



  end
--------------------------------------------------------------------------------

return module

