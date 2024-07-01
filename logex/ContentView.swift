//
//  ContentView.swift
//  logex
//
//  Created by Prasiddha Shrestha on 6/30/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Login") {
                login()
            }
            .padding()
            Button("Sign Up") {
                signUp()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Authentication Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                // Proceed to the main part of your app
                self.alertMessage = "Login Successful!"
                self.showAlert = true
            }
        }
    }

    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.alertMessage = error.localizedDescription
                self.showAlert = true
            } else {
                // User was created successfully
                self.alertMessage = "Sign Up Successful!"
                self.showAlert = true
            }
        }
    }
}
