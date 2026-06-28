local Players          = game:GetService("Players")
local UIS              = game:GetService("UserInputService")
local TeleportService  = game:GetService("TeleportService")
local Player           = Players.LocalPlayer

local Running   = false
local STEP_WAIT = 0.8
local WORLD1    = 74384050846716
local WORLD2    = 136389089978291

local CHECKPOINTS = {
    { name = "Basic",  pos = Vector3.new(-64, -4, -20) },
    { name = "Great",  pos = Vector3.new(-49, -4, -9)  },
    { name = "Golden", pos = Vector3.new(-34, -4, -3)  },
}
local SelectedCP     = CHECKPOINTS[1].pos
local ACTIVE_COLOR   = Color3.fromRGB(50, 120, 200)
local INACTIVE_COLOR = Color3.fromRGB(55, 55, 55)

local Gui  = Instance.new("ScreenGui")
Gui.Name   = "AutoWin"
Gui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size             = UDim2.new(0, 240, 0, 248)
Frame.Position         = UDim2.new(0.5, -120, 0.5, -124)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel  = 0
Frame.Parent           = Gui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Size             = UDim2.new(1, 0, 0, 32)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Text             = "Hack Support World 2 Only Soryy For Ur MoM"
Title.TextColor3       = Color3.new(1, 1, 1)
Title.Font             = Enum.Font.GothamBold
Title.TextSize         = 13
Title.Parent           = Frame
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 8)

local Toggle = Instance.new("TextButton")
Toggle.Size             = UDim2.new(0.9, 0, 0, 28)
Toggle.Position         = UDim2.new(0.05, 0, 0, 38)
Toggle.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
Toggle.TextColor3       = Color3.new(1, 1, 1)
Toggle.Font             = Enum.Font.GothamBold
Toggle.TextSize         = 12
Toggle.Text             = "START"
Toggle.Parent           = Frame
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 6)

local DelayBox = Instance.new("TextBox")
DelayBox.Size             = UDim2.new(0.9, 0, 0, 28)
DelayBox.Position         = UDim2.new(0.05, 0, 0, 74)
DelayBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DelayBox.TextColor3       = Color3.new(1, 1, 1)
DelayBox.Font             = Enum.Font.Gotham
DelayBox.TextSize         = 12
DelayBox.Text             = "10"
DelayBox.PlaceholderText  = "Cooldown (seconds)"
DelayBox.Parent           = Frame
Instance.new("UICorner", DelayBox).CornerRadius = UDim.new(0, 6)

local CPLabel = Instance.new("TextLabel")
CPLabel.Size                   = UDim2.new(0.9, 0, 0, 16)
CPLabel.Position               = UDim2.new(0.05, 0, 0, 110)
CPLabel.BackgroundTransparency = 1
CPLabel.TextColor3             = Color3.fromRGB(120, 120, 120)
CPLabel.Font                   = Enum.Font.Gotham
CPLabel.TextSize               = 11
CPLabel.Text                   = "Checkpoint"
CPLabel.TextXAlignment         = Enum.TextXAlignment.Left
CPLabel.Parent                 = Frame

local CPButtons = {}
for i, cp in ipairs(CHECKPOINTS) do
    local btn = Instance.new("TextButton")
    btn.Size             = UDim2.new(0.28, 0, 0, 26)
    btn.Position         = UDim2.new(0.05 + (i - 1) * 0.31, 0, 0, 130)
    btn.BackgroundColor3 = i == 1 and ACTIVE_COLOR or INACTIVE_COLOR
    btn.TextColor3       = Color3.new(1, 1, 1)
    btn.Font             = Enum.Font.GothamBold
    btn.TextSize         = 11
    btn.Text             = cp.name
    btn.Parent           = Frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        SelectedCP = cp.pos
        for j, b in ipairs(CPButtons) do
            b.BackgroundColor3 = j == i and ACTIVE_COLOR or INACTIVE_COLOR
        end
    end)
    CPButtons[i] = btn
end

local WorldLabel = Instance.new("TextLabel")
WorldLabel.Size                   = UDim2.new(0.9, 0, 0, 16)
WorldLabel.Position               = UDim2.new(0.05, 0, 0, 164)
WorldLabel.BackgroundTransparency = 1
WorldLabel.TextColor3             = Color3.fromRGB(120, 120, 120)
WorldLabel.Font                   = Enum.Font.Gotham
WorldLabel.TextSize               = 11
WorldLabel.Text                   = "Teleport World"
WorldLabel.TextXAlignment         = Enum.TextXAlignment.Left
WorldLabel.Parent                 = Frame

