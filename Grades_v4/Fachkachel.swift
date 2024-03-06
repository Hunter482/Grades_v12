//
//  Fachkachel.swift
//  Grades_v4
//
//  Created by Jakob Erlebach on 02.03.24.
//

import SwiftUI
//@ObservedObject var storage: storageclass
struct Fachkachel: View, Hashable{
    
    var accentcolor: Color = .white
    var fachspeicher: Fachspeicher
    var schnittKA: String
    var schnittHÜ: String
    var schnittEPO: String
    init(fachspeicher: Fachspeicher) {
        self.accentcolor = .white
        self.fachspeicher = fachspeicher
        self.schnittKA = {
            var sum: Double = 0
            var counter: Double = 0
            
            for test in fachspeicher.tests{
                if test.testart == .klassenarbeit{
                    sum += test.note
                    counter += 1
                }
            }
            if counter > 0{
                return String(sum/counter)
            }else{
                return "-"
            }
            
        }()
        self.schnittHÜ = {
            var sum: Double = 0
            var counter: Double = 0
            
            for test in fachspeicher.tests{
                if test.testart == .hü{
                    sum += test.note
                    counter += 1
                }
            }
            if counter > 0{
                return String(sum/counter)
            }else{
                return "-"
            }
        }()
        self.schnittEPO = {
            var sum: Double = 0
            var counter: Double = 0
            
            for test in fachspeicher.tests{
                if test.testart == .epo{
                    sum += test.note
                    counter += 1
                }
            }
            if counter > 0{
                return String(sum/counter)
            }else{
                return "-"
            }
        }()
    }
   
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 29.09)
                .foregroundStyle(fachspeicher.color)
                .opacity(0.77)
            
            
            VStack{
                
                HStack{
                    Text(fachspeicher.name)
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(.top, 15)
                        .padding(.leading, 20)
                        .foregroundColor(accentcolor)
                    
                    Button(action: {
                        //storage.addnote = true
                    }){
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .frame(width: 40, height: 40)
                            .foregroundColor(accentcolor)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(.top, 15)
                    .padding(.trailing, 15)
                }
                HStack{
                    VStack{
                        
                        Text("Ø KA")
                            .foregroundColor(Color("lightgray"))
                            .bold()
                        
                        Text(schnittKA)
                            .font(.title)
                            .foregroundColor(Color("lightgray"))
                            .bold()
                    }
                    VStack{
                        Text("")
                        
                        Text("|")
                            .font(.title)
                            .foregroundColor(Color("lightgray"))
                            .bold()
                    }
                    VStack{
                        Text("Ø HÜ")
                            .foregroundColor(Color("lightgray"))
                            .bold()
                        
                        Text(schnittHÜ)
                            .font(.title)
                            .foregroundColor(Color("lightgray"))
                            .bold()
                    }
                    VStack{
                        Text("")
                        
                        Text("|")
                            .font(.title)
                            .foregroundColor(Color("lightgray"))
                            .bold()
                    }
                    VStack{
                        Text("Ø Epo")
                            .foregroundColor(Color("lightgray"))
                            .bold()
                        
                        Text(schnittEPO)
                            .font(.title)
                            .foregroundColor(Color("lightgray"))
                            .bold()
                    }
                        Spacer()
                    VStack{
                    label: do {
                        HStack{
                            Text("-,--")
                                .font(.largeTitle)
                                .foregroundColor(Color("lightgray"))
                            
                            Text("Ø").font(.largeTitle)
                                .foregroundColor(Color("lightgray"))
                        }.padding(.trailing, 25)
                    }
                    }
                        
                        
                    }.padding(.bottom, 15)
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                
            }
        }
        .padding(.horizontal, 15)
        .frame(height: 130)
    }
}

struct Fachkachel_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}

