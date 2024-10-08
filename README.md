# os384-cli
Command line interface to os384 servers (public).

## Installation
```zsh
    brew tap 384co/os384-cli
    brew install os384-cli
```

## Usage
```zsh
    384 <command> <parameters>
```

## Development

```zsh
    # do your thing with the scripts

    # update tag
    git tag -a 1.0.42 -m "version 0.0.1"
    git push origin 1.0.42

    # you can then make it
    make

    # and install it
    brew install os384-cli
    
    # if you've modified the Formula, you will need to untap and retap
    brew untap 384co/os384-cli
    brew tap 384co/os384-cli
```
