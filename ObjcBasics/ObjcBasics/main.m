//  main.m
//  ObjcBasics
//  Created by Iv on 04/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

void Lesson1Task1And2(void);
void Lesson1Task3(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Lesson1Task1And2();
        Lesson1Task3();
    }
    return 0;
}

// 1. Создать калькулятор на основе практической задачи 3.
// 2. Улучшить калькулятор благодаря выводу результата, а также переменных в консоль одной строкой (как в практической задаче 2)
void Lesson1Task1And2(void) {
    printf("CALCULATOR\n");
    int op1 = 0;
    int op2 = 0;
    int action = -1;
    NSString *actionSign;
    NSString const *actionHelp = @"1 for +, 2 for -, 3 for *, 4 for /";
    float res = 0.0;
    printf("First operand: ");
    scanf("%d", &op1);
    printf("Second operand: ");
    scanf("%d", &op2);
    printf("Action (%s): ", [actionHelp cStringUsingEncoding:NSUTF8StringEncoding]);
    scanf("%d", &action);
    switch (action) {
        case 1:
            actionSign = @"+";
            res = op1 + op2;
            break;
        case 2:
            actionSign = @"-";
            res = op1 - op2;
            break;
        case 3:
            actionSign = @"*";
            res = op1 * op2;
            break;
        case 4:
            if (op2 == 0) {
                NSLog(@"Incorrect divisor (0)");
                return;
            }
            actionSign = @"/";
            res = op1 / op2;
            break;
        default:
            NSLog(@"Action is not supported, use %@", actionHelp);
            return;
    }
    NSLog(@"%d %@ %d = %f", op1, actionSign, op2, res);
}

// 3. *Создать приложение, которое будет вычислять среднее число из трех переменных без применения специальных функций.
void Lesson1Task3(void) {
    printf("AVERAGE\n");
    int n1 = 0;
    int n2 = 0;
    int n3 = 0;
    printf("First number: ");
    scanf("%d", &n1);
    printf("Second number: ");
    scanf("%d", &n2);
    printf("Third number: ");
    scanf("%d", &n3);
    NSLog(@"Simple average of numbers %d, %d and %d is %f", n1, n2, n3, (n1 + n2 + n3) / 3.0);
}
