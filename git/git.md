# Show remote url
> [StackOverflow](http://stackoverflow.com/questions/4089430/how-can-i-determine-the-url-that-a-local-git-repository-was-originally-cloned-fr)

1. If referential integrity has been broken:

  `git config --get remote.origin.url`

1. If referential integrity is intact:

  `git remote show origin`
  
1. `git ls-remote --get-url origin`
  
> Please note that remote name could be anything other than `origin`, though `origin` is a very common name.

You can use tab to autocomplete the remote if you do not know what it is. Or you can use:

  `git remote -v`
