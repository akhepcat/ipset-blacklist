#!/usr/bin/perl -Tw
#-----------------------------------------------------------------------
# Name: ipmerge.pl
# Created: 2014-04-16
# Author: Royce Williams
# Purpose: combine a list of subnets into the largest possible contiguous blocks.
# $Id: ipmerge.pl,v 1.1 2014/05/02 17:43:32 royce Exp royce $
#-----------------------------------------------------------------------

use strict;
use warnings;

use NetAddr::IP;

#-----------------------------------------------------------------------

my @addresses;
my @addresses_raw = (<STDIN>);

# Rough filter for non-IP records.
my @addresses_raw2 = grep /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/, @addresses_raw;

# Create network objects for each record.
push @addresses, NetAddr::IP->new($_) for @addresses_raw2;

# Print output.
print join("\n", NetAddr::IP::compact(@addresses)), "\n";

#-----------------------------------------------------------------------
