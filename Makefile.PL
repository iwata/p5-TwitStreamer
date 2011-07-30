use inc::Module::Install;
name 'TwitStreamer';
all_from 'lib/TwitStreamer.pm';
readme_from 'lib/TwitStreamer.pm';
readme_markdown_from 'lib/TwitStreamer.pm';
readme_pod_from 'lib/TwitStreamer.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
