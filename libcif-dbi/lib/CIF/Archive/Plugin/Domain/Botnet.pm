package CIF::Archive::Plugin::Domain::Botnet;
use base 'CIF::Archive::Plugin::Domain';

use strict;
use warnings;

use Iodef::Pb::Simple qw(iodef_impacts);

__PACKAGE__->table('domain_botnet');

sub prepare {
    my $class = shift;
    my $data = shift;

    my $impacts = iodef_impacts($data);
    foreach (@$impacts){
        return 1 if($_->get_content->get_content() =~ /^botnet$/);
    }
    return(0);
}

1;
