package Test::Delegation;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

use parent qw/Test::Builder::Module/;
our @EXPORT = qw/delegation_ok/;

use Test::Mock::Guard qw/mock_guard/;
use Test::MockObject;

my $CLASS = __PACKAGE__;

sub delegation_ok ($$$;$) {
    my ($context, $method, $delegation, $message) = @_;
    $message ||= sprintf '%s::%s is delegated to %s::%s', $context || ref $context, $method, $context || ref $context, $delegation;

    my $mock_delegator = Test::MockObject->new;
    $mock_delegator->set_false($method);

    my $guard = mock_guard $context => {
        $delegation => $mock_delegator,
    };

    $context->$method();

    my $tb = $CLASS->builder;
    return $tb->ok($mock_delegator->called($method), $message);
}

1;
__END__

=encoding utf-8

=head1 NAME

Test::Delegation - Make easy to test delegation methods

=head1 SYNOPSIS

    use Test::Delegation;

    delegation_ok $class, 'foo', 'bar'; # $class->bar->foo(...) is delegated by $class->foo(...)

    # sub foo { shift->bar->foo(@_) }
    # sub bar { ... }

=head1 DESCRIPTION

Test::Delegation is ...

=head1 LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

karupanerura E<lt>karupa@cpan.orgE<gt>

=cut

