//
//  startsreen.swift
//  Grades_v4
//
//  Created by Etienne Hüttl on 16.03.24.
//

import SwiftUI

struct startsreen: View {
    
    @ObservedObject var storage: storageclass
    
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    Divider()
                    
                    ForEach(storage.schuljahre, id: \.self) { jahr in
                        Button(action: {
                            storage.activeview = .schuljahr
                            storage.activeschuljahr = jahr.jahr
                            
                        }, label: {
                            schuljahr(schuljahr: jahr)
                        })
                        
                        
                    }
                    
                    
                }.navigationBarItems(trailing: Button(action: {
                    storage.addschuljahr = true
                }){
                    Image(systemName: "plus.rectangle.on.folder.fill")
                        .resizable()
                        .scaledToFit()
                        .padding(4)
                        .frame(width: 45, height: 35)
                    
                        .foregroundColor(.blue)
                } )
                .navigationTitle("GRADES").frame(maxWidth: .infinity, alignment: .leading)
            }
            if storage.addschuljahr{
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .ignoresSafeArea(edges: .all)
                
                addschuljarviwe(storage: storage)
                    .padding(.horizontal, UIScreen.main.bounds.width / 6)
            }
            
        }
    }
}

#Preview {
    Wrapper()
}
