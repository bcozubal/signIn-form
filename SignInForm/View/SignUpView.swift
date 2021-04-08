//
//  SignUpView.swift
//  SignInForm
//
//  Created by Barış Özübal on 25.02.2021.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var secured = false
    @State private var acceptedTerms = false
    @State private var valid = false
    
    @State private var presentTermsView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section(header: Text("USERNAME & E-MAIL")) {
                        TextField("Username", text: $username)
                        
                        HStack {
                            TextField("E-mail", text: $email, onEditingChanged: { (changed) in
                                if email.isValidEmail {
                                    valid = true
                                } else {
                                    valid = false
                                }
                            })
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            Spacer()
                            Image(systemName: valid ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(valid ? .green : .red)
                        }
                    }
                    
                    Section(header: Text("PASSWORD")) {
                        SecureField("Password", text: self.$password)
                            .autocapitalization(.none)
                        
                        SecureField("Confirm Password", text: self.$confirmPassword)
                            .autocapitalization(.none)
                        
                    }
                    
                    Section(header: Text("Terms and Conditions")) {
                        Toggle(isOn: $acceptedTerms) {
                            Text("I agree to the terms & conditions")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .onTapGesture {
                                    presentTermsView.toggle()
                                }
                        }
                    }
                }
                
            }
            .sheet(isPresented: $presentTermsView) {
                TermsView(acceptedTerms: $acceptedTerms)
            }
            .navigationBarTitle(Text("Sign Up"),displayMode: .inline)
            .navigationBarItems( leading: Button(action: { presentationMode.wrappedValue.dismiss() }) { Text("Cancel") }, trailing: Button(action: { print("done action") }) { Text("Done") } )
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
