yes=0
include('shared.lua')
require('Neuron')
sw11 = true
sw12 = true
--[[---------------------------------------------------------
   Name: Draw yes
   Purpose: Draw the model in-game.
   Remember, the things you render first will be underneath!
---------------------------------------------------------]]
function ENT:Draw()
    -- self.BaseClass.Draw(self)  -- We want to override rendering, so don't call baseclass.
                                  -- Use this when you need to add to the rendering.
     -- Draw an outline of 1 world unit.
    self:DrawModel()       -- Draw the model.

    AddWorldTip( self:EntIndex(), "Robot", 0.5, self:GetPos(), self  ) -- Add an example tip.
end
function ENT:Use()
yes=1
print("\n")
print("---------------")
print("Frente "..r11.."      |\n")
print("Derecha "..r12.."     |\n")
print("Izquierda "..r13.."   |\n")
print("---------------")
end
function ENT:Think()
    r11 = 0
    r12 = 0
    r13 = 0

    for k, v in pairs(ents.FindByClass("prop_physics")) do q = v end
    print("Frente")
    r1 =ents.FindAlongRay(self:GetPos(), self:GetPos() + Vector(250,0,0))
    --PrintTable(r1)
    if(table.HasValue(r1, q)) then r11 = 1 end --Frente
    print("Derecha")
    r2 =ents.FindAlongRay(self:GetPos(), self:GetPos() + Vector(250,-200,0))
    --PrintTable(r2)
    if(table.HasValue(r2, q)) then r12 = 1 end --Derecha
    if(next(r2) == ents.FindByClass("prop_physics")) then print("true") end
    print("Izquierda")
    r3 =ents.FindAlongRay(self:GetPos(), self:GetPos() + Vector(250,200,0))
    --PrintTable(r3)
    if(table.HasValue(r3, q)) then r13 = 1 end --Izquierda
--Trainer
sw11 = true
Izq=r13
Der=r12
while(sw11 == true) do

local FirstVal1 = math.random() + math.random(-1,1)

local FirstVal2 = math.random() + math.random(-1,1)

local FirstVal3 = math.random() + math.random(-1,1)



if(math.Function(neuron2(1.0,0.0,FirstVal1,FirstVal2,FirstVal3))==0 and

math.Function(neuron2(0.0,1.0,FirstVal1,FirstVal2,FirstVal3))==0 and

math.Function(neuron2(0.0,0.0,FirstVal1,FirstVal2,FirstVal3))==0 and

math.Function(neuron2(1.0,1.0,FirstVal1,FirstVal2,FirstVal3))==1) then

LastWeight1 = FirstVal1

LastWeight2 = FirstVal2

LastThreshold1 = FirstVal3

sw11 = false

end
end
while(sw12 == true) do


    local FirstVal1 = math.random() + math.random(-1,1)

    local FirstVal2 = math.random() + math.random(-1,1)

    local FirstVal3 = math.random() + math.random(-1,1)



    if(math.Function(neuron2(1.0,0.0,FirstVal1,FirstVal2,FirstVal3))==0 and

    math.Function(neuron2(0.0,1.0,FirstVal1,FirstVal2,FirstVal3))==0 and

    math.Function(neuron2(0.0,0.0,FirstVal1,FirstVal2,FirstVal3))==1 and

    math.Function(neuron2(1.0,1.0,FirstVal1,FirstVal2,FirstVal3))==0) then

    LastWeight3 = FirstVal1

    LastWeight4 = FirstVal2

    LastThreshold2 = FirstVal3

    sw12 = false

end
end
if(yes==0)then
    if(math.Function(neuron2(Izq,Der,LastWeight1,LastWeight2,LastThreshold2))==1) then
        self:SetPos(self:GetPos()+Vector(0,10,0))
    end
    if(math.Function(neuron2(Izq,Der,LastWeight1,LastWeight2,LastThreshold1))==1) then
        self:SetPos(self:GetPos()+Vector(0,-10,0))
    end
    if(math.Function(neuron2(math.Function(neuron2(Der,Der,LastWeight3,LastWeight4,LastThreshold2)),Izq,LastWeight1,LastWeight2,LastThreshold1))==1) then
        self:SetPos(self:GetPos()+Vector(250,0,0))
    end
    if(math.Function(neuron2(math.Function(neuron2(Izq,Izq,LastWeight3,LastWeight4,LastThreshold2)),Der,LastWeight1,LastWeight2,LastThreshold1))==1) then
        self:SetPos(self:GetPos()+Vector(-250,0,0))
    end
end
end
