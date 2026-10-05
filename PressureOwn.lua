local Deletedp = 0
local Work = game:GetService("Workspace")
local Player = game:GetService("Players").LocalPlayer
local GPF = Work:WaitForChild("GameplayFolder")
local rooms = GPF:FindFirstChild("Rooms")
local Monster = {
    Angler = {text = "怪物angler来了",extra = "找个地方躲"},
    Froger = {text = "怪物froger来了",extra = "躲起来 注意他还会回来的！"},
    Pinkie = {text = "怪物pinkie来了",extra = "躲起来"},
    Blitz = {text = "怪物blitz来了",extra = "躲起来 他很快 所以你也要快！！！"},
    Chainsmoker = {text = "怪物chainsmoker来了",extra = "躲起来 他很慢 所以注意躲藏时间"},
    A60 = {text = "怪物A60来了",extra = "躲起来 尽量快！"},
    Bleach = {text = "怪物Bleach来了",extra = "躲起来 在变成瞎子之前"},
    A200 = {text = "怪物A200来了",extra = "躲起来 他知道你在哪 所以躲到柜子里或者床底下"},
    Pandemonium = {text = "怪物Panddemonium来了",extra = "躲起来 她的的视力很好 要完全躲起来"}
}
print ("已加载")
task.wait(2)
print ("这个脚本由一个菜鸟制作的 所以还存在很多问题")
local function addhl(goal,color,hltr)
 local hl = Instance.new("Highlight")
 hl.FillColor = color or Color3.fromRGB(0,255,0)
 hl.FillTransparency = hltr or 0.9
 hl.Parent = goal
end
--ui
local TweenService = game:GetService("TweenService")
local PlayerGui = Player:WaitForChild("PlayerGui")


local screen = Instance.new("ScreenGui")
screen.Name = "MonsterNotice"
screen.ResetOnSpawn = false          
screen.IgnoreGuiInset = true
screen.Parent = PlayerGui


local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.AnchorPoint = Vector2.new(1, 1)
holder.Position = UDim2.new(1, -20, 1, -20)   
holder.Size = UDim2.new(0, 340, 1, -40)
holder.BackgroundTransparency = 1
holder.Parent = screen


local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Vertical
layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)
layout.Parent = holder


local order = 0

local function addMarker(targetPart, textContent, color, textco)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "TargetMarker"
    billboard.Size = UDim2.new(0, 60, 0, 80)   
    billboard.StudsOffset = Vector3.new(0, 2, 0) 
    billboard.AlwaysOnTop = true               
    billboard.LightInfluence = 0               
    billboard.Adornee = targetPart              
    billboard.Parent = targetPart               
    local circle = Instance.new("Frame")
    circle.Name = "Circle"
    circle.Size = UDim2.new(0, 50, 0, 30)       
    circle.Position = UDim2.new(0.5, -2, 0, 0) 
    circle.BackgroundColor3 = color or Color3.fromRGB(255,255,0)
    circle.BorderSizePixel = 1
    circle.ZIndex = 2 
    circle.Parent = billboard
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1,0)
    corner.Parent = circle

   
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Label"
    textLabel.Size = UDim2.new(1, 0, 0, 20)     
    textLabel.Position = UDim2.new(0, 0, 0, 35) 
    textLabel.BackgroundTransparency = 1
    textLabel.Text = textContent or "目标"
    textLabel.TextColor3 = textco or Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0        
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextXAlignment = Enum.TextXAlignment.Center
    textLabel.Parent = billboard

    return billboard
