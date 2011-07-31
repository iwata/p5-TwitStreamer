use strict;
use warnings;
use utf8;
use open OUT => qw/:utf8 :std/;

use FindBin;
use lib "$FindBin::Bin/../../extlib/lib/perl5";
use Test::More;
use Test::Exception;

use TwitStreamer::Filter::Instagram;

my $filter = TwitStreamer::Filter::Instagram->new;

{
    can_ok 'TwitStreamer::Filter::Instagram', 'before';

    my $tweet = {
        text => 'Just posted a photo  @ 大久保駅 (Okubo Sta.) http://instagr.am/p/I-B7n/',
        user => {
            screen_name       => 'test user',
            profile_image_url => 'http://a2.twimg.com/profile_images/237552700/icon_twitter.jpg'},
    };
    my $instagram = 'http://images.instagram.com/media/2011/07/31/1741bc1d685b43c0ab1a8d4303e2b2a7_7.jpg';

    lives_and {
        $filter->before($tweet);
        is $tweet->{image} => $instagram, 'scrape image';
    } 'scrape instagram image';
}

done_testing;
