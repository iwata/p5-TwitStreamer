package TwitStreamer::Filter::None;

use strict;
use warnings;
use utf8;

use base 'TwitStreamer::Filter::Base';

sub before {
    my ($class, $tweet) = @_;
    $tweet->{image} = $tweet->{user}{profile_image_url};
    $tweet;
}

1;

__END__

=head1 NAME

TwitStreamer::Filter::None

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
