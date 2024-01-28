

import FSCalendar
import UIKit

class CalendarView: UIView{
    
    var calendar = FSCalendar()
    var delegate: FSCalendarDelegate?
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        addSubview(calendar)
        calendar.delegate = delegate 
        setUpCalendarConstraints()
        setUpCalendarAppearance()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCalendarConstraints(){
        calendar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: topAnchor),
            calendar.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendar.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }

    private func setUpCalendarAppearance(){

        calendar.backgroundColor = fatSecretGreen
        calendar.firstWeekday = 2
        calendar.appearance.titleDefaultColor = .white
        calendar.appearance.selectionColor = UIColor.green
        calendar.appearance.weekdayTextColor = .white
        calendar.appearance.todayColor = fatSecretGreen
        customizeWeekdaySymbols()
        calendar.headerHeight = 0
    }
    
    func customizeWeekdaySymbols() {
            // Set custom weekday symbols
        let dateFormatter = DateFormatter()

        dateFormatter.shortStandaloneWeekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]
            dateFormatter.veryShortStandaloneWeekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]
            calendar.calendarWeekdayView.weekdayLabels.forEach { label in
                if let index = calendar.calendarWeekdayView.weekdayLabels.firstIndex(of: label) {
                    label.text = dateFormatter.veryShortStandaloneWeekdaySymbols[index]
                }
            }
        }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
            if Calendar.current.isDateInToday(date) {
                return .red
            }
            return nil
        }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
            if Calendar.current.isDateInToday(date) {
                return .white
            }
            return nil
        }

    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            let currentPageDate = calendar.currentPage
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM yyyy" // Format as "Month Year"
            let currentMonthString = dateFormatter.string(from: currentPageDate)

            // Print the current month or update your UI
            print("Current month: \(currentMonthString)")
        }


}
