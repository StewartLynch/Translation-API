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
//1.    “Das Essen war fantastisch und der Service erstklassig. Ich komme definitiv wieder!”
//(The food was fantastic and the service was first-class. I will definitely come back!)
//    2.    “Ein wunderschönes Ambiente und sehr freundliches Personal. Die Gerichte waren raffiniert und köstlich.”
//(A beautiful ambiance and very friendly staff. The dishes were sophisticated and delicious.)
//    3.    “Leider war das Essen nur durchschnittlich, und der Service ließ zu wünschen übrig.”
//(Unfortunately, the food was only average, and the service left something to be desired.)
//    4.    “Die Preise sind etwas hoch, aber die Qualität des Essens rechtfertigt sie.”
//(The prices are a bit high, but the quality of the food justifies them.)
//    5.    “Ein wahres kulinarisches Erlebnis! Jede Speise war ein Gedicht.”
//(A true culinary experience! Every dish was a poem.)
//    6.    “Das Restaurant war überfüllt und laut, was das Erlebnis etwas getrübt hat.”
//(The restaurant was crowded and noisy, which somewhat marred the experience.)
//    7.    “Sehr gute Weinauswahl und die Vorspeisen waren exzellent. Der Hauptgang konnte leider nicht mithalten.”
//(Very good wine selection and the appetizers were excellent. Unfortunately, the main course couldn’t keep up.)
//    8.    “Wir wurden herzlich empfangen und fühlten uns rundum wohl. Das Essen war hervorragend.”
//(We were warmly welcomed and felt completely comfortable. The food was excellent.)
//    9.    “Die Portionen waren klein, aber dafür geschmacklich herausragend. Perfekt für einen besonderen Anlass.”
//(The portions were small, but the taste was outstanding. Perfect for a special occasion.)
//    10.    “Ein Geheimtipp in der Stadt! Tolles Essen, freundliches Personal und ein schönes Ambiente.”
//(A hidden gem in the city! Great food, friendly staff, and a nice atmosphere.)
