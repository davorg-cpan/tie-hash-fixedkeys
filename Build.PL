use Module::Build;
my $build = new Module::Build(module_name => 'Tie::Hash::FixedKeys',
			      license => 'perl',
			      requires => {
					   perl           => '5.6.0',
					  },
                              create_makefile_pl => 'traditional'
			     );
$build->create_build_script;

