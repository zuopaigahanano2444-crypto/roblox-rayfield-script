-- Anti-Kick Functionality (Must be at the top)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
   local method = getnamecallmethod()
   if method == "Kick" or method == "kick" then
      return nil
   end
   return old(self, ...)
end)

setreadonly(mt, true)

-- Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Manus Script - Roblox (Anti-Kick)",
   LoadingTitle = "Rayfield UI Library",
   LoadingSubtitle = "by Manus",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "ManusHub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false
})

local Tab = Window:CreateTab("Main Settings", 4483362458)

local Section = Tab:CreateSection("Character Modifiers")

local SliderSpeed = Tab:CreateSlider({
   Name = "WalkSpeed (移動速度)",
   Range = {16, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SliderSpeed",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local SliderJump = Tab:CreateSlider({
   Name = "JumpPower (ジャンプ力)",
   Range = {50, 500},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "SliderJump",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local Section2 = Tab:CreateSection("Security")

Tab:CreateLabel("Anti-Kick is automatically enabled.")

Rayfield:Notify({
   Title = "Script Loaded",
   Content = "Manus Script with Anti-Kick has been successfully loaded!",
   Duration = 6.5,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
            print("The user tapped Okay!")
         end
      },
   },
})
