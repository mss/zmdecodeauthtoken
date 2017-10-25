#!/usr/bin/perl
# Decode a zimbraAuthTokenKey or zimbraExternalAccountProvisioningKey
use v5.18;
use strict;
use warnings;
use Data::Dumper;
use POSIX qw(strftime);

my $token = $ARGV[0] || die "Usage: $0 token";

my @token = split(/:/, $token);
die "Invalid format: Wrong number of parts" if (scalar @token != 3);

my %token = (
  'key-id'  => $token[0] * 1,
  'created' => strftime('%Y-%m-%d %H:%M:%S', localtime($token[1] / 1000)),
  'secret'  => $token[2],
);

print Dumper(\%token);
