//
//  DiaryViewModel.swift
//  FatSecretAnup
//
//  Created by Anup Kuriakose on 26/12/2023.
//

import Foundation
import UIKit

class DiaryViewModel {
    
    var images: [UIImage] = []
    var collectionViewHeightConstraint: NSLayoutConstraint!
    var calendarHeightConstraint: NSLayoutConstraint!
    var BreakFastItems:[MealItems] = []
    var caloryTarget = 2200
    var isCollapsed = false
    var calendarIsHidden = true
    
    
    // MARK: - viewDidLoad functions
    
    func loadImagesArray(){
        for _ in 0...100 {
            images.append(UIImage(named: "balanced")!)
            images.append(UIImage(named: "highprotein")!)
            images.append(UIImage(named: "intermittent")!)
            images.append(UIImage(named: "keto")!)
            images.append(UIImage(named: "mediteranean")!)
            images.append(UIImage(named: "vegetarian")!)
        }
    }

    func setUpNavBarTop(navBarTop: UIView, view: UIView, navigationBar: CustomNavigationBar){
        view.addSubview(navBarTop)
        navBarTop.backgroundColor = fatSecretGreen
        navBarTop.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navBarTop.topAnchor.constraint(equalTo: view.topAnchor),
            navBarTop.bottomAnchor.constraint(equalTo: navigationBar.topAnchor),
            navBarTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBarTop.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    func setUpNavBar(navBarTop: UIView, view: UIView, navigationBar: CustomNavigationBar){
        view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    func currentDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        let dateString = formatter.string(from: currentDate)
        return dateString
    }
    
    func setUpCollapseButtonAppearance(button: UIButton, isCollapsed: Bool){
        let imageName = isCollapsed ? "chevron.down" : "chevron.up"
        let boldFont = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.setImage(UIImage(systemName: imageName, withConfiguration: UIImage.SymbolConfiguration(font: boldFont)), for: .normal)
        button.tintColor = .systemGray
    }
    
    //func setupCalendarViewConstraints(calendarView: UIView, scrollView: UIScrollView){
    func setupCalendarViewConstraints(calendarView: UIView, navigationBar: CustomNavigationBar, view: UIView){
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        calendarHeightConstraint = calendarView.heightAnchor.constraint(equalToConstant: 0)
        calendarHeightConstraint.isActive = true
    }
    
    func setupCollectionViewConstraints(collectionView: UICollectionView, scrollView: UIScrollView){
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 130)
        collectionViewHeightConstraint.isActive = true
    }
    
    func setUpCollapseButtonConstraints(view: UIView, scrollView: UIScrollView, button: UIButton, collectionView: UICollectionView){
        scrollView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -26),
        ])
    }
    
    func setUpCollapseLabel(scrollView: UIScrollView, collapseLbl: UILabel, button: UIButton, isCollapsed: Bool){
        scrollView.addSubview(collapseLbl)
        collapseLbl.translatesAutoresizingMaskIntoConstraints = false
        collapseLbl.text = isCollapsed ? "Explore Meal Plans" : "Collapse"
        NSLayoutConstraint.activate([
            collapseLbl.rightAnchor.constraint(equalTo: button.leftAnchor, constant: -5),
            collapseLbl.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            collapseLbl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setUpViews(parentView: UIView, scrollView: UIScrollView, childView: UIView, topAnchorConstraint: NSLayoutAnchor<NSLayoutYAxisAnchor>, topAnchorConstant: CGFloat, heightAnchorConstant: CGFloat){
        scrollView.addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: topAnchorConstraint, constant: topAnchorConstant),
            childView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            childView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            childView.heightAnchor.constraint(equalToConstant: heightAnchorConstant)
        ])
    }

    
    func setUpTableViews(parentView: UIView, scrollView: UIScrollView, childView: UIView, topAnchorConstraint: NSLayoutAnchor<NSLayoutYAxisAnchor>, topAnchorConstant: CGFloat){
        scrollView.addSubview(childView)
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: topAnchorConstraint, constant: topAnchorConstant),
            childView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            childView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            childView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

// MARK: - Collection View Automatic Scrolling functions

extension DiaryViewModel {
    
    func scrollToMiddle(collectionView: UICollectionView) {
        let middleIndex = images.count / 2
        let indexPath = IndexPath(item: middleIndex, section: 0)
        
        // Scroll to the middle index
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
    
    func scrollToNextItem(collectionView: UICollectionView) {
        let currentIndexPath = getCurrentIndexPath(collectionView: collectionView)
        let nextItem = currentIndexPath.item + 1
        let nextIndexPath = getNextIndexPath(nextItem: nextItem, currentIndexPath: currentIndexPath)
        performScrolling(nextItem: nextItem, nextIndexPath: nextIndexPath, collectionView: collectionView)
    }
    
    func getCurrentIndexPath(collectionView: UICollectionView) -> IndexPath{
        let visibleCells = collectionView.indexPathsForVisibleItems.sorted()
        return visibleCells[1] 
    }
    
    func getNextIndexPath(nextItem: Int, currentIndexPath: IndexPath) -> IndexPath{
        let nextIndexPath = IndexPath(item: nextItem, section: currentIndexPath.section)
        return nextIndexPath
    }
    
    func performScrolling(nextItem: Int, nextIndexPath: IndexPath, collectionView: UICollectionView){
        nextItem < images.count ?
            collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
                :
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func calculateWidthCollectionItem(view: UIView) -> CGFloat{
        return view.frame.width/2
    }
}

// MARK: - Calory Computations

extension DiaryViewModel {
    
    func totalCaloriesConsumed() -> Int {
        var totalCalories = 0
        BreakFastItems.forEach{item in totalCalories += item.calories}
        return totalCalories
    }
    
    func totalCaloriesRemaining() -> Int {
        return caloryTarget - totalCaloriesConsumed()
    }
    
    func totalCaloriesRemainingPercentage() -> Int {
        return (totalCaloriesConsumed()*100/caloryTarget)
    }
}

// MARK: - TableView UI computations
extension DiaryViewModel {
    
    func mealsNotEmpty() -> Bool {
        return BreakFastItems.count > 0
    }
    
    func tableRowsCount() -> Int {
        return(mealsNotEmpty() ? (isCollapsed ? 2 : BreakFastItems.count + 3) : 1)
    }
    
    func toggleCollapseBtn () {
        isCollapsed = !isCollapsed
    }
    
    func deleteMealArrayItem(index: Int, option: Int){
        option == 1 ? BreakFastItems.remove(at: index) : nil
    }
    
    func mealNameFromIndex(index: Int) -> String{
        return BreakFastItems[index].name
    }
 
}
