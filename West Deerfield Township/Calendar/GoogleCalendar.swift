//
//  GoogleCalendar.swift
//  West Deerfield Township
//
//  Created by Ben Rosen on 1/13/19.
//  Copyright © 2019 Ben Rosen. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST
import SwiftDate

class GoogleCalendar: NSObject {
    
    static func fetchEventsForDate(_ date: Date, completionBlock: @escaping ([GTLRCalendar_Event]) -> Void) {
       let service = GTLRCalendarService()
        service.apiKey = "AIzaSyDIX57TcwB7oarOfzm5lVY-ZaxImp4Wk-0"
        service.apiKeyRestrictionBundleID = "me.benrosen.West-Deerfield-Township"

        let query = GTLRCalendarQuery_EventsList.query(withCalendarId: "benrosen.me_udklh1nkj2mg546vjkngdlrtvg@group.calendar.google.com")

        query.timeZone = "America/Chicago"
        query.timeMin = GTLRDateTime(date: date.dateAtStartOf(.day))
        query.timeMax = GTLRDateTime(date: date.dateAtEndOf(.day))

        let ticket = service.executeQuery(query) { (ticket, response, error) in
            print(ticket)
            print(response)
            print(error)
            if let calEvents = response as? GTLRCalendar_Events, let items = calEvents.items {
                completionBlock(items)
            }
        }
    }

}
