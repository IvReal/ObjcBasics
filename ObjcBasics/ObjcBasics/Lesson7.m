//  Lesson7.m
//  ObjcBasics
//  Created by Iv on 20/08/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import "Lesson7.h"

// 1. Создать программу, которая будет сохранять введенные данные (с помощью функции scanf) с применением списков свойств
void Lesson7Task1(void)
{
    printf("PLIST\n");
    
    // массив для хранения введенных с помощью scanf данных
    NSMutableArray *writeArray = [[NSMutableArray alloc] init];

    // форматтер для преобразования строки в число
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;

    // цикл ввода данных
    char input[50];
    int count = 6;
    for (int i = 0; i < count; i++)
    {
        printf("Enter string or number (%d of %d): ", i + 1, count);
        scanf("%49s", input);
        NSString *str = [[NSString alloc] initWithCString: input encoding: NSUTF8StringEncoding];
        NSNumber *num = [f numberFromString:str];
        // если строка преобразовалась в число (num != nil) пишем в массив NSNumber, иначе - NSString
        [writeArray addObject:(num == nil)?str:num];
    }
    
    // пути к файлам данных
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path1 = [dir stringByAppendingString:@"/data1.plist"];
    NSString *path2 = [dir stringByAppendingString:@"/data2.plist"];

    // сохранение массива в файл
    [writeArray writeToFile:path1 atomically:YES];
    // сохранение массива в файл через NSData
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:writeArray requiringSecureCoding:YES error:nil];
    [data writeToFile:path2 atomically:YES];
    
    // чтение данных из файлов и вывод в консоль
    NSArray *readArray1 = [NSArray arrayWithContentsOfFile:path1];
    NSLog(@"Variant 1: %@", readArray1);
    NSData *data2 = [[NSData alloc] initWithContentsOfFile:path2];
    NSArray *readArray2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSArray class] fromData:data2 error:nil];
    NSLog(@"Variant 2: %@", readArray2);
}

// 2. Умышленно допустить ошибку в программе и попробовать применить отладчик
void funcWithException()
{
    @throw [NSException exceptionWithName:@"GBException" reason:@"GeekBrainsIsOneBigException" userInfo:nil];
}

void Lesson7Task2(void)
{
    printf("EXCEPTION\n");
    @try
    {
        funcWithException();
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception occured: %@", exception);
    }
    @finally
    {
        NSLog(@"Finally");
    }
}
