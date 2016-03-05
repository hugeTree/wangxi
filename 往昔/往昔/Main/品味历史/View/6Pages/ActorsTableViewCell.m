//
//  ActorsTableViewCell.m
//  往昔
//
//  Created by mac on 16/2/29.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "ActorsTableViewCell.h"

@implementation ActorsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setData:(MovieModel *)data {
    
    if (_data != data) {
        _data = data;
        //导演
        _directorLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, kScreenWidth - 40, kChineseTitleFont)];
        
        _directorLabel.text = [NSString stringWithFormat:@"导演: %@", _data.director];
        _directorLabel.font = [UIFont systemFontOfSize:kChineseTitleFont];
        _directorLabel.textColor = [UIColor blackColor];
        
        [self.contentView addSubview:_directorLabel];
        //演员
        NSMutableString *actorsName = [NSMutableString string];
        for (int i = 0; i < _data.actor.count; i++) {
            
            [actorsName appendString:[NSString stringWithFormat:@"%@/", _data.actor[i]]];
        }
        [actorsName deleteCharactersInRange:NSMakeRange(actorsName.length - 1, 1)];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = kLineSpace;
        paragraphStyle.headIndent = kHeadIndent;
        paragraphStyle.firstLineHeadIndent = 0;
        
        NSDictionary *attributes =@{
                                    NSParagraphStyleAttributeName : paragraphStyle,
                                    NSForegroundColorAttributeName : [UIColor blackColor],
                                    NSFontAttributeName            : [UIFont systemFontOfSize:kChineseTitleFont]
                                    };
        
        NSAttributedString *attributedText = [[ NSAttributedString alloc ] initWithString :[NSString stringWithFormat:@"主演: %@", actorsName] attributes:attributes];
        
        CGFloat height = [WXLabel getTextHeight:kChineseTitleFont width:kScreenWidth - 40 - kHeadIndent text:actorsName linespace:kLineSpace];
        
        _actorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + kChineseTitleFont + 20, kScreenWidth - 40, height)];
        _actorsLabel.numberOfLines = 0;
//        _actorsLabel.text = [NSString stringWithFormat:@"%@", attributedText];
        _actorsLabel.attributedText = attributedText;
        
        [self.contentView addSubview:_actorsLabel];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
