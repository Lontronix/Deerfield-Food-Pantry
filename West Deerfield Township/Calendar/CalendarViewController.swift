//
//  CalendarViewController.swift
//  West Deerfield Township
//
//  Created by Ben Rosen on 12/28/18.
//  Copyright © 2018 Ben Rosen. All rights reserved.
//

import UIKit
import FSCalendar
import SwiftDate
import GoogleAPIClientForREST

class CalendarViewController: UIViewController {
    
    lazy var availableTimesTableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CalendarTimeTableViewCell.self, forCellReuseIdentifier: CalendarTimeTableViewCell.reuseIdentifier)
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    lazy var scopeGesture: UIPanGestureRecognizer = { [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        return panGesture
    }()
    
    let calendarContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var calendar: FSCalendar = { [unowned self] in
        let calendar = FSCalendar(frame: .zero)
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 17, weight: .medium)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 15, weight: .medium)
        calendar.appearance.weekdayTextColor = UIColor.primaryTintColor
        calendar.appearance.headerTitleColor = UIColor.primaryTintColor
        calendar.appearance.todayColor = UIColor.gray
        calendar.appearance.selectionColor = UIColor.primaryTintColor
        
        calendar.scope = .month
        calendar.calendarHeaderView.isHidden = false
        calendar.dataSource = self
        calendar.delegate = self
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    var events: [GTLRCalendar_Event]?
    
    var calendarHeightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Volunteer"
        view.backgroundColor = UIColor(red: 0.897, green: 0.893, blue: 0.883, alpha: 1.00)
        
        view.addSubview(calendarContainer)
        view.addSubview(calendar)
        
        calendarHeightConstraint = calendar.heightAnchor.constraint(equalToConstant: 300)
        calendarHeightConstraint?.isActive = true
        view.addConstraints([
            calendarContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            calendarContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            calendarContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            calendar.topAnchor.constraint(equalTo: calendarContainer.topAnchor),
            calendar.leftAnchor.constraint(equalTo: calendarContainer.leftAnchor),
            calendar.rightAnchor.constraint(equalTo: calendarContainer.rightAnchor),
            calendarContainer.bottomAnchor.constraint(equalTo: calendar.bottomAnchor),
            ])
        

        view.addSubview(availableTimesTableView)
        
        view.addConstraints([
            availableTimesTableView.topAnchor.constraint(equalTo: calendarContainer.bottomAnchor),
            availableTimesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            availableTimesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            availableTimesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        view.addGestureRecognizer(scopeGesture)
        availableTimesTableView.panGestureRecognizer.require(toFail: self.scopeGesture)
    }
    
    
}

// MARK: UIGestureRecognizerDelegate
extension CalendarViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let shouldBegin = self.availableTimesTableView.contentOffset.y <= -self.availableTimesTableView.contentInset.top
        if shouldBegin {
            let velocity = self.scopeGesture.velocity(in: self.view)
            switch self.calendar.scope {
            case .month:
                return velocity.y < 0
            case .week:
                return velocity.y > 0
            }
        }
        return shouldBegin
    }
    
}

// MARK: UITableViewDelegate & UITableViewDataSource
extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let events = events else {
            return 1
        }
        return events.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.reuseIdentifier, for: indexPath) as! HeaderTableViewCell
            cell.label.text = "January 19, 2018 slots"
            return cell
        }
        
        let event = events![indexPath.row - 1]

        let cell = tableView.dequeueReusableCell(withIdentifier: CalendarTimeTableViewCell.reuseIdentifier, for: indexPath) as! CalendarTimeTableViewCell
        
        if let desc = event.summary {
            cell.subtitleLabel.text = desc
        }
        if let startDate = event.start?.dateTime?.stringValue.toDate()?.convertTo(calendar: nil, timezone: TimeZone.current, locale: nil), let endDate = event.end?.dateTime?.stringValue.toDate()?.convertTo(calendar: nil, timezone: TimeZone.current, locale: nil) {

            cell.titleLabel.text = "\(startDate.toFormat("h:mm a")) to \(endDate.toFormat("h:mm a"))"
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint?.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
        GoogleCalendar.fetchEventsForDate(date) { events in
            self.events = events
            self.availableTimesTableView.reloadData()
        }
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date() + 15.days
    }
}
