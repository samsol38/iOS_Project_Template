//
//  InterfaceUtility.m
//  Project_Template
//
//  Created by SamSol on 29/08/15.
//  Copyright (c) 2015 SamSol. All rights reserved.
//

#import "InterfaceUtility.h"

@implementation InterfaceUtility

NSString *const KNoInternetMessage = @"Internet connection is not available.";

static UIAlertView *alertView = nil;

+(void)displayAlertViewWithTitle:(NSString*)title andMessage:(NSString*)message{
    dispatch_async(dispatch_get_main_queue(), ^{
        if(alertView == nil){
            alertView = [[UIAlertView alloc] initWithTitle:nil message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        }
        
        [alertView setTitle:title];
        [alertView setMessage:message];
        [alertView setDelegate:nil];
        [alertView show];
    });
}

+(void)displayAlertViewForNoInternetWithTerminateApp:(BOOL)wantTerminateApp{
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIAlertView showWithTitle:@"⚠️ Error"
                           message:KNoInternetMessage
                 cancelButtonTitle:@"OK"
                 otherButtonTitles:nil
                          tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex){
                              if (buttonIndex == [alertView cancelButtonIndex]) {
                                  if(wantTerminateApp){
                                      exit(0);
                                  }
                              }
                          }];
    });
}

+(CGSize)getDeviceScreenSize{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return screenBounds.size;
}

+(void)setBorderColor:(UIColor*)borderColor width:(CGFloat)width andRadius:(CGFloat)radius ofView:(UIView*)view{
    
    [view.layer setBorderColor:borderColor.CGColor];
    [view.layer setBorderWidth:width];
    [view.layer setCornerRadius:radius];
}

