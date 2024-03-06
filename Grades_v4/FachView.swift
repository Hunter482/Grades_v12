//
//  FachView.swift
//  Grades_v4
//
//  Created by Jakob Erlebach on 04.03.24.
//

import SwiftUI

struct FachView: View {
    
    var buttoncolor: Color = .red
    @ObservedObject var storage: storageclass
    @State var refreshtoogle: Bool = false
    @State var klassenarbeitenvorhanden: [testspeicher]
    @State var hüvorhanden: [testspeicher]
    @State var epovorhanden: [testspeicher]
    @State var offsetlistKA: [CGFloat]
    @State var KAoffsetted: Bool = false
    
    @State var testcounter: Int = 0
    
    init(storage: storageclass) {
        self.storage = storage
        self.hüvorhanden = []
        self.klassenarbeitenvorhanden = []
        self.epovorhanden = []
        
        
        var hüspeicher: [testspeicher] = []
        var klassenarbeitenspeicher: [testspeicher] = []
        var epospeicher: [testspeicher] = []
        var offsetlistKAspeicher: [CGFloat] = []
        
        var counter = 0
        for jahr in storage.schuljahre{
            if jahr.jahr == storage.activeschuljahr{
                var counter2 = 0
                for fach in storage.schuljahre[counter].fächer{
                    if fach.name == storage.activefach{
                        var counter3 = 0
                        for test in storage.schuljahre[counter].fächer[counter2].tests{
                            switch test.testart {
                            case .hü:
                                hüspeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                            case .klassenarbeit:
                                klassenarbeitenspeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                                offsetlistKAspeicher.append(CGFloat(0))
                                print("Added KA")
                            case .epo:
                                epospeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                            }
                            counter3 += 1
                        }
                    }
                    counter2 += 1
                }
            }
            counter += 1
        }
        
        _hüvorhanden = State(initialValue: hüspeicher)
        _klassenarbeitenvorhanden = State(initialValue: klassenarbeitenspeicher)
        //_epovorhanden = State(initialValue: epospeicher)
        _offsetlistKA = State(initialValue: offsetlistKAspeicher)
    }
    
    func initialize(){
        hüvorhanden = []
        klassenarbeitenvorhanden = []
        epovorhanden = []
        
        
        var hüspeicher: [testspeicher] = []
        var klassenarbeitenspeicher: [testspeicher] = []
        var epospeicher: [testspeicher] = []
        var offsetlistKAspeicher: [CGFloat] = []
        
        var counter = 0
        for jahr in storage.schuljahre{
            if jahr.jahr == storage.activeschuljahr{
                var counter2 = 0
                for fach in storage.schuljahre[counter].fächer{
                    if fach.name == storage.activefach{
                        var counter3 = 0
                        for test in storage.schuljahre[counter].fächer[counter2].tests{
                            switch test.testart {
                            case .hü:
                                hüspeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                            case .klassenarbeit:
                                klassenarbeitenspeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                                offsetlistKAspeicher.append(CGFloat(0))
                                print("Added KA")
                            case .epo:
                                epospeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                            }
                            counter3 += 1
                        }
                    }
                    counter2 += 1
                }
            }
            counter += 1
        }
        
        hüvorhanden = hüspeicher
        klassenarbeitenvorhanden = klassenarbeitenspeicher
        epovorhanden = epospeicher
        offsetlistKA = offsetlistKAspeicher
    }
    
