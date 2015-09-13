//
//  main.m
//  NumeralSystem
//
//  Created by Serhii Kopach on 13.09.15.
//  Copyright (c) 2015 Serhii Kopach. All rights reserved.
//

#include <stdio.h>
#include <math.h>

// Getting significant length of the string

int stringLength (char *string, int size) {
    int i;
    for (i = 0; i < size; i++) {
        if (string[i] == '\0') {
            return i;
        }
    }
    return 0;
}

// Checking if current symbol is a digit (from 0 to 9)

int isDigit (char symbol) {
    return (symbol >= 48) && (symbol <= 57);
}

// Converting from char to int

int charToInt (char symbol) {
    return (isDigit(symbol)) ? symbol - 48 : 0;
}

////////////////
////////////////
////////////////

int main () {
    // Reading incoming system value
    
    int incomingSystem = 0;
    printf("Enter incoming system: ");
    scanf("%d", &incomingSystem);
    
    // Reading incoming number string
    
    int stringMaximumSize = 32;
    char incomingNumber[stringMaximumSize];
    printf("Enter number in %d numeral system: ", incomingSystem);
    scanf("%32s", incomingNumber);
    incomingNumber[stringMaximumSize - 1] = '\0';
    
    int incomingStringLength = stringLength(incomingNumber, stringMaximumSize);
    
    // Converting incoming number to another numeral system
    
    int x = 0;
    
    int i;
    for (i = 0; i < incomingStringLength; i++) {
        x = x + charToInt(incomingNumber[incomingStringLength - 1 - i]) * pow(incomingSystem, i);
    }
    
    // Printing result
    
    printf("Number in 10 numeral system: %d\n", x);
    return 0;
}