
FruitIdleState = Class{__includes = BaseState}

function FruitIdleState:init(gameobject)
  
    self.gameobject = gameobject
    self.gameobject:changeAnimation('pulse')

    print("pulse")
  
end

function FruitIdleState:update(dt)
  
   self.gameobject.currentAnimation:update(dt)
  
print("update function")

end


function FruitIdleState:render()
   
    local anim = self.gameobject.currentAnimation
    

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.gameobject.x), math.floor(self.gameobject.y))

end
