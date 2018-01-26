1. GPG cheasheet: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
1. The public key is for encrypting the data, and the private key is used for decrypting it.
1. Generate key pair: `gpg --gen-key` or better `gpg --full-generate-key`
    * Use `RSA and RSA (default)`
    * Use `2048` or better `4096` bits
1. All commands in the cheatsheet. Some useful ones:
    * `gpg --export -a "User Name" > public.key`
        * For "User name", use the name or email address used while generating.
    * `gpg --export-secret-key -a "User Name" > private.key`
    * `gpg --import public.key`
    * `gpg --delete-key "User Name"`
    * `gpg --list-keys`
    * `gpg --list-secret-keys`
1. To see info about the `.gpg` file: `gpg --list-packets file.gpg`


