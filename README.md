# NAME

Test::Delegation - Make easy to test delegation methods

# SYNOPSIS

    use Test::Delegation;

    delegate_ok $class, 'foo', 'bar'; # $class->bar->foo(...) is delegated by $class->foo(...)

    # sub foo { shift->bar->foo(@_) }
    # sub bar { ... }

# DESCRIPTION

Test::Delegation is ...

# LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

karupanerura <karupa@cpan.org>
