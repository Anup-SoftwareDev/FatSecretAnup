
import Foundation

struct ApiResponse: Decodable {
    let foods: Foods

    enum CodingKeys: String, CodingKey {
        case foods = "foods"
    }
}

struct Foods: Decodable {
    let food: [FoodItem]

    enum CodingKeys: String, CodingKey {
        case food = "food"
    }
}

struct FoodItem: Decodable {
    let foodDescription: String
    let foodId: String
    let foodName: String
    let foodType: String
    let foodUrl: String

    enum CodingKeys: String, CodingKey {
        case foodDescription = "food_description"
        case foodId = "food_id"
        case foodName = "food_name"
        case foodType = "food_type"
        case foodUrl = "food_url"
    }
}


struct NutritionInfo {
    var serving: String
    var calories: Int
    var fat: Double
    var carbs: Double
    var protein: Double
}

struct FoodItemFormatted {
    let serving: String
    let calories: Int
    let fat: Double
    let carbs: Double
    let protein: Double
    let foodId: Int
    let foodName: String
    let foodType: String
    let foodUrl: String
    var isSelected: Bool
}
