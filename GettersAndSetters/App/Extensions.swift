//
//  Extensions.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "en_US")
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.date(from: self)
    }
}

extension Date {
    func calculateAge() -> Int {
        let dob = self
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: dob, to: .now)
        return components.year ?? 0
    }
}
