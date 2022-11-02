--[[Some Code reused from:
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

EntityWalkState = Class{__includes = BaseState}

function EntityWalkState:init(entity, level, player)
    self.entity = entity
    self.entity:changeAnimation('walk-down')

    self.level = level
    self.player = player

    -- used for AI control
    self.moveDuration = 0
    self.movementTimer = 0

    -- keeps track of whether we just hit a wall
    self.bumped = false

    if (self.entity.type == 'monster') then
    self.entity.offsetY = 8
    self.entity.offsetX = 8
    end


end

function EntityWalkState:update(dt)
    
    -- assume we didn't hit a wall
    self.bumped = false

    -- boundary checking on all sides, allowing us to avoid collision detection on tiles
    if self.entity.direction == 'left' then
        self.entity.x = self.entity.x - self.entity.walkSpeed * dt
        
        if self.entity.x <=  0  then 
            self.entity.x =  0 
            self.bumped = true
        end
    elseif self.entity.direction == 'right' then
        self.entity.x = self.entity.x + self.entity.walkSpeed * dt

        if self.entity.x  >= VIRTUAL_WIDTH - TILE_SIZE   then
            self.entity.x = VIRTUAL_WIDTH - TILE_SIZE 
            self.bumped = true
        end
    elseif self.entity.direction == 'up' then
        self.entity.y = self.entity.y - self.entity.walkSpeed * dt

                if self.entity.y <=  0 then 
                    self.entity.y =  0

            self.bumped = true
        end
    elseif self.entity.direction == 'down' then
        self.entity.y = self.entity.y + self.entity.walkSpeed * dt

             local bottomEdge = VIRTUAL_HEIGHT 

        if self.entity.y + self.entity.height >= bottomEdge then
            self.entity.y = bottomEdge - self.entity.height
            self.bumped = true
        end
    end


end



function EntityWalkState:processAI(params, dt)
    local level = params.level
    local directions = {'left', 'right', 'up', 'down'}

    local tileLeft = level:pointToTile(self.entity.x, self.entity.y)
    local tileDown = level:pointToTile(self.entity.x + self.entity.width/2, self.entity.y + self.entity.height)
    local tileUp = level:pointToTile(self.entity.x + self.entity.width, self.entity.y - TILE_SIZE)

    
   -- print("x", math.floor(self.entity.x))
   -- print("y", math.floor(self.entity.y))
    
    
-- only allow walking on dirt tiles for cat


        -- hit the  bottom right corner
        if self.entity.x >= 345 and self.entity.y == 208 then
                
                    self.entity.direction = 'left'
                    self.entity:changeAnimation('walk-left')
                    print("changed directions left") 
        
        -- cat should chase the player if on left side
        elseif self.entity.x > self.player.x and self.entity.x - self.player.x < 5 * TILE_SIZE and self.player.direction == 'left' and tileLeft and tileLeft.color == 1 then
            self.entity.direction = 'left'
            self.entity:changeAnimation('walk-left')
            print('chase player')


        -- hit the bottom left corner
        elseif self.entity.x <= 4 and self.entity.y == 208 and self.entity.direction == "left" then      
        self.entity.direction = 'up'
        self.entity:changeAnimation('walk-up')
        print('bottom left corner')

    elseif self.entity.x <= 4 and self.entity.y == 208 and self.entity.direction == "down" then      
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-right')
        print('bottom left corner')

        -- hit the top left corner
        elseif self.entity.x <= 4 and self.entity.y == 0 and self.entity.direction == 'up' then      
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-right')

        elseif self.entity.x <= 4 and self.entity.y == 0 and self.entity.direction == 'left' then      
        self.entity.direction = 'down'
        self.entity:changeAnimation('walk-down')


        
        -- switch down if there's dirt path directly below and traveling right or left   
        elseif (self.entity.direction == 'left' or self.entity.direction == 'right') and self.entity.y < 208 and self.entity.y > TILE_SIZE  and tileDown and tileDown.color == 1  and self.entity.x > 0 then
            self.entity.direction = 'down'
            self.entity:changeAnimation('walk-down')
            print("changed directions down")  
       

        --hit the top right corner
        elseif self.entity.x == 368 and self.entity.y == 0 and self.entity.direction == 'up' then
                
                    self.entity.direction = 'left'
                    self.entity:changeAnimation('walk-left')
                    print("changed directions left")  

        elseif self.entity.x == 368 and self.entity.y == 0 and self.entity.direction == 'right' then
                
                    self.entity.direction = 'down'
                    self.entity:changeAnimation('walk-down')
                    print("changed directions down")  
        

        --hit the right wall
        elseif self.entity.direction == 'right' and self.entity.x == 368 and self.entity.y > 0 then
            
                self.entity.direction = 'down'
                self.entity:changeAnimation('walk-down')
                print("changed directions down") 

        
        --hit the left wall
        elseif self.entity.direction == 'left' and self.entity.x == 0 and self.entity.y > 0 then
            
            self.entity.direction = 'up'
            self.entity:changeAnimation('walk-up')
            print('hit left wall')

        --hit the top wall
        elseif self.entity.direction == 'up' and self.entity.x <= 345 and self.entity.y == 0 then
            
            if math.random(2) > 1 then 
            self.entity.direction = 'left'
            self.entity:changeAnimation('walk-left')
            print('random left')
            else 
                self.entity.direction = 'right'
                self.entity:changeAnimation('walk-right') 
                print('random right')
            end   
            print("hit top wall")

        --top row - sometimes move down or continue  
    elseif self.entity.direction == 'right' and self.entity.x > 20 and self.entity.y == 0 and tileDown and tileDown.color == 1 then
            
        if math.random(8) == 1 then 
        self.entity.direction = 'down'
        self.entity:changeAnimation('walk-down')
        print('random down from top row')
        
        end 

        --hit the bottom wall
        elseif self.entity.x >= 150 and self.entity.y == 208 and self.entity.direction == 'down' then
            
            self.entity.direction = 'left'
            self.entity:changeAnimation('walk-left')
            print('hit bottom wall')

        elseif self.entity.y == 208 and self.entity.direction == 'down' and self.entity.x < 150 then
            self.entity.direction = 'right'
            self.entity:changeAnimation('walk-right')
            print('hit bottom wall')


        elseif self.entity.direction == 'up' and tileUp and tileUp.color == 2 and tileLeft and tileLeft.color == 1 and self.entity.x > 16 then
            self.entity.direction = 'left'
            self.entity: changeAnimation('walk-left')
            print('move left if top is grass')

        elseif self.entity.direction == 'up'  and tileUp and tileUp.color == 2 and tileLeft and tileLeft.color == 2 then
            self.entity.direction = 'down'
            self.entity: changeAnimation('walk-down')
            print('backtrack if top and left is grass')


        -- if moving down and grass 
        elseif self.entity.direction == 'down' and tileDown and tileDown.color == 2 then
            self.entity.direction = 'up'
            self.entity: changeAnimation('walk-up')
            print('move up when hit grass')
        
        --[[ elseif self.entity.direction == 'down' and self.entity.y > TILE_SIZE and tileLeft and tileLeft.color == 1 then
            if math.random(5) == 1 then
            self.entity.direction = 'left'
            self.entity: changeAnimation('walk-left')
            print('move left when walking down')
            end ]]

       --[[  elseif (self.entity.direction == 'right' or self.entity.direction == 'left') and tileUp and tileUp.color == 2 and tileLeft and tileLeft.color == 1 and self.entity.x > 0 then
            self.entity.direction = 'left'
            self.entity: changeAnimation('walk-left')
            print('move left if top is grass') ]]
            
        
--[[         elseif tileLeft and tileLeft.color == 1 then
                self.entity.direction = 'left'
                self.entity:changeAnimation('walk-left')
                print("changed directions to left")  ]] 
    end
   

    if self.moveDuration == 0 or self.bumped then
        
        -- set an initial move duration and direction
        self.moveDuration = math.random(5)
        --[[ self.entity.direction = directions[math.random(#directions)]
        self.entity:changeAnimation('walk-' .. tostring(self.entity.direction)) ]]
   
    elseif self.movementTimer > self.moveDuration then
        self.movementTimer = 0
    

        -- chance to go idle
       --[[  if math.random(3) == 1 then
            self.entity:changeState('idle')
        else
            self.moveDuration = math.random(5)
            --[[ self.entity.direction = directions[math.random(#directions)]
            self.entity:changeAnimation('walk-' .. tostring(self.entity.direction)) 
        end ]]
    end

    self.movementTimer = self.movementTimer + dt

   
end

function EntityWalkState:render()
 


    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
    
    -- debug code
    --[[ love.graphics.setColor(255, 0, 255, 255)
    love.graphics.rectangle('line', self.entity.x, self.entity.y, self.entity.width, self.entity.height)
    love.graphics.setColor(255, 255, 255, 255)  ]]
end