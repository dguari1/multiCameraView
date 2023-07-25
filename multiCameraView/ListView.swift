//
//  ListView.swift
//  multiCameraView
//
//  Created by DiegoGuarin on 7/17/23.
//

import SwiftUI

struct ListView: View {
    
    let resolutions = ["1920x1080","1280x720"]
    @State private var selectedResolution: Int = 0
    let FPS = ["60","30"]
    @State private var selectedFPS: Int = 0
    let codecs = ["hevc", "h.264"]
    @State private var selectedCodec: Int = 0
    let extensions = ["mp4","mov"]
    @State private var selectedExtension: Int = 0
    
    @State var desiredResolution: String = "1920x1080"
    @State var desiredFPS: String = "60"
    @State var desiredExtension: String = "mp4"
    @State var desiredCodec: String = "hevc"
    
    
    var body: some View {

        NavigationView {
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Resolution")
                        Picker(selection: $selectedResolution, label: Text("Resolution")) {
                            ForEach(0..<resolutions.count) {
                                Text(resolutions[$0]).padding()
                            }
                        }.padding(-10)
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedResolution){
                                desiredResolution = resolutions[selectedResolution]
                            }
                    }.padding(-5)
                    Spacer()
    
                    VStack(alignment:.leading) {
                        Text("FPS")
                        Picker(selection: $selectedFPS, label: Text("Resolution")) {
                            ForEach(0..<FPS.count) {
                                Text(FPS[$0]).padding()
                            }
                        }.padding(-10)
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedFPS){
                                desiredFPS = FPS[selectedFPS]
                            }
                    }.padding(-5)
                    Spacer()
     
                    VStack(alignment:.leading) {
                        Text("Codec")
                        Picker(selection: $selectedCodec, label: Text("Codec")) {
                            ForEach(0..<codecs.count) {
                                Text(codecs[$0]).padding()
                            }
                        }.padding(-10)
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedCodec){
                                desiredCodec = codecs[selectedCodec]
//                                if (desiredCodec == "hevc") {
//                                    selectedExtension = 1
//                                }
                            }
                    }.padding(-5)
                    
                    Spacer()
                    VStack(alignment:.leading) {
                        Text("Extension")
                        Picker(selection: $selectedExtension, label: Text("Extension")) {
                            ForEach(0..<extensions.count) {
                                Text(extensions[$0]).padding()
                            }
                        }.padding(-10)
                            .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedExtension){
                                if selectedCodec == 1 && selectedExtension == 0 {
                                    selectedExtension = 1
                                }
                                desiredExtension = extensions[selectedExtension]
                            }
           
                    }.padding(-5)
                    Spacer()
                    
                }
                
                List {
                    NavigationLink{
                        CameraViewWrapper(desiredResolution: $desiredResolution, desiredFPS: $desiredFPS, desiredExtension: $desiredExtension, desiredCodec: $desiredCodec)
                    } label: {
                        Text("Custom Recording")
                    }.padding()
                    NavigationLink{
                        
                        CameraViewHandsWrapper(desiredResolution: $desiredResolution, desiredFPS: $desiredFPS, desiredExtension: $desiredExtension, desiredCodec: $desiredCodec, chilarity:"Right")
                        
                    } label: {
                        Text("Finger Tapping - Right Hand")
                    }.padding()
                    NavigationLink{
                        CameraViewHandsWrapper(desiredResolution: $desiredResolution, desiredFPS: $desiredFPS, desiredExtension: $desiredExtension, desiredCodec: $desiredCodec, chilarity:"Left")
                        
                    } label: {
                        Text("Finger Tapping - Left Hand")
                    }.padding()
                    NavigationLink{
                        
                    } label: {
                        Text("Leg Agility - Right Foot")
                    }.padding()
                    NavigationLink{
                        
                    } label: {
                        Text("Leg Agility - Left Foot")
                    }.padding()
                    NavigationLink{
                        
                    } label: {
                        Text("Standing from Chair")
                    }.padding()
                    NavigationLink{
                        
                    } label: {
                        Text("Audio Recording")
                    }.padding()
                }
            }
            
        }.navigationTitle("Custom Camera App")
        

    }
    
}

#Preview {
    ListView()
}
