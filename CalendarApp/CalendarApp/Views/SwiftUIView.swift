//
//  SwiftUIView.swift
//  CalendarApp
//
//  Created by John Abraham on 9/15/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Title")
                    .font(.system(size: 32, weight: .bold))
                
                Text("Course ")
            }
            
            Spacer()
            
            Text("Due Date")
                .font(.callout)
        }
        .padding(20)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
