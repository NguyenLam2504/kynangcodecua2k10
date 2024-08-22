local sitinklib = {}
function sitinklib:Notify(NotifyConfig)
    local NotifyConfig = NotifyConfig or {}
    NotifyConfig.Title = NotifyConfig.Title or "sitink Hub"
    NotifyConfig.Description = NotifyConfig.Description or ""
    NotifyConfig.Content = NotifyConfig.Content or ""
    NotifyConfig["Color"] =
        NotifyConfig["Color"] or Color3.fromRGB(127.00000002980232, 146.00000649690628, 242.00000077486038)
    NotifyConfig.Time = NotifyConfig.Time or 0.5
    NotifyConfig.Delay = NotifyConfig.Delay or 5
    local NotifyFunc = {}
    spawn(
        function()
            if not CoreGui:FindFirstChild("NotifyGui") then
                local NotifyGui = Instance.new("ScreenGui")
                NotifyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                NotifyGui.Name = "NotifyGui"
                NotifyGui.Parent = CoreGui
            end
            if not CoreGui.NotifyGui:FindFirstChild("NotifyLayout") then
                local NotifyLayout = Instance.new("Frame")

                NotifyLayout.AnchorPoint = Vector2.new(1, 1)
                NotifyLayout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NotifyLayout.BackgroundTransparency = 0.9990000128746033
                NotifyLayout.BorderColor3 = Color3.fromRGB(0, 0, 0)
                NotifyLayout.BorderSizePixel = 0
                NotifyLayout.Position = UDim2.new(1, -30, 1, -30)
                NotifyLayout.Size = UDim2.new(0, 300, 1, -30)
                NotifyLayout.Name = "NotifyLayout"
                NotifyLayout.Parent = CoreGui.NotifyGui

                local Count = 0
                CoreGui.NotifyGui.NotifyLayout.ChildRemoved:Connect(
                    function()
                        Count = 0
                        for i, v in CoreGui.NotifyGui.NotifyLayout:GetChildren() do
                            TweenService:Create(
                                v,
                                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                                {Position = UDim2.new(0, 0, 1, -((v.Size.Y.Offset + 12) * Count))}
                            ):Play()
                            Count = Count + 1
                        end
                    end
                )
            end
            local NotifyPosHeigh = 0
            for i, v in CoreGui.NotifyGui.NotifyLayout:GetChildren() do
                NotifyPosHeigh = -(v.Position.Y.Offset) + v.Size.Y.Offset + 12
            end
            local NotifyFrame = Instance.new("Frame")
            local NotifyFrameReal = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local DropShadowHolder = Instance.new("Frame")
            local DropShadow = Instance.new("ImageLabel")
            local NotifyContent = Instance.new("TextLabel")
            local Top = Instance.new("Frame")
            local NotifyTitle = Instance.new("TextLabel")
            local NotifyDescription = Instance.new("TextLabel")
            local NotifyClose = Instance.new("TextButton")
            local NotifyCloseImage = Instance.new("ImageLabel")

            NotifyFrame.AnchorPoint = Vector2.new(0, 1)
            NotifyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            NotifyFrame.BackgroundTransparency = 1
            NotifyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyFrame.BorderSizePixel = 0
            NotifyFrame.Position = UDim2.new(0, 0, 1, -(NotifyPosHeigh))
            NotifyFrame.Size = UDim2.new(1, 0, 0, 65)
            NotifyFrame.Name = "NotifyFrame"
            NotifyFrame.Parent = CoreGui.NotifyGui.NotifyLayout

            NotifyFrameReal.BackgroundColor3 = Color3.fromRGB(45.00000111758709, 45.00000111758709, 45.00000111758709)
            NotifyFrameReal.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyFrameReal.BorderSizePixel = 0
            NotifyFrameReal.Position = UDim2.new(0, 330, 0, 0)
            NotifyFrameReal.Size = UDim2.new(1, 0, 1, 0)
            NotifyFrameReal.Name = "NotifyFrameReal"
            NotifyFrameReal.Parent = NotifyFrame

            UICorner.Parent = NotifyFrameReal
            UICorner.CornerRadius = UDim.new(0, 5)

            DropShadowHolder.BackgroundTransparency = 1
            DropShadowHolder.BorderSizePixel = 0
            DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
            DropShadowHolder.ZIndex = 0
            DropShadowHolder.Name = "DropShadowHolder"
            DropShadowHolder.Parent = NotifyFrameReal

            DropShadow.Image = "rbxassetid://6015897843"
            DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
            DropShadow.ImageTransparency = 0.5
            DropShadow.ScaleType = Enum.ScaleType.Slice
            DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
            DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
            DropShadow.BackgroundTransparency = 1
            DropShadow.BorderSizePixel = 0
            DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
            DropShadow.Size = UDim2.new(1, 47, 1, 47)
            DropShadow.ZIndex = 0
            DropShadow.Name = "DropShadow"
            DropShadow.Parent = DropShadowHolder

            NotifyContent.Font = Enum.Font.GothamBold
            NotifyContent.Text = NotifyConfig.Content
            NotifyContent.TextColor3 = Color3.fromRGB(140.00000685453415, 140.00000685453415, 140.00000685453415)
            NotifyContent.TextSize = 13
            NotifyContent.TextXAlignment = Enum.TextXAlignment.Left
            NotifyContent.TextYAlignment = Enum.TextYAlignment.Top
            NotifyContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotifyContent.BackgroundTransparency = 0.9990000128746033
            NotifyContent.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyContent.BorderSizePixel = 0
            NotifyContent.Position = UDim2.new(0, 12, 0, 27)
            NotifyContent.Size = UDim2.new(1, -24, 0, 13)
            NotifyContent.Name = "NotifyContent"
            NotifyContent.Parent = NotifyFrameReal

            Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top.BackgroundTransparency = 0.9990000128746033
            Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Top.BorderSizePixel = 0
            Top.Size = UDim2.new(1, 0, 0, 34)
            Top.Name = "Top"
            Top.Parent = NotifyFrameReal

            NotifyTitle.Font = Enum.Font.GothamBold
            NotifyTitle.Text = NotifyConfig.Title
            NotifyTitle.TextColor3 = NotifyConfig.Color
            NotifyTitle.TextSize = 14
            NotifyTitle.TextXAlignment = Enum.TextXAlignment.Left
            NotifyTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotifyTitle.BackgroundTransparency = 0.9990000128746033
            NotifyTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyTitle.BorderSizePixel = 0
            NotifyTitle.Position = UDim2.new(0, 12, 0, 10)
            NotifyTitle.Size = UDim2.new(0, 0, 0, 14)
            NotifyTitle.Name = "NotifyTitle"
            NotifyTitle.Parent = Top

            NotifyDescription.Font = Enum.Font.GothamBold
            NotifyDescription.Text = NotifyConfig.Description
            NotifyDescription.TextColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612)
            NotifyDescription.TextSize = 14
            NotifyDescription.TextXAlignment = Enum.TextXAlignment.Left
            NotifyDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotifyDescription.BackgroundTransparency = 0.9990000128746033
            NotifyDescription.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyDescription.BorderSizePixel = 0
            NotifyDescription.Position = UDim2.new(0, 16 + NotifyTitle.TextBounds.X, 0, 10)
            NotifyDescription.Size = UDim2.new(0, 0, 0, 14)
            NotifyDescription.Name = "NotifyDescription"
            NotifyDescription.Parent = Top

            NotifyClose.Font = Enum.Font.SourceSans
            NotifyClose.Text = ""
            NotifyClose.TextColor3 = Color3.fromRGB(0, 0, 0)
            NotifyClose.TextSize = 14
            NotifyClose.AnchorPoint = Vector2.new(1, 0)
            NotifyClose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotifyClose.BackgroundTransparency = 0.9990000128746033
            NotifyClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyClose.BorderSizePixel = 0
            NotifyClose.Position = UDim2.new(1, 0, 0, 0)
            NotifyClose.Size = UDim2.new(0, 34, 0, 34)
            NotifyClose.Name = "NotifyClose"
            NotifyClose.Parent = Top

            NotifyCloseImage.Image = "rbxassetid://18328658828"
            NotifyCloseImage.AnchorPoint = Vector2.new(0.5, 0.5)
            NotifyCloseImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotifyCloseImage.BackgroundTransparency = 0.9990000128746033
            NotifyCloseImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
            NotifyCloseImage.BorderSizePixel = 0
            NotifyCloseImage.Position = UDim2.new(0.5, 0, 0.5, 0)
            NotifyCloseImage.Size = UDim2.new(1, -15, 1, -15)
            NotifyCloseImage.Name = "NotifyCloseImage"
            NotifyCloseImage.Parent = NotifyClose

            NotifyContent.Size =
                UDim2.new(1, -24, 0, 13 + (13 * (NotifyContent.TextBounds.X // NotifyContent.AbsoluteSize.X)))
            NotifyContent.TextWrapped = true

            if NotifyContent.AbsoluteSize.Y < 27 then
                NotifyFrame.Size = UDim2.new(1, 0, 0, 65)
            else
                NotifyFrame.Size = UDim2.new(1, 0, 0, NotifyContent.AbsoluteSize.Y + 40)
            end
            if NotifyContent.Text == "" then
                DropShadow.Size = UDim2.new(1, 30, 1, 30)
                NotifyFrame.Size = UDim2.new(1, 0, 0, 35)
            end
            local waitbruh = false
            function NotifyFunc:Close()
                if waitbruh then
                    return false
                end
                waitbruh = true
                TweenService:Create(
                    NotifyFrameReal,
                    TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                    {Position = UDim2.new(0, 330, 0, 0)}
                ):Play()
                task.wait(tonumber(NotifyConfig.Time) / 1.2)
                NotifyFrame:Destroy()
            end
            NotifyClose.Activated:Connect(
                function()
                    NotifyFunc:Close()
                end
            )
            TweenService:Create(
                NotifyFrameReal,
                TweenInfo.new(tonumber(NotifyConfig.Time), Enum.EasingStyle.Back, Enum.EasingDirection.InOut),
                {Position = UDim2.new(0, 0, 0, 0)}
            ):Play()
            task.wait(tonumber(NotifyConfig.Delay))
            NotifyFunc:Close()
        end
    )
end
