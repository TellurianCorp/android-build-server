# Branch Protection Setup Guide

This guide explains how to configure GitHub branch protection to enforce test and coverage requirements.

## Required Status Checks

To ensure all submissions meet quality standards, configure branch protection with these required checks:

### Required Status Checks

1. **Tests / test (3.12)** - Main test suite on Python 3.12
2. **Coverage Gate / enforce-coverage** - Coverage threshold enforcement
3. **PR Checks / test-required** - PR test validation
4. **PR Checks / coverage-required** - PR coverage validation

### Setup Instructions

1. Go to your repository on GitHub
2. Navigate to **Settings** → **Branches**
3. Click **Add rule** or edit existing rule for `main`/`master`
4. Configure the following:

#### Branch Protection Settings

- ✅ **Require a pull request before merging**
  - Require approvals: 1 (optional but recommended)
  - Dismiss stale pull request approvals when new commits are pushed

- ✅ **Require status checks to pass before merging**
  - Check the following status checks:
    - `Tests / test (3.12)`
    - `Coverage Gate / enforce-coverage`
    - `PR Checks / test-required`
    - `PR Checks / coverage-required`
  - ✅ **Require branches to be up to date before merging**

- ✅ **Require conversation resolution before merging** (optional)

- ✅ **Do not allow bypassing the above settings** (recommended for production)

#### Additional Settings (Optional)

- ✅ Require linear history
- ✅ Include administrators
- ✅ Restrict who can push to matching branches

## Verification

After setup:

1. Create a test PR
2. Verify that all required checks appear in the PR
3. Try to merge without all checks passing (should be blocked)
4. Once all checks pass, merge should be allowed

## Coverage Threshold

The current coverage threshold is **60%**. This is enforced in:
- `.coveragerc` - `fail_under = 60`
- Workflow files - `--cov-fail-under=60`

To change the threshold:
1. Update `.coveragerc`
2. Update all workflow files that use `--cov-fail-under`
3. Update this documentation
