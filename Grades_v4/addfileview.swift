//
//  addfileview.swift
//  Grades_v4
//
//  Created by Jakob Erlebach on 08.03.24.
//

import SwiftUI

struct addfileview: View {
    @State var nameinput: String = ""
    @State var lehererinput: String = ""
    @State var rauminput: String = ""
    @State var pickedcolor: Color = .blue
    @ObservedObject var storage: storageclass
    //var schuljahr: [schuljahrspeicher]
    
    var body: some View {
        Group{
            VStack{
                Text("Name")
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: (2*UIScreen.main.bounds.width) / 3, alignment: .leading)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(10)
                    TextField("FACH BSPW. MATHE", text: $nameinput)
                        .padding(.horizontal)
                    
                    
                }.frame(height: UIScreen.main.bounds.height / 20)
                
                Divider()
                
                HStack{
                    Text("Gewichting")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height:UIScreen.main.bounds.width / 15)
                    })
                }
                
                Divider()
                
                
                
                ColorPicker(selection: $pickedcolor, label: {
                    Text("Farbe")
                        .bold()
                        .font(.system(size: 20))
                    
                })
                Divider()
                Text("Lehrer")
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: (2*UIScreen.main.bounds.width) / 3, alignment: .leading)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(10)
                    TextField("LEHRER", text: $lehererinput)
                        .padding(.horizontal)
                    
                    
                }.frame(height: UIScreen.main.bounds.height / 20)
                Divider()
                
                Text("Raum")
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: (2*UIScreen.main.bounds.width) / 3, alignment: .leading)
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(10)
                    TextField("Raum", text: $rauminput)
                        .padding(.horizontal)
                    
                    
                }.frame(height: UIScreen.main.bounds.height / 20)
                
                Divider()
                Button(action: {
                    var counter = 0
                    for jahr in storage.schuljahre{
                        if jahr.jahr == storage.activeschuljahr{
                            storage.schuljahre[counter].fächer.append(Fachspeicher(tests: [], color: pickedcolor, name: nameinput, lehrer: lehererinput, raum: rauminput, gewichtung: 1))
                        }
                        counter += 1
                    }
                    
                    storage.addfach = false
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
                    storage.addfach = false
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
/*
 .frame(width: (2*UIScreen.main.bounds.width) / 3, alignment: .leading)
 */
