//
//  ViewController.m
//  Selector
//
//  Created by FellowPlus-Binboy on 1/14/16.
//  Copyright © 2016 Binboy. All rights reserved.
//

#import "ViewController.h"

@interface MyClass : NSObject

@end

@implementation MyClass

- (void)doSomethingForInvocation
{
    
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.通过建立NSInvocation对象建立Timer
    NSMethodSignature *sig = [MyClass instanceMethodSignatureForSelector:@selector(doSomethingForInvocation)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:@selector(doSomethingForInvocation)];
    int anArgument = 1;
    // “請注意，在呼叫 NSInvocation 的 setArgument:atIndex的時候，我們要傳遞的參數，要從 2 開始，因為在這邊我們要想成，這是給objc_msgSend 呼叫用的參數，在 0 的參數是物件的 self，位在 1 的則是selector”
    [invocation setArgument:&anArgument atIndex:2];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 invocation:invocation repeats:YES];
    
    
    // 2.在某个Thread执行Method
    [self performSelectorInBackground:@selector(doSomethingBackground) withObject:nil];
}

- (void)doSomethingBackground
{
    // “注意，在背景執行時，這個 method 的內部需要建立自己的 Auto-Release Pool。”
    @autoreleasepool {
        
    }
    
    // “執行完畢後，我們可以透過 -performSelectorOnMainThread:withObjectwaitUntilDone: ，通知主 Thread我們已經把事情做完了。像是，如果我們要轉換一個比較大的檔案，就可以在背景實際轉檔，轉完之後，再告訴主Thread，在 UI 上跳出提示視窗，提示使用者已經轉檔完畢。”
    [self performSelectorOnMainThread:@selector(doAnotherThingOnMainThread) withObject:nil waitUntilDone:NO];
}

- (void)doAnotherThingOnMainThread
{
    
}

@end
