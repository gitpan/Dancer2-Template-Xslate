
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.09

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Dancer2/Template/Xslate.pm',
    't/00-compile.t',
    't/01-file.t',
    't/author-critic.t',
    't/author-no-tabs.t',
    't/author-pod-spell.t',
    't/author-test-eol.t',
    't/release-cpan-changes.t',
    't/release-dist-manifest.t',
    't/release-distmeta.t',
    't/release-kwalitee.t',
    't/release-minimum-version.t',
    't/release-mojibake.t',
    't/release-pod-coverage.t',
    't/release-pod-linkcheck.t',
    't/release-pod-syntax.t',
    't/release-portability.t',
    't/release-test-version.t',
    't/release-unused-vars.t',
    't/views/index.tx',
    't/views/layouts/main.tx'
);

notabs_ok($_) foreach @files;
done_testing;
