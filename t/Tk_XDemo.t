# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use blib;
use Tk;
use Test::More tests => 1;
require Tk::MainWindow;
require Tk::HList;
require Tk::TextHighlight;

my $main = new MainWindow;
my $ed;
my $pl = $main->Scrolled('HList',
	-scrollbars => 'osoe',
	-browsecmd => sub {
		my $stx = shift;
		$ed->configure(-syntax => $stx, '-rules' => undef);
		$ed->Load("samples/$stx.test");
	},
)->pack(
	-side => 'left', 
	-fill => 'y'
);
$ed = $main->Scrolled('TextHighlight',
	-wrap => 'none',
	-syntax => 'Bash',
	-scrollbars => 'se',
)->pack(
	-side => 'left',
	-expand => 1,
	-fill => 'both',
);

my @plugs = $ed->highlightPlugList;
foreach my $p (@plugs) {
	$pl->add($p,
		-text => $p,
	);
}
$main->configure(-menu => $ed->menu);
$main->MainLoop;

BEGIN { use_ok('Tk::RulesEditor') };   #NEEDED THIS TO MAKE TEST HARNESS PASS?!?!?!
