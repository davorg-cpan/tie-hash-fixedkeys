use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Tie::Hash::FixedKeys',
    'VERSION_FROM'	=> 'FixedKeys.pm', # finds $VERSION
    'PREREQ_PM'		=> { Attribute::Handlers => 0.76,
                             Test::Simple => 0,
                             Test::Pod    => 0 },
);
