
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
local internet = require("internet")

local module = {}

local workspace, window, localization = table.unpack({...})
local userSettings
userSettings = system.getUserSettings()

--------------------------------------------------------------------------------

module.name = "Home"
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

  local function flashEFI(url)
    internet.download(url, "/tempEFI.lua")
    EFI.set(fs.read("/tempEFI.lua"))
    EFI.setLabel("HillOS BIOS")
    fs.remove("/tempEFI.lua")
  end

  --internet.download("URL HERE", "PATH HERE")
  local iconButton = addButton(window.contentLayout, 1, 36, "Change Dev settings")

  local wallpaperSwitch = window.contentLayout:addChild(GUI.switchAndLabel(1, 1, 36, 8, 0x66DB80, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, "HillOS S mode", false)).switch

  wallpaperSwitch.onStateChanged = function()

  end


  local function replaceloader()

  end


  iconButton.onTouch = function()
  replaceloader()
  end
  --space:draw()





  --fs.remove("/Libraries/" .. text .. ".lua")
  --fs.rename("/Libraries/" .. text ..".lua", "/OS.lua")
  end
--------------------------------------------------------------------------------

return module

