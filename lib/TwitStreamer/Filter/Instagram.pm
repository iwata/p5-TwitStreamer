package TwitStreamer::Filter::Instagram;

use strict;
use warnings;
use utf8;

use Carp;
use Web::Scraper;
use URI;

use base 'TwitStreamer::Filter';

my $scraper = scraper {
    process 'img.photo', image => '@src';
};

sub before {
    my ($class, $tweet) = @_;

    return unless $tweet->{text} =~ /(http:\/\/instagr\.am\/.+)/;

    my $res = eval {
        $scraper->scrape(URI->new($1))
    };
    if ( my $e = $@ ) {
        croak $e;
    }

    $tweet->{image} = $res->{image};
}

1;

__END__

=head1 NAME

TwitStreamer::Filter::Instagram

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 new

=head1 AUTHOR

Motonori Iwata, E<lt>gootonori@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Motonori Iwata.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
