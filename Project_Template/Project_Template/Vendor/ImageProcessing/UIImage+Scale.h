

@interface UIImage (Scale)

-(UIImage *)scaleToWidth:(CGFloat)width;
- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

@end