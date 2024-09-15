
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

module.name = "Updates"
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

  -- Info
  local Label_Info = window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, "No Updates for any apps right now"))

  --local Button_Running_String = addButton(window.contentLayout, 1, 36, "Download and Install")
  --Button_Running_String.onTouch = function()

  --end

  end
--------------------------------------------------------------------------------

return module