+(void)setTopBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view{
    
    NSString *layerName = @"upper_layer";
    
    for(CALayer *layer in [view.layer sublayers]){
        if([layer.name isEqualToString:layerName]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    CALayer *upperBorder = [CALayer layer];
    
    [upperBorder setName:layerName];
    
    upperBorder.frame = CGRectMake(0, 0, CGRectGetWidth(view.frame), 1.0f);
    [upperBorder setBorderWidth:width];
    upperBorder.borderColor = [borderColor CGColor];
    [view.layer addSublayer:upperBorder];
}

+(void)setBottomBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view{
    
    NSString *layerName = @"bottom_layer";
    
    for(CALayer *layer in [view.layer sublayers]){
        if([layer.name isEqualToString:layerName]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    CALayer *bottomBorder = [CALayer layer];
    
    [bottomBorder setName:layerName];
    bottomBorder.frame = CGRectMake(0, CGRectGetHeight(view.frame)-width, CGRectGetWidth(view.frame), width);
    
    bottomBorder.borderColor = [borderColor CGColor];
    [bottomBorder setBorderWidth:width];
    [view.layer addSublayer:bottomBorder];
}

+(void)setLeftBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view{
    
    NSString *layerName = @"left_layer";
    
    for(CALayer *layer in [view.layer sublayers]){
        if([layer.name isEqualToString:layerName]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    CALayer *leftBorder = [CALayer layer];
    
    [leftBorder setName:layerName];
    
    leftBorder.frame = CGRectMake(0, 0, width, CGRectGetHeight(view.frame));
    leftBorder.borderColor = [borderColor CGColor];
    [leftBorder setBorderWidth:width];
    [view.layer addSublayer:leftBorder];
}

+(void)setRightBorderColor:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view{
    
    NSString *layerName = @"right_layer";
    
    for(CALayer *layer in [view.layer sublayers]){
        if([layer.name isEqualToString:layerName]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    CALayer *rightBorder = [CALayer layer];
    
    [rightBorder setName:layerName];
    
    rightBorder.frame = CGRectMake(0, CGRectGetWidth(view.frame), width, CGRectGetHeight(view.frame));
    rightBorder.borderColor = [borderColor CGColor];
    [rightBorder setBorderWidth:width];
    [view.layer addSublayer:rightBorder];
}


+(void)setCircleViewWith:(UIColor*)borderColor width:(CGFloat)width ofView:(UIView*)view{
    [view.layer setCornerRadius:view.frame.size.width/2];
    [view.layer setMasksToBounds:YES];
    [view.layer setBorderWidth:width];
    [view.layer setBorderColor:[borderColor CGColor]];
    
    CALayer* containerLayer = [CALayer layer];
    containerLayer.shadowColor = [UIColor blackColor].CGColor;
    containerLayer.shadowRadius = 10.f;
    containerLayer.shadowOffset = CGSizeMake(0.f, 5.f);
    containerLayer.shadowOpacity = 1.f;
    
    [view.superview.layer addSublayer:containerLayer];
}

+(void)setIndicatorAtBottomWithInnerFillColor:(UIColor*)innerFillColor ofView:(UIView*)iView{
    
    NSString *layerNamebox = @"bottom_box_layer";
    NSString *layerNamepoint = @"bottom_point_layer";
    
    for(CALayer *layer in [iView.layer sublayers]){
        if([layer.name isEqualToString:layerNamebox]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    for(CALayer *layer in [iView.layer sublayers]){
        if([layer.name isEqualToString:layerNamepoint]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    CGSize viewSize = iView.layer.bounds.size;
    CGMutablePathRef path;
    CAShapeLayer *shapeLayer;
    
    CGFloat pathWidth, pathHeight;
    pathWidth = 14.0f;
    pathHeight = 5.0f;
    
    CGFloat startPointX = (viewSize.width - pathWidth)/2;
    CGFloat endPointX = startPointX + pathWidth;
    CGFloat midPointX = startPointX + pathWidth/2;
    
    path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, startPointX, 0.0f);
    CGPathAddLineToPoint(path, NULL, midPointX, pathHeight);
    CGPathAddLineToPoint(path, NULL, endPointX, 0.0f);
    CGPathAddLineToPoint(path, NULL, startPointX, 0.0f);
    
    shapeLayer = [CAShapeLayer layer];
    [shapeLayer setPath:path];
    [shapeLayer setFillColor:[innerFillColor CGColor]];
    [shapeLayer setStrokeColor:[innerFillColor CGColor]];
    [shapeLayer setLineWidth:0.0];
    [shapeLayer setPosition:CGPointMake(0.0f, 0.0f)];
    [shapeLayer setFrame:CGRectMake(0.0f, viewSize.height, viewSize.width, pathHeight)];
    [shapeLayer setName:layerNamepoint];
    [iView.layer addSublayer:shapeLayer];
    CGPathRelease(path);
}

+(void)removeIndicatorFromView:(UIView*)iView{
    
    NSString *layerNamebox = @"bottom_box_layer";
    NSString *layerNamepoint = @"bottom_point_layer";
    
    for(CALayer *layer in [iView.layer sublayers]){
        if([layer.name isEqualToString:layerNamebox]){
            [layer removeFromSuperlayer];
            break;
        }
    }
    
    for(CALayer *layer in [iView.layer sublayers]){
        if([layer.name isEqualToString:layerNamepoint]){
            [layer removeFromSuperlayer];
            break;
        }
    }
}

+(UIViewController *)getViewControllerFromSubView:(UIView*)view{
    
    Class viewControllerClass = [UIViewController class];
    
    UIResponder *responder = view;
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass: viewControllerClass]){
            return (UIViewController *)responder;
        }
    }
    
    return nil;
}

+(CGSize)getAppropriateSizeFromSize:(CGSize)iSize withDivision:(CGFloat)divider andInterSpacing:(CGFloat)interSpacing{
    
    CGFloat iWidth = iSize.width;
    CGFloat iHeight = iSize.height;
    
    CGFloat oWidth, oHeight;
    
    if(iWidth >= iHeight){
        oWidth = (iHeight - (interSpacing*(divider+1)))/divider;
        oHeight = oWidth;
    }else{
        oWidth = (iWidth - (interSpacing*(divider+1)))/divider;
        oHeight = oWidth;
    }
    
    CGSize oSize = CGSizeMake(oWidth, oHeight);
    return oSize;
}

+(CGSize)aspectScaledImageSizeForImageView:(UIImageView *)iv image:(UIImage *)image{
    
    float x,y;
    float a,b;
    x = iv.frame.size.width;
    y = iv.frame.size.height;
    a = image.size.width;
    b = image.size.height;
    
    if ( x == a && y == b ) {
        
    }
    else if ( x > a && y > b ) {
        if ( x-a > y-b ) {
            a = y/b * a;
            b = y;
        } else {
            b = x/a * b;
            a = x;
        }
    }
    else if ( x < a && y < b ) {
        if ( a - x > b - y ) {
            a = y/b * a;
            b = y;
        } else {
            b = x/a * b;
            a = x;
        }
    }
    else if ( x < a && y > b ) {
        b = x/a * b;
        a = x;
    }
    else if ( x > a && y < b ) {
        a = y/b * a;
        b = y;
    }
    else if ( x == a ) {
        a = y/b * a;
        b = y;
    } else if ( y == b ) {
        b = x/a * b;
        a = x;
    }
    return CGSizeMake(a,b);
    
}

+(UIImage *)cropImage:(UIImage*)image fromRect:(CGRect)rect{
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

+ (UIImage *)imageFromColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/*      Color Functions     */

+(UIColor *)colorWithHexString:(NSString *)str{
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [InterfaceUtility colorWithHex:(UInt32)x];
}

+(UIColor *)colorWithHex:(UInt32)col{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1];
}

+(CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width{
    
    UITextView *textView = [[UITextView alloc] init];
    [textView setAttributedText:text];
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    textView = nil;
    return size.height;
}

-(void)dealloc{
    alertView = nil;
}

@end
