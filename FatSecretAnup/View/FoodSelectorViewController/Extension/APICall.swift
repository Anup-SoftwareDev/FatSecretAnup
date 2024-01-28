import UIKit

extension FoodSelectionViewController {
    
    private func setupButton() {
            let button = UIButton(type: .system)
            button.setTitle("Present Modal", for: .normal)
            button.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)

            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)

            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }

        @objc private func presentModalViewController() {
            let foodSelectionViewController = FoodSelectionViewController()
            foodSelectionViewController.modalPresentationStyle = .overFullScreen // or .fullScreen
            present(foodSelectionViewController, animated: true)
        }
    func searchFoodData(searchExpression: String, accessToken: String, completion: @escaping(ApiResponse) -> Void) {
        
        let urlString = "https://fatsecretapibackend.onrender.com/api/fatsecret" // Include the specific endpoint
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

            let bodyParameters = "method=foods.search&search_expression=\(searchExpression)&format=json"
            request.httpBody = bodyParameters.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error@SearchFood: \(error?.localizedDescription ?? "No error description")")
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(ApiResponse.self, from: data)
                completion(response)
                // Now you can process your data
                DispatchQueue.main.async {
                    self.foodArray.removeAll()  //
                    for foodItem in response.foods.food {
                        let foodArrayItem = self.formatFoodItem(foodItem: foodItem)
                        self.foodArray.append(foodArrayItem)
                    }
                    self.tableView.reloadData()  // Reload the table view here
                    print(self.foodArray)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
            
        }

        task.resume()
    }
    
    func requestAccessToken(completion: @escaping (String) -> Void) {
        let tokenURL = URL(string: "https://oauth.fatsecret.com/connect/token")!
        var request = URLRequest(url: tokenURL)
        request.httpMethod = "POST"

        let clientID = clientID
        let clientSecret = clientSecret
        let credentials = "\(clientID):\(clientSecret)".data(using: .utf8)!.base64EncodedString()
        
        request.addValue("Basic \(credentials)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyParameters = "grant_type=client_credentials&scope=basic"
        request.httpBody = bodyParameters.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error@accessToken: \(error.localizedDescription)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response: \(httpResponse.statusCode)")
            }

            if let data = data {
               
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let accessToken = json["access_token"] as? String {
                        DispatchQueue.main.async {
                            completion(accessToken)
                        }
                    } else {
                        print("JSON does not contain access_token")
                    }
                } catch {
                    print("Error parsing response data: \(error.localizedDescription)")
                }
            }
        }

        task.resume()
    }
    
    func parseNutritionInfo(from string: String) -> NutritionInfo? {
        let components = string.split(separator: "|")
      
        guard let servingPart = components.first?.split(separator: "-").first?.trimmingCharacters(in: .whitespaces),
              components.count == 4 else {
            return nil
        }
        guard let caloriesPart = components.first?.split(separator: "-").last?.trimmingCharacters(in: .whitespaces),
              components.count == 4 else {
            return nil
        }
    
        let nutritionValues = components.dropFirst().map { component -> Double? in
            let parts = component.split(separator: ":")
            guard parts.count == 2, let valuePart = parts.last else { return nil }
            guard let valueString = valuePart.trimmingCharacters(in: .whitespaces).split(separator: " ").first
                else {
                return nil
            }
            return (extractDouble(from: String(valueString)))
        }
        
        let caloryParts = caloriesPart.split(separator: ":")
        guard caloryParts.count == 2, let caloryValuePart = caloryParts.last else { return nil }
        let caloryValueString = caloryValuePart.trimmingCharacters(in: .whitespaces).split(separator: " ").first
        let calories = (extractInteger(from: String(caloryValueString!))!)
        guard nutritionValues.count == 3,
              let fat = nutritionValues[0],
                let carbs = nutritionValues[1],
                let protein = nutritionValues[2] else {
            return nil
        }
        return NutritionInfo(serving: String(servingPart), calories: calories, fat: fat, carbs: carbs, protein: protein)
    }
    
    func extractInteger(from string: String) -> Int? {
        let filteredString = string.filter { "0"..."9" ~= $0 }
        return Int(filteredString)
    }
    func extractDouble(from string: String) -> Double? {
        let filteredString = string.filter { "0"..."9" ~= $0 || $0 == "." }
        return Double(filteredString)
    }
    
    
    func formatFoodItem(foodItem: FoodItem) -> FoodItemFormatted {
        let foodId = Int(foodItem.foodId) ?? 0
        let foodName = foodItem.foodName
        let foodType = foodItem.foodType
        let foodUrl = foodItem.foodUrl

        guard let nutritionInfo = parseNutritionInfo(from: foodItem.foodDescription) else {
            return FoodItemFormatted(serving: "", calories: 0, fat: 0, carbs: 0, protein: 0, foodId: foodId, foodName: foodName, foodType: foodType, foodUrl: foodUrl, isSelected: false)
        }

        return FoodItemFormatted(serving: nutritionInfo.serving, calories: nutritionInfo.calories, fat: nutritionInfo.fat, carbs: nutritionInfo.carbs, protein: nutritionInfo.protein, foodId: foodId, foodName: foodName, foodType: foodType, foodUrl: foodUrl, isSelected: false)
    }

}
