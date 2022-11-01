PlayState = Class{__includes = BaseState}

function PlayState:init()

    self.enemies = {}
    self.level = LevelMaker.generate(1)
    self.tiles = self.level.tiles
    
    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        x = VIRTUAL_WIDTH / 2,
        y = VIRTUAL_HEIGHT / 2,
        width = ENTITY_DEFS['player'].width, 
        height = ENTITY_DEFS['player'].height,
        level = self.level,
        tiles = self.tiles,
        
        
    }

    self.player.stateMachine = StateMachine {
        ['idle'] = function() return PlayerIdleState(self.player, self.level) end,
        ['walking'] = function() return PlayerWalkState(self.player, self.level) end,
    }
    self.player:changeState('idle')

    self:spawnEnemies()

end

function PlayState:enter(params)
    self.enemies = {}
    self.level = LevelMaker.generate(params.levelNumber)
    self.tiles = self.level.tiles

    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        x = VIRTUAL_WIDTH / 2 - TILE_SIZE,
        y = VIRTUAL_HEIGHT / 2 - TILE_SIZE,
        width = ENTITY_DEFS['player'].width, 
        height = ENTITY_DEFS['player'].height,
        level = self.level,
        tiles = self.tiles,
 
    }

    self.player.stateMachine = StateMachine {
        ['idle'] = function() return PlayerIdleState(self.player, self.level) end,
        ['walking'] = function() return PlayerWalkState(self.player, self.level) end,
    }
    self.player:changeState('idle')

    self:spawnEnemies()

    self.player.score = params.score

    self.player.levelNumber = params.levelNumber

end
    

function PlayState:update(dt)
    Timer.update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('space') then
        self.level = LevelMaker.generate(self.player.levelNumber)
    end

    self.level:update(dt)
    self.player:update(dt)

    for i = #self.enemies, 1, -1 do
        local enemy = self.enemies[i]
        enemy:processAI({level = self.level}, dt)
           enemy:update(dt)

    end

    for k,monster in pairs(self.enemies) do
        if self.player:collides(monster) then
            
            print("gameover")   
                
            
        end
        
    end 

    --Go to next level when eat all the fruit
    if #self.level.objects == 0 then

        gStateMachine:change('play', {levelNumber = self.player.levelNumber + 1, score = self.player.score})
    end

    

    
    
end


function PlayState:render()
    love.graphics.setColor(175/255, 53/255, 42/255, 1)
    
    
    self.level:render()
    self.player:render()

    for k, enemy in pairs(self.enemies) do
        enemy:render(self.adjacentOffsetX, self.adjacentOffsetY) 
    end
    

       -- render score
       love.graphics.setFont(gFonts['medium'])
       love.graphics.setColor(0, 0, 0, 1)
       love.graphics.print(tostring(self.player.score), 5, 5)
       love.graphics.setColor(1, 1, 1, 1)
       love.graphics.print(tostring(self.player.score), 4, 4)

        -- render level
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print("Level", VIRTUAL_WIDTH - 60, 5)
        love.graphics.print(tostring(self.player.levelNumber), VIRTUAL_WIDTH - 10, 5)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.print("Level", VIRTUAL_WIDTH - 60, 4)
        love.graphics.print(tostring(self.player.levelNumber), VIRTUAL_WIDTH - 10, 4)

end


function PlayState:spawnEnemies()
   
        local cat
        cat =  Entity {
            animations = ENTITY_DEFS['pink-kitty'].animations,
            walkSpeed = MONSTER_WALK_SPEED,
            level = self.level,
            tiles = self.tiles,
            type = "monster",

            -- always spawn in top corners
            x = 368,
            y = 0 ,

           
            width = ENTITY_DEFS['pink-kitty'].width,
            height = ENTITY_DEFS['pink-kitty'].height,
           

        }

       cat.stateMachine = StateMachine {
            ['walk'] = function() return EntityWalkState(cat, self.level) end,
            ['idle'] = function() return EntityIdleState(cat) end
        }

        cat:changeState('idle')
    
        table.insert(self.enemies, cat)
        
        local types = {'green-slime', 'blue-slime', 'orange-slime', 'pink-slime', 'yellow-slime', 'silver-slime', 'grey-slime'}

       for i = 1, 10 do 

        local slime_type = types[math.random(#types)]
        
        local slime
        
        slime =  Entity {
            animations = ENTITY_DEFS[slime_type].animations,
            walkSpeed = SLIME_WALK_SPEED,
            level = self.level,
            tiles = self.tiles,
            type = 'monster',
            
            -- always spawn in top corners
            x = 0,
            y = 0 ,
            width = ENTITY_DEFS[slime_type].width,
            height = ENTITY_DEFS[slime_type].height
           
        }

       slime.stateMachine = StateMachine {
            ['walk'] = function() return SlimeWalkState(slime, self.level) end,
            ['idle'] = function() return EntityIdleState(slime) end
        }

        slime:changeState('walk')
    
        table.insert(self.enemies, slime)
    end
        






    end
