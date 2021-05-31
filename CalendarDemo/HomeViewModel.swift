//
//  HomeViewModel.swift
//  CalendarDemo
//
//  Created by Dmitrijs Beloborodovs on 31/05/2021.
//

import Foundation
import FSCalendar

class HomeViewModel: NSObject, ObservableObject {

    @Published var calendar = FSCalendar()
    @Published var isCalendarExpanded: Bool = true
    @Published var calendarHeight: CGFloat = 300.0

    @Published var selectedDate: String = ""

    override init() {
        super.init()

        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = isCalendarExpanded ? .month : .week
        calendar.firstWeekday = 2
    }
}

extension HomeViewModel: FSCalendarDelegate {

    func calendar(_ calendar: FSCalendar,
                  didSelect date: Date,
                  at monthPosition: FSCalendarMonthPosition) {
        dateSelected(date)
    }

    func calendar(_ calendar: FSCalendar,
                  boundingRectWillChange bounds: CGRect,
                  animated: Bool) {
        calendarHeight = bounds.height
    }
}

extension HomeViewModel: FSCalendarDataSource {

    func calendar(_ calendar: FSCalendar,
                  numberOfEventsFor date: Date) -> Int {
        numberOfEvent(for: date)
    }
}

private extension HomeViewModel {

    func numberOfEvent(for date: Date) -> Int {
        /// some logic here
        return 0
    }

    func dateSelected(_ date: Date) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.selectedDate = date.description
        }
    }
}
