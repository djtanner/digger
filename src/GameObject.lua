GameObject = Class{}

function GameObject:init(def, x, y)
    
    -- string identifying this object type
    self.type = def.type
    self.texture = def.texture
    self.interval = def.interval
    self.frame = def.frame or 1
    self.looping = def.looping

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
   -- self.onCollide = function() end
   self.onCollide = def.onCollide

   self.animations = self:createAnimations(def.animations)

end



function GameObject:update(dt)
    if self.currentAnimation then
        self.currentAnimation:update(dt)
    end

end

function GameObject:createAnimations(animations)
    local animationsReturned = {}

    for k, animationDef in pairs(animations) do
        animationsReturned[k] = Animation {
            texture = animationDef.texture,
            frames = animationDef.frames,
            interval = animationDef.interval
        }
    end

    return animationsReturned
end

function GameObject:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

function GameObject:render()
   
    local anim = self.animations

    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.x), math.floor(self.y))
end