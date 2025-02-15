# Objective-C ARC and Manual Memory Management Conflict

This repository demonstrates a subtle bug in Objective-C related to the interaction between Automatic Reference Counting (ARC) and manual memory management.  The bug arises when a method returns an autoreleased object, and the caller doesn't retain the object before using it.

The `bug.m` file contains the buggy code, while `bugSolution.m` demonstrates the corrected version.

## Bug Description

The core issue is in the `createMyClass` method. It allocates a `MyClass` object, but doesn't retain it, leaving it autoreleased. If the caller does not retain the returned object, it may be prematurely deallocated before its use, potentially resulting in a crash or undefined behavior.

## Solution

The solution is to explicitly retain the object returned from `createMyClass` using the `retain` method in the caller's code.  In modern Objective-C with ARC, this might involve using strong properties.