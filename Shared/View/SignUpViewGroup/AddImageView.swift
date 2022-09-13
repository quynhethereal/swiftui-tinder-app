//
//  AddImageView.swift
//  TinderApp
//
//  Created by Le Helen on 11/09/2022.
//

import SwiftUI
import ImagePickerView
import FirebaseStorage

struct AddImageView: View {
    @EnvironmentObject var viewModel : ProfileRegistrationViewModel
    @EnvironmentObject var userViewModel: UserSignInViewModel
    @State private var disableButton: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isImagePickerViewPresented = false
    //    @State var pickedImages: [ImagePickerResult.SelectedImage]? = nil
    @State var pickedImages: [UIImage]? = nil
    @State var didSelect: Bool = false
    @State var currentIndex = 0
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50)
                Text("Thêm ảnh")
                    .font(.system(size: 45, weight: .medium, design: .default))
                    .padding(.leading, -10)
//                    .opacity(disableButton ? 1 : 0)

                Text("Thêm ít nhất 2 ảnh để tiếp tục.")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                    .padding(.bottom, 50)
                    .opacity(disableButton ? 1 : 0)

                
                Group {
                    HStack {
                        ZStack {
                            Button {
                                isImagePickerViewPresented = true
                            } label: {
                                ZStack {
                                    VStack {
                                        Image(systemName: "camera")
                                            .font(.largeTitle)
                                    }
                                    
                                }
                                
                            }
                            .sheet(isPresented: $isImagePickerViewPresented) {
                                ImagePickerView(filter:
                                        .any(of: [.images, .livePhotos]),
                                                selectionLimit: 0,
                                                delegate: ImagePickerView.Delegate(
                                                    isPresented: $isImagePickerViewPresented,
                                                    didCancel: { (phPickerViewController) in
                                                        print("Did Cancel: \(phPickerViewController)")
                                                    }, didSelect: { (result) in
                                                        let phPickerViewController = result.picker
                                                        let images = result.images
                                                        
                                                        print("Did Select images: \(images) from \(phPickerViewController)")
                                                        
                                                        pickedImages = images
                                                        
                                                        if images.count >= 2{
                                                            disableButton = false
                                                        }
                                                        
                                                        
                                                    }, didFail: { (imagePickerError) in
                                                        let phPickerViewController = imagePickerError.picker
                                                        let error = imagePickerError.error
                                                        print("Did Fail with error: \(error) in \(phPickerViewController)")
                                                    }))
                            }
                            .opacity(disableButton ? 1 : 0)
//                            .disabled(disableButton == false)
                            
                            VStack {
                                if !(pickedImages == nil) {
                                    VStack {
                                        
                                        TabView(selection: $currentIndex) {
                                            ForEach(0..<(pickedImages!.count ), id: \.self) { num in
                                                Image(uiImage: pickedImages![num]).resizable().scaledToFill().tag(num).cornerRadius(5)
                                            }
                                        }
                                        .tabViewStyle(PageTabViewStyle())
                                        .onReceive(timer, perform: { _ in
                                            currentIndex = currentIndex < (pickedImages!.count - 1) ? currentIndex + 1 : 0
                                            print(currentIndex)
                                        })
                                        .frame(height: 300)
                                    }
                                    .opacity(disableButton ? 0 : 1)
                                }
                            }
                            .frame(height: 300)
                            
                        }
                        .frame(width: 400, height: 200)
//                        Spacer().frame(width: 30)
                        
                    }
//                    Spacer().frame(height: 40)
//                    HStack {
//
//                        Spacer().frame(width: 30)
//
//                        Spacer().frame(width: 30)
//                    }
                }
                Spacer()
                Button {
                    uploadtoFirebase()
                    
                    
                } label: {
                    if pickedImages?.count ?? 0 >= 2 {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextEnable())
                    } else {
                        Text("TIẾP TỤC")
                            .modifier(ButtonNextDisable())
                    }
                    
                }
                .disabled(disableButton)
                .padding(.horizontal, 30)
                .onChange(of: pickedImages?.count, perform: {newValue in
                    if newValue! >= 2 {
                        self.disableButton = false
                    } else if newValue! < 2 {
                        self.disableButton = true
                    }
                })
                
                Spacer().frame(height: 40)
            }
            .overlay(
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image("darkGrayBackButton")
                        .resizable()
                        .scaledToFit()
                }
                    .modifier(BackButtonModifier()),
                alignment: .topLeading
            )
            .padding(20)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
    
    func numberOfImages() -> Int {
        return (pickedImages?.count ?? 0)
    }
    
    func uploadtoFirebase(){
        disableButton = true
        for (_,image) in pickedImages?.enumerated() ?? [].enumerated() {
            if let data = image.jpegData(compressionQuality: 1.0) {
                let storage = Storage.storage()
                let storageRef = storage.reference()
                // Create a reference to the file you want to upload
                let directory = "uploads/"
                
                let filename = UUID().uuidString
                
                let newMetadata = StorageMetadata()
                newMetadata.contentType = "image/jpeg"
                
                
                let fileRef = storageRef.child(directory + "\(filename)")
                
                _ = fileRef.putData(data, metadata: newMetadata) { metadata, error in
                    fileRef.downloadURL { (url, error) in
                        
                        if let error = error {
                            
                            print("Failed to retrieve download url: \(error)")
                            return
                        }
                        
                        viewModel.userProfile.images.append(url?.absoluteString ?? "errorURL")
                        viewModel.createNewProfile(userProfile: viewModel.userProfile){result in}
                        UserDefaults.standard.set(true, forKey: "userprofile")
                        disableButton = false
                        
                    }
                    
                }
            }
        }
        
    }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}
