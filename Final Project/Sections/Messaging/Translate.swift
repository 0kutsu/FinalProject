
//  Translate.swift
//  Final Project
//
//  Created by Ivan Xiong (student LM) on 4/29/24.
//
import Foundation
// Define a dictionary mapping Spanish words to English translations: add more/delete some for demo as needed
let spanishToEnglish: [String: String] = [
    "hola": "hello",
    "buenos dias": "good morning",
    "buenas tardes": "good afternoon",
    "buenas noches": "good evening",
    "adios": "goodbye",
    "por favor": "please",
    "gracias": "thank you",
    "de nada": "you're welcome",
    "si": "yes",
    "no": "no",
    "mi": "my",
    "la": "the",
    "los": "the",
    "el": "the/he",
    "un poco": "a little",
    "un":"a",
    "de": "of",
    "espanol": "spanish",
    "bano": "bathroom",
    "donde" : "where"
    "como estas": "how are you",
    "estoy bien": "I'm fine",
    "lo siento": "I'm sorry",
    "perdon": "excuse me",
    "hablo": "I speak",
    "que tal": "how's it going",
    "mucho gusto": "nice to meet you",
    "como te llamas": "what's your name",
    "bienvenido": "welcome",
    "que pasa": "what's happening",
    "no se": "I don't know",
    "como se dice": "how do you say",
    "felicidades": "congratulations",
    "queso": "cheese",
    "amigo": "friend",
    "amor": "love",
    "ano": "year",
    "casa": "house",
    "cosa": "thing",
    "ciudad": "city",
    "dia": "day",
    "dinero": "money",
    "doctor": "doctor",
    "familia": "family",
    "forma": "form",
    "gente": "people",
    "gobierno": "government",
    "grupo": "group",
    "hijo": "son",
    "historia": "history",
    "hombre": "man",
    "hora": "hour",
    "idea": "idea",
    "iglesia": "church",
    "informacion": "information",
    "juego": "game",
    "lado": "side",
    "lugar": "place",
    "mano": "hand",
    "mujer": "woman",
    "mundo": "world",
    "nino": "child",
    "noche": "night",
    "nombre": "name",
    "numero": "number",
    "ojo": "eye",
    "padre": "father",
    "pais": "country",
    "palabra": "word",
    "parte": "part",
    "persona": "person",
    "pie": "foot",
    "pueblo": "town",
    "punto": "point",
    "razon": "reason",
    "semana": "week",
    "senor": "Mr.",
    "senora": "Mrs.",
    "senorita": "Miss",
    "servicio": "service",
    "sistema": "system",
    "sitio": "site",
    "sociedad": "society",
    "trabajo": "work",
    "vida": "life",
    "voz": "voice",
    "agua": "water",
    "aire": "air",
    "animal": "animal",
    "arte": "art",
    "barrio": "neighborhood",
    "biblioteca": "library",
    "calle": "street",
    "cama": "bed",
    "campo": "field",
    "carro": "car",
    "cielo": "sky",
    "clase": "class",
    "color": "color",
    "comida": "food",
    "cuerpo": "body",
    "derecho": "right",
    "edad": "age",
    "escuela": "school",
    "fiesta": "party",
    "flor": "flower",
    "foto": "photo",
    "fruta": "fruit",
    "guerra": "war",
    "hermano": "brother",
    "hermana": "sister",
    "hija": "daughter",
    "jardin": "garden",
    "joven": "young person",
    "luz": "light",
    "madre": "mother",
    "mar": "sea",
    "mesa": "table",
    "musica": "music",
    "nacion": "nation",
    "papa": "potato",
    "parque": "park",
    "pelicula": "movie",
    "plaza": "square",
    "puerta": "door",
    "rio": "river",
    "sabor": "flavor",
    "salud": "health",
    "silla": "chair",
    "sol": "sun",
    "television": "television",
    "tierra": "earth",
    "tren": "train",
    "ventana": "window",
    "viaje": "trip",
    "vino": "wine"
]

