//  Lesson4.h
//  ObjcBasics
//  Created by Iv on 25/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Создать программу, которая будет выводить список студентов. Для этого необходимо создать класс Студент, а значения свойств устанавливать, используя собственный конструктор.
// У студента должно быть свойство age (возраст), оно должно быть только для чтения
// У студента должны быть свойства name, surname и fullName. Первые два должны быть обычными свойствами, а fullName должно возвращать строку состоящую из склеенных name и surname.
// Переопределите метод description чтобы при выводе объекта в NSLog выводилась информация по всем его свойствам.
// Добавьте метод который будет увеличивать его возраст. (Да свойство age только для чтения).

@interface Student : NSObject

- (instancetype)initWithNameSurnameAge:(NSString *)name surname:(NSString *)surname age:(int) age;

@property (nonatomic, readonly) int age;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, readonly) NSString *fullName;

- (void)addAge:(int) years;

@end

NS_ASSUME_NONNULL_END

void Lesson4Task(void);

