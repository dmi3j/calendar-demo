//
//  CalendarRepresentable.swift
//  CalendarDemo
//
//  Created by Dmitrijs Beloborodovs on 31/05/2021.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    var calendar: FSCalendar

    @Binding var isCalendarExpanded: Bool

    func makeUIView(context: Context) -> FSCalendar {
        calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        let scope: FSCalendarScope = isCalendarExpanded ? .month : .week
        uiView.setScope(scope, animated: false)
    }
}
