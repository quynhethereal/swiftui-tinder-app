//
//  AddImageView.swift
//  TinderApp
//
//  Created by Le Helen on 11/09/2022.
//

import SwiftUI
import ImagePickerView

struct AddImageView: View {
    @StateObject var viewModel = ProfileRegistrationViewModel()
    @EnvironmentObject var userViewModel: UserSignInViewModel
    @State private var disableButton: Bool = true
    
    @State var isImagePickerViewPresented = false
    //    @State var pickedImages: [ImagePickerResult.SelectedImage]? = nil
    @State var pickedImages: [UIImage]? = nil
    @State var didSelect: Bool = false
    
    var body: some View {
        VStack {
            Spacer().frame(height: 50)
            Text("Thêm ảnh")
                .font(.system(size: 45, weight: .medium, design: .default))
                .padding(.leading, -10)
            Text("Thêm ít nhất 2 ảnh để tiếp tục.")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.gray)
                .padding(.bottom, 50)
            
            Group {
                HStack {
                    ZStack {
                        Image("abc")
                            .resizable()
                        //                            .modifier(ImageModifier())
                            .overlay(
                                Button {
                                    isImagePickerViewPresented = true
                                } label: {
                                    VStack {
                                        Image(systemName: "camera")
                                            .font(.largeTitle)
                                    }
                                }
                                    .sheet(isPresented: $isImagePickerViewPresented) {
                                        ImagePickerView(filter: .any(of: [.images, .livePhotos]), selectionLimit: 0, delegate: ImagePickerView.Delegate(isPresented: $isImagePickerViewPresented, didCancel: { (phPickerViewController) in
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
                            )
                    }
                    .frame(width: 100, height: 160)
                    Spacer().frame(width: 30)
                    
                }
                Spacer().frame(height: 40)
                HStack {
                  
                    Spacer().frame(width: 30)
                    //                            ZStack {
                    //                                Image(viewModel.images[4])
                    //                                    .resizable()
                    //                                    .modifier(ImageModifier())
                    //                                    .overlay(
                    //                                        Button(action: {
                    //                                            addOrDeleteImage(4, imageName: "gin")
                    //                                        }) {
                    //                                            if !viewModel.images[4].contains("localimage") {
                    //                                                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    //                                                            .mask(Image(systemName: "multiply.circle")
                    //                                                            .resizable()
                    //                                                            .aspectRatio(contentMode: .fit)
                    //                                                )
                    //                                            } else {
                    //                                                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    //                                                            .mask(Image(systemName: "plus.circle.fill")
                    //                                                            .resizable()
                    //                                                            .aspectRatio(contentMode: .fit)
                    //                                                )
                    //                                            }
                    //                                        }
                    //                                        .modifier(AddImageButtonModifier()),
                    //                                        alignment: .bottomTrailing
                    //                                    )
                    //                            }
                    //                            .frame(width: 100, height: 160)
                    Spacer().frame(width: 30)
                    //                            ZStack {
                    //                                Image(viewModel.images[5])
                    //                                    .resizable()
                    //                                    .modifier(ImageModifier())
                    //                                    .overlay(
                    //                                        Button(action: {
                    //                                            addOrDeleteImage(5, imageName: "gin")
                    //                                        }) {
                    //                                            if !viewModel.images[5].contains("localimage") {
                    //                                                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    //                                                            .mask(Image(systemName: "multiply.circle")
                    //                                                            .resizable()
                    //                                                            .aspectRatio(contentMode: .fit)
                    //                                                )
                    //                                            } else {
                    //                                                LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightRed")]), startPoint: .leading, endPoint: .trailing)
                    //                                                            .mask(Image(systemName: "plus.circle.fill")
                    //                                                            .resizable()
                    //                                                            .aspectRatio(contentMode: .fit)
                    //                                                )
                    //                                            }
                    //                                        }
                    //                                        .modifier(AddImageButtonModifier()),
                    //                                        alignment: .bottomTrailing
                    //                                    )
                    //                            }
                    //                            .frame(width: 100, height: 160)
                }
            }
            Spacer()
            Button {
                
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
            Spacer().frame(height: 40)
        }
        .overlay(
            Button(action: {
                
            }) {
                Image("darkGrayBackButton")
                    .resizable()
                    .scaledToFit()
            }
                .modifier(BackButtonModifier()),
            alignment: .topLeading
        )
        .padding(20)
    }
    
    
    func numberOfImages() -> Int {
        return (pickedImages?.count ?? 0)
    }
    
    
    //            func addOrDeleteImage(_ position: Int, imageName: String) {
    //                if viewModel.images[position].contains("localimage") {
    //                    viewModel.images[position] = imageName
    //                    viewModel.countAddedImage += 1
    //                } else if !viewModel.images[position].contains("localimage") {
    //                    viewModel.images[position] = "localimage"
    //                    viewModel.countAddedImage -= 1
    //                }
    //            }
}

struct AddImageView_Previews: PreviewProvider {
    static var previews: some View {
        AddImageView()
    }
}
