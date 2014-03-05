class Player  
 @health = 20 
 @memory = 0
 @@dir = 0 #direction
 @noSearch = false #make sure that both side is clear!
 @rescue =false 
  def play_turn(warrior) 
     
     hasEnemyBack = false
     distance1 = 0   #distance between  and moster
     distance2 = 10   #distance between warrior and captive
   if @@dir !=0
     if warrior.look(:backward)[0].enemy? ||  
       warrior.look(:backward)[1].enemy? ||  
       warrior.look(:backward)[2].enemy?  
       @noSearch = true
       end
     end

     if warrior.look(:backward)[0].enemy? ||  
       warrior.look(:backward)[1].enemy? ||  
       warrior.look(:backward)[2].enemy?  
       @hasEnemyBack = true
       
     end  
    if @@dir !=1
      if  warrior.health != @health && @hasEnemyBack
               warrior.pivot! 
               @@dir =1
               return 0
         end
     end
     if @rescue && @noSearch 
       warrior.pivot!
       @rescue = false
       @noSearch =false
       return 0
       end
   

 
      if warrior.look[0].captive?
            distance2=1
      elsif  warrior.look[0].enemy?
            hasEnemy = 1
            distance1=1
      end
      
      if warrior.look[1].captive?
            distance2 =2
      elsif  warrior.look[1].enemy?
            hasEnemy = 1
            distance1 = 2
      end
      
      if warrior.look[2].captive?
            distance2 =3
      elsif  warrior.look[2].enemy?
            hasEnemy = 1
            distance1 = 3
      end
  if hasEnemy and distance2>distance1
         warrior.shoot!  
         health = warrior.health 
    else
    if warrior.feel.captive?  
       warrior.rescue! 
       @rescue = true
      else  
        if warrior.feel.empty?  
           if warrior.health < 20  
                if warrior.health < 10  
                    if warrior.feel(:backward).wall?  
                        if warrior.health >=@health  
                          warrior.rest!  
                         
                        end  
                    elsif warrior.feel(:backward).captive?  
                     warrior.rescue!(:backward)  
                    
                    else  
                       warrior.walk!(:backward)  
                    end  
               else  
                    if warrior.health >=@health  
                        warrior.rest!  
                     
                    else  
                        warrior.walk!  
                    end  
                end  
           else  
              warrior.walk!  
             
           end  
       else  
         if warrior.feel.wall?  
              warrior.pivot!  
         else  
           warrior.attack!  
           end
          end 
        
       end
    end
     @health = warrior.health
   end  
end