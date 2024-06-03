//
//  FlashcardView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 3/20/24.
//
import SwiftUI
import CoreHaptics

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

struct FlashCardStudyView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    
    
    @Binding var currentFlashCardSet: FlashCardSet
    @Binding var flashCardScreen: FlashCardScreen
    
    @State private var startAnimation: Bool = false
    @State private var isActive = true
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var showingEditScreen = false
    
    @State private var showingSettingScreen = false
    @State private var reuseCards = false
    
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Button {
                        flashCardScreen = .flashCardSetInfoView
                    } label: {
                        FlashCardSetView(flashCardSet: currentFlashCardSet)
                    }

                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.showingSettingScreen = true
                        }) {
                            Image(systemName: "gear.circle.fill")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 40, height: 40)
                                
                                .background(Color.orangeA)
                                .cornerRadius(20)
                                .shadow(radius: 2, y: 1)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                
                
                ZStack {
                    ForEach(0 ..< currentFlashCardSet.cards.count, id: \.self) {index in
                        CardView(card: currentFlashCardSet.cards[index]) {
                            withAnimation {
                                if reuseCards {
                                    
                                    self.pushCardToBack(at: index)
                                    
                                } else {
                                    self.removeCard(at: index)
                                }
                                self.errorHaptic()
                            }
                        }
                        .stacked(at: index, in: self.currentFlashCardSet.cards.count)
                        .allowsHitTesting(index == self.currentFlashCardSet.cards.count - 1)
                        .accessibilityHidden(index < self.currentFlashCardSet.cards.count - 1)
                    }
                }
                .allowsTightening(timeRemaining > 0)
                
                if currentFlashCardSet.cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(25)
                }
                Spacer()
            }
        }
        .onReceive(timer) {time in
            guard self.isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if currentFlashCardSet.cards.isEmpty == false {
                self.isActive = true
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCardsView(currentFlashCardSet: $currentFlashCardSet)
        }
        .sheet(isPresented: $showingSettingScreen, onDismiss: nil) {
            SettingsView(reuseCards: self.$reuseCards)
        }
        .onAppear(perform: performFunctions)
    }
    
    func performFunctions() {
        resetCards()
        prepareHaptics()
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func errorHaptic() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let eventOne = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(eventOne)
        let eventTwo = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0.1)
        events.append(eventTwo)

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        
        currentFlashCardSet.cards.remove(at: index)
        
        if currentFlashCardSet.cards.isEmpty {
            isActive = false
        }
    }
    
    func pushCardToBack(at index: Int) {
        let reuseCard = currentFlashCardSet.cards.remove(at: index)
        currentFlashCardSet.cards.insert(reuseCard, at: 0)
        
        if currentFlashCardSet.cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        loadData()
        timeRemaining = 100
        isActive = true
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.currentFlashCardSet.cards = decoded
            }
        }
    }
}



// preview
struct FlashCardStudyView_Preview: PreviewProvider {
    static var previews: some View {
        FlashCardStudyView(currentFlashCardSet: Binding.constant(flashCardSetExample), flashCardScreen: Binding.constant(FlashCardScreen.flashCardSetsView))
    }
}






struct DefaultButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black.opacity(0.7))
            .clipShape(Circle())
    }
}

extension View {
    func defaultButtonStyle() -> some View {
        modifier(DefaultButton())
    }
}

struct AccessibilityButton: View {
    
    var imageName: String
    var accessibilityLabel: String
    var accessibilityHint: String
    var targetAction: (() -> Void)
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.targetAction()
            }
        }, label: {
            Image(systemName: imageName)
                .defaultButtonStyle()
        })
        .accessibilityLabel(Text(self.accessibilityLabel))
        .accessibility(hint: Text(self.accessibilityHint))
    }
}