    func deleteKA(at offsets: IndexSet){
        klassenarbeitenvorhanden.remove(atOffsets: offsets)
    }
    
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    Divider()
                        .onChange(of: refreshtoogle, {
                            initialize()
                        })
                    if klassenarbeitenvorhanden.count > 0{
                        HStack{
                            Text("Klassenarbeiten").frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                .font(.title)
                                .bold()
                            
                        label: do {
                            HStack{
                                Text("-,--")
                                    .font(.title2)
                                    .foregroundStyle(Color("midgray"))
                                
                                Text("Ø").font(.title2)
                                    .bold()
                            }.padding(.trailing, 20)
                        }
                            
                        }
                        
                        ForEach(klassenarbeitenvorhanden.indices, id: \.self) { index in
                            HStack(){
                                Notenkasten(note: String(klassenarbeitenvorhanden[index].note), testtyp: klassenarbeitenvorhanden[index].testart)
                                    .padding(.horizontal)
                                    .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                        .onChanged({ value in
                                            self.offsetlistKA[index] = value.translation.width
                                            for offindex in offsetlistKA.indices{
                                                if offindex != index{
                                                    self.offsetlistKA[offindex] = CGFloat(0)
                                                }
                                            }
                                        })
                                             
                                            .onEnded({ value in
                                                testcounter += 1
                                                if value.translation.width < 0 {
                                                    KAoffsetted = true
                                                    self.offsetlistKA[index] = -90
                                                }else{
                                                    KAoffsetted = false
                                                    //self.offset = 0
                                                }
                                            }))
                                
                                Button {
                                    self.klassenarbeitenvorhanden.remove(at: index)
                                    self.offsetlistKA.remove(at: index)
                                    for jahr in storage.schuljahre.indices{
                                        if storage. == storage.activeschuljahr{
                                            for
                                        }
                                    }
                                } label: {
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.red)
                                            .cornerRadius(15)
                                            .frame(width: 70, alignment: .trailing)
                                        
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .scaledToFit()
                                            .foregroundColor(.white)
                                            
                                    }
                                }
                                .padding(.trailing, -70)
                            }
                            .offset(x: offsetlistKA[index])
                        }
                        
                        Divider()
                    }
                    
                    if hüvorhanden.count > 0{
                        HStack{
                            Text("HÜ´S").frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                .font(.title)
                                .bold()
                            
                        label: do {
                            HStack{
                                Text("-,--")
                                    .font(.title2)
                                    .foregroundStyle(Color("midgray"))
                                
                                Text("Ø").font(.title2)
                                    .bold()
                            }.padding(.trailing, 20)
                        }
                            
                        }
                        
                        
                        ForEach(hüvorhanden, id: \.self) { test in
                            
                            Notenkasten(note: String(test.note), testtyp: test.testart)
                        }
                        
                        Divider()
                    }
                    if epovorhanden.count > 0{
                        HStack{
                            Text("EPO'S").frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                .font(.title)
                                .bold()
                            
                        label: do {
                            HStack{
                                Text("-,--")
                                    .font(.title2)
                                    .foregroundStyle(Color("midgray"))
                                
                                Text("Ø").font(.title2)
                                    .bold()
                            }.padding(.trailing, 20)
                        }
                            
                        }
                        ForEach(epovorhanden, id: \.self) { test in
                            Notenkasten(note: String(test.note), testtyp: test.testart)
                        }
                        .onDelete(perform: { indexSet in
                            print("Test")
                        })
                        Divider()
                    }
                    
                    
                    Button("Löschen") {
                        
                    }.bold().font(.title3).foregroundColor(buttoncolor).frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    
                    
                }.navigationBarItems(trailing: Button(action: {
                    storage.addnote = true
                }){
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                        .foregroundColor(.blue)
                } )
                .navigationBarItems(leading: Button(action: {
                    
                }){
                    Button(action: {
                        storage.activeview = .schuljahr
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                                .foregroundColor(.blue)
                            
                            Text("Zurück")
                        }
                    })
                    
                    
                } )
                .navigationTitle(storage.activefach)
            }
            if storage.addnote{
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .ignoresSafeArea(edges: .all)
                
                addnoteview(storage: storage, updatetoggle: $refreshtoogle, notenartinput: .klassenarbeit)
                    .padding(.horizontal, UIScreen.main.bounds.width / 6)
        }
        
    }
    
    }
}

struct FachView_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}



/*
 self.storage = storage
 self.hüvorhanden = []
 self.klassenarbeitenvorhanden = []
 self.epovorhanden = []
 
 
 var hüspeicher: [testspeicher] = []
 var klassenarbeitenspeicher: [testspeicher] = []
 var epospeicher: [testspeicher] = []
 var offsetlistKAspeicher: [CGFloat] = []
 
 var counter = 0
 for jahr in storage.schuljahre{
     if jahr.jahr == storage.activeschuljahr{
         var counter2 = 0
         for fach in storage.schuljahre[counter].fächer{
             if fach.name == storage.activefach{
                 var counter3 = 0
                 for test in storage.schuljahre[counter].fächer[counter2].tests{
                     switch test.testart {
                     case .hü:
                         hüspeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                     case .klassenarbeit:
                         klassenarbeitenspeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                         offsetlistKAspeicher.append(CGFloat(0))
                         print("Added KA")
                     case .epo:
                         epospeicher.append(storage.schuljahre[counter].fächer[counter2].tests[counter3])
                     }
                     counter3 += 1
                 }
             }
             counter2 += 1
         }
     }
     counter += 1
 }
 
 _hüvorhanden = State(initialValue: hüspeicher)
 _klassenarbeitenvorhanden = State(initialValue: klassenarbeitenspeicher)
 //_epovorhanden = State(initialValue: epospeicher)
 _offsetlistKA = State(initialValue: offsetlistKAspeicher)
 */
