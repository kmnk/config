use strict;
use warnings;
use utf8;

use Test::More;

my $class;
BEGIN {
    $class = '{{_expr_:substitute(substitute(substitute(expand('%'), '.*lib[/]', '', 'g'), '[/]', '::', 'g'), '\.t$', '', 'g')}}';
    ::use_ok $class;
};

subtest 'sample' => sub {
    plan tests => 1;

    {{_cursor_}}

    pass 'i am sample test';
};

done_testing();
__END__

=head1 NAME

{{_expr_:expand('%')}} - {{_expr_:substitute(substitute(substitute(expand('%'), '.*lib[/]', '', 'g'), '[/]', '::', 'g'), '\.t$', '', 'g')}} のテスト


=head1 SYNOPSIS

    script/devel/proveit {{_expr_:expand('%')}}


=head1 DESCRIPTION

{{_expr_:substitute(substitute(substitute(expand('%'), '.*lib[/]', '', 'g'), '[/]', '::', 'g'), '\.t$', '', 'g')}} のテストです。


=head1 SEE ALSO

=over 4

=item {{_expr_:substitute(substitute(substitute(expand('%'), '.*lib[/]', '', 'g'), '[/]', '::', 'g'), '\.t$', '', 'g')}}

=back


=head1 AUTHOR

kmnk (kmnknmk+perl@gmail.com)


=head1 LICENSE AND COPYRIGHT

Copyright (c) <年> kmnk (kmnknmk+perl@gmail.com). All rights reserved.

MIT License


=cut
