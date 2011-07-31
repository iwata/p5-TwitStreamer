package TwitStreamer::View::Growl;

use strict;
use warnings;
use utf8;
use Growl::Any;

use base 'TwitStreamer::View';

sub tweet {
    my ($class, $tweet) = @_;

    return unless (defined $tweet->{text});

    my $event = 'tweet';
    my $growl = Growl::Any->new(
        appname => $class->application,
        events  => [$event],
    );

    $growl->notify(
        $event,
        $tweet->{user}{screen_name},
        $tweet->{text},
        $tweet->{image},
    );
}

1;

__END__

=head1 NAME

TwitStreamer::View::Growl

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
