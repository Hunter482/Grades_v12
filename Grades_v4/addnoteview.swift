//
//  addnoteview.swift
//  Grades_v4
//
//  Created by Etienne Hüttl on 18.03.24.
//

import SwiftUI

struct addnoteview: View {
    @ObservedObject var storage: storageclass
    @Binding var updatetoggle: Bool

    
    @State var notenartinput: testarten = .klassenarbeit
    @State var dateinput: Date = Date()
    @State var selectednote: Double = 2
    @State var tendenz: notentendenz = .null
    
    
    
    var body: some View {
        Group{
            VStack{
                Text("Art")
                    .bold()
                    .font(.system(size: 20))
                    .frame(width: (2*UIScreen.main.bounds.width) / 3, alignment: .leading)
                
                /*ZStack{
                    Rectangle()
                        .foregroundColor(Color("lightgray"))
                        .cornerRadius(10)
                    TextField("BSPW. Hü, KA, Epo", text: $notenartinput)
                        .padding(.horizontal)
                    
                    
                }.frame(height: UIScreen.main.bounds.height / 20)
                */
                
                
                HStack{
                    Button(action: {
                        notenartinput = .hü
                    }, label: {
                        ZStack{
                                Rectangle()
                                .foregroundColor(notenartinput == .hü ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                            Text("HÜ").foregroundStyle(notenartinput == .hü ? .white : Color("midgray"))
                        }
                    })
                    
                    
                    Button(action: {
                        notenartinput = .klassenarbeit
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(notenartinput == .klassenarbeit ? Color("midgray") : Color("lightgray"))
                                .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                .cornerRadius(5)
                            
                            Text("KA").foregroundStyle(notenartinput == .klassenarbeit ? .white : Color("midgray"))
                        }
                    })
                    
                    
                    Button(action: {
                        notenartinput = .epo
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(notenartinput == .epo ? Color("midgray") : Color("lightgray"))
                                .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                .cornerRadius(5)
                            
                            Text("EPO").foregroundStyle(notenartinput == .epo ? .white : Color("midgray"))
                        }
                    })
                }
                
                Divider()
                


                DatePicker("Datum", selection: $dateinput, displayedComponents: .date)

                
                Divider()
                HStack{
                    VStack{
                        
                        Button(action: {
                            selectednote = 1
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(selectednote == 1 ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                                Text("1").foregroundStyle(selectednote == 1 ? .white : Color("midgray"))
                            }
                        })
                        
                        Button(action: {
                            selectednote = 4
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(selectednote == 4 ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                                Text("4").foregroundStyle(selectednote == 4 ? .white : Color("midgray"))
                            }
                        })
                        
                    }
                    
                    VStack{
                        
                        Button(action: {
                            selectednote = 2
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(selectednote == 2 ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                                Text("2").foregroundStyle(selectednote == 2 ? .white : Color("midgray"))
                            }
                        })
                        
                        Button(action: {
                            selectednote = 5
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(selectednote == 5 ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                                Text("5").foregroundStyle(selectednote == 5 ? .white : Color("midgray"))
                            }
                        })
                        
                    }
                    
                    VStack{
                        
                        Button(action: {
                            selectednote = 3
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(selectednote == 3 ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                                Text("3").foregroundStyle(selectednote == 3 ? .white : Color("midgray"))
                            }
                        })
                        
                        Button(action: {
                            selectednote = 6
                        }, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(selectednote == 6 ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                                Text("6").foregroundStyle(selectednote == 6 ? .white : Color("midgray"))
                            }
                        })
                        
                    }
                }
                
                Divider()
                
                HStack{
                    Button(action: {
                        tendenz = .plus
                    }, label: {
                        ZStack{
                                Rectangle()
                                .foregroundColor(tendenz == .plus ? Color("midgray") : Color("lightgray"))
                                    .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                    .cornerRadius(5)
                                
                            Text("+").foregroundStyle(tendenz == .plus ? .white : Color("midgray"))
                        }
                    })
                    
                    
                    Button(action: {
                        tendenz = .null
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(tendenz == .null ? Color("midgray") : Color("lightgray"))
                                .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                .cornerRadius(5)
                            
                            Text("0").foregroundStyle(tendenz == .null ? .white : Color("midgray"))
                        }
                    })
                    
                    
                    Button(action: {
                        tendenz = .minus
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(tendenz == .minus ? Color("midgray") : Color("lightgray"))
                                .frame(width: (2*UIScreen.main.bounds.width) / 10, height: UIScreen.main.bounds.height / 25)
                                .cornerRadius(5)
                            
                            Text("-").foregroundStyle(tendenz == .minus ? .white : Color("midgray"))
                        }
                    })
                }
                
                Divider()
                Button(action: {
                    
                    for jahr in storage.schuljahre{
                        if jahr.jahr == storage.activeschuljahr{
                            for fach in jahr.fächer{
                                if fach.name == storage.activefach{
                                    fach.tests.append(testspeicher(datum_geschrieben: dateinput, note: selectednote, testart: notenartinput))
                                }
                            }
                        }
                    }
                    
                    
                    storage.addnote = false
                    self.updatetoggle.toggle()
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
                    storage.addnote = false
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
