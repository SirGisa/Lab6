//
//  ViewController.m
//  project2
//
//  Created by Shvarsman on 25.04.25.
//

#import "ViewController.h"
#import "Sportsperson.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indicator;
@property (weak, nonatomic) IBOutlet UILabel *sportindicator;
@property (weak, nonatomic) IBOutlet UIImageView *sportimage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.indicator.numberOfLines = 0;
    self.sportindicator.numberOfLines = 0;
    self.sportimage.image = nil;
    self.sportindicator.text = nil;
}

- (IBAction)refresh:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Enter city name", nil)
                                                                                 message:nil
                                                                          preferredStyle:UIAlertControllerStyleAlert];

        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = NSLocalizedString(@"City name", nil);
        }];

        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil)
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textField = alert.textFields.firstObject;
            NSString *cityName = textField.text;

            NSDictionary *weatherData = @{
                @"Minsk": @(-5),
                @"Gomel": @(10),
                @"Hamburg": @(22),
                @"Berlin": @(3)
            };

            NSDictionary *cityData = @{
                @"Minsk": [[Sportsperson alloc] initWithName:@"Виктор Ананьев"
                                                     imageName:@"victor_ananev"
                                                     achievements:NSLocalizedString(@"Achievements of Victor Ananev", nil)],
                @"Gomel": [[Sportsperson alloc] initWithName:@"Анатолий Карпенко"
                                                      imageName:@"anatoly_karpenko"
                                                      achievements:NSLocalizedString(@"Achievements of Anatoly Karpenko", nil)],
                @"Berlin": [[Sportsperson alloc] initWithName:@"Мария Ласицкене"
                                                       imageName:@"maria_lasitskene"
                                                       achievements:NSLocalizedString(@"Achievements of Maria Lasitskene", nil)],
                @"Hamburg": [[Sportsperson alloc] initWithName:@"Кристиано Роналду"
                                                        imageName:@"christiano_ronaldo"
                                                        achievements:NSLocalizedString(@"Achievements of Cristiano Ronaldo", nil)]
            };

            NSNumber *temperature = weatherData[cityName];
            Sportsperson *sportsperson = cityData[cityName];

            if (temperature != nil && sportsperson != nil) {
                NSString *formattedString = [NSString stringWithFormat:NSLocalizedString(@"temperature_info", nil), cityName, temperature.integerValue];
                UIColor *color;

                if (temperature.integerValue < 0) {
                    color = [UIColor blueColor];
                } else if (temperature.integerValue <= 15) {
                    color = [UIColor yellowColor];
                } else {
                    color = [UIColor redColor];
                }

                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:formattedString];
                [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, formattedString.length)];

                self.indicator.attributedText = attributedString;

                // Показываем спортсмена
                self.sportimage.image = sportsperson.image;
                self.sportindicator.text = [NSString stringWithFormat:@"%@\n\n%@", sportsperson.name, sportsperson.achievements];
            } else {
                NSString *errorString = NSLocalizedString(@"city_not_found", nil);
                self.indicator.text = errorString;
                self.indicator.textColor = [UIColor grayColor];
                self.sportimage.image = nil;
                self.sportindicator.text = nil;
            }
        }];

        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                              style:UIAlertActionStyleCancel
                                                            handler:nil];

        [alert addAction:okAction];
        [alert addAction:cancelAction];

        [self presentViewController:alert animated:YES completion:nil];
}


@end
