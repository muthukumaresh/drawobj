//
//  colorpageViewController.m
//  DrawingObj
//
//  Created by BSA Univ19 on 23/06/14.
//  Copyright (c) 2014 BSA Univ19. All rights reserved.
//

#import "colorpageViewController.h"

@interface colorpageViewController ()
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    CGPoint lastPoint;
    
    BOOL mouseSwiped;
    
    int mouseMoved;
    
    UIImageView *image;
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
}
@end

@implementation colorpageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    screenRect= [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight= screenRect.size.height;
    
    //set the color as black
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    brush = 10.0;
    opacity = 1.0;
    
    image = [[UIImageView alloc ] initWithFrame:CGRectMake(0, 0,screenWidth, screenHeight-300)];
    [image setBackgroundColor:[UIColor redColor]];
    
    image.image = nil;
    
    image.tag = 1000;
    
    // signImage.layer.borderWidth = 3.0;
    // signImage.layer.borderColor = [[UIColor blackColor] CGColor];
    
    [self.view addSubview:image];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    mouseSwiped = NO;
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchLocation = [touch locationInView:self.view];
    
    
    
    if (CGRectContainsPoint(image.frame, touchLocation))
        
    {
        
        lastPoint = [touch locationInView:image];
        
    }
    
    
    
    
}



- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = YES;
    
    CGPoint currentPoint;
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchLocation = [touch locationInView:self.view];
    
    
    
    if (CGRectContainsPoint(image.frame, touchLocation))
        
    {
        
        currentPoint = [touch locationInView:image];
        
        UIGraphicsBeginImageContext(image.frame.size);
        
        [image.image drawInRect:CGRectMake(0, 0, image.frame.size.width, image.frame.size.height)];
        
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
        
        CGContextBeginPath(UIGraphicsGetCurrentContext());
        
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        
        image.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    
    
    //currentPoint.y -= 150;
    
    
    
    lastPoint = currentPoint;
    
    
    
    mouseMoved++;
    
    
    
    if (mouseMoved == 10) {
        
        mouseMoved = 0;
        
    }
    
    
    
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    if(!mouseSwiped) {
        
        
        
        CGPoint currentPoint;
        
        UITouch *touch = [touches anyObject];
        
        CGPoint touchLocation = [touch locationInView:self.view];
        
        
        
        if (CGRectContainsPoint(image.frame, touchLocation))
            
        {
            
            currentPoint = [touch locationInView:image];
            
            
            
            UIGraphicsBeginImageContext(image.frame.size);
            
            [image.image drawInRect:CGRectMake(0, 0, image.frame.size.width, image.frame.size.height)];
            
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
            
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
            
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
            
            CGContextBeginPath(UIGraphicsGetCurrentContext());
            
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            
            image.image = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
        }
        
    }
    
}

- (IBAction)Black:(id)sender
{
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
    
}

- (IBAction)Blue:(id)sender
{
    red = 0.0/255.0;
    green = 0.0/255.0;
    blue = 255.0/255.0;
}

- (IBAction)Brown:(id)sender
{
    red = 165.0/255.0;
    green = 42.0/255.0;
    blue = 42.0/255.0;
}

- (IBAction)Skyblue:(id)sender
{
    red = 0.0/255.0;
    green = 255.0/255.0;
    blue = 255.0/255.0;
}

- (IBAction)Green:(id)sender
{
    red = 0.0/255.0;
    green = 255.0/255.0;
    blue = 0.0/255.0;
}

- (IBAction)Pink:(id)sender
{
    red = 255.0/255.0;
    green = 0.0/255.0;
    blue = 255.0/255.0;
}

- (IBAction)Orange:(id)sender
{
    red = 255.0/255.0;
    green = 165.0/255.0;
    blue = 0.0/255.0;
}

- (IBAction)Purple:(id)sender
{
    red = 128.0/255.0;
    green = 0.0/255.0;
    blue = 128.0/255.0;
}

- (IBAction)Red:(id)sender
{
    red = 255.0/255.0;
    green = 0.0/255.0;
    blue = 0.0/255.0;
}

- (IBAction)Yellow:(id)sender
{
    red = 255.0/255.0;
    green = 255.0/255.0;
    blue = 0.0/255.0;
}

- (IBAction)Erase:(id)sender
{
    red = 255.0/255.0;
    green = 255.0/255.0;
    blue = 255.0/255.0;
}

- (IBAction)Reset:(id)sender
{
    [image setImage:Nil];
}
@end
