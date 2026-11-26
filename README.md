
# PipeIt Weekend: My CI/CD Pipeline

![Pipeline Status](https://github.com/umuashraf1/pipeit-weekend/actions/workflows/pipeline.yml/badge.svg)

**Live Site:** https://umuashraf1.github.io/pipeit-weekend/

A CI/CD pipeline I built with GitHub Actions during PipeIt Weekend by SKILL.SCH.

Every change I push is automatically tested, a web page is built using **my own custom GitHub Action**, and the result is published to GitHub Pages. The pipeline also runs automatically every morning on a scheduled basis.

## How It Works

```text
Push to main / Daily Schedule / Manual Workflow Trigger
                         |
                         v
                       TEST
              bash tests/check.sh
                         |
                         v
                       BUILD
            My Custom GitHub Action
             .github/actions/build-card
                         |
                         v
                       DEPLOY
                  GitHub Pages
```

## What Is in This Repository?

| File | Description |
|---|---|
| `.github/workflows/hello.yml` | My first workflow: prints a message on every push. |
| `.github/workflows/ci.yml` | Runs my test on every push and pull request. |
| `.github/workflows/pipeline.yml` | Tests, builds with my custom action, and deploys to GitHub Pages. |
| `.github/actions/build-card/action.yml` | My custom action for building the status page. |
| `tests/check.sh` | My test script that checks whether this README has a valid title. |

## My Custom GitHub Action: build-card

`build-card` is a composite GitHub Action that accepts two inputs:

- `name` (required): The name displayed on the generated page.
- `message` (optional): A custom message displayed on the page.

It generates `site/index.html` containing the workflow run number, commit information, and timestamp. It also adds a summary to the GitHub Actions run page.

Example usage:

```yaml
- uses: ./.github/actions/build-card
  with:
    name: Ganiyat Adebayo
    message: Built automatically by my own GitHub Action
```

## What I Learned

- How GitHub Actions workflows are structured and stored in `.github/workflows`.
- How to configure workflow triggers such as `push`, `pull_request`, `schedule`, and `workflow_dispatch`.
- How to use `needs:` to control job execution order and prevent failed tests from proceeding to deployment.
- How to create and reuse custom composite GitHub Actions with inputs and outputs.
- How to troubleshoot failed workflow runs by examining logs and fixing errors.
- How to automate website deployment to GitHub Pages.

## What I Would Add Next

- [ ] Run checks on pull requests and protect the main branch.
- [ ] Add a second automated test.
- [ ] Publish my custom GitHub Action for reuse in other repositories.

## About

Built by **Ganiyat Adebayo** during [PipeIt Weekend](https://skill-sch.com/pipeit), organised by SKILL.SCH.
