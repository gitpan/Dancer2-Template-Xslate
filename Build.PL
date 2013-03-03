
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Dancer2::Core::Hook" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Text::Xslate template engine for Dancer2",
  "dist_author" => [
    "Richard Sim\303\265es <rsimoes AT cpan DOT org>"
  ],
  "dist_name" => "Dancer2-Template-Xslate",
  "dist_version" => "v0.0.1",
  "license" => "mit",
  "module_name" => "Dancer2::Template::Xslate",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dancer2::Core::Role::Template" => 0,
    "Dancer2::Core::Types" => 0,
    "Dancer2::FileUtils" => 0,
    "Moo" => 0,
    "Text::Xslate" => 0,
    "perl" => "5.008"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
