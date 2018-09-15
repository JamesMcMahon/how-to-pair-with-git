# How to track pairing with Git?

Doc to store research and learnings as I try to figure out how best to capture pairing with Git in 2018.

## Git

How does Git enable pairing?

### Trailers
* `Signed-off-by` - see [`--signoff`](https://git-scm.com/docs/git-commit#git-commit---signoff)
* `Co-authored-by`

## Platforms

### Github

Github supports pairing via the `Co-authored-by` trailer.

[Commit together with co-authors](https://blog.github.com/2018-01-29-commit-together-with-co-authors/)

It also appears to work with the `Signed-off-by` trailer. Have't tested more then 2 people.

### Gitlab

Haven't tested but Gitlab has several issues open to support pairing:

* [Utilize Co-authored-by convention in UX](https://gitlab.com/gitlab-org/gitlab-ce/issues/31640)
* [Display commit co-authors alongside main author](https://gitlab.com/gitlab-org/gitlab-ce/issues/44986)

Appears to still be WIP.

## Tools

### git-together

Repo: https://github.com/kejadlen/git-together

License: MIT

Language: Rust

#### Implementation

git-together uses he `Signed-off-by` trailer to mark commits as having multiple authors.

#### Limitations

* Only supports two people on the commit at a time, rotates signed off between commits if there are more then 2 authors.
* Uses `Signed-off-by` instead of `Co-authored-by` by.
* Alias the git command so that all git actions run through it. Not sure why, I think it is using this to amend `--signoff` to each commit.

Note: can use `Co-authored-by` if used through [git-author](https://github.com/xinzweb/git-author).

### git-coauthor

Repo: https://github.com/simoleone/git-coauthor

License: MIT

Language: Bash

#### Implementation

Simple bash script to add `Co-authored-by` to commits.

#### Limitations

* Uses global git config which would snowflake machines and make author configuration non-portable.
* Doesn't appear to actually work. Might be something local to my setup, but I couldn't get it to actually do anything.


### git-duet

Repo: https://github.com/git-duet/git-duet

License: MIT

Language: Go / Bash split

#### Implementation

Need to revisit as I haven't used in a while but it does have an experimental mode that will append `Co-authored-by` to commits.

#### Limitations

* Need to revisit, but it is odd that it has two distinct ways of operating.

### git-pair

Repo: https://github.com/pivotal-legacy/git_scripts

License: MIT

Language: Ruby

#### Implementation

Munages author string to be a concatenation of all authors on the commit.

#### Limitations

* Old and seemingly unmaintained.
* Does not use trailers so authors with not be recognized by platforms like Github et al.


## License

[![CC BY 4.0](https://i.creativecommons.org/l/by/4.0/88x31.png)](https://creativecommons.org/licenses/by/4.0/)

This work is licensed under a Creative Commons Attribution 4.0 International License.

See [LICENSE](LICENSE) for more information.
