//
//  SLPostViewController.m
//  SelfLog
//
//  Created by SatoDaisuke on 12/9/14.
//  Copyright (c) 2014 SatoDaisuke. All rights reserved.
//

#import "SLPostViewController.h"
#import "SLLog.h"
#import <RLMRealm.h>

@interface SLPostViewController () <UITextFieldDelegate,UITextViewDelegate>
{
    
    __weak IBOutlet UITextField *_titleTextField;
    
    __weak IBOutlet UITextView *_logTextView;
    
}

@end

@implementation SLPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)post{
    
    //データベースに格納
    
    SLLog *newLog = [[SLLog alloc]init];
    
    newLog.title = _titleTextField.text;
    newLog.log = _logTextView.text;
    newLog.postedDate = [NSDate date];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:newLog];
    [realm commitWriteTransaction];
}

-(void)existsBlankField{
    
    // コントローラを生成
    UIAlertController * ac =
    [UIAlertController alertControllerWithTitle:@"Error"
                                        message:@"There is a blank fields."
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    // OK用のアクションを生成
    UIAlertAction * okAction =
    [UIAlertAction actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {
                               // ボタンタップ時の処理
                               NSLog(@"OK button tapped.");
                           }];
    
    // コントローラにアクションを追加
    [ac addAction:okAction];
    
    // アラート表示処理
    [self presentViewController:ac animated:YES completion:nil];

   
}

-(BOOL)canPost{
    
    if(_titleTextField.text.length == 0 || _logTextView.text.length == 0){
        return NO;
    }
    else
        return YES;
    
}

- (IBAction)tappedPostBtn:(id)sender {
    
    if([self canPost])
        [self post];
    else
        [self existsBlankField];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(_titleTextField.isFirstResponder)
       [_titleTextField resignFirstResponder];
    
    if(_logTextView.isFirstResponder)
       [_logTextView resignFirstResponder];
}

#pragma mark - UITextFieldDeleagate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark - UITextViewDelegate
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    [textView resignFirstResponder];
    
    return YES;
}



@end
