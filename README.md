# Description
 Application for the purpose of studying the use of lint, git hooks and semantic version with golang.


 # Run 
Clone this project. Access the project directory and update the GO packages.

```bash 
 $ go mod tidy
```

To get everything ready, it is necessary to execute some commands from the Makefile. It is important to have make installed on your machine.

Keep in mind that the internal makefile commands will work on macOS and Linux; if you are using Windows, you will need to adapt them.

Allow Git to execute hooks and tags. This will allow Git to execute the pre-commit and pre-push hooks that have already been defined.

```bash
 $ make hooks
```

If you want to use semantic versioning in conjunction with Git tags, use the following command after finishing your commits.

```bash
 $ make version_and_git_tag
```

Feel free to explore the Makefile and adapt it for your use.


# Package

 [go imports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports?source=post_page-----c43740065c2e--------------------------------)

 [go fmt](https://go.dev/blog/gofmt?source=post_page-----c43740065c2e--------------------------------)

 [go lint](https://github.com/golang/lint)

 [go vet](https://pkg.go.dev/cmd/vet)

 [go gci lint](https://github.com/golangci/golangci-lint)

 [go commit lint](https://github.com/conventionalcommit/commitlint)

 # Next steps
 Check the possibility of replacing the version control with this item:
 [go releaser](https://goreleaser.com/install/#compiling-from-source)

