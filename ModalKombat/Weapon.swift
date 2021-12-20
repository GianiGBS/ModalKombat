//
//  Weapon.swift
//  ModalKombat
//
//  Created by Giovanni Gabriel on 19/10/2021.
//


class Weapon {
    // MARK: Internal properties
    var name: String
    var damage: Int
    var heal: Int
    
    // MARK: Initialization
    init(name: String, damage: Int, heal: Int) {
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}

var weaponsList: [Weapon] = [Weapon(name: "Guandao 🟣", damage: 15, heal: 45),//Gladiator
                         Weapon(name: "Sai 🟡", damage: 30, heal: 65),//Assassin
                         Weapon(name: "Tessen 🔴", damage: 45, heal: 40),//Wizard
                         Weapon(name: "Katana 🔵", damage: 20, heal: 35),//Knight
                         Weapon(name: "Kusarigama 🟢", damage: 25, heal: 55),//Rodeur
                         Weapon(name: "Gun 🟠", damage: 40, heal: 50)]//Shaman