end
local function Notice(title,text,duration)
    duration = duration or 4   
    order += 1
    local nowor = order
    task.spawn(function()      
        local item = Instance.new("Frame")
        item.Name = "Item"
        item.Size = UDim2.new(0, 320, 0, 74)
        item.BackgroundTransparency = 1
        item.LayoutOrder = nowor
        item.Parent = holder

        
        local card = Instance.new("Frame")
        card.Name = "Card"
        card.Size = UDim2.new(1, 0, 1, 0)
        card.Position = UDim2.new(1, 30, 0, 0)   
        card.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
        card.BackgroundTransparency = 0.15
        card.BorderSizePixel = 0
        card.Parent = item

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = card

        
        local bar = Instance.new("Frame")
        bar.Size = UDim2.new(0, 4, 1, -12)
        bar.Position = UDim2.new(0, 6, 0, 6)
        bar.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
        bar.BorderSizePixel = 0
        bar.Parent = card

        local barCorner = Instance.new("UICorner")
        barCorner.CornerRadius = UDim.new(1, 0)
        barCorner.Parent = bar

        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -24, 0, 28)
        titleLabel.Position = UDim2.new(0, 16, 0, 8)
        titleLabel.BackgroundTransparency = 1
        titleLabel.TextColor3 = Color3.fromRGB(255, 90, 90)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 17
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Text = title
        titleLabel.Parent = card

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, -24, 0, 30)
        textLabel.Position = UDim2.new(0, 16, 0, 36)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(225, 225, 230)
        textLabel.Font = Enum.Font.Gotham
        textLabel.TextSize = 13
        textLabel.TextWrapped = true
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.TextYAlignment = Enum.TextYAlignment.Top
        textLabel.Text = text
        textLabel.Parent = card

        
        local slideIn = TweenService:Create(
            card,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Position = UDim2.new(0, 0, 0, 0) }
        )
        slideIn:Play()
        slideIn.Completed:Wait()

        
        task.wait(duration)

        
        local slideOut = TweenService:Create(
            card,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
            { Position = UDim2.new(1, 30, 0, 0) }
        )
        slideOut:Play()
        slideOut.Completed:Wait()

        
        item:Destroy()
    end)
end
--Notice(Name,data,time)
function SendNot(name)
 local namereal = Monster[name]
 if not namereal then return end
 Notice(namereal.text,namereal.extra,4)
end
workspace.ChildAdded:Connect(function(child)
 local cn = child.Name
 if not Monster[cn] then return end
 SendNot(cn)
 addMarker(child,child.Name,Color3.fromRGB(255,0,0),Color3.fromRGB(255,0,0))
end)
rooms.ChildAdded:Connect(function(child)
 print("new rooms !!!!!")
 task.wait(0.3)
 local et = child:FindFirstChild("Entrances")
 if et then 
  local etc = et:GetChildren()
  if #etc > 0 then
   for _,ld in ipairs(etc) do
    if ld.Name == "NormalDoor" then
     addhl(ld.Door,Color3.fromRGB(0,255,0))
    elseif ld.Name == "DoubleDoor" then
     for _,lds in ipairs(ld:GetChildren()) do
      if lds.Name == "NormalDoor" then
       addhl(lds.Door,Color3.fromRGB(0,255,0))
      end
     end
    end
   end
  end
 end
 local doors = child:FindFirstChild("Exits"):GetChildren()
 local door = doors[1]
 addMarker(door,"门",Color3.fromRGB(0,255,0),Color3.fromRGB(0,255,0))
 local dmg = child:FindFirstChild("DamageParts")
 if dmg then
  print ("realpart")
  local dpt = dmg:GetChildren()
  print ("realchild")
  if dpt[1] then
   for _,dpo in ipairs(dpt) do
    dpo:Destroy()
    Deletedp += 1
    print("成功删除"..tostring(Deletedp).."个damageparts")
   end
  end
 end   
end)
task.wait(0.5)
for _,br in ipairs(rooms:GetChildren()) do
 addMarker(br.Exits:GetChildren()[1],"门",Color3.fromRGB(0,255,0),Color3.fromRGB(0,255,0))
 local let = br:FindFirstChild("Entrances")
 if let then
  local letc = let:GetChildren()
  if #letc > 0 then
   for _,lld in ipairs(letc) do
    if lld.Name == "NormalDoor" then
     addhl(lld.Door,Color3.fromRGB(0,255,0))
    elseif ld.Name == "DoubleDoor" then
     for _,lds in ipairs(ld:GetChildren()) do
      if lds.Name == "NormalDoor" then
       addhl(lds.Door,Color3.fromRGB(0,255,0))
      end
     end
    end
   end
  end
 end
end
print("ALL DONE!!!!!!")
