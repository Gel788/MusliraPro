//
//  UltimateWelcomeView.swift
//  Muslirapro
//
//  World-Class Welcome Screen
//  Created by Альберт Гилоян on 22.09.2025.
//

import SwiftUI

struct UltimateWelcomeView: View {
    @State private var logoScale: CGFloat = 0.8
    @State private var logoOpacity: Double = 0
    @State private var textOpacity: Double = 0
    @State private var buttonOpacity: Double = 0
    @State private var signatureOpacity: Double = 0
    @State private var navigateToMain = false
    
    var body: some View {
        ZStack {
            // Premium Black Background
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // Logo Section
                VStack(spacing: 32) {
                    // Logo with subtle animation
                    VStack(spacing: 16) {
                        Image("Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .scaleEffect(logoScale)
                            .opacity(logoOpacity)
                        
                        VStack(spacing: 8) {
                            Text("MUSLIRA")
                                .font(.system(size: 36, weight: .bold, design: .rounded))
                                .tracking(3)
                                .foregroundColor(.white)
                            
                            Text("Pro")
                                .font(.system(size: 14, weight: .semibold))
                                .tracking(2)
                                .foregroundColor(.white.opacity(0.6))
                        }
                        .opacity(textOpacity)
                    }
                    
                    // Tagline
                    VStack(spacing: 12) {
                        Text("Music Platform")
                            .font(.system(size: 15, weight: .medium))
                            .tracking(1.5)
                            .foregroundColor(.white.opacity(0.5))
                        
                        Text("of the New Generation")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.white.opacity(0.4))
                    }
                    .opacity(textOpacity)
                    
                    // Features
                    HStack(spacing: 20) {
                        FeatureDot(text: "Live")
                        FeatureDot(text: "Artists")
                        FeatureDot(text: "Courses")
                    }
                    .opacity(textOpacity)
                    .padding(.top, 8)
                    
                    // Start Button
                    Button(action: { navigateToMain = true }) {
                        HStack(spacing: 10) {
                            Text("Get Started")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Image(systemName: "arrow.right")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            Capsule()
                                .fill(Color.white)
                        )
                    }
                    .opacity(buttonOpacity)
                    .padding(.horizontal, 48)
                    .padding(.top, 24)
                }
                
                Spacer()
                
                // Footer
                VStack(spacing: 8) {
                    Text("By Anna Simonyan")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.4))
                    
                    Text("© 2025 Muslira Pro")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.3))
                }
                .opacity(signatureOpacity)
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            startAnimations()
        }
        .fullScreenCover(isPresented: $navigateToMain) {
            MainTabView()
        }
    }
    
    private func startAnimations() {
        // Logo animation
        withAnimation(.easeOut(duration: 0.8)) {
            logoScale = 1.0
            logoOpacity = 1.0
        }
        
        // Text animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeOut(duration: 0.6)) {
                textOpacity = 1.0
            }
        }
        
        // Button animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.easeOut(duration: 0.6)) {
                buttonOpacity = 1.0
            }
        }
        
        // Signature animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeOut(duration: 0.6)) {
                signatureOpacity = 1.0
            }
        }
    }
}

// MARK: - Feature Dot
struct FeatureDot: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 6) {
            Circle()
                .fill(Color.white.opacity(0.2))
                .frame(width: 4, height: 4)
            
            Text(text)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
        }
    }
}

#Preview {
    UltimateWelcomeView()
}

