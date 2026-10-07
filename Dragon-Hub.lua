--[[ DRAGON HUB v11 - PARTE 1/4 ]]
local P=game:GetService("Players")local R=game:GetService("RunService")local U=game:GetService("UserInputService")local W=game:GetService("Workspace")local C=game:GetService("CoreGui")local T=game:GetService("TweenService")local V=game:GetService("VirtualUser")local S=game:GetService("StarterGui")local RS=game:GetService("ReplicatedStorage")local LP=P.LocalPlayer local Cam=W.CurrentCamera
local ak=LP.Idled:Connect(function()V:Button2Down(Vector2.new(0,0),Cam.CFrame)task.wait(1)V:Button2Up(Vector2.new(0,0),Cam.CFrame)end)
pcall(function()local m=getrawmetatable(game)local o=m.__namecall setreadonly(m,false)m.__namecall=newcclosure(function(s,...)if getnamecallmethod()=="Kick"and s==LP then return end return o(s,...)end)setreadonly(m,true)end)
local BG=nil pcall(function()if getcustomasset then BG=getcustomasset("a72346eae5672d603414b8a0b97e1079.png")end end)
local Cf={AimbotGuards=false,AimbotInmates=false,AimbotCriminals=false,AimLockAll=false,Noclip=false,FollowCharacter=false,AutoJump=false,ESPLine=false,ESPBox=false,ESPBone=false,ESPLife=false,ESPTeam="All",AimbotSmooth=0.25,AimbotFOV=300,NoclipSpeed=45}
local EO={}local NC={}local NR=false local NX=0 local NZ=0 local NY=0 local FT=nil
local function gTP(t)local l={}for _,p in pairs(P:GetPlayers())do if p~=LP and p.Character and p.Team and p.Team.Name==t then if p.Character:FindFirstChild("HumanoidRootPart")then table.insert(l,p)end end end return l end
local function gCP(f)local cl,d=nil,math.huge local mh=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")if not mh then return nil end for _,p in pairs(P:GetPlayers())do if p~=LP and p.Character then local h=p.Character:FindFirstChild("HumanoidRootPart")local hm=p.Character:FindFirstChildOfClass("Humanoid")if h and hm and hm.Health>0 then if f==nil or f(p)then local dd=(h.Position-mh.Position).Magnitude if dd<d then d=dd cl=p end end end end end return cl end
local function aT(t)if not t or not t.Character then return end local h=t.Character:FindFirstChild("HumanoidRootPart")local hd=t.Character:FindFirstChild("Head")if not h then return end local ap=hd and hd.Position or h.Position local sp,os=Cam:WorldToViewportPoint(ap)if not os then return end local c=Vector2.new(Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2)if(Vector2.new(sp.X,sp.Y)-c).Magnitude>Cf.AimbotFOV then return end local cf=Cam.CFrame local tf=CFrame.new(cf.Position,ap)Cam.CFrame=cf:Lerp(tf,Cf.AimbotSmooth)end
local SG=Instance.new("ScreenGui")SG.Name="DragonHub"SG.ResetOnSpawn=false SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling SG.IgnoreGuiInset=true
pcall(function()if syn and syn.protect_gui then syn.protect_gui(SG)SG.Parent=C elseif gethui then SG.Parent=gethui()else SG.Parent=C end end)if not SG.Parent then SG.Parent=LP:WaitForChild("PlayerGui")end
local M=Instance.new("Frame")M.Size=UDim2.new(0,500,0,340)M.Position=UDim2.new(0.5,-250,0.5,-170)M.BackgroundColor3=Color3.fromRGB(15,15,20)M.BorderSizePixel=0 M.Active=true M.Draggable=true M.Parent=SG
local MC=Instance.new("UICorner")MC.CornerRadius=UDim.new(0,12)MC.Parent=M
local BI=Instance.new("ImageLabel")BI.Size=UDim2.new(1,0,1,0)BI.BackgroundTransparency=1 BI.ScaleType=Enum.ScaleType.Crop BI.ZIndex=0 BI.Parent=M
if BG then BI.Image=BG BI.ImageTransparency=0.5 else BI.BackgroundColor3=Color3.fromRGB(35,18,55)BI.BackgroundTransparency=0.15 end
local BC=Instance.new("UICorner")BC.CornerRadius=UDim.new(0,12)BC.Parent=BI
local OV=Instance.new("Frame")OV.Size=UDim2.new(1,0,1,0)OV.BackgroundColor3=Color3.fromRGB(0,0,0)OV.BackgroundTransparency=0.4 OV.BorderSizePixel=0 OV.ZIndex=1 OV.Parent=M
local OC=Instance.new("UICorner")OC.CornerRadius=UDim.new(0,12)OC.Parent=OV
local ST=Instance.new("UIStroke")ST.Color=Color3.fromRGB(120,60,220)ST.Thickness=1.5 ST.Transparency=0.3 ST.Parent=M
--[[ DRAGON HUB v11 - PARTE 2/4 ]]
local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,40)TB.BackgroundColor3=Color3.fromRGB(10,10,15)TB.BackgroundTransparency=0.3 TB.BorderSizePixel=0 TB.ZIndex=2 TB.Parent=M
local TC=Instance.new("UICorner")TC.CornerRadius=UDim.new(0,12)TC.Parent=TB
local Tl=Instance.new("TextLabel")Tl.Size=UDim2.new(0,300,1,0)Tl.Position=UDim2.new(0,15,0,0)Tl.BackgroundTransparency=1 Tl.Text="🐉 DRAGON HUB"Tl.Font=Enum.Font.GothamBold Tl.TextSize=16 Tl.TextColor3=Color3.fromRGB(180,130,255)Tl.TextXAlignment=Enum.TextXAlignment.Left Tl.ZIndex=3 Tl.Parent=TB
local MnB=Instance.new("TextButton")MnB.Size=UDim2.new(0,34,0,34)MnB.Position=UDim2.new(1,-80,0,3)MnB.BackgroundColor3=Color3.fromRGB(40,40,50)MnB.Text="—"MnB.Font=Enum.Font.GothamBold MnB.TextSize=18 MnB.TextColor3=Color3.fromRGB(255,200,100)MnB.BorderSizePixel=0 MnB.ZIndex=3 MnB.Parent=TB
local MnC=Instance.new("UICorner")MnC.CornerRadius=UDim.new(0,6)MnC.Parent=MnB
local CB=Instance.new("TextButton")CB.Size=UDim2.new(0,34,0,34)CB.Position=UDim2.new(1,-42,0,3)CB.BackgroundColor3=Color3.fromRGB(60,20,30)CB.Text="X"CB.Font=Enum.Font.GothamBold CB.TextSize=16 CB.TextColor3=Color3.fromRGB(255,100,120)CB.BorderSizePixel=0 CB.ZIndex=3 CB.Parent=TB
local CC=Instance.new("UICorner")CC.CornerRadius=UDim.new(0,6)CC.Parent=CB
local TBB=Instance.new("Frame")TBB.Size=UDim2.new(1,0,0,32)TBB.Position=UDim2.new(0,0,0,45)TBB.BackgroundTransparency=1 TBB.ZIndex=2 TBB.Parent=M
local TL=Instance.new("UIListLayout")TL.FillDirection=Enum.FillDirection.Horizontal TL.Padding=UDim.new(0,6)TL.Parent=TBB
local TPd=Instance.new("UIPadding")TPd.PaddingLeft=UDim.new(0,10)TPd.Parent=TBB
local CT=Instance.new("Frame")CT.Size=UDim2.new(1,-16,1,-90)CT.Position=UDim2.new(0,8,0,82)CT.BackgroundColor3=Color3.fromRGB(12,12,18)CT.BackgroundTransparency=0.25 CT.BorderSizePixel=0 CT.ZIndex=2 CT.Parent=M
local CTC=Instance.new("UICorner")CTC.CornerRadius=UDim.new(0,8)CTC.Parent=CT
local curT=nil
local function cT(n,e,w)
local b=Instance.new("TextButton")b.Size=UDim2.new(0,w or 105,1,0)b.BackgroundColor3=Color3.fromRGB(25,25,35)b.Text=e.." "..n b.Font=Enum.Font.GothamMedium b.TextSize=12 b.TextColor3=Color3.fromRGB(200,200,220)b.BorderSizePixel=0 b.ZIndex=3 b.Parent=TBB
local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
local pg=Instance.new("ScrollingFrame")pg.Size=UDim2.new(1,-8,1,-8)pg.Position=UDim2.new(0,4,0,4)pg.BackgroundTransparency=1 pg.BorderSizePixel=0 pg.ScrollBarThickness=4 pg.ScrollBarImageColor3=Color3.fromRGB(150,100,230)pg.CanvasSize=UDim2.new(0,0,0,0)pg.AutomaticCanvasSize=Enum.AutomaticSize.Y pg.Visible=false pg.ZIndex=3 pg.Parent=CT
local ly=Instance.new("UIListLayout")ly.Padding=UDim.new(0,5)ly.SortOrder=Enum.SortOrder.LayoutOrder ly.Parent=pg
local pd=Instance.new("UIPadding")pd.PaddingLeft=UDim.new(0,5)pd.PaddingTop=UDim.new(0,5)pd.PaddingRight=UDim.new(0,5)pd.Parent=pg
b.MouseButton1Click:Connect(function()for _,ch in pairs(CT:GetChildren())do if ch:IsA("ScrollingFrame")then ch.Visible=false end end pg.Visible=true curT=pg end)
if not curT then pg.Visible=true curT=pg end
return pg end
local function cTg(p,t,cb)
local b=Instance.new("TextButton")b.Size=UDim2.new(1,-8,0,36)b.BackgroundColor3=Color3.fromRGB(25,25,35)b.Text="  "..t b.Font=Enum.Font.GothamMedium b.TextSize=13 b.TextColor3=Color3.fromRGB(220,220,240)b.TextXAlignment=Enum.TextXAlignment.Left b.BorderSizePixel=0 b.AutoButtonColor=false b.Parent=p
local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,6)c.Parent=b
local id=Instance.new("Frame")id.Size=UDim2.new(0,40,0,20)id.Position=UDim2.new(1,-50,0.5,-10)id.BackgroundColor3=Color3.fromRGB(50,50,60)id.BorderSizePixel=0 id.Parent=b
local ic=Instance.new("UICorner")ic.CornerRadius=UDim.new(1,0)ic.Parent=id
local dt=Instance.new("Frame")dt.Size=UDim2.new(0,16,0,16)dt.Position=UDim2.new(0,2,0.5,-8)dt.BackgroundColor3=Color3.fromRGB(200,200,200)dt.BorderSizePixel=0 dt.Parent=id
local dc=Instance.new("UICorner")dc.CornerRadius=UDim.new(1,0)dc.Parent=dt
local s=false
b.MouseButton1Click:Connect(function()s=not s if s then T:Create(id,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(120,60,220)}):Play()T:Create(dt,TweenInfo.new(0.2),{Position=UDim2.new(1,-18,0.5,-8)}):Play()else T:Create(id,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(50,50,60)}):Play()T:Create(dt,TweenInfo.new(0.2),{Position=UDim2.new(0,2,0.5,-8)}):Play()end cb(s)end)
return b end
local function cL(p,t)
local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-8,0,22)l.BackgroundTransparency=1 l.Text="  "..t l.Font=Enum.Font.Gotham l.TextSize=12 l.TextColor3=Color3.fromRGB(160,160,180)l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=p
return l end
local function cS(p,t)
local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-8,0,26)l.BackgroundTransparency=1 l.Text="▸ "..t l.Font=Enum.Font.GothamBold l.TextSize=13 l.TextColor3=Color3.fromRGB(180,130,255)l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=p
return l end
local NP=Instance.new("Frame")NP.Name="NoclipPad"NP.Size=UDim2.new(0,200,0,200)NP.Position=UDim2.new(0,20,0.5,-100)NP.BackgroundColor3=Color3.fromRGB(15,15,25)NP.BackgroundTransparency=0.25 NP.BorderSizePixel=0 NP.Visible=false NP.Active=true NP.Draggable=true NP.ZIndex=50 NP.Parent=SG
local NPC=Instance.new("UICorner")NPC.CornerRadius=UDim.new(0,14)NPC.Parent=NP
local NPS=Instance.new("UIStroke")NPS.Color=Color3.fromRGB(150,80,255)NPS.Thickness=1.5 NPS.Transparency=0.3 NPS.Parent=NP
local NT=Instance.new("TextLabel")NT.Size=UDim2.new(1,0,0,22)NT.Position=UDim2.new(0,0,0,4)NT.BackgroundTransparency=1 NT.Text="🐉 NOCLIP"NT.Font=Enum.Font.GothamBold NT.TextSize=12 NT.TextColor3=Color3.fromRGB(200,150,255)NT.ZIndex=51 NT.Parent=NP
local function cPb(t,x,y,sx,sy,op,orl)
local b=Instance.new("TextButton")b.Size=UDim2.new(0,sx,0,sy)b.Position=UDim2.new(0,x,0,y)b.BackgroundColor3=Color3.fromRGB(35,25,55)b.Text=t b.Font=Enum.Font.GothamBold b.TextSize=22 b.TextColor3=Color3.fromRGB(220,200,255)b.BorderSizePixel=0 b.AutoButtonColor=false b.ZIndex=52 b.Parent=NP
local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,8)c.Parent=b
local s=Instance.new("UIStroke")s.Color=Color3.fromRGB(120,70,200)s.Thickness=1 s.Transparency=0.4 s.Parent=b
b.MouseButton1Down:Connect(function()b.BackgroundColor3=Color3.fromRGB(120,60,220)if op then op()end end)
b.MouseButton1Up:Connect(function()b.BackgroundColor3=Color3.fromRGB(35,25,55)if orl then orl()end end)
b.MouseLeave:Connect(function()b.BackgroundColor3=Color3.fromRGB(35,25,55)if orl then orl()end end)
return b end
cPb("▲",70,30,60,60,function()NZ=-1 end,function()NZ=0 end)
cPb("▼",70,130,60,60,function()NZ=1 end,function()NZ=0 end)
cPb("◀",10,80,60,60,function()NX=-1 end,function()NX=0 end)
cPb("▶",130,80,60,60,function()NX=1 end,function()NX=0 end)
local CD=Instance.new("Frame")CD.Size=UDim2.new(0,20,0,20)CD.Position=UDim2.new(0,90,0,100)CD.BackgroundColor3=Color3.fromRGB(80,40,150)CD.BorderSizePixel=0 CD.ZIndex=52 CD.Parent=NP
local CDC=Instance.new("UICorner")CDC.CornerRadius=UDim.new(1,0)CDC.Parent=CD
local UB=Instance.new("TextButton")UB.Size=UDim2.new(0,60,0,55)UB.Position=UDim2.new(1,-70,0,30)UB.BackgroundColor3=Color3.fromRGB(40,120,60)UB.Text="⬆️"UB.Font=Enum.Font.GothamBold UB.TextSize=22 UB.TextColor3=Color3.fromRGB(255,255,255)UB.BorderSizePixel=0 UB.AutoButtonColor=false UB.ZIndex=52 UB.Parent=NP
local UBC=Instance.new("UICorner")UBC.CornerRadius=UDim.new(0,8)UBC.Parent=UB
UB.MouseButton1Down:Connect(function()UB.BackgroundColor3=Color3.fromRGB(60,180,90)NY=1 end)
UB.MouseButton1Up:Connect(function()UB.BackgroundColor3=Color3.fromRGB(40,120,60)NY=0 end)
UB.MouseLeave:Connect(function()UB.BackgroundColor3=Color3.fromRGB(40,120,60)NY=0 end)
local DB=Instance.new("TextButton")DB.Size=UDim2.new(0,60,0,55)DB.Position=UDim2.new(1,-70,0,100)DB.BackgroundColor3=Color3.fromRGB(120,40,40)DB.Text="⬇️"DB.Font=Enum.Font.GothamBold DB.TextSize=22 DB.TextColor3=Color3.fromRGB(255,255,255)DB.BorderSizePixel=0 DB.AutoButtonColor=false DB.ZIndex=52 DB.Parent=NP
local DBC=Instance.new("UICorner")DBC.CornerRadius=UDim.new(0,8)DBC.Parent=DB
DB.MouseButton1Down:Connect(function()DB.BackgroundColor3=Color3.fromRGB(180,60,60)NY=-1 end)
DB.MouseButton1Up:Connect(function()DB.BackgroundColor3=Color3.fromRGB(120,40,40)NY=0 end)
DB.MouseLeave:Connect(function()DB.BackgroundColor3=Color3.fromRGB(120,40,40)NY=0 end)
local CNB=Instance.new("TextButton")CNB.Size=UDim2.new(0,22,0,22)CNB.Position=UDim2.new(1,-26,0,4)CNB.BackgroundColor3=Color3.fromRGB(60,20,30)CNB.Text="×"CNB.Font=Enum.Font.GothamBold CNB.TextSize=14 CNB.TextColor3=Color3.fromRGB(255,150,150)CNB.BorderSizePixel=0 CNB.ZIndex=52 CNB.Parent=NP
local CNC=Instance.new("UICorner")CNC.CornerRadius=UDim.new(0,5)CNC.Parent=CNB
CNB.MouseButton1Click:Connect(function()NP.Visible=false end)
local function sN()NR=false NP.Visible=false NX,NY,NZ=0,0,0 for _,c in pairs(NC)do pcall(function()c:Disconnect()end)end NC={} local ch=LP.Character if ch then local h=ch:FindFirstChildOfClass("Humanoid")if h then pcall(function()h:ChangeState(Enum.HumanoidStateType.Running)h.PlatformStand=false end)end for _,pt in pairs(ch:GetDescendants())do if pt:IsA("BasePart")then pcall(function()pt.CanCollide=true end)end end end end
local function stN()sN()NR=true NX,NY,NZ=0,0,0 NP.Visible=true table.insert(NC,R.Heartbeat:Connect(function(dt)if not NR then return end local ch=LP.Character if not ch then return end local hr=ch:FindFirstChild("HumanoidRootPart")local h=ch:FindFirstChildOfClass("Humanoid")if not hr or not h then return end h.PlatformStand=true hr.CanCollide=false local cc=Cam.CFrame local fw=cc.LookVector local rt=cc.RightVector fw=Vector3.new(fw.X,0,fw.Z)rt=Vector3.new(rt.X,0,rt.Z)if fw.Magnitude>0 then fw=fw.Unit end if rt.Magnitude>0 then rt=rt.Unit end local mv=(fw*-NZ)+(rt*NX)if mv.Magnitude>0 then mv=mv.Unit end local st=Cf.NoclipSpeed*dt local of=mv*st+Vector3.new(0,NY*st,0)hr.CFrame=hr.CFrame+of hr.AssemblyLinearVelocity=Vector3.new(0,0,0)pcall(function()h:ChangeState(Enum.HumanoidStateType.Running)end)end))table.insert(NC,R.Stepped:Connect(function()if not NR then return end local ch=LP.Character if not ch then return end local hr=ch:FindFirstChild("HumanoidRootPart")if not hr then return end if hr.Position.Y<-50 then local sp=W:FindFirstChildOfClass("SpawnLocation")if sp then hr.CFrame=CFrame.new(sp.Position+Vector3.new(0,8,0))else hr.CFrame=CFrame.new(0,50,0)end end end))end
--[[ DRAGON HUB v11 - PARTE 3/4 ]]
local MT=cT("Principal","🧿")cS(MT,"AIMBOTS")
local gL=cL(MT,"Guards: 0")local iL=cL(MT,"Inmates: 0")local crL=cL(MT,"Criminals: 0")
cTg(MT,"Aimbot Guards",function(v)Cf.AimbotGuards=v end)
cTg(MT,"Aimbot Inmates",function(v)Cf.AimbotInmates=v end)
cTg(MT,"Aimbot Criminals",function(v)Cf.AimbotCriminals=v end)
cTg(MT,"AimLock All",function(v)Cf.AimLockAll=v end)
cS(MT,"MOVIMENTAÇÃO")
cTg(MT,"Noclip (Prison Life)",function(v)Cf.Noclip=v if v then stN()else sN()end end)
cL(MT,"📱 Painel de controles na tela")
local RP=Instance.new("TextButton")RP.Size=UDim2.new(1,-8,0,30)RP.BackgroundColor3=Color3.fromRGB(60,30,100)RP.Text="🎮 Mostrar Painel Noclip"RP.Font=Enum.Font.GothamBold RP.TextSize=12 RP.TextColor3=Color3.fromRGB(230,210,255)RP.BorderSizePixel=0 RP.Parent=MT
local RPC=Instance.new("UICorner")RPC.CornerRadius=UDim.new(0,6)RPC.Parent=RP
RP.MouseButton1Click:Connect(function()if NR then NP.Visible=true end end)
cTg(MT,"Follow Character",function(v)Cf.FollowCharacter=v if not v then FT=nil end end)
cTg(MT,"Auto-Jump",function(v)Cf.AutoJump=v end)
LP.CharacterAdded:Connect(function()task.wait(1.5)if Cf.Noclip then stN()end end)
local TT=cT("Tools","⚒️")cS(TT,"BRUTAL KNIFE")
local SB=Instance.new("TextButton")SB.Size=UDim2.new(1,-8,0,36)SB.BackgroundColor3=Color3.fromRGB(80,40,130)SB.Text="🔍 Procurar Brutal Knife"SB.Font=Enum.Font.GothamBold SB.TextSize=13 SB.TextColor3=Color3.fromRGB(240,220,255)SB.BorderSizePixel=0 SB.Parent=TT
local SBC=Instance.new("UICorner")SBC.CornerRadius=UDim.new(0,6)SBC.Parent=SB
local SL=cL(TT,"Status: clique em Procurar")
local TL2=Instance.new("Frame")TL2.Size=UDim2.new(1,-8,0,300)TL2.BackgroundTransparency=1 TL2.Parent=TT
local TLL=Instance.new("UIListLayout")TLL.Padding=UDim.new(0,5)TLL.Parent=TL2
local ET=cT("ESP","🧿")cS(ET,"VISUALIZAÇÃO")
cTg(ET,"ESP Line",function(v)Cf.ESPLine=v end)
cTg(ET,"ESP Box",function(v)Cf.ESPBox=v end)
cTg(ET,"ESP Esqueleto",function(v)Cf.ESPBone=v end)
cTg(ET,"ESP Life",function(v)Cf.ESPLife=v end)
cS(ET,"TIME DO ESP")
local TO={"All","Guards","Inmates","Criminals"}
local TF=Instance.new("Frame")TF.Size=UDim2.new(1,-8,0,32)TF.BackgroundTransparency=1 TF.Parent=ET
local TFL=Instance.new("UIListLayout")TFL.FillDirection=Enum.FillDirection.Horizontal TFL.Padding=UDim.new(0,4)TFL.Parent=TF
for _,tn in ipairs(TO)do local b=Instance.new("TextButton")b.Size=UDim2.new(0,75,1,0)b.BackgroundColor3=(tn=="All")and Color3.fromRGB(120,60,220)or Color3.fromRGB(25,25,35)b.Text=tn b.Font=Enum.Font.GothamMedium b.TextSize=11 b.TextColor3=Color3.fromRGB(230,230,250)b.BorderSizePixel=0 b.Parent=TF local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,6)bc.Parent=b b.MouseButton1Click:Connect(function()for _,o in pairs(TF:GetChildren())do if o:IsA("TextButton")then o.BackgroundColor3=Color3.fromRGB(25,25,35)end end b.BackgroundColor3=Color3.fromRGB(120,60,220)Cf.ESPTeam=tn end)end
--[[ DRAGON HUB v11 - PARTE 4/4 ]]
local CRT=cT("créditos","ℹ️",110)
local CCd=Instance.new("Frame")CCd.Size=UDim2.new(1,-8,0,240)CCd.BackgroundColor3=Color3.fromRGB(25,15,40)CCd.BackgroundTransparency=0.15 CCd.BorderSizePixel=0 CCd.Parent=CRT
local CCdC=Instance.new("UICorner")CCdC.CornerRadius=UDim.new(0,12)CCdC.Parent=CCd
local CCdS=Instance.new("UIStroke")CCdS.Color=Color3.fromRGB(180,100,255)CCdS.Thickness=1.5 CCdS.Transparency=0.2 CCdS.Parent=CCd
local WL=Instance.new("TextLabel")WL.Size=UDim2.new(1,-20,0,40)WL.Position=UDim2.new(0,10,0,12)WL.BackgroundTransparency=1 WL.Text="Olá, seja bem vindo ao Dragon Hub."WL.Font=Enum.Font.GothamBold WL.TextSize=15 WL.TextColor3=Color3.fromRGB(220,180,255)WL.TextWrapped=true WL.TextXAlignment=Enum.TextXAlignment.Center WL.Parent=CCd
local D1=Instance.new("Frame")D1.Size=UDim2.new(1,-40,0,1)D1.Position=UDim2.new(0,20,0,58)D1.BackgroundColor3=Color3.fromRGB(120,60,200)D1.BackgroundTransparency=0.4 D1.BorderSizePixel=0 D1.Parent=CCd
local function cIL(p,i,lt,vt,y,vc)
local lf=Instance.new("Frame")lf.Size=UDim2.new(1,-20,0,32)lf.Position=UDim2.new(0,10,0,y)lf.BackgroundTransparency=1 lf.Parent=p
local il=Instance.new("TextLabel")il.Size=UDim2.new(0,30,1,0)il.Position=UDim2.new(0,0,0,0)il.BackgroundTransparency=1 il.Text=i il.Font=Enum.Font.GothamBold il.TextSize=16 il.TextColor3=Color3.fromRGB(180,130,255)il.Parent=lf
local ll=Instance.new("TextLabel")ll.Size=UDim2.new(0,100,1,0)ll.Position=UDim2.new(0,35,0,0)ll.BackgroundTransparency=1 ll.Text=lt ll.Font=Enum.Font.GothamMedium ll.TextSize=12 ll.TextColor3=Color3.fromRGB(170,170,190)ll.TextXAlignment=Enum.TextXAlignment.Left ll.Parent=lf
local vl=Instance.new("TextLabel")vl.Size=UDim2.new(1,-145,1,0)vl.Position=UDim2.new(0,140,0,0)vl.BackgroundTransparency=1 vl.Text=vt vl.Font=Enum.Font.GothamBold vl.TextSize=13 vl.TextColor3=vc or Color3.fromRGB(230,210,255)vl.TextXAlignment=Enum.TextXAlignment.Right vl.Parent=lf
return lf end
cIL(CCd,"👤","Criador:","@Fazgalua",72,Color3.fromRGB(255,200,100))
cIL(CCd,"🤝","Parceria:","Nenhuma",108,Color3.fromRGB(180,180,200))
cIL(CCd,"📅","Criação:","07/10/26",144,Color3.fromRGB(150,200,255))
local VF=Instance.new("Frame")VF.Size=UDim2.new(1,-20,0,42)VF.Position=UDim2.new(0,10,0,185)VF.BackgroundColor3=Color3.fromRGB(30,60,30)VF.BackgroundTransparency=0.3 VF.BorderSizePixel=0 VF.Parent=CCd
local VFC=Instance.new("UICorner")VFC.CornerRadius=UDim.new(0,8)VFC.Parent=VF
local VFS=Instance.new("UIStroke")VFS.Color=Color3.fromRGB(100,255,120)VFS.Thickness=1 VFS.Transparency=0.4 VFS.Parent=VF
local VI=Instance.new("TextLabel")VI.Size=UDim2.new(0,30,1,0)VI.Position=UDim2.new(0,8,0,0)VI.BackgroundTransparency=1 VI.Text="💎"VI.Font=Enum.Font.GothamBold VI.TextSize=16 VI.Parent=VF
local VL=Instance.new("TextLabel")VL.Size=UDim2.new(0,110,1,0)VL.Position=UDim2.new(0,42,0,0)VL.BackgroundTransparency=1 VL.Text="Validade do Hub:"VL.Font=Enum.Font.GothamMedium VL.TextSize=12 VL.TextColor3=Color3.fromRGB(190,220,190)VL.TextXAlignment=Enum.TextXAlignment.Left VL.Parent=VF
local VV=Instance.new("TextLabel")VV.Size=UDim2.new(1,-160,1,0)VV.Position=UDim2.new(0,155,0,0)VV.BackgroundTransparency=1 VV.Text="Grátis 🆓"VV.Font=Enum.Font.GothamBold VV.TextSize=14 VV.TextColor3=Color3.fromRGB(100,255,120)VV.TextXAlignment=Enum.TextXAlignment.Right VV.Parent=VF
local FL=Instance.new("TextLabel")FL.Size=UDim2.new(1,-8,0,30)FL.BackgroundTransparency=1 FL.Text="🐉 Dragon Hub © 2026 — Feito com ❤️"FL.Font=Enum.Font.GothamMedium FL.TextSize=11 FL.TextColor3=Color3.fromRGB(140,120,170)FL.TextXAlignment=Enum.TextXAlignment.Center FL.Parent=CRT
MnB.MouseButton1Click:Connect(function()local i=M.Size.Y.Offset<60 if i then T:Create(M,TweenInfo.new(0.3),{Size=UDim2.new(0,500,0,340)}):Play()task.wait(0.15)CT.Visible=true TBB.Visible=true else T:Create(M,TweenInfo.new(0.3),{Size=UDim2.new(0,500,0,40)}):Play()CT.Visible=false TBB.Visible=false end end)
CB.MouseButton1Click:Connect(function()sN()if ak then ak:Disconnect()end SG:Destroy()end)
R.RenderStepped:Connect(function()if Cf.AimbotGuards then local t=gCP(function(p)return p.Team and p.Team.Name=="Guards"end)if t then aT(t)end end if Cf.AimbotInmates then local t=gCP(function(p)return p.Team and p.Team.Name=="Inmates"end)if t then aT(t)end end if Cf.AimbotCriminals then local t=gCP(function(p)return p.Team and p.Team.Name=="Criminals"end)if t then aT(t)end end if Cf.AimLockAll then local t=gCP(nil)if t then aT(t)end end end)
R.Heartbeat:Connect(function()if not Cf.FollowCharacter then FT=nil return end local tg=gCP(nil)FT=tg if not tg or not tg.Character then return end local mc=LP.Character if not mc then return end local mh=mc:FindFirstChild("HumanoidRootPart")local th=tg.Character:FindFirstChild("HumanoidRootPart")if not mh or not th then return end local la=CFrame.new(mh.Position,Vector3.new(th.Position.X,mh.Position.Y,th.Position.Z))mh.CFrame=CFrame.new(mh.Position)*(la-la.Position)end)
R.Heartbeat:Connect(function()if not Cf.AutoJump then return end local ch=LP.Character if not ch then return end local h=ch:FindFirstChildOfClass("Humanoid")if not h then return end local s=h:GetState()if s==Enum.HumanoidStateType.Running or s==Enum.HumanoidStateType.RunningNoPhysics then h.Jump=true pcall(function()h:ChangeState(Enum.HumanoidStateType.Jumping)end)end end)
task.spawn(function()while SG.Parent do gL.Text="  Guards: "..#gTP("Guards")iL.Text="  Inmates: "..#gTP("Inmates")crL.Text="  Criminals: "..#gTP("Criminals")task.wait(1)end end)
local function iBK(t)if not t:IsA("Tool")then return false end local n=string.lower(t.Name)return string.find(n,"brutal")~=nil or string.find(n,"knife")~=nil end
local function fBK()local f={}local s={}local cs={W,RS}for _,r in ipairs(cs)do for _,o in pairs(r:GetDescendants())do if o:IsA("Tool")and iBK(o)and not s[o]then s[o]=true table.insert(f,o)end end end for _,p in pairs(P:GetPlayers())do local b=p:FindFirstChildOfClass("Backpack")if b then for _,t in pairs(b:GetChildren())do if t:IsA("Tool")and iBK(t)and not s[t]then s[t]=true table.insert(f,t)end end end if p.Character then for _,t in pairs(p.Character:GetChildren())do if t:IsA("Tool")and iBK(t)and not s[t]then s[t]=true table.insert(f,t)end end end end return f end
local function gT(t)local ch=LP.Character if not ch then return false,"Sem character"end local h=ch:FindFirstChildOfClass("Humanoid")local b=LP:FindFirstChildOfClass("Backpack")if not b then return false,"Sem backpack"end if t.Parent==ch or t.Parent==b then return true,"Já é sua"end local o1=pcall(function()if h then h:EquipTool(t)end end)if o1 and(t.Parent==ch or t.Parent==b)then return true,"EquipTool funcionou"end local o2=pcall(function()t.Parent=b end)if o2 and t.Parent==b then return true,"Parent Backpack funcionou"end local o3=pcall(function()t.Parent=ch end)if o3 and t.Parent==ch then return true,"Parent Character funcionou"end local o4=pcall(function()local c=t:Clone()c.Parent=b end)if o4 then return true,"Clonei a tool"end return false,"Servidor bloqueou"end
local function cKE(t)local f=Instance.new("Frame")f.Size=UDim2.new(1,-5,0,56)f.BackgroundColor3=Color3.fromRGB(30,20,40)f.BorderSizePixel=0 f.Parent=TL2 local fc=Instance.new("UICorner")fc.CornerRadius=UDim.new(0,8)fc.Parent=f local sr=Instance.new("UIStroke")sr.Color=Color3.fromRGB(255,100,150)sr.Thickness=1 sr.Transparency=0.3 sr.Parent=f local ic=Instance.new("TextLabel")ic.Size=UDim2.new(0,34,1,0)ic.Position=UDim2.new(0,6,0,0)ic.BackgroundTransparency=1 ic.Text="🗡️"ic.Font=Enum.Font.GothamBold ic.TextSize=22 ic.Parent=f local n=Instance.new("TextLabel")n.Size=UDim2.new(0.55,0,0.5,0)n.Position=UDim2.new(0,42,0,4)n.BackgroundTransparency=1 n.Text=t.Name n.Font=Enum.Font.GothamBold n.TextSize=12 n.TextColor3=Color3.fromRGB(255,200,220)n.TextXAlignment=Enum.TextXAlignment.Left n.Parent=f local lc=Instance.new("TextLabel")lc.Size=UDim2.new(0.55,0,0.5,0)lc.Position=UDim2.new(0,42,0,24)lc.BackgroundTransparency=1 lc.Font=Enum.Font.Gotham lc.TextSize=10 lc.TextColor3=Color3.fromRGB(180,180,200)lc.TextXAlignment=Enum.TextXAlignment.Left lc.Parent=f local function gL2()local p=t.Parent if not p then return"Destruída"elseif p==W then return"🟢 Chão"elseif p:IsA("Backpack")then return"🟡 Mochila: "..p.Parent.Name elseif p:IsA("Model")and p:FindFirstChildOfClass("Humanoid")then local pl=P:GetPlayerFromCharacter(p)return"🔴 Equipada: "..(pl and pl.Name or p.Name)else return"🟡 "..p.Name end end lc.Text=gL2()local gb=Instance.new("TextButton")gb.Size=UDim2.new(0,95,0,40)gb.Position=UDim2.new(1,-100,0.5,-20)gb.BackgroundColor3=Color3.fromRGB(100,40,150)gb.Text="🦴 PEGAR"gb.Font=Enum.Font.GothamBold gb.TextSize=12 gb.TextColor3=Color3.fromRGB(255,255,255)gb.BorderSizePixel=0 gb.Parent=f local gbc=Instance.new("UICorner")gbc.CornerRadius=UDim.new(0,8)gbc.Parent=gb gb.MouseButton1Click:Connect(function()SL.Text="  ⏳ Tentando..."local ok,msg=gT(t)if ok then SL.Text="  ✅ "..msg gb.Text="✅ OK"gb.BackgroundColor3=Color3.fromRGB(40,120,50)else SL.Text="  ❌ "..msg gb.Text="❌ FAIL"gb.BackgroundColor3=Color3.fromRGB(120,30,30)task.wait(1.5)gb.Text="🦴 PEGAR"gb.BackgroundColor3=Color3.fromRGB(100,40,150)end end)task.spawn(function()while f.Parent do if not t.Parent then f:Destroy()break end lc.Text=gL2()task.wait(1)end end)return f end
local function dS()for _,c in pairs(TL2:GetChildren())do if c:IsA("Frame")then c:Destroy()end end local fn=fBK()SL.Text="  Facas: "..#fn if #fn==0 then local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-8,0,40)l.BackgroundTransparency=1 l.Text="  ❌ Nenhuma faca"l.Font=Enum.Font.Gotham l.TextSize=12 l.TextColor3=Color3.fromRGB(200,150,150)l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=TL2 else for _,t in ipairs(fn)do cKE(t)end end end
SB.MouseButton1Click:Connect(dS)
task.spawn(function()while SG.Parent do task.wait(2)pcall(dS)task.wait(6)end end)
local function cE(p)if EO[p]then return end local o={}o.Line=Drawing.new("Line")o.Line.Visible=false o.Line.Thickness=1.5 o.Line.Color=Color3.fromRGB(180,130,255)o.Line.Transparency=1 o.Box=Drawing.new("Square")o.Box.Visible=false o.Box.Thickness=1.5 o.Box.Color=Color3.fromRGB(180,130,255)o.Box.Filled=false o.Box.Transparency=1 o.Life=Drawing.new("Text")o.Life.Visible=false o.Life.Size=14 o.Life.Center=true o.Life.Outline=true o.Life.Color=Color3.fromRGB(100,255,100)o.Bones={}for i=1,17 do o.Bones[i]=Drawing.new("Line")o.Bones[i].Visible=false o.Bones[i].Thickness=1.5 o.Bones[i].Color=Color3.fromRGB(255,255,255)o.Bones[i].Transparency=1 end EO[p]=o end
local function rE(p)if EO[p]then local o=EO[p]pcall(function()o.Line:Remove()end)pcall(function()o.Box:Remove()end)pcall(function()o.Life:Remove()end)for _,b in pairs(o.Bones)do pcall(function()b:Remove()end)end EO[p]=nil end end
local function tM(p)if Cf.ESPTeam=="All"then return true end return p.Team and p.Team.Name==Cf.ESPTeam end
local function wTS(ps)local sp,on=Cam:WorldToViewportPoint(ps)return Vector2.new(sp.X,sp.Y),on end
R.RenderStepped:Connect(function()for _,p in pairs(P:GetPlayers())do if p==LP then continue end if not tM(p)then if EO[p]then local o=EO[p]o.Line.Visible=false o.Box.Visible=false o.Life.Visible=false for _,b in pairs(o.Bones)do b.Visible=false end end continue end if not EO[p]then cE(p)end local o=EO[p]if not o then continue end local ch=p.Character if not ch then o.Line.Visible=false o.Box.Visible=false o.Life.Visible=false for _,b in pairs(o.Bones)do b.Visible=false end continue end local hr=ch:FindFirstChild("HumanoidRootPart")local h=ch:FindFirstChildOfClass("Humanoid")local hd=ch:FindFirstChild("Head")if not hr or not h then continue end if Cf.ESPLine then local ps,on=wTS(hr.Position)if on then o.Line.From=Vector2.new(Cam.ViewportSize.X/2,Cam.ViewportSize.Y)o.Line.To=ps o.Line.Visible=true else o.Line.Visible=false end else o.Line.Visible=false end if Cf.ESPBox then local tp,onT=wTS(hr.Position+Vector3.new(0,3,0))local bp,onB=wTS(hr.Position-Vector3.new(0,3,0))if onT and onB then local hh=bp.Y-tp.Y local ww=hh*0.6 o.Box.Size=Vector2.new(ww,hh)o.Box.Position=Vector2.new(tp.X-ww/2,tp.Y)o.Box.Visible=true else o.Box.Visible=false end else o.Box.Visible=false end if Cf.ESPLife and hd then local hp,on=wTS(hd.Position+Vector3.new(0,1,0))if on then o.Life.Text="❤️ "..math.floor(h.Health).."/"..math.floor(h.MaxHealth)o.Life.Position=hp o.Life.Visible=true else o.Life.Visible=false end else o.Life.Visible=false end if Cf.ESPBone then local pt={hd,ch:FindFirstChild("Torso")or ch:FindFirstChild("UpperTorso"),ch:FindFirstChild("Left Arm")or ch:FindFirstChild("LeftUpperArm"),ch:FindFirstChild("Right Arm")or ch:FindFirstChild("RightUpperArm"),ch:FindFirstChild("Left Leg")or ch:FindFirstChild("LeftUpperLeg"),ch:FindFirstChild("Right Leg")or ch:FindFirstChild("RightUpperLeg")}local cn={{1,2},{2,3},{2,4},{2,5},{2,6}}for i,b in pairs(o.Bones)do b.Visible=false end for ix,c in ipairs(cn)do local p1,p2=pt[c[1]],pt[c[2]]if p1 and p2 and o.Bones[ix]then local s1,o1=wTS(p1.Position)local s2,o2=wTS(p2.Position)if o1 and o2 then o.Bones[ix].From=s1 o.Bones[ix].To=s2 o.Bones[ix].Visible=true end end end else for _,b in pairs(o.Bones)do b.Visible=false end end end end)
P.PlayerRemoving:Connect(rE)
pcall(function()S:SetCore("SendNotification",{Title="🐉 Dragon Hub v11",Text="Carregado!",Duration=3})end)
print("[🐉 Dragon Hub v11] Carregado!")
