# Contributing to bspwmctl

Thank you for your interest in contributing to bspwmctl! We appreciate any help to make this project better.

## How to contribute

| If you want to...                | then...
|----------------------------------|-------
| report a **bug**                 | open a [Bug Report issue][bug-report]
| suggest a **feature**            | open a [Feature Request issue][feature-request]
| suggest an **improvement**       | open a [Feature Request issue][feature-request]
| ask a **question**               | open a [Question issue][question]
| contribute **code**              | follow the steps below
| report a **documentation** issue | open an issue in the [documentation repository][docs-repo]
| do **something else**            | open an [issue][issues] and let us know!

## Contributing code

1. **Fork the repository**: Create your own fork of bspwmctl
2. **Pick an issue**: Check the [open issues][issues] and pick one that interests you
   - Comment on the issue that you're working on it to avoid duplicate work
   - If there's no issue for what you want to work on, create one first!
3. **Create a branch**: Work on your changes in a new branch
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Make your changes**: Write your code following our guidelines below
5. **Test your changes**: Make sure everything works as expected on different distros if possible
6. **Commit your changes**: Use clear and descriptive commit messages
   ```bash
   git commit -m "Add: brief description of your changes"
   ```
7. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
8. **Create a Pull Request**: Open a PR from your fork to the `main` branch
   - Describe what your PR does
   - Reference the issue it solves (e.g., "Closes #42")
   - Assign @lukatinarelli to review it

## Code guidelines

- **Keep it simple**: bspwmctl is written in Shell, keep scripts readable and maintainable
- **Follow the style**: Try to match the existing code style in the project
- **Comment your code**: Explain complex logic or non-obvious decisions
- **Test on multiple distros**: If possible, test on Debian, Arch, and Fedora-based systems. `bspwmctl install` really installs packages and replaces configs, so use a VM or a container, not your daily machine
- **Run the checks**: `bash -n bspwmctl` and `shellcheck --severity=warning bspwmctl`. Every pull request also builds the packages and test-installs them on GitHub Actions
- **Packages**: if you add one, check that it exists with that name in Debian/Ubuntu, Arch and Fedora (names often differ)
- **Handle errors**: Make sure your code handles edge cases and provides helpful error messages
- **Update documentation**: If you add a new feature or option, update the `README.md` and consider updating the [documentation site][docs-repo]

## What makes a good contribution?

- ✅ Fixes bugs or improves existing functionality
- ✅ Adds requested features from the issues
- ✅ Improves documentation or adds examples
- ✅ Adds support for new distros or desktop environments
- ✅ Optimizes performance or code quality
- ❌ Large changes without prior discussion
- ❌ Breaking changes without good reason

## Questions?

If you're unsure about anything, don't hesitate to open an [issue][issues] and ask! We're here to help.

---

Thank you for contributing to bspwmctl! 🎉


[issues]: https://github.com/bspwmctl/bspwmctl/issues
[bug-report]: https://github.com/bspwmctl/bspwmctl/issues/new?labels=bug&template=bug_report.md
[feature-request]: https://github.com/bspwmctl/bspwmctl/issues/new?labels=enhancement&template=feature_request.md
[question]: https://github.com/bspwmctl/bspwmctl/issues/new?labels=question&template=question.md
[docs-repo]: https://github.com/bspwmctl/docs
