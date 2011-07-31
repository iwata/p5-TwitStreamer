#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use lib "$FindBin::Bin/../extlib/lib/perl5";

use Getopt::Long qw(:config auto_help);
use Pod::Usage;
use feature qw/say/;

use TwitStreamer;

my %opt = (pit => 'twitter.com', viewer => 'growl');
GetOptions( \%opt, qw/pit=s viewer|v=s/) or exit 1;

if ( TwitStreamer::run($opt{pit}, $opt{viewer}) ) {
    say 'end';
}

__END__

=head1 NAME

B<streamer.pl> - start stream

=head1 VERSION

0.01

=head1 DESCRIPTION

start twitter stream

=head1 SYNOPSIS

  Options:
    --pit           pit key for twitter(default twitter)
    --track|-t      tracking keyword for twitter stream(required)

=head1 OPTIONS

=item B<--help|-h>

Print brief help message and exit

=head1 AUTHOR

Motonori Iwata

=head1 SEE ALSO

=cut

# Local Variables:
# mode: perl
# perl-indent-level: 4
# indent-tabs-mode: nil
# coding: utf-8-unix
# End:
#
# vim: expandtab shiftwidth=4:
