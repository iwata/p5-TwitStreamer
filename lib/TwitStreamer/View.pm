package TwitStreamer::View;

use strict;
use warnings;

use Class::Load;
use String::CamelCase qw/camelize/;

sub factory {
    my $class = 'TwitStreamer::View::'.camelize( shift );
    Class::Load::load_class $class;
    $class->new;
}

1;

__END__

=head1 NAME

TwitStreamer::View

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
