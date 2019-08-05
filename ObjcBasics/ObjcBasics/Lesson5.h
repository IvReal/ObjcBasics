//  Lesson5.h
//  ObjcBasics
//  Created by Iv on 02/08/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 1. Изменить созданный калькулятор из предыдущих уроков на ручное управление памятью.
// 2. Смоделировать и разработать программу для стаи птиц (на основе практического задания) с применением ручного управления памятью.
// 3. *Улучшить созданную программу из задания 2 с применением пула автоматического освобождения.

@interface Bird : NSObject

- (instancetype) initWithName:(NSString *)name;

@property (nonatomic, strong) NSString *name;

@end

@interface Flight : NSObject

- (void)addBirds:(NSArray *)birds;

@property (nonatomic, strong) NSArray *birds;

@end

NS_ASSUME_NONNULL_END

void Lesson5Task1(void);
void Lesson5Task2(void);
void Lesson5Task3(void);
