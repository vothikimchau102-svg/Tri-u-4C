-- Script ESP by Triệu 4C
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function CreateESP(player)
    local function SetupCharacter(character)
        if not character then return end
        
        -- Tạo viền Highlight nhìn xuyên tường
        local highlight = character:FindFirstChild("Trieu4C_Highlight") or Instance.new("Highlight")
        highlight.Name = "Trieu4C_Highlight"
        highlight.Parent = character
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Màu đỏ
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Viền trắng
        highlight.FillTransparency = 0.5
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

        -- Tạo bảng tên Triệu 4C
        local head = character:WaitForChild("Head", 10)
        if head then
            if head:FindFirstChild("Trieu4C_NameTag") then head.Trieu4C_NameTag:Destroy() end
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "Trieu4C_NameTag"
            billboard.Parent = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true

            local label = Instance.new("TextLabel")
            label.Parent = billboard
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "Triệu 4C | " .. player.Name
            label.TextColor3 = Color3.fromRGB(255, 255, 0) -- Màu vàng cho rực rỡ
            label.TextStrokeTransparency = 0
            label.TextScaled = true
            label.Font = Enum.Font.SourceSansBold
        end
    end

    -- Tự động gắn lại khi chết và hồi sinh
    player.CharacterAdded:Connect(SetupCharacter)
    if player.Character then SetupCharacter(player.Character) end
end

-- Kích hoạt cho người chơi cũ và mới
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then CreateESP(player) end
end
Players.PlayerAdded:Connect(CreateESP)

print("ESP Triệu 4C đã được kích hoạt thành công!")
