//
//  NewTabView.swift
//  MultiWindowApp
//
//  Created by Michele Manniello on 06/11/22.
//

import SwiftUI
struct NewTabView:View {
    var tab: Tab?
    var isRootView:Bool = false
//    MARK: View Properties
    @State var searchText:String = ""
    
//    MARK: macOS 13+ API
    @Environment(\.openWindow) var openWindow
    
    var body: some View{
        VStack(spacing: 0){
//            MARKL Building Chrome Like UI
            HStack(spacing: 4){
                CustomButtonView(systemImage: "arrow.left") {
                    
                }
                .foregroundColor(.gray)
                
                CustomButtonView(systemImage: "arrow.right") {
                    
                }
                .foregroundColor(.gray)
                
                CustomButtonView(systemImage: "arrow.clockwise") {
                    
                }
                .foregroundColor(.white)
                
//                MARK: Search Bar
                SearchBar()
                
                CustomButtonView(systemImage: "star") {
                    
                }
                .foregroundColor(.gray)
                
//                MARK: Menu Button
                Menu {
                    Button("New Window"){
//                        MARK: Adding New Window
//                        Pass Your Addictional Info Here
                        let newTab = Tab()
                        openWindow(value: newTab)
                    }
                    .keyboardShortcut("k")
                    Button("Help"){
                        
                    }
                    Button(isRootView ? "Quit" : "Close Window"){
//                        MARK: blosing Current Window / Quitting the Entire App
                        if isRootView{
                            NSApplication.shared.terminate(nil)
                        }else{
                            NSApplication.shared.mainWindow?.close()
                        }
                    }
                    .keyboardShortcut("o")
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .rotationEffect(.init(degrees: 90))
                        .frame(width: 20, height: 20)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .keyboardShortcut("m")
//                MARK: Adding keyboard ShortCuts
//       CMD + M -> menu
//       CMD + M + K ->  openNew Tab
//       CMD + M + O ->  Close/Quit

                
            }
            .padding(.vertical,5)
            .padding(.horizontal,10)
            .background {
                Color("NavBar")
                    .ignoresSafeArea()
            }
            ZStack{
                Color("BG")
            }
            
        }
//        MARK: YOUR CUSTOM SIZE
        .frame(minWidth: 500, minHeight: 400)
    }
    
    @ViewBuilder
    func SearchBar() -> some View {
        TextField("Search Google or type a URL", text: $searchText)
            .textFieldStyle(.plain)
            .padding(.vertical,6)
            .padding(.horizontal,10)
            .background{
                Capsule()
                    .fill(.black)
            }
    }
    
//    MARK: Custom Button
    @ViewBuilder
    func CustomButtonView(systemImage:String,onTap:@escaping ()->()) -> some View {
        Button {
            onTap()
        } label: {
            Image(systemName: systemImage)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: 20, height: 20)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)

    }
    
}
struct NewTabView_Previews:PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
