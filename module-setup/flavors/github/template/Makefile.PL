use inc::Module::Install;
name '[% dist %]';
all_from 'lib/[% module_unix_path %].pm';
[% IF config.readme_from -%]
readme_from 'lib/[% module_unix_path %].pm';
[% END -%]
[% IF config.readme_markdown_from -%]
readme_markdown_from 'lib/[% module_unix_path %].pm';
[% END -%]
[% IF config.readme_pod_from -%]
readme_pod_from 'lib/[% module_unix_path %].pm';
[% END -%]
[% IF config.githubmeta -%]
githubmeta;
[% END -%]

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
