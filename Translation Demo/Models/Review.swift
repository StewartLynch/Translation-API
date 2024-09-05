//
//  Review.swift
//  Translation Demo
//
//  Created by Stewart Lynch on 9/2/24.
//
import Foundation

struct Review: Identifiable
{
    var id = UUID()
    var comment: String
    var translatedComment: String = ""
    
    static var samples:[Review] {
        [
            Review(comment: "Das Essen war fantastisch und der Service erstklassig. Ich komme definitiv wieder!"),
            Review(comment: "Ein wunderschönes Ambiente und sehr freundliches Personal. Die Gerichte waren raffiniert und köstlich."),
            Review(comment: "Leider war das Essen nur durchschnittlich, und der Service ließ zu wünschen übrig."),
            Review(comment: "Das Restaurant war überfüllt und laut, was das Erlebnis etwas getrübt hat."),
            Review(comment: "Ein wahres kulinarisches Erlebnis! Jede Speise war ein Gedicht."),
            Review(comment: "Das Restaurant war überfüllt und laut, was das Erlebnis etwas getrübt hat."),
            Review(comment: "Sehr gute Weinauswahl und die Vorspeisen waren exzellent. Der Hauptgang konnte leider nicht mithalten."),
            Review(comment: "Wir wurden herzlich empfangen und fühlten uns rundum wohl. Das Essen war hervorragend."),
            Review(comment: "Die Portionen waren klein, aber dafür geschmacklich herausragend. Perfekt für einen besonderen Anlass."),
            Review(comment: "Ein Geheimtipp in der Stadt! Tolles Essen, freundliches Personal und ein schönes Ambiente."),
        ]
    }
}
