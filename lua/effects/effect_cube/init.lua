function EFFECT:Init(data)
	self:SetModel("models/editor/cube_small.mdl")
	self.m_bVisible = true
	self.colText = Color(255,255,255,255)
end

function EFFECT:SetID(ID)
	self.m_id = ID
end
function EFFECT:GetID()
	return self.m_id
end

function EFFECT:OnRemove()
end

function EFFECT:SetOrigin(pos)
	self.m_origin = pos
	self:SetPos(pos)
end

function EFFECT:SetVisible(b)
	self.m_bVisible = b
end

function EFFECT:Think()
	self:SetPos(self.m_origin)
	return not self.m_bRemove
end

function EFFECT:Render()
	if not self.m_bVisible then
		return
	end
	
	self:DrawModel()
	
	local id = self:GetID()
	if id then
		local Angle = LocalPlayer():EyeAngles()
		local Position = self:GetPos() + Vector(0,0,30)
		Angle:RotateAroundAxis(Angle:Forward(), 90)
		Angle:RotateAroundAxis(Angle:Right(), 90)
		cam.Start3D2D(Position, Angle(0,Angle.y,90),0.5)
			draw.DrawText(id,"default",2,2,self.colText,TEXT_ALIGN_CENTER)
		cam.End3D2D()
	end
end