func translateSpanishToEnglish(_ spanishText: String) -> String {
    let cleanedText = spanishText
        .lowercased()
        .folding(options: .diacriticInsensitive, locale: Locale(identifier: "es"))
    
    if let translation = spanishToEnglish[cleanedText] {
        return translation
    }
    else {
        return "you have not learned yet"
    }
}

func splitStringByDictionaryKeys(_ inputString: String, dictionary: [String: String]) -> [[String]] {
    var substrings: [[String]] = [[]]
    var currentSubstring: [String] = []
    let maxSubstringLength = 18
    var currentIndex = inputString.startIndex
    
    // Iterate through input string characters
    while currentIndex < inputString.endIndex {
        var foundMatch = false
        
        // Iterate through dictionary keys
        for key in dictionary.keys.sorted(by: { $0.count > $1.count }) {
            // Construct the potential phrase using the current position and subsequent characters
            let remainingCharacters = inputString[currentIndex...]
            let potentialPhrase = String(remainingCharacters.prefix(key.count)).lowercased()
            
            // Normalize the potential phrase and key to ignore accents and spaces
            let normalizedPotentialPhrase = potentialPhrase.replacingOccurrences(of: " ", with: "").folding(options: .diacriticInsensitive, locale: nil)
            let normalizedKey = key.lowercased().replacingOccurrences(of: " ", with: "").folding(options: .diacriticInsensitive, locale: nil)
            
            // Check if the normalized potential phrase matches any dictionary key
            if normalizedPotentialPhrase == normalizedKey {
                currentSubstring.append(potentialPhrase)
                currentIndex = inputString.index(currentIndex, offsetBy: key.count) // Move currentIndex to the end of the matched phrase
                foundMatch = true
                break
            }
        }
        
        // If no match was found, add the current character and move to the next
        if !foundMatch {
            let currentChar = inputString[currentIndex]
            if currentChar == " " {
                currentSubstring.append(" ") // Insert space
            } else {
                currentSubstring.append(String(currentChar))
            }
            currentIndex = inputString.index(after: currentIndex)
        }
        
        // If the current length exceeds the maximum substring length or if it's a space, continue in the current substring
        if currentSubstring.joined().count >= maxSubstringLength || currentIndex == inputString.endIndex {
            substrings[substrings.count - 1].append(contentsOf: currentSubstring)
            currentSubstring = []
            substrings.append([]) // Start a new substring
        }
    }
    
    // Remove the last empty substring if it exists
    if substrings.last?.isEmpty ?? false {
        substrings.removeLast()
    }
    
    // Merge consecutive characters
    var resultArray: [[String]] = []
    
    for row in substrings {
        var mergedRow: [String] = []
        var currentString = ""
        
        for string in row {
            // Check if the current string is a single character and not punctuation or space
            if string.count == 1 && string.rangeOfCharacter(from: CharacterSet.punctuationCharacters.union(CharacterSet.whitespaces)) == nil {
                // Append the current character to the accumulated characters
                currentString.append(string)
            } else {
                // If the accumulated characters are not empty, append them to mergedRow
                if !currentString.isEmpty {
                    mergedRow.append(currentString)
                    currentString = ""
                }
                // Append the current string to mergedRow
                mergedRow.append(string)
            }
        }
        
        // Append the accumulated characters at the end of the row
        if !currentString.isEmpty {
            mergedRow.append(currentString)
        }
        
        // Append the merged row to the result array
        resultArray.append(mergedRow)
    }
    
    return resultArray
}

func isPunctuation(_ string: String) -> Bool {
    let punctuationCharacters = CharacterSet.punctuationCharacters
    return string.rangeOfCharacter(from: punctuationCharacters) != nil && string.rangeOfCharacter(from: CharacterSet.alphanumerics) == nil
}
func isWhitespace(_ string: String) -> Bool {
    return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
}


