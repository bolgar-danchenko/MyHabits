//
//  InfoData.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 16.08.2022.
//

import UIKit

struct InfoData {
    
    static let headerText: String = "Привычка за 21 день"
    
    static let text0: String = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
    
    static let text1: String = "1. Провести 1 день без обращенияк старым привычкам, стараться вести себя так, как будто цель, загаданнаяв перспективу, находится на расстоянии шага."
    
    static let text2: String = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
    
    static let text3: String = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче,с чем еще предстоит серьезно бороться."
    
    static let text4: String = "4. Поздравить себя с прохождением первого серьезного порога в 21 день.За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
    
    static let text5: String = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
    
    static let text6: String = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
    
    static let sourceText: String = "Источник: psychbook.ru"
    
    static func makeTextLabel(text: String, size: CGFloat, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = size > 17 ? UIFont.boldSystemFont(ofSize: size): UIFont.systemFont(ofSize: size, weight: weight)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
