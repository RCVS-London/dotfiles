# RCVS Dotfiles

Save generic, reusable code to this repository so that it can be submoduled into other
repositories.

To submodule, run the following in the root of the parent repository:
`git submodule add https://github.com/RCVS-London/dotfiles.git`

Then create symbolic links to the files you want from where you want like so:
`ln -s dotfiles/file_i_want`

`file_i_want` will now be part of the parent repository in that directory, but changes
to it will be reflected in this repository and can easily be pushed to all other
projects using this repository.

Submodule diffs do not appear in the parent repository by default, so you either need to
`cd` into it to see and commit them or use some of the more advanced techniques from the
[git documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

## Pre-commit

After installing pre-commit itself (e.g: `poetry add pre-commit`) you need to install
the hooks before making commits using `pre-commit install` and
`pre-commit install --hook-type commit-msg`.
