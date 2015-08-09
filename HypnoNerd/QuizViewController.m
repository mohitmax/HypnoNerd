//
//  QuizViewController.m
//  Quiz
//
//  Created by Mohit Sadhu on 9/18/14.
//  Copyright (c) 2014 MohitSadhu. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic, weak) IBOutlet UILabel* questionLabel;
@property (nonatomic, weak) IBOutlet UILabel* answerLabel;

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray* questions;
@property (nonatomic, copy) NSArray* answers;


@end

@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"Icon.png"];
        
        self.questions = @[@"From what is cognac made?",
                           @"What is 7 + 7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    //Step to the next question
    self.currentQuestionIndex++;
    
    //Check if the number of questions in the array are over.
    if(self.currentQuestionIndex == [self.questions count])
    {
        self.currentQuestionIndex = 0;
    }
    
    //Display the string at that index in the questions array
    NSString* question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    
    //Reset the answerLabel when showing a new question
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    //Get the answer to the question at the same index
    NSString* answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
