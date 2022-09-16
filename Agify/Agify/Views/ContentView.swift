//
//  ContentView.swift
//  Agify
//
//  Created by David Williams on 9/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = AgifyViewModel()
    
    @State private var text: String = ""
    @State private var validSubmission = true
    
    var body: some View {
        
        ZStack {
            Rectangle().fill(Color("backgroundColor").gradient)
                .ignoresSafeArea()
            
            VStack {
                Text("Agify")
                    .foregroundColor(Color("titleColor"))
                    .font(.system(size: 120, weight: .semibold, design: .rounded))
                    .shadow(radius: 5, y: 5)
                    
                
                
                TextField("Enter a name...", text: $text)
                    .font(.title)
                    .padding(10)
                    .background(Color("titleColor").opacity(0.2))
                    .cornerRadius(15)
                    .padding(.horizontal, 40)
                    .offset(x: !validSubmission ? -10 : 0)
                    .animation(Animation.default.repeatCount(3, autoreverses: true).speed(6))
                    
                
                Button(action: {
                    
                    Task {
                        invalidSubmission(validity: try await vm.getNameAsync(name: text))
                        text = ""
                    }
                    
                }, label: {
                
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                        .background(Color("titleColor"))
                        .foregroundColor(Color("backgroundColor"))
                        .font(.largeTitle).bold()
                        .cornerRadius(15)
                        .padding(.horizontal, 40)
                    
                })
                .disabled(text == "")
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        vm.clearNames()
                        
                    }, label: {
                        Text("Clear")
                            .foregroundColor(Color("backgroundColor"))
                            .padding(5)
                            .background(Color("titleColor"))
                            .cornerRadius(15)
                            .bold()
                    })
                    .padding(.horizontal, 40)
                }
                
                ScrollView {
                    ForEach(vm.names, id: \.self) {name in
                        cellView(name: name)
                            .listRowBackground(Color.clear)
                            
                    }
                    
                }
                
                
                
            }
            
            }
        }
    
    // if there is an invalid entry, this causes the validSubmission state variable to momentarily be false, triggering the animation
    func invalidSubmission(validity: Bool) {
        if !validity {
            withAnimation {
                validSubmission = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation {
                        validSubmission = false
                    }
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
