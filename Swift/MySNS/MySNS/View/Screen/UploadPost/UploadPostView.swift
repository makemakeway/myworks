//
//  UploadPostView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct UploadPostView: View {
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var isPresented = false
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            VStack {
                if selectedImage == nil {
                    Button(action: { isPresented = true }, label: {
                        VStack(spacing: 24) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                            Text("게시물 작성")
                                .font(.system(size: 24, weight: .semibold))
                        }
                        .foregroundColor(.primary)
                    })
                    .fullScreenCover(isPresented: $isPresented, onDismiss: loadImage) {
                        ImagePicker(image: $selectedImage)
                    }
                    
                } else if let image = postImage {
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 96, height: 96)
                            .clipped()
                        
                        Spacer()
                        
                        TextField("문구 입력..", text: $captionText)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding()
                    
                    Button(action: {  }, label: {
                        Text("게시")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    })
                    .frame(width: 360, height: 40)
                    .background(Color(#colorLiteral(red: 0.1141172731, green: 0.541489393, blue: 1, alpha: 1)))
                    .cornerRadius(10)
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: { mode.wrappedValue.dismiss() }, label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.primary)
            }))
            .navigationBarTitle("새 게시물", displayMode: .inline)
        }
    }
}



extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}


struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
