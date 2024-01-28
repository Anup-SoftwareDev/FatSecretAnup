//
//  APIData.swift
//  FatSecretAPIcall
//
//  Created by Anup Kuriakose on 24/1/2024.
//

import Foundation

let clientID = "044b39bfd86445ae8445d36af77ab013"
let clientSecret = "b68bd9ec00ae4e3194d44b7d36db8211"
var initialisedFoodItem = FoodItemFormatted(serving: "", calories: 0, fat: 0, carbs: 0, protein: 0, foodId: 0, foodName: "", foodType: "", foodUrl: "", isSelected: false)
var foodItemExample =  FoodItem(foodDescription: "Per 100g - Calories: 50kcal | Fat: 1.97g | Carbs: 4.68g | Protein: 3.30g", foodId: "800", foodName: "2% Fat Milk", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/milk-cows-fluid-2%25-fat")

var foodArrayToastExample = [FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 293, fat: 4.0, carbs: 54.4, protein: 9.0, foodId: 38821, foodName: "Toasted White Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-white-bread", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 282, fat: 4.42, carbs: 51.32, protein: 9.95, foodId: 3591, foodName: "Toasted Whole Wheat Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-whole-wheat-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 293, fat: 4.0, carbs: 54.4, protein: 9.0, foodId: 3423, foodName: "Toasted Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 272, fat: 4.1, carbs: 50.4, protein: 10.9, foodId: 3681, foodName: "Toasted Multigrain Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-multigrain-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 298, fat: 3.3, carbs: 56.4, protein: 9.6, foodId: 3491, foodName: "Toasted Sour Dough Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-sour-dough-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 305, fat: 5.9, carbs: 56.4, protein: 9.2, foodId: 38827, foodName: "Toasted Whole Wheat Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-whole-wheat-bread", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 1 slice", calories: 110, fat: 1.0, carbs: 21.0, protein: 3.0, foodId: 69147, foodName: "Texas Toast White Enriched Bread", foodType: "Brand", foodUrl: "https://www.fatsecret.com/calories-nutrition/holsum/texas-toast-white-enriched-bread", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 1 slice", calories: 100, fat: 1.0, carbs: 18.0, protein: 3.0, foodId: 62992, foodName: "Texas Toast Bread", foodType: "Brand", foodUrl: "https://www.fatsecret.com/calories-nutrition/franz/texas-toast-bread", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 293, fat: 4.0, carbs: 54.4, protein: 9.0, foodId: 3434, foodName: "Toasted White Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-white-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 1 serving", calories: 120, fat: 0.5, carbs: 25.0, protein: 5.0, foodId: 2236582, foodName: "Honey Wheat Toast", foodType: "Brand", foodUrl: "https://www.fatsecret.com/calories-nutrition/silvergreens/honey-wheat-toast", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 299, fat: 6.78, carbs: 54.32, protein: 9.19, foodId: 3569, foodName: "Toasted 100% Whole Wheat Bread (Home Recipe or Bakery)", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-whole-wheat-100%25-made-from-home-recipe-or-purchased-at-bakery-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 239, fat: 3.8, carbs: 49.2, protein: 9.5, foodId: 38808, foodName: "Toasted Oat Bran Bread (Reduced Calorie)", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-oat-bran-bread-(reduced-calorie)", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 315, fat: 6.34, carbs: 54.78, protein: 8.67, foodId: 3436, foodName: "Toasted White Bread (Home Recipe or Bakery)", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-white-made-from-home-recipe-or-purchased-at-a-bakery-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 284, fat: 3.6, carbs: 53.1, protein: 9.4, foodId: 38815, foodName: "Toasted Rye Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-rye-bread", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 275, fat: 3.4, carbs: 52.2, protein: 9.5, foodId: 38804, foodName: "Toasted Pumpernickel Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-pumpernickel-bread", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 292, fat: 3.62, carbs: 55.62, protein: 8.4, foodId: 3485, foodName: "Toasted Potato Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-potato-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 251, fat: 3.8, carbs: 46.4, protein: 10.0, foodId: 38794, foodName: "Mixed Grain Bread (Includes Whole Grain and 7 Grain)", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/mixed-grain-bread-(includes-whole-grain-and-7-grain)", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 227, fat: 2.75, carbs: 48.68, protein: 9.56, foodId: 3473, foodName: "Toasted Reduced Calorie High Fiber White Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-reduced-calorie-and-or-high-fiber-white-or-nfs-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 223, fat: 3.19, carbs: 44.5, protein: 10.0, foodId: 3651, foodName: "Toasted Reduced Calorie High Fiber Rye Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-rye-reduced-calorie-and-or-high-fiber-toasted", isSelected: false), FatSecretAnup.FoodItemFormatted(serving: "Per 100g", calories: 272, fat: 4.1, carbs: 50.4, protein: 10.9, foodId: 38795, foodName: "Toasted Mixed Grain Bread (Includes Whole Grain and 7 Grain)", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-mixed-grain-bread-(includes-whole-grain-and-7-grain)", isSelected: false)]

//var foodArrayToastExample = [FoodItemFormatted(serving: "Per 100g", calories: 293, fat: 4.0, carbs: 54.4, protein: 9.0, foodId: 38821, foodName: "Toasted White Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/usda/toasted-white-bread", isSelected: false), FoodItemFormatted(serving: "Per 100g", calories: 282, fat: 4.42, carbs: 51.32, protein: 9.95, foodId: 3591, foodName: "Toasted Whole Wheat Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-whole-wheat-toasted", isSelected: false), FoodItemFormatted(serving: "Per 100g", calories: 293, fat: 4.0, carbs: 54.4, protein: 9.0, foodId: 3423, foodName: "Toasted Bread", foodType: "Generic", foodUrl: "https://www.fatsecret.com/calories-nutrition/generic/bread-toasted", isSelected: false)]
