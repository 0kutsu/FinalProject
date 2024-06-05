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
    "me": "I",
    "tu": "you",
    "si": "yes",
    "no": "no",
    "mi": "my",
    "la": "the",
    "los": "the",
    "el": "the/he",
    "un":"a",
    "poco":"little",
    "de": "of",
    "y": "and",
    "espanol": "spanish",
    "bano": "bathroom",
    "donde" : "where",
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
    "vino": "wine",
    "hablar": "to speak",
    "comer": "to eat",
    "beber": "to drink",
    "vivir": "to live",
    "amar": "to love",
    "trabajar": "to work",
    "estudiar": "to study",
    "aprender": "to learn",
    "jugar": "to play",
    "correr": "to run",
    "saltar": "to jump",
    "dormir": "to sleep",
    "mirar": "to look",
    "escuchar": "to listen",
    "entender": "to understand",
    "querer": "to want",
    "necesitar": "to need",
    "ayudar": "to help",
    "buscar": "to search",
    "encontrar": "to find",
    "bueno": "good",
    "malo": "bad",
    "grande": "big",
    "pequeño": "small",
    "alto": "tall",
    "bajo": "short",
    "nuevo": "new",
    "viejo": "old",
    "feliz": "happy",
    "triste": "sad",
    "contento": "content",
    "cansado": "tired",
    "listo": "smart",
    "tonto": "silly",
    "rápido": "fast",
    "lento": "slow",
    "caliente": "hot",
    "frío": "cold",
    "bonito": "pretty",
    "feo": "ugly",
    "ensalada": "salad",
    "quiero": "I want",
    "quieres": "You want",
    "voy a": "I'll",
    "hacer": "to make, do",
    "con": "with",
    "algo": "something"
]

func translateSpanishToEnglish(_ spanishText: String) -> String {
    // Define a set of characters to ignore (punctuation)
    let charactersToRemove = CharacterSet.punctuationCharacters.union(.whitespacesAndNewlines)
    
    // Clean the input text by removing diacritics, converting to lowercase, and removing punctuation
    let cleanedText = spanishText
        .folding(options: .diacriticInsensitive, locale: .current)
        .lowercased()
        .components(separatedBy: charactersToRemove)
        .joined(separator: " ")
    
    // Attempt to translate individual words
    let translatedWords = cleanedText
        .split(separator: " ")
        .compactMap { spanishWord in
            spanishToEnglish[String(spanishWord)]
        }

    // If individual words were found and translated, combine them into a single string
    if !translatedWords.isEmpty {
        return translatedWords.joined(separator: " ")
    }

    // Attempt to translate the entire input text as a phrase
    if let translatedPhrase = spanishToEnglish[cleanedText] {
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
