//
//  TabBarControllerExtensions.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 24/12/2023.
//

import Foundation
import UIKit



class TabBarViewModel {
    
    let diaryViewController = DiaryViewController()
    let premiumViewController = PremiumViewController()
    let homeViewController = HomeViewController()
    let reportsViewController = ReportsViewController()
    let meViewController = MeViewController()
    let diaryNavController: UINavigationController
    let premiumNavController: UINavigationController
    let homeNavController: UINavigationController
    let reportsNavController: UINavigationController
    let meNavController: UINavigationController
    var tabBarItems: [TabBarItems] = []
    var tabBarViewControllers: [UINavigationController]
    
    init() {
        self.diaryNavController = UINavigationController(rootViewController: diaryViewController)
        self.premiumNavController = UINavigationController(rootViewController: premiumViewController)
        self.homeNavController = UINavigationController(rootViewController: homeViewController)
        self.reportsNavController = UINavigationController(rootViewController: reportsViewController)
        self.meNavController = UINavigationController(rootViewController: meViewController)
        self.tabBarViewControllers = [homeNavController, meNavController, diaryNavController, reportsNavController, premiumNavController]
    }

    func getTabBarItems(){
        tabBarViewControllers.enumerated().forEach{index, controller in tabBarItems.append(TabBarItems(controller: controller, image: images[index], title: titles[index]))}
    }
    
    func addTabBarItems(){
        tabBarItems.forEach{tabBarItem in addTabBarItems(navController: tabBarItem.controller, systemName: tabBarItem.image, title: tabBarItem.title)}
    }
    
    private func addTabBarItems(navController: UINavigationController, systemName: String, title: String){
        if let image = UIImage(systemName: systemName) {
            navController.tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        }
        navController.viewControllers.first?.navigationItem.title = title
    }
    func addAvatar(){
        if let originalImage = UIImage(named: "avatarImg") {
            let roundedImage = makeRoundImageWithBorder(image: originalImage, borderWidth: 2, borderColor: UIColor.white, outerBorderColor: UIColor.gray).withRenderingMode(.alwaysOriginal)
            meNavController.tabBarItem = UITabBarItem(title: "Me", image: roundedImage, selectedImage: nil)
        }
    }
    
    func makeRoundImageWithBorder(image: UIImage, borderWidth: CGFloat, borderColor: UIColor, outerBorderColor: UIColor) -> UIImage {
        let imageSize = image.size
        let borderSize = borderWidth * 2
        let newSize = CGSize(width: imageSize.width + borderSize, height: imageSize.height + borderSize)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)

        // Define the rect for the outer border
        let outerBorderRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        outerBorderColor.setFill()
        UIBezierPath(roundedRect: outerBorderRect, cornerRadius: newSize.width / 2).fill()

        // Define the rect for the inner border
        let innerBorderRect = outerBorderRect.insetBy(dx: borderWidth, dy: borderWidth)
        borderColor.setFill()
        UIBezierPath(roundedRect: innerBorderRect, cornerRadius: innerBorderRect.width / 2).fill()

        // Define the rect for the image
        let imageRect = innerBorderRect.insetBy(dx: borderWidth, dy: borderWidth)
        
        // Clip the context to round the image
        let path = UIBezierPath(roundedRect: imageRect, cornerRadius: imageRect.width / 2)
        path.addClip()
        
        // Draw the image
        image.draw(in: imageRect)

        let finalImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
        UIGraphicsEndImageContext()

        return finalImage
    }
    
}
