#!/usr/bin/perl -Tw
#-----------------------------------------------------------------------
# Name: ipmerge.pl
# Created: 2014-04-16
# Author: Royce Williams
# Updated-Date: 2017-03-30
# Updated-By: Leif Sawyer
# Purpose: combine a list of IPv4 subnets into the largest possible contiguous blocks.
# $Id: ipmerge.pl,v 1.1 2014/05/02 17:43:32 royce Exp royce $
#-----------------------------------------------------------------------

use strict;
use warnings;

use NetAddr::IP qw(Compact);

#-----------------------------------------------------------------------

my @addresses;
my @addresses_raw;

# Filter out non-IPv4 records.
while (<STDIN>) {
    if (m/^((?:\d{1,3}\.){3}\d{1,3}(?:\/\d{1,2})?)(.*)$/) {
        push @addresses_raw, $1;
    }
}

# Create network objects for each record.
push @addresses, NetAddr::IP->new($_) for @addresses_raw;

# Print output.
print join("\n", Compact(@addresses)), "\n";

#-----------------------------------------------------------------------
