//  Lesson5.m
//  ObjcBasics
//  Created by Iv on 02/08/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import "Lesson5.h"
#import "Lesson3.h" // enum Action

// 1. Изменить созданный калькулятор из предыдущих уроков на ручное управление памятью.

NSNumber* calculate2(enum Action act, NSNumber* a, NSNumber* b)
{
    switch (act) {
        case actAdd:
            return @([a intValue] + [b intValue]);
        case actDiff:
            return @([a intValue] - [b intValue]);;
        case actMult:
            return @([a intValue] * [b intValue]);;
        case actDiv:
            if ([b intValue] == 0)
            {
                NSLog(@"Invalid operand");
                return nil;
            }
            return @([a floatValue] / [b floatValue]);;
        default:
            NSLog(@"Not supported action");
            return nil;
    }
}

void Lesson5Task1(void)
{
    printf("CALCULATOR\n");
    NSNumber* operand1 = [NSNumber numberWithInt:2]; // для MRC аналогично [[[NSNumber alloc] numberWithInt:2] autorelease]
    NSNumber* operand2 = [NSNumber numberWithInt:40];
    // Сложение
    NSNumber* result = calculate2(actAdd, operand1, operand2);
    NSLog(@"%@ + %@ = %@", operand1, operand2, result);
    //MRC [result release];
    // Вычитание
    result = calculate2(actDiff, operand1, operand2);
    NSLog(@"%@ - %@ = %@", operand1, operand2, result);
    //MRC [result release];
    // Умножение
    result = calculate2(actMult, operand1, operand2);
    NSLog(@"%@ * %@ = %@", operand1, operand2, result);
    //MRC [result release];
    // Деление
    result = calculate2(actDiv, operand1, operand2);
    NSLog(@"%@ / %@ = %@", operand1, operand2, result);
    //MRC [result release];
    // Деление на 0
    //[operand2 release];
    operand2 = [NSNumber numberWithInt:0];
    result = calculate2(actDiv, operand1, operand2);
    NSLog(@"%@ / %@ = %@", operand1, operand2, result);
    /*MRC [operand1 release];
    [operand2 release];
    [result release];*/
}

// 2. Смоделировать и разработать программу для стаи птиц (на основе практического задания) с применением ручного управления памятью.

// Класс птички
@implementation Bird
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        /*MRC [name retain];
        [name release];
        _name = name;*/
        NSLog(@"Hi %@", name);
    }
    return self;
}
- (void)dealloc {
    NSLog(@"Goodbye %@", _name);
    /*MRC [_name release];
    [super dealloc];*/
}
@end

// Класс стаи
@implementation Flight
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Create flight");
    }
    return self;
}
- (void)addBirds:(NSArray *)birds {
    /*MRC [birds retain];
    [birds release];*/
    _birds = birds;
    for (Bird *bird in birds) {
        NSLog(@"%@ join to flight", bird.name);
    }
}
- (void)breakUp {
    NSLog(@"All birds leave the flight");
    /*MRC for (Bird *bird in _birds) {
        [bird release];
    }
    [_birds release];*/
}
- (void)dealloc {
    [self breakUp];
    NSLog(@"Dealloc flight");
    /*MRC [super dealloc]*/;
}
@end

void Lesson5Task2(void)
{
    printf("ANGRY BIRDS\n");
    NSArray *birds = [[NSArray alloc] initWithObjects:
                      [[Bird alloc] initWithName:@"Chuck"],
                      [[Bird alloc] initWithName:@"Matilda"],
                      [[Bird alloc] initWithName:@"Bubbles"],
                      [[Bird alloc] initWithName:@"Bomber"],
                      nil];
    Flight *angryBirds = [[Flight alloc] init];
    [angryBirds addBirds:birds];
    /*MRC [angryBirds release];*/
}

// 3. *Улучшить созданную программу из задания 2 с применением пула автоматического освобождения.

void Lesson5Task3(void)
{
    printf("ANGRY BIRDS (autoreleasepool)\n");
    @autoreleasepool {
        NSArray *birds = [[NSArray alloc] initWithObjects:
                          [[Bird alloc] initWithName:@"Jay"],
                          [[Bird alloc] initWithName:@"Jim"],
                          [[Bird alloc] initWithName:@"Jake"],
                          nil];
        /*MRC Flight *angryBirds = [[[Flight alloc] init] autorelease];*/
        Flight *angryBirds = [[Flight alloc] init];
        [angryBirds addBirds:birds];
    }
    /* alternative way
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    NSArray *birds = [[NSArray alloc] initWithObjects:
                      [[Bird alloc] initWithName:@"Jay"],
                      [[Bird alloc] initWithName:@"Jim"],
                      [[Bird alloc] initWithName:@"Jake"],
                      nil];
    Flight *angryBirds = [[[Flight alloc] init] autorelease];
    [angryBirds addBirds:birds];
    [pool release];*/
 }

