//
//  Card.m
//  PayApp
//
//  Created by Alexey on 11.12.15.
//  Copyright © 2015 Alexey. All rights reserved.
//

#import "Card.h"
#import "PANFormatter.h"

@implementation Card

-(NSString*)rootName
{
    return @"Card";
}

-(BOOL)creditDefault
{
    if (isCreditDefault && [isCreditDefault isEqualToString:@"true"])
        return YES;
    
    return NO;
}

-(void)setCreditDefault:(BOOL)creditDefault
{
    isCreditDefault = creditDefault?@"true":@"false";
}

-(NSString*)expiryDate
{
    if (expiryDateNative && expiryDateNative.length>0)
    {
        NSString * year = [expiryDateNative substringWithRange:NSMakeRange(2, 2)];
        NSString * month = [expiryDateNative substringWithRange:NSMakeRange(5, 2)];
        return [NSString stringWithFormat:@"%@/%@", month, year];
    }
    return @"";
    //2022-12+03:00
}

-(NSString*)expiryDateNativeValue
{
    return expiryDateNative;
}

-(void)setExpiryDate:(NSString *)expiryDate
{
    expiryDateNative = expiryDate;
}

-(NSString*)maskedPan
{
    if (_pan && _pan.length>0)
    {
        PANFormatter * panFormatter = [PANFormatter maskedLastFourNumberPanFormatter];
        NSString * lastFourNumberMaskedPan = [panFormatter stringFromPAN:_pan];
        if (lastFourNumberMaskedPan)
            return lastFourNumberMaskedPan;
    }
    return @"";
}

- (CHOrderedDictionary*) mapProperties
{
    
    return [CHOrderedDictionary dictionaryWithObjects:@[
                                                        @"cardId",
                                                        @"cardName",
                                                        @"cardState",
                                                        @"cardFill",
                                                        @"isCreditDefault",
                                                        @"cardPaySys",
                                                        @"expiryDateNative",
                                                        @"cardholderName",
                                                        @"pan",
                                                        @"cardCVC2"
                                                        ] forKeys:  @[
                                                                      @"CardId",
                                                                      @"CardName",
                                                                      @"CardState",
                                                                      @"CardFill",
                                                                      @"CreditDefault",
                                                                      @"CardPaySys",
                                                                      @"ExpiryDate",
                                                                      @"CardholderName",                                                                      
                                                                      @"PAN",
                                                                      @"CVC2"
                                                                      ]];
    
}

- (CHOrderedDictionary *)mapClasses
{
    return (CHOrderedDictionary*)@{};
}

-(NSArray*) attributes
{
    return nil;
}

+ (CardType) cardTypeForCardString:(NSString*)cardString
{
    NSInteger index = [@[@"American Express", @"Japan Credit Bureau", @"VISA", @"MasterCard" , @"Discover Card"] indexOfObject:cardString];
    if (index != NSNotFound)
        return (int)(index + 1);
    else
        return 0;
}

+ (UIImage*) cardLogoForType:(CardType)cardType
{
    switch (cardType)
    {
        case CardTypeAmex:
            return [UIImage imageNamed:@"payapp_kard_2_11_ae.png"];
            break;
            
        case CardTypeJCB:
            return [UIImage imageNamed:@"payapp_kard_2_11_jcb.png"];
            break;
            
        case CardTypeVisa:
            return [UIImage imageNamed:@"payapp_kard_2_11_visa.png"];
            break;
            
        case CardTypeMasterCard:
            return [UIImage imageNamed:@"payapp_kard_2_11_master.png"];
            break;
            
        case CardTypeDiscover:
            return [UIImage imageNamed:@"payapp_kard_2_11_discover.png"];
            break;
            
        case CardTypeMaestro:
            return [UIImage imageNamed:@"payapp_kard_2_11_maestro.png"];
            break;
            
        default:
            return [UIImage imageNamed:@"payapp_kard_2_11_noname.png"];
            break;
    }
}

+ (UIImage*) operationsCardLogoForType:(CardType)cardType
{
    switch (cardType)
    {
        case CardTypeAmex:
            return [UIImage imageNamed:@"payapp_kard_amex1.png"];
            break;
            
        case CardTypeJCB:
            return [UIImage imageNamed:@"payapp_kard_jcb1.png"];
            break;
            
        case CardTypeVisa:
            return [UIImage imageNamed:@"payapp_kard_visa1.png"];
            break;
            
        case CardTypeMasterCard:
            return [UIImage imageNamed:@"payapp_kard_master1.png"];
            break;
            
        case CardTypeDiscover:
            return [UIImage imageNamed:@"payapp_kard_discov1.png"];
            break;
            
        case CardTypeMaestro:
            return [UIImage imageNamed:@"payapp_kard_maestro.png"];
            break;
            
        default:
            return [UIImage imageNamed:@"payapp_kard_.png"];
            break;
    }
}
@end
