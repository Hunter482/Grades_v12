//
//  schuljahr.swift
//  Grades_v4
//
//  Created by Etienne Hüttl on 16.03.24.
//

import SwiftUI

struct schuljahr: View {
    
    var accentcolour: Color = .white
    var schuljahr: schuljahrspeicher
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 27.54)
                .foregroundColor(schuljahr.farbe)
            
            VStack{
                HStack{
                    Text(schuljahr.jahr)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .bold()
                        .font(.title)
                        .padding(.leading, 20)
                        .padding(.top, 15)
                        .foregroundColor(accentcolour)
                    
                    VStack{
                    label: do {
                        HStack{
                            Text(String(schuljahr.durchschnitt))
                                .font(.largeTitle)
                                .foregroundColor(Color("lightgray"))
                            
                            Text("Ø").font(.largeTitle)
                                .foregroundColor(Color("lightgray"))
                        }.padding(.trailing, 25)
                    }
                    }
                }
                
                
            }
        }.frame(height: 130)
            .padding(.horizontal)
    }
}
#Preview {
    Wrapper()
}
