//  Lesson6.m
//  ObjcBasics
//  Created by Iv on 12/08/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import "Lesson6.h"

// Попрактиковаться с применением блоков: создать программу для вывода сообщений в консоль с использованием минимум 6 блоков

typedef void(^ProcessString)(NSString*); // блок, принимающий строку
typedef int(^Calc)(int); // блок вычисления функции аргумента
typedef NSString*(^Format)(NSString*, int, int); // блок форматирование двух целых чисел
typedef void(^block)(void); // блок для проверки присвоения значения внешней переменной

// Функция разбиения строки на слова и вызовом переданного в функцию блока для каждого слова
void SplitString(NSString *string, ProcessString block)
{
    NSArray* words = [string componentsSeparatedByString:@" "];
    for (NSString *word in words)
        block(word);
}

void Lesson6Task1(void)
{
    printf("BLOCKS\n");
    
    // вывод строки в лог через блок
    ProcessString printString = ^(NSString *string) {
        NSLog(@"%@", string);
    };
    printString(@"Objective-C is a very powerful language:-)");

    // вывод в лог квадрата числа
    Format format = ^(NSString *fmt, int val1, int val2) {
        return [NSString stringWithFormat:fmt, val1, val2];
    };
    Calc calcSquare = ^(int value) {
        return value * value;
    };
    int val = 123;
    printString(format(@"Squared %i is %i", val, calcSquare(val))); // сразу три блока:-)

    // делаем первые буквы слов прописными
    __block NSString* strval = @"now i study objective c";
    printString(strval);
    block capString = ^(void) {
        strval = [strval capitalizedString];
    };
    capString();
    printString(strval);
    
    // разбиваем строку на слова и выводим в лог каждое слово в верхнем регистре
    SplitString(@"не так уж много в жизни нужно луч солнца бриз за лесом мыс уютный сад десяток книжек и смысл",
                ^(NSString *s){
                    NSLog(@"%@", [s uppercaseString]);
                });
}

// Добавить выполнение блоков в различные очереди с применением GCD и NSOperation

void Lesson6Task2(void)
{
    printf("GCD & nNSOperation\n");
    
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    dispatch_async(queue, ^{ NSLog(@"широкой поступью шагая");  });
    dispatch_async(queue, ^{ NSLog(@"по среднерусской полосе");  });
    dispatch_async(queue, ^{ NSLog(@"сусанин шёл не понимая");  });
    dispatch_async(queue, ^{ NSLog(@"где все");  });
    
    NSOperationQueue *myQueue = [[NSOperationQueue alloc] init];
    [myQueue addOperationWithBlock:^{ NSLog(@"начало лета жизнь прекрасна"); }];
    [myQueue addOperationWithBlock:^{ NSLog(@"течёт неспешно бытие"); }];
    [myQueue addOperationWithBlock:^{ NSLog(@"и вдруг печаль ну вот откуда"); }];
    [myQueue addOperationWithBlock:^{ NSLog(@"сие"); }];

    sleep(3);
}
