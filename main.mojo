from random import random_ui64

struct Warrior:
        var name: String
        var strength: Int
        var endurance: Int
        var agility: Int
        var health: Int
        var skills: Array[Skill]

struct Skill:
        var name: String
        var type: String  
        var power: Int

        fn apply_effect(self, warrior: Warrior, opponent: Warrior):
            if self.type == "offensive":
                var extra_damage = self.power 
                opponent.health -= extra_damage 
                print("$warrior.name uses Power Strike, dealing an extra $extra_damage damage!") 

fn main():
    

        fn __init__(inout self, name: String, strength: Int, endurance: Int, agility: Int, health: Int):
            self.name = name
            self.strength = strength
            self.endurance = endurance
            self.agility = agility
            self.health = health

        fn use_skill(self, skill: Skill, opponent: Warrior) -> Void :
            skill.apply_effect(self, opponent)   

        fn attack(self) -> Int: 
            return self.strength * (1 + random_ui64(0, 10) * 2)  

        fn defend(self, damage: Int) -> Int:
            var block_chance = self.agility * 0.1  
            if random_ui64(0, 10) < block_chance:        
                print("$name blocks the attack!") 
                return 0     
            else:
                var damage_taken = damage - self.endurance * 0.1 
                self.health -= damage_taken if damage_taken > 0
                return damage_taken 

            func battle(warrior1: Warrior, warrior2: Warrior):
                var current_attacker = warrior1 
                var current_defender = warrior2

                if randInt(1, 2) == 1: 
                    (current_attacker, current_defender) = (current_defender, current_attacker)

                while warrior1.health > 0 && warrior2.health > 0: 
                    var damage = current_attacker.attack()
                    var damage_taken = current_defender.defend(damage) 

                    print("$current_attacker.name attacks $current_defender.name for $damage damage!")
                    print("$current_defender.name has $current_defender.health health remaining.")

                    (current_attacker, current_defender) = (current_defender, current_attacker)  


                if warrior1.health <= 0:
                    print("$warrior2.name wins!")
                else:
                    print("$warrior1.name wins!")

            var warrior1 = Warrior("Ragnar", 10, 8, 6, 100) 
            var warrior2 = Warrior("Astrid", 9, 7, 7, 100) 


            battle(warrior1, warrior2) 