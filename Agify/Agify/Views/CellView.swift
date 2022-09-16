//
//  cellView.swift
//  Agify
//
//  Created by David Williams on 9/15/22.
//

import SwiftUI

struct cellView: View {
    
    var name: NameResult
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("titleColor").opacity(0.1))
            HStack {
                Text(name.name)
                Spacer()
                Text("Est. Age: " + String(name.age!))
            }
            .font(.title2).bold()
            .foregroundColor(Color("titleColor"))
            .padding(.horizontal, 20)
            
        }
        .frame(height: 50)
        .cornerRadius(15)
        .padding(.horizontal, 30)
        
    }
}

struct cellView_Previews: PreviewProvider {
    static var previews: some View {
        cellView(name: NameResult(name: "David", age: 70, count: 1, country_id: "US"))
    }
}
