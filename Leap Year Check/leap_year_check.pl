use strict;
use warnings;

print "Hello! Let's check for leap year.\n";

sub checking {

    #print "Hello! Let's check for leap year.\n";
    print "Enter year (1600-4000): ";

    my $year = <STDIN>;
    chomp($year);

    if ($year >= 1600 && $year <= 4000) {
        if (($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0) {
            print "Result: $year - leap year\n";
        } else {
            print "Result: $year - not a leap year\n";
        }
    } else {
        print "Year is not included in the range from 1600 to 4000\n";
    }

    print "Do you want to check other year? [y/n]";
    my $new_try = <STDIN>;
    chomp($new_try);
    
    if ($new_try eq 'y') {
        checking();
    } elsif($new_try ne 'n') {
        print "Uncorrect enter. The programm is ending.\n";
    }

}

checking();
