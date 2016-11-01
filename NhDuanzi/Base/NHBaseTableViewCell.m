//
//  NHBaseTableViewCell.m
//  NhDuanzi
//
//  Created by EWSAPPLE on 16/11/1.
//  Copyright © 2016年 com.ews. All rights reserved.
//

#import "NHBaseTableViewCell.h"

@implementation NHBaseTableViewCell

-(UITableView *)tableView{
    float version=[[[UIDevice currentDevice]systemVersion]floatValue];
    if (version>=7.0) {
        return (UITableView*)self.superview.superview;
    }else{
        return (UITableView*)self.superview;
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+(instancetype)cellWithTabelView:(UITableView *)tableView{
    if (tableView==nil) {
        return [[self alloc]init];
    }
    NSString *classname=NSStringFromClass([self class]);
    NSString *identifier=[classname stringByAppendingString:@"CellID"];
    [tableView registerClass:[self class] forCellReuseIdentifier:identifier];
    return [tableView dequeueReusableCellWithIdentifier:identifier];
}

+(instancetype)nibCellWithTableView:(UITableView *)tabelView{
    if (tabelView ==nil) {
        return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    }
    NSString *classname=NSStringFromClass([self class]);
    NSString *identifier = [classname stringByAppendingString:@"nibCellID"];
    UINib *nib = [UINib nibWithNibName:classname bundle:nil];
    [tabelView registerNib:nib forCellReuseIdentifier:identifier];
    return [tabelView dequeueReusableCellWithIdentifier:identifier];
}

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
