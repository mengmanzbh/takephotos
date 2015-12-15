//
//  ViewController.m
//  takephoto
//
//  Created by kuailefu on 15/12/15.
//  Copyright © 2015年 kuailefu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (IBAction)showClicked:(id)sender
{
    FSMediaPicker *mediaPicker = [[FSMediaPicker alloc] init];
    mediaPicker.mediaType = FSMediaTypePhoto;
    mediaPicker.editMode = FSEditModeStandard;
    mediaPicker.delegate = self;
    [mediaPicker showFromView:sender];
}
- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    if (mediaInfo.mediaType == FSMediaTypeVideo) {
        
    } else {
        if (mediaPicker.editMode == FSEditModeNone) {
            self.imageView.image = mediaInfo.originalImage;
        } else {
            self.imageView.image = mediaPicker.editMode == FSEditModeCircular? mediaInfo.circularEditedImage:mediaInfo.editedImage;
        }
    }
}
- (void)mediaPickerDidCancel:(FSMediaPicker *)mediaPicker
{
    NSLog(@"%s",__FUNCTION__);
}


@end
