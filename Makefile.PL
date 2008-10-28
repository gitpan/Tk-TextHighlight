use strict;
use ExtUtils::MakeMaker;

my $pm = 'TextHighlight';
my $ld = '$(INST_LIBDIR)';

WriteMakefile(
	NAME => "Tk::$pm",
	PREREQ_PM => {
		'Tk' => '800.024',
#		'Syntax::Highlight::Perl' => 0,
	},
#	PMLIBDIRS => ['Tk'],
	PM => {
		"lib/Tk/$pm.pm" => "$ld/$pm.pm",
		"lib/Tk/ROTextHighlight.pm" => "$ld/ROTextHighlight.pm",
		"$pm/Bash.pm" => "$ld/$pm/Bash.pm",
		"$pm/HTML.pm" => "$ld/$pm/HTML.pm",
		"$pm/Kate.pm" => "$ld/$pm/Kate.pm",
		"$pm/None.pm" => "$ld/$pm/None.pm",
		"$pm/Perl.pm" => "$ld/$pm/Perl.pm",
		"$pm/PerlCool.pm" => "$ld/$pm/PerlCool.pm",
		"$pm/Pod.pm" => "$ld/$pm/Pod.pm",
		"$pm/Template.pm" => "$ld/$pm/Template.pm",
		"$pm/Xresources.pm" => "$ld/$pm/Xresources.pm",
		"$pm.pod" => "$ld/$pm.pod",
		"RulesEditor.pm" => "$ld/RulesEditor.pm",
	},
	VERSION_FROM => "lib/Tk/$pm.pm",
	'dist'	=> {COMPRESS => 'gzip', SUFFIX => 'gz'},
	($] >= 5.005 ?
		(ABSTRACT => "a TextUndo widget with syntax highlight capabilities",
		AUTHOR	=> 'Jim Turner (turnerjw784@yahoo.coom)') : ()),
);

1

