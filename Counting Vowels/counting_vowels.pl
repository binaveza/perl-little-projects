use strict;
use warnings;

print ("Hello. This is a simple vowels checking.\n");

sub counting_vowels {
    print "Enter text: ";

    my $text = <STDIN>;
    chomp($text);

    my $count = ($text =~ tr/aeiouAEIOU//);
    print ("Count of vowels: $count.\n");

    print "Do you want to check other word? [y/n]";
    my $new_try = <STDIN>;
    chomp($new_try);
    
    if ($new_try eq 'y') {
        counting_vowels();
    } elsif($new_try ne 'n') {
        print "Uncorrect enter. The programm is ending.\n";
    }
}

counting_vowels();

