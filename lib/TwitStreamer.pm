package TwitStreamer;
use strict;
use warnings;

use Config::Pit;
use AnyEvent;
use AnyEvent::Twitter;
use AnyEvent::Twitter::Stream;
use String::CamelCase qw/camelize/;

our $VERSION = '0.01';

sub run {
    my ($pit, $out, $track) = @_;

    my $out_class = 'TwitStreamer::Out::'.camelize($out);
    Class::Load::load_class( $out_class );

    my $auth     = Config::Pit::get($pit);
    my $cv       = AnyEvent->condvar;
    my $streamer = AnyEvent::Twitter::Stream->new(
        %$auth,
        method   => 'filter',
        track    => $track,
        on_tweet => $out_class->call_back,
    );

    return $cv->recv;
}

1;
__END__

=head1 NAME

TwitStreamer -

=head1 SYNOPSIS

  use TwitStreamer;

=head1 DESCRIPTION

TwitStreamer is

=head1 AUTHOR

Motonori Iwata E<lt>gootonori@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
