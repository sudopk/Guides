# Show git branch
Add to `.bashrc`:

  ```bash
  # Prompt will show git branch
  PS1='\w$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]]")$ '
  ```
