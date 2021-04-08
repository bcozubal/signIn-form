//
//  SignInView.swift
//  SignInForm
//
//  Created by Barış Özübal on 25.02.2021.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var secured = false
    
    @State private var presentSignUpView = false
    
    var body: some View {
        NavigationView {
            Form {
                Image("signin-image")
                    .resizable()
                    .scaledToFit()
                    //.padding(30)
                    .listRowInsets(EdgeInsets())
                
                Section(header: Text("E-MAIL & PASSWORD")) {
                    TextField("E-mail", text: $email)
                        .autocapitalization(.none)
                    
                    ZStack {
                        if self.secured {
                            TextField("Password", text: self.$password)
                                .autocapitalization(.none)
                            
                        } else {
                            SecureField("Password", text: self.$password)
                                .autocapitalization(.none)
                        }
                        
                        Image(systemName: secured ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .onTapGesture {
                                secured.toggle()
                            }
                    }
                    
                    Button(action: { resetPassword() }) {
                        Text("Forgot password?")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                }
                
                Section(footer: HStack {
                    Spacer()
                    
                    Button(action: { presentSignUpView.toggle() } ) {
                        VStack {
                            Text("Don't have an account?")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("Sign Up")
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    Spacer()
                }) {
                    Button(action: { print("logged in")} ) {
                        Text("Continue")
                    }}
            }
            .navigationBarTitle(Text("Welcome"),displayMode: .large)
            .sheet(isPresented: $presentSignUpView) {
                SignUpView()
            }
        }
    }
    
    func resetPassword() {
        let alert = UIAlertController(title: "Reset Your Password!", message: "Please enter your email address, we'll send you a link to reset your password.", preferredStyle: .alert)
        
        alert.addTextField {(textField) in
            textField.placeholder = "Email Address"
            textField.keyboardType = .emailAddress
            textField.text = email
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { ( _ ) in
            
            //OK ACTION SAMPLE
            //sampleViewModel.forgotPassword(email: alert.textFields![0].text!) { (error) in
            //    print(error ?? "")
            //}
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
