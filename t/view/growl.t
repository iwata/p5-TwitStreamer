use strict;
use warnings;
use utf8;

use FindBin;
use lib "$FindBin::Bin/../../extlib/lib/perl5";
use Test::More;
use Test::Exception;

use TwitStreamer::View::Growl;

my $growl = TwitStreamer::View::Growl->new;

{
    can_ok 'TwitStreamer::View::Growl', 'tweet';

    my $tweet = {
        text => 'test',
        user => {
            screen_name       => 'test user',
            profile_image_url => 'http://a2.twimg.com/profile_images/237552700/icon_twitter.jpg'},
    };
    lives_ok { $growl->tweet($tweet) } 'tweet to growl';
}

done_testing;
