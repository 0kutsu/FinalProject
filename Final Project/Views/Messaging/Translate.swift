//
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
    "espanol": "spanish",
    "bano": "bathroom",
    "donde esta": "where is",
    "como estas": "how are you",
    "estoy bien": "I'm fine",
    "lo siento": "I'm sorry",
    "perdon": "excuse me",
    "hablo": "I speak",
    "que tal": "how's it going",
    "mas tarde": "later",
    "hasta luego": "see you later",
    "hasta manana": "see you tomorrow",
    "cuanto cuesta": "how much does it cost",
    "no entiendo": "I don't understand",
    "hablo un poco de espanol": "I speak a little Spanish",
    "puedes ayudarme": "can you help me",
    "donde estoy": "where am I",
    "que hora es": "what time is it",
    "me llamo": "my name is",
    "mucho gusto": "nice to meet you",
    "como te llamas": "what's your name",
    "bienvenido": "welcome",
    "que pasa": "what's happening",
    "estoy perdido": "I'm lost",
    "necesito ayuda": "I need help",
    "no lo se": "I don't know",
    "gracias por su ayuda": "thank you for your help",
    "puedo pagar con tarjeta": "can I pay with card",
    "me gustaria un cafe": "I would like a coffee",
    "no tengo dinero": "I don't have money",
    "donde puedo comprar un billete": "where can I buy a ticket",
    "donde puedo encontrar un restaurante": "where can I find a restaurant",
    "lo siento, no puedo ayudarte": "I'm sorry, I can't help you",
    "como llego a": "how do I get to",
    "puedo tener la cuenta, por favor": "can I have the bill, please",
    "no se": "I don't know",
    "no lo entiendo": "I don't understand",
    "me gustaria reservar una mesa": "I would like to reserve a table",
    "cunto tiempo" : "how long",
    "estoy buscando": "I'm looking for",
    "como se dice": "how do you say",
    "necesito un medico": "I need a doctor",
    "tengo hambre": "I'm hungry",
    "tengo sed": "I'm thirsty",
    "me duele aqui": "it hurts here",
    "estoy cansado": "I'm tired",
    "estoy enfermo": "I'm sick",
    "no puedo": "I can't",
    "puedo ayudarte": "I can help you",
    "que bonito": "how beautiful",
    "estoy feliz": "I'm happy",
    "estoy triste": "I'm sad",
    "me gusta": "I like it",
    "no me gusta": "I don't like it",
    "estoy preocupado": "I'm worried",
    "no me siento bien": "I'm not feeling well",
    "tengo frio": "I'm cold",
    "tengo calor": "I'm hot",
    "me puede recomendar un restaurante": "can you recommend a restaurant",
    "no hay problema": "no problem",
    "como se llama esto": "what's this called",
    "cuanto tiempo lleva": "how long does it take",
    "estoy aburrido": "I'm bored",
    "estoy emocionado": "I'm excited",
    "me encanta": "I love it",
    "tengo miedo": "I'm scared",
    "no lo necesito": "I don't need it",
    "no hay de que": "you're welcome",
    "es caro": "it's expensive",
    "es barato": "it's cheap",
    "esta bien": "it's okay",
    "salud": "cheers",
    "feliz cumpleanos": "happy birthday",
    "felicidades": "congratulations",
    "donde vives": "where do you live",
    "donde trabaja": "where do you work",
    "hasta pronto": "see you soon",
    "hasta la vista": "see you later",
    "me gusta esto": "I like this",
    "queso": "cheese"
]

func translateSpanishToEnglish(_ spanishText: String) -> String {
    let cleanedText = spanishText
        .folding(options: .diacriticInsensitive, locale: .current)
        .lowercased()
    
    if let translation = spanishToEnglish[cleanedText] {
        return translation
    } else {
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


