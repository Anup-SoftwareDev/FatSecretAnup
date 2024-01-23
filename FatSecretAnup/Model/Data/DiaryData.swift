//
//  DiaryData.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 2/1/2024.
//

import Foundation
import UIKit


// MARK: - Nav Bar Images
let navTitleUpArrowImg = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
let navTitleDownArrowImg = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
let calendarImg = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(weight: .heavy))?.withTintColor(.white, renderingMode: .alwaysOriginal)
let searchImg = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.white, renderingMode: .alwaysOriginal)
let dateImg = UIImage(systemName: "22.square", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withTintColor(.white, renderingMode: .alwaysOriginal)

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


// Links images

let todayImg = UIImage(systemName: "chart.bar.xaxis")?.withTintColor(fatSecretGreen, renderingMode: .alwaysOriginal)
let albumImg = UIImage(systemName: "photo")?.withTintColor(fatSecretGreen, renderingMode: .alwaysOriginal)
let mealsImg = UIImage(systemName: "map")?.withTintColor(fatSecretGreen, renderingMode: .alwaysOriginal)
let exportImg = UIImage(systemName: "arrow.up.doc")?.withTintColor(fatSecretGreen, renderingMode: .alwaysOriginal)
let optionsImg = UIImage(systemName: "gearshape")?.withTintColor(fatSecretGreen, renderingMode: .alwaysOriginal)

let tableData = [("Breakfast", "balanced"), ("Lunch", "balanced"), ("Dinner", "balanced"),("Snacks/Other", "balanced"), ("Custom Meals", "balanced"), ("Water Tracker", "balanced"), ("Add Exercise/Sleep", "balanced"), ("Item 2", "balanced"), ("Item 3", "balanced")]
var mealItems:[MealItems] = [MealItems(name: "Milk", serving: "1 cup", calories: 122),MealItems(name: "Egg Omelette", serving: "1 large", calories: 93)]
let mealNames = ["Breakfast", "Lunch", "Dinner", "Snacks/Other", "Custom Meals", "Water Tracker", "Add Exercise/Sleep", "Summary", "Graphs"]
let mealsImages = [breakfastImg, lunchImg, dinnerImg, snacksImg, forknifeImg, waterDrop, exerciseImg, snacksImg, plusImg]
let rowHeights = [90, 68, 68, 68, 90, 90, 68, 175, 225]


