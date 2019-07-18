//  Lesson3.h
//  ObjcBasics
//  Created by Iv on 18/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#ifndef Lesson3_h
#define Lesson3_h

typedef enum Action {
    actAdd,
    actDiff,
    actMult,
    actDiv
} Action;

typedef struct User {
    NSString *Name;
    NSInteger Age;
} User;

void Lesson3Task1(void);
void Lesson3Task2(void);
void Lesson3Task3(void);
int calculate(enum Action act, int a, int b);

#endif /* Lesson3_h */
