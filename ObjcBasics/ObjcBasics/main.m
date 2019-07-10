//  main.m
//  ObjcBasics
//  Created by Iv on 04/07/2019.
//  Copyright © 2019 Iv. All rights reserved.

#import <Foundation/Foundation.h>

#include "Lesson1.h"
#include "Lesson2.h"

#define CURRENT_LESSON 2

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        switch (CURRENT_LESSON) {
            case 1:
                Lesson1Task1And2();
                Lesson1Task3();
                break;
            case 2:
                Lesson2Task1();
                Lesson2Task2();
            default:
                break;
        }
    }
    return 0;
}

