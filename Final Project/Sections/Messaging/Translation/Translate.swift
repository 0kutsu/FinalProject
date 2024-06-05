
//  Translate.swift
//  Final Project
//
//  Created by Ivan Xiong (student LM) on 4/29/24.
//
import Foundation
// Define a dictionary mapping Spanish words to English translations: add more/delete some for demo as needed
let spanishToEnglish: [String: String] = [
        "adios": "goodbye",
        "aire": "air",
        "algo": "something",
        "amar": "to love",
        "amigo": "friend",
        "amor": "love",
        "ano": "year",
        "aprender": "to learn",
        "arte": "art",
        "ayudar": "to help",
        "barrio": "neighborhood",
        "beber": "to drink",
        "biblioteca": "library",
        "bienvenido": "welcome",
        "buenas noches": "good evening",
        "buenas tardes": "good afternoon",
        "buenos dias": "good morning",
        "bueno": "good",
        "buscar": "to search",
        "calle": "street",
        "cama": "bed",
        "campo": "field",
        "carro": "car",
        "cielo": "sky",
        "ciudad": "city",
        "clase": "class",
        "color": "color",
        "comer": "to eat",
        "comida": "food",
        "cosa": "thing",
        "correr": "to run",
        "cuerpo": "body",
        "de": "of",
        "de nada": "you're welcome",
        "derecho": "right",
        "dia": "day",
        "dinero": "money",
        "dormir": "to sleep",
        "donde": "where",
        "edad": "age",
        "el": "the/he",
        "encontrar": "to find",
        "ensalada": "salad",
        "entender": "to understand",
        "escuchar": "to listen",
        "escuela": "school",
        "espanol": "spanish",
        "estoy bien": "I'm fine",
        "estudiar": "to study",
        "familia": "family",
        "felicidades": "congratulations",
        "feo": "ugly",
        "fiesta": "party",
        "flor": "flower",
        "forma": "form",
        "foto": "photo",
        "fruta": "fruit",
        "gente": "people",
        "gobierno": "government",
        "grupo": "group",
        "guerra": "war",
        "hablar": "to speak",
        "hablo": "I speak",
        "hasta luego": "see you later",
        "hasta pronto": "see you soon",
        "hija": "daughter",
        "historia": "history",
        "hijo": "son",
        "hombre": "man",
        "hola": "waving",
        "hora": "hour",
        "iglesia": "church",
        "idea": "idea",
        "igualmente": "likewise",
        "informacion": "information",
        "jardin": "garden",
        "joven": "young person",
        "juego": "game",
        "jugar": "to play",
        "la": "the",
        "lado": "side",
        "lugar": "place",
        "lo siento": "I'm sorry",
        "luz": "light",
        "madre": "mother",
        "mano": "hand",
        "mar": "sea",
        "me": "I",
        "mesa": "table",
        "mi": "my",
        "mirar": "to look",
        "mismo": "same",
        "mujer": "woman",
        "mundo": "world",
        "musica": "music",
        "mucho gusto": "nice to meet you",
        "nacion": "nation",
        "necesitar": "to need",
        "new": "nuevo",
        "no": "no",
        "noche": "night",
        "nombre": "name",
        "nuevo": "new",
        "nunca": "never",
        "ojo": "eye",
        "padre": "father",
        "pais": "country",
        "palabra": "word",
        "papa": "potato",
        "parque": "park",
        "parte": "part",
        "persona": "person",
        "perdon": "excuse me",
        "pequeno": "small",
        "perro": "dog",
        "photo": "foto",
        "pueblo": "town",
        "puerta": "door",
        "punto": "point",
        "que pasa": "what's happening",
        "que tal": "how's it going",
        "quien": "who",
        "quiero": "I want",
        "razon": "reason",
        "rio": "river",
        "sabor": "flavor",
        "salud": "health",
        "sano": "healthy",
        "silla": "chair",
        "sistema": "system",
        "sitio": "site",
        "sociedad": "society",
        "sol": "sun",
        "solo": "alone",
        "tallo": "stem",
        "tambien": "also",
        "tarde": "late",
        "tarea": "task",
        "tele": "TV",
        "television": "television",
        "tiempo": "time",
        "tierra": "earth",
        "todos": "everyone",
        "tomar": "to take",
        "trabajar": "to work",
        "triste": "sad",
        "tuyo": "yours",
        "un": "a",
        "un poco": "a little",
        "vacio": "empty",
        "veces": "times",
        "verdad": "truth",
        "viaje": "trip",
        "vida": "life",
        "vino": "wine",
        "vivir": "to live",
        "voz": "voice",
        "yo": "I",
        "queso": "cheese",
        "agua": "water"
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
    return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
}
