//  main.m
//  ObjcBasics
//  Created by Iv on 04/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

#include "Lesson1.h"
#include "Lesson2.h"
#include "Lesson3.h"
#include "Lesson4.h"
#include "Lesson5.h"
#include "Lesson6.h"
#include "Lesson7.h"

#define CURRENT_LESSON 7

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        switch (CURRENT_LESSON)
        {
            case 1:
                Lesson1Task1And2();
                Lesson1Task3();
                break;
            case 2:
                Lesson2Task1();
                Lesson2Task2();
                break;
            case 3:
                Lesson3Task1();
                Lesson3Task2();
                Lesson3Task3();
                break;
            case 4:
                Lesson4Task();
                break;
            case 5:
                Lesson5Task1();
                Lesson5Task2();
                Lesson5Task3();
                break;
            case 6:
                Lesson6Task1();
                Lesson6Task2();
                break;
            case 7:
                Lesson7Task1();
                Lesson7Task2();
                break;
            default:
                break;
        }
    }
    return 0;
}

