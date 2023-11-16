//
//  EmployeesView.swift
//  IosTestTask_iMakeBetter
//
//  Created by Tobias on 15.11.2023.
//

import SwiftUI

struct EmployeesView: View {
    let title: String
    var employees: [Cast]
    var takeOnly: Int?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(title):")
                .foregroundColor(.secondTextColor)
                .font(.footnoteFont)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    if employees.count > 0 {
                        if let takeOnly = takeOnly {
                            ForEach(employees.prefix(takeOnly), id: \.self) { cast in
                                PeopleAvatarView(name: cast.originalName, avatarURL: cast.imagePath)
                            }
                        } else {
                            ForEach(employees, id: \.self) { cast in
                                PeopleAvatarView(name: cast.originalName, avatarURL: cast.imagePath)
                            }
                        }
                    } else {
                        Text("Unknow \(title)")
                            .foregroundColor(.secondTextColor)
                            .font(.footnoteFont)
                    }
                    
                }
            }
        }
    }
}