local WorldBtn1 = Instance.new("TextButton")
WorldBtn1.Size             = UDim2.new(0.44, 0, 0, 26)
WorldBtn1.Position         = UDim2.new(0.05, 0, 0, 184)
WorldBtn1.BackgroundColor3 = Color3.fromRGB(130, 60, 160)
WorldBtn1.TextColor3       = Color3.new(1, 1, 1)
WorldBtn1.Font             = Enum.Font.GothamBold
WorldBtn1.TextSize         = 11
WorldBtn1.Text             = "World 1"
WorldBtn1.Parent           = Frame
Instance.new("UICorner", WorldBtn1).CornerRadius = UDim.new(0, 6)
WorldBtn1.MouseButton1Click:Connect(function()
    TeleportService:Teleport(WORLD1, Player)
end)

local WorldBtn2 = Instance.new("TextButton")
WorldBtn2.Size             = UDim2.new(0.44, 0, 0, 26)
WorldBtn2.Position         = UDim2.new(0.51, 0, 0, 184)
WorldBtn2.BackgroundColor3 = Color3.fromRGB(130, 60, 160)
WorldBtn2.TextColor3       = Color3.new(1, 1, 1)
WorldBtn2.Font             = Enum.Font.GothamBold
WorldBtn2.TextSize         = 11
WorldBtn2.Text             = "World 2"
WorldBtn2.Parent           = Frame
Instance.new("UICorner", WorldBtn2).CornerRadius = UDim.new(0, 6)
WorldBtn2.MouseButton1Click:Connect(function()
    TeleportService:Teleport(WORLD2, Player)
end)

local Status = Instance.new("TextLabel")
Status.Size                   = UDim2.new(0.9, 0, 0, 20)
Status.Position               = UDim2.new(0.05, 0, 0, 220)
Status.BackgroundTransparency = 1
Status.TextColor3             = Color3.fromRGB(160, 160, 160)
Status.Font                   = Enum.Font.Gotham
Status.TextSize               = 11
Status.Text                   = "OFF"
Status.Parent                 = Frame

local Dragging, DragStart, StartPos = false, nil, nil
Title.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging  = true
        DragStart = i.Position
        StartPos  = Frame.Position
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)
UIS.InputChanged:Connect(function(i)
    if Dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - DragStart
        Frame.Position = UDim2.new(
            StartPos.X.Scale, StartPos.X.Offset + d.X,
            StartPos.Y.Scale, StartPos.Y.Offset + d.Y
        )
    end
end)

local function GetButtons()
    local ok, Folder = pcall(function() return workspace.Map.World2.WinButtons end)
    if not ok or not Folder then return {} end
    local out = {}
    for _, v in ipairs(Folder:GetChildren()) do
        if v.Name == "WinButton" then
            local p = v:FindFirstChild("Button")
            if p then table.insert(out, p) end
        end
    end
    return out
end

local function TP(target)
    local Char = Player.Character
    if not Char then return end
    local HRP = Char:FindFirstChild("HumanoidRootPart")
    if not HRP then return end
    if typeof(target) == "Vector3" then
        HRP.CFrame = CFrame.new(target)
    else
        HRP.CFrame = target.CFrame + Vector3.new(0, 1, 0)
    end
end

local mainTask = nil

local function StopAll()
    Running = false
    if mainTask then
        pcall(task.cancel, mainTask)
        mainTask = nil
    end
    Toggle.Text             = "START"
    Toggle.BackgroundColor3 = Color3.fromRGB(0, 160, 0)
    Status.Text             = "OFF"
end

Toggle.MouseButton1Click:Connect(function()
    if Running then StopAll() return end

    Running                 = true
    Toggle.Text             = "STOP"
    Toggle.BackgroundColor3 = Color3.fromRGB(160, 0, 0)
    Status.Text             = "RUNNING"

    mainTask = task.spawn(function()
        while Running do
            local cd         = math.max(tonumber(DelayBox.Text) or 10, 1)
            local Buttons    = GetButtons()
            local roundStart = tick()

            Status.Text = "Warping..."
            for _, part in ipairs(Buttons) do
                if not Running then break end
                TP(part)
                task.wait(STEP_WAIT)
            end

            if not Running then break end

            TP(SelectedCP)

            local deadline = roundStart + cd
            while Running and tick() < deadline do
                Status.Text = string.format("Next: %.1f s", deadline - tick())
                task.wait(0.05)
            end
        end
    end)
end)
