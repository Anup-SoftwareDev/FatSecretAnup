//
//  DiaryData.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 2/1/2024.
//

import Foundation
import UIKit


let breakfastImg = UIImage(systemName: "sunrise.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
let lunchImg = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemCyan, renderingMode: .alwaysOriginal)
let dinnerImg = UIImage(systemName: "sun.haze.fill")?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
let snacksImg = UIImage(systemName: "moon.fill")?.withTintColor(.systemPurple, renderingMode: .alwaysOriginal)
let plusImg = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))?.withTintColor(fatSecretGreen, renderingMode: .alwaysOriginal)
let waterDrop = UIImage(systemName: "drop.fill")?.withTintColor(.systemCyan, renderingMode: .alwaysOriginal)
let forknifeImg = UIImage(systemName: "fork.knife")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
let exerciseImg = UIImage(systemName: "figure.soccer")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
let logoImg = UIImage(systemName: "medal.fill")?.withTintColor(.systemBrown, renderingMode: .alwaysOriginal)
let xImg = UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.darkGray , renderingMode: .alwaysOriginal)

let tableData = [("Breakfast", "balanced"), ("Lunch", "balanced"), ("Dinner", "balanced"),("Snacks/Other", "balanced"), ("Custom Meals", "balanced"), ("Water Tracker", "balanced"), ("Add Exercise/Sleep", "balanced"), ("Item 2", "balanced"), ("Item 3", "balanced")]

let mealNames = ["Breakfast", "Lunch", "Dinner", "Snacks/Other", "Custom Meals", "Water Tracker", "Add Exercise/Sleep", "Summary", "Graphs"]
let mealsImages = [breakfastImg, lunchImg, dinnerImg, snacksImg, forknifeImg, waterDrop, exerciseImg, snacksImg, plusImg]
let rowHeights = [68, 68, 68, 68, 90, 90, 68, 140, 180]
