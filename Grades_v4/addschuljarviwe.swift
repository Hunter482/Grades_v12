//
//  addschuljarviwe.swift
//  Grades_v4
//
//  Created by Etienne Hüttl on 18.03.24.
//

import SwiftUI

struct addschuljarviwe: View {
    @State var jahrinput: String = ""
    @State var pickedcolor: Color = .red
    @ObservedObject var storage: storageclass
    
    
    var body: some View {
        Group{
            VStack{
                Text("Schuljahr")
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: (2*UIScreen.main.bounds.width) / 3, alignment: .leading)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(10)
                    TextField("JAHR BSPW. 23/24", text: $jahrinput)
                        .padding(.horizontal)
                    
                    
                }.frame(height: UIScreen.main.bounds.height / 20)
                
                Divider()
                
                
                
                
                ColorPicker(selection: $pickedcolor, label: {
                    Text("Farbe")
                        .bold()
                        .font(.system(size: 20))
                    
                })

                
                Divider()
                Button(action: {
                    storage.schuljahre.append(schuljahrspeicher(fächer: [], jahr: jahrinput, durchschnitt: 0, farbe: pickedcolor))
                    storage.addschuljahr = false
                }, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                        Text("Speichern")
                            .bold()
                            .foregroundStyle(.white)
                    }.frame(height: UIScreen.main.bounds.height / 20)
                })
                Divider()
                Button(action: {
                    storage.addschuljahr = false
                }, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color("lightgray"))
                            .cornerRadius(10)
                        Text("Zurück")
                            .bold()
                            .foregroundStyle(.blue)
                    }.frame(height: UIScreen.main.bounds.height / 20)
                })
            }
        }.padding()
            .background(.white)
            .cornerRadius(15)
    }
    }


#Preview {
    Wrapper()
}
