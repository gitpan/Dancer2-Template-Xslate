package Dancer2::Template::Xslate;

use v5.10;
use strict;
use warnings FATAL => "all";
use utf8;

use Carp;
use Moo;
use Dancer2::Core::Types;
use Dancer2::FileUtils qw(read_file_content);
use File::Spec::Functions qw(splitpath);
use Text::Xslate;

our $VERSION = 'v0.0.2'; # VERSION
# ABSTRACT: Text::Xslate template engine for Dancer2

with "Dancer2::Core::Role::Template";

has "+engine" => (
    isa => InstanceOf["Text::Xslate"]
);
has "+default_tmpl_ext" => (
    default => sub {"tx"},
);

sub _build_engine {
    my ($self) = @_;

    # Set a default path that is overridable by the engine config:
    return Text::Xslate->new(path => ["/"], %{ $self->config });
}

sub render {
    my ($self, $tmpl, $vars) = @_;

    my $xslate = $self->engine;
    my $content = eval {
        if ( ref($tmpl) eq "SCALAR" ) {
            $xslate->render_string($$tmpl, $vars)
        }
        else {
            $xslate->render($tmpl, $vars);
        }
    };

    if ( my $error = $@ ) { croak $error }

    return $content;
}

1;
=encoding utf8

=head1 NAME

Dancer2::Template::Xslate - Text::Xslate template engine for Dancer2

=head1 SYNOPSIS

C<config.yaml>:

    template: xslate
    engines:
      xslate: { path: "views" }

A Dancer 2 application:

    use Dancer2;

    get /page/:number => sub {
        my $page_num = params->{number};
        template "foo.tx", { page_num => $page_num };
    };

=head1 METHODS

=over

=item render($template, $tokens)

Renders a template. C<$template> can be one of:

=over 2

=item *

a string of the path to a template file (*.tx, not *.tt like the core Dancer2
template engines)

=item *

a reference to a string containing prerendered template content

=back

=back

=head1 SEE ALSO

=over

=item L<Dancer::Template::Xslate>

Xslate rendering engine for Dancer 1.

=back

=head1 AUTHOR

Richard Simões C<< <rsimoes AT cpan DOT org> >>

=head1 COPYRIGHT AND LICENSE

Copyright © 2013 Richard Simões. This module is released under the terms of the
B<MIT License> and may be modified and/or redistributed under the same or any
compatible license.
