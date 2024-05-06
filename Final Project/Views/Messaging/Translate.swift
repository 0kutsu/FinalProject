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
    "como estas": "how are you",
    "estoy bien": "I'm fine",
    "lo siento": "I'm sorry",
    "perdon": "excuse me",
    "que tal": "how's it going",
    "mas tarde": "later",
    "hasta luego": "see you later",
    "hasta manana": "see you tomorrow",
    "cuanto cuesta": "how much does it cost",
    "donde esta el bano": "where is the bathroom",
    "no entiendo": "I don't understand",
    "hablo un poco de espanol": "I speak a little Spanish",
    "puedes ayudarme": "can you help me",
    "donde estoy": "where am I",
    "que hora es": "what time is it",
    "me llamo": "my name is",
    "mucho gusto": "nice to meet you",
    "como te llamas": "what's your name",
    "bienvenido": "welcome",
    "lo siento, no hablo espanol": "I'm sorry, I don't speak Spanish",
    "puedo ir al bano": "can I go to the bathroom",
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
    "en espanol": "in spanish",
    "necesito un medico": "I need a doctor",
    "tengo hambre": "I'm hungry",
    "tengo sed": "I'm thirsty",
    "me duele aqui": "it hurts here",
    "estoy cansado": "I'm tired",
    "estoy enfermo": "I'm sick",
    "no puedo": "I can't",
    "puedo tener la carta, por favor": "can I have the menu, please",
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
    // Attempt to translate individual words
    let translatedWords = spanishText
        .folding(options: .diacriticInsensitive, locale: .current)
        .lowercased()
        .split(separator: " ")
        .compactMap { spanishWord in
            spanishToEnglish[String(spanishWord)]
        }

    // If individual words were found and translated, combine them into a single string
    if !translatedWords.isEmpty {
        return translatedWords.joined(separator: " ")
    }

    // Attempt to translate the entire input text as a phrase
    if let translatedPhrase = spanishToEnglish[spanishText
        .folding(options: .diacriticInsensitive, locale: .current)
        .lowercased()] {
        return translatedPhrase
    }

    // If translation is not found, return the original text
    return "you have not learned yet"
}

func splitStringByDictionaryKeys(_ inputString: String, dictionary: [String: String]) -> [[String]] {
    var substrings: [[String]] = []
    var currentSubstring: [String] = []
    let maxSubstringLength = 20  // Adjust as needed
    
    let sortedKeys = dictionary.keys.sorted { $0.count > $1.count }
    let words = inputString.components(separatedBy: " ")
    var currentIndex = 0
    
    while currentIndex < words.count {
        let currentWord = words[currentIndex]
        var phrase = currentWord
        var nextIndex = currentIndex + 1
        
        while nextIndex < words.count {
            let newPhrase = phrase + " " + words[nextIndex]
            
            if newPhrase.count > maxSubstringLength {
                break
            }
            
            if let _ = dictionary[newPhrase.lowercased()] {
                phrase = newPhrase
                currentIndex = nextIndex
            } else {
                break
            }
            
            nextIndex += 1
        }
        
        currentSubstring.append(phrase)
        
        if currentSubstring.joined(separator: " ").count >= maxSubstringLength {
            substrings.append(currentSubstring)
            currentSubstring = []
        }
        
        currentIndex += 1
    }
    
    if !currentSubstring.isEmpty {
        substrings.append(currentSubstring)
    }
    
    return substrings
}

func isPunctuation(_ string: String) -> Bool {
    let punctuationCharacters = CharacterSet.punctuationCharacters
    return string.rangeOfCharacter(from: punctuationCharacters) != nil && string.rangeOfCharacter(from: CharacterSet.alphanumerics) == nil
}
func isWhitespace(_ string: String) -> Bool {
    return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
}

