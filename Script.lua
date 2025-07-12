-- Wastelane Hack Script by ChatGPT - GUI Completo com Rayfield UI

-- Carregar Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Wastelane Hack [Completão]",
   LoadingTitle = "Injetando Script...",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- Auto Farm Inimigos
Rayfield:CreateToggle({
   Name = "Auto Farm Inimigos",
   CurrentValue = false,
   Callback = function(state)
      getgenv().autoFarm = state
      while getgenv().autoFarm do
         for _, enemy in ipairs(workspace:GetDescendants()) do
            if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Name ~= "Player" then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
               wait(0.5)
            end
         end
         wait()
      end
   end,
})

-- Kill Aura (Arma equipada)
Rayfield:CreateToggle({
   Name = "Kill Aura (Arma equipada)",
   CurrentValue = false,
   Callback = function(state)
      getgenv().killAura = state
      while getgenv().killAura do
         local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
         if tool then
            for _, enemy in ipairs(workspace:GetDescendants()) do
               if enemy:FindFirstChild("Humanoid") and enemy.Name ~= "Player" then
                  enemy.Humanoid.Health = 0
               end
            end
         end
         wait(0.3)
      end
   end,
})

-- Teleport Loja
Rayfield:CreateButton({
   Name = "Teleportar para a Loja",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 5, 100) -- Substitua se necessário
   end,
})

-- Comprar Tudo (Magnum, Espingarda, Armazém...)
Rayfield:CreateButton({
   Name = "Comprar Tudo (Magnum, Espingarda...)",
   Callback = function()
      local remote = game:GetService("ReplicatedStorage"):FindFirstChild("BuyItem")
      local itens = {"Magnum", "Espingarda", "Armazém"}
      if remote then
         for _, item in ipairs(itens) do
            remote:FireServer(item)
            wait(0.2)
         end
      else
         warn("RemoteEvent 'BuyItem' não encontrado.")
      end
   end,
})

-- Fly (Voo)
Rayfield:CreateToggle({
   Name = "Fly (Voo)",
   CurrentValue = false,
   Callback = function(state)
      if state then
         local bodyVelocity = Instance.new("BodyVelocity")
         bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
         bodyVelocity.Velocity = Vector3.new(0, 100, 0)
         bodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
      else
         for _, child in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
            if child:IsA("BodyVelocity") then
               child:Destroy()
            end
         end
      end
   end,
})

-- Speed Hack (Aceleração)
Rayfield:CreateSlider({
   Name = "Speed Hack (Velocidade)",
   MinValue = 16,
   MaxValue = 200,
   DefaultValue = 50,
   Callback = function(value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
   end,
})

-- ESP (Inimigos e Itens)
Rayfield:CreateToggle({
   Name = "ESP (Inimigos e Itens)",
   CurrentValue = false,
   Callback = function(state)
      getgenv().espEnabled = state
      while getgenv().espEnabled do
         for _, object in ipairs(workspace:GetDescendants()) do
            if object.Name == "Enemy" then
               local box = Instance.new("Part")
               box.Size = Vector3.new(4, 6, 4)
               box.Position = object.HumanoidRootPart.Position
               box.Anchored = true
               box.CanCollide = false
               box.BrickColor = BrickColor.new("Bright red")
               box.Parent = workspace
            end
         end
         wait(0.5)
      end
   end,
})

-- God Mode (experimental)
Rayfield:CreateToggle({
   Name = "God Mode (experimental)",
   CurrentValue = false,
   Callback = function(state)
      if state then
         local char = game.Players.LocalPlayer.Character
         if char:FindFirstChild("Humanoid") then
            char.Humanoid.Name = "1"
            local clone = char["1"]:Clone()
            clone.Name = "Humanoid"
            clone.Parent = char
            wait(0.5)
            char["1"]:Destroy()
         end
      end
   end,
})

print("Wastelane Hack [Completão] Carregado com Sucesso!")
