//  Lesson2.m
//  ObjcBasics
//  Created by Iv on 11/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

#include "Lesson2.h"

// 1. Создание функции, которая будет проверять, входит ли переданная буква в английский алфавит.
void Lesson2Task1(void)
{
    printf("CHECK LETTER\n");
    char input[5]; // может быть получен многобайтовый символ
    printf("Enter a single char and press 'Enter' key: ");
    scanf("%4s", input);
    BOOL isEnglish = IsLetterEnglish(input);
    NSLog(@"'%s' is%s a single letter of english alphabet", input, isEnglish ? "" : " not");
}

/*
 Функция проверки вхождения символа в английский алфавит
 Символ входит в английский алфавит если он
 а) однобайтовый
 б) расположен в диапазоне A...Z или a...z
 */
BOOL IsLetterEnglish(const char *input)
{
    BOOL result = strlen(input) == 1;
    if (result)
    {
        char firstByte = input[0];
        result = (firstByte >= 'A' && firstByte <= 'Z') || (firstByte >= 'a' && firstByte <= 'z');
    }
    return result;
}

//2. Разделение метода calculate (из практической задачи 2) на несколько методов (отдельно сложение, вычитание, умножение и деление).
void Lesson2Task2(void)
{
    printf("CALCULATOR\n");
    int operand1;
    int operand2;
    char action[2];
    printf("First operand: ");
    scanf("%d", &operand1);
    printf("Second operand: ");
    scanf("%d", &operand2);
    printf("Action: ");
    scanf("%1s", action);
    if (action[0] == '+')
        NSLog(@"%d %s %d = %d", operand1, action, operand2, fSum(operand1, operand2));
    else if (action[0] == '-')
        NSLog(@"%d %s %d = %d", operand1, action, operand2, fDiff(operand1, operand2));
    else if (action[0] == '*')
        NSLog(@"%d %s %d = %d", operand1, action, operand2, fMult(operand1, operand2));
    else if (action[0] == '/')
    {
        if (operand2 == 0)
            NSLog(@"Incorrect divisor (0)");
        else
            NSLog(@"%d %s %d = %f", operand1, action, operand2, fDiv(operand1, operand2));
    }
    else
        NSLog(@"Action '%s' is not supported", action);
}

int fSum(int a, int b)
{
    return a + b;
}

int fDiff(int a, int b)
{
    return a - b;
}

int fMult(int a, int b)
{
    return a * b;
}

double fDiv(int a, int b)
{
    return (double)a / b;
}

/*
int calculate(NSString *method, int a, int b)
{
    if ([method isEqualToString:@"+"]) {
        return a + b;
    }
    else if ([method isEqualToString:@"-"]) {
        return a - b;
    }
    else if ([method isEqualToString:@"*"]) {
        return a * b;
    }
    else if ([method isEqualToString:@"/"]) {
        return a / b;
    }
    else if ([method isEqualToString:@"%"]) {
        return a % b;
    }
    else {
        NSLog(@"Функция не знает переданный метод");
        return 0;
    }
    return a + b;
}
*/
