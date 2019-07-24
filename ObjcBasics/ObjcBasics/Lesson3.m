//  Lesson3.m
//  ObjcBasics
//  Created by Iv on 18/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

#include "Lesson3.h"

// Создать программу, которая будет выводить список введенных пользователем значений (с применением функции scanf)
void Lesson3Task1(void)
{
    printf("USER VALUES\n");
    NSMutableArray *values = [NSMutableArray new];
    char input[50];
    NSString * value;
    for (int i = 0; i < 5; i++)
    {
        printf("Enter value %d: ", i + 1);
        scanf("%49s", input);
        value = [[NSString alloc] initWithCString: input encoding: NSUTF8StringEncoding];
        [values addObject: value];
    }
    printf("Your values are:\n");
    for (int i = 0; i < [values count]; i++)
        NSLog(@"%@", values[i]);
}

// Улучшить калькулятор с помощью перечислений, чтобы все возможные методы (сложение, вычитание, деление, умножение) передавались в виде состояния
void Lesson3Task2(void)
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
        NSLog(@"%d %s %d = %d", operand1, action, operand2, calculate(actAdd, operand1, operand2));
    else if (action[0] == '-')
        NSLog(@"%d %s %d = %d", operand1, action, operand2, calculate(actDiff, operand1, operand2));
    else if (action[0] == '*')
        NSLog(@"%d %s %d = %d", operand1, action, operand2, calculate(actMult, operand1, operand2));
    else if (action[0] == '/')
        NSLog(@"%d %s %d = %d", operand1, action, operand2, calculate(actDiv, operand1, operand2));
    else
        NSLog(@"Action '%s' is not supported", action);
}

int calculate(enum Action act, int a, int b)
{
    switch (act) {
        case actAdd:
            return a + b;
        case actDiff:
            return a - b;
        case actMult:
            return a * b;
        case actDiv:
            if (b == 0)
            {
                NSLog(@"Invalid operand");
                return 0;
            }
            return a / b;
        default:
            NSLog(@"Not supported action");
            return 0;
    }
}

// Создать приложение, которое будет добавлять и выводить список пользователей, которые были добавлены путем введения имени в консоль (scanf).
// Все имена необходимо хранить в структуре пользователя.
void Lesson3Task3(void)
{
    printf("USERS\n");
    NSMutableArray *users = [NSMutableArray new];
    char input[50];
    for (int i = 0; i < 3; i++)
    {
        printf("Enter user %d: ", i + 1);
        scanf("%49s", input);
        User user;
        user.Name = [[NSString alloc] initWithCString: input encoding: NSUTF8StringEncoding];
        NSValue *wrappedUser = [NSValue value: &user withObjCType: @encode(User)];
        [users addObject: wrappedUser];
    }
    printf("Users list:\n");
    for (int i = 0; i < [users count]; i++)
    {
        User unwrappedUser;
        [users[i] getValue:&unwrappedUser];
        NSLog(@"%@", unwrappedUser.Name);
    }
}
