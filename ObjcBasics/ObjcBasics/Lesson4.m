//  Lesson4.m
//  ObjcBasics
//  Created by Iv on 25/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import "Lesson4.h"

// Создать программу, которая будет выводить список студентов. Для этого необходимо создать класс Студент, а значения свойств устанавливать, используя собственный конструктор.
// У студента должно быть свойство age (возраст), оно должно быть только для чтения
// У студента должны быть свойства name, surname и fullName. Первые два должны быть обычными свойствами, а fullName должно возвращать строку состоящую из склеенных name и surname.
// Переопределите метод description чтобы при выводе объекта в NSLog выводилась информация по всем его свойствам.
// Добавьте метод который будет увеличивать его возраст. (Да свойство age только для чтения).

@implementation Student

/**
 Собственный конструктор с инициализацией имени, фамилии и возраста студента
 */
- (instancetype)initWithNameSurnameAge:(NSString *)name surname:(NSString *)surname age:(int) age
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.surname = surname;
        _age = age;
    }
    return self;
}


/**
 Полное имя студента - вычисляемое свойство
 */
- (NSString *)fullName {
    return [NSString stringWithFormat: @"%@ %@", self.name, self.surname];
}


/**
 Метод изменения возраста студента
 */
- (void)addAge:(int) years
{
    _age += years;
}


/**
 Деструктор
 */
- (void)dealloc {
    NSLog(@"%@ всё", self.fullName);
}


/**
 Переопределенный description возвращает все знания о студенте
 */
-(NSString *)description
{
    return [NSString stringWithFormat:@"Студент %@ %d лет", self.fullName, self.age];
}

@end

void Lesson4Task(void)
{
    // Создаем трех студентов
    Student *s1 = [[Student alloc] initWithNameSurnameAge:@"Иван" surname:@"Васечкин" age:19];
    Student *s2 = [[Student alloc] initWithNameSurnameAge:@"Петр" surname:@"Мамолькин" age:20];
    Student *s3 = [[Student alloc] initWithNameSurnameAge:@"Сидор" surname:@"Харчочкин" age:18];
    // Запихиваем их в массив
    NSMutableArray<Student *> *students = [NSMutableArray new];
    [students addObject:s1];
    [students addObject:s2];
    [students addObject:s3];
    // Увеличиваем возраст второго
    [s2 addAge:5];
    // Выводим данные о студентах в лог
    for (int i=0; i< [students count]; i++)
    {
        NSLog(@"%@", students[i]);
    }
}
