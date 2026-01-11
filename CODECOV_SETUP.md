# Codecov Setup Guide

This guide explains how to set up Codecov for coverage reporting in your GitHub repository.

## Quick Setup

1. **Sign up for Codecov**
   - Go to [codecov.io](https://codecov.io)
   - Sign in with your GitHub account
   - Authorize Codecov to access your repositories

2. **Add Your Repository** ✅ (Already configured)
   - Repository: `TellurianCorp/android-build-server`
   - Codecov is connected and receiving coverage data

3. **Add Codecov Token to GitHub Secrets** (Recommended)
   - Your Codecov token: `XSMLPRV9EH`
   - Go to your GitHub repository → Settings → Secrets and variables → Actions
   - Click "New repository secret"
   - Name: `CODECOV_TOKEN`
   - Value: `XSMLPRV9EH`
   - Click "Add secret"
   
   **Note:** The workflow will work without a token if your repository is connected via GitHub OAuth, but using a token is more reliable.

4. **Badge URLs** ✅ (Already configured)
   - Organization: `TellurianCorp`
   - Repository: `android-build-server`
   - Badges are automatically updated with coverage data

## Badge URLs

The badges in README.md are configured as:

```markdown
[![Coverage](https://codecov.io/gh/TellurianCorp/android-build-server/branch/main/graph/badge.svg?token=XSMLPRV9EH)](https://codecov.io/gh/TellurianCorp/android-build-server)
```

Current configuration:
- Organization: `TellurianCorp`
- Repository: `android-build-server`
- Branch: `main`
- Token: Included in badge URL for authenticated access

## GitHub Actions Integration

The workflow in `.github/workflows/test.yml` automatically:
- Generates coverage reports using pytest-cov
- Uploads coverage to Codecov using the `codecov-action`
- Works without any additional configuration once Codecov is set up

## Testing the Integration

1. Push a commit to trigger the GitHub Actions workflow
2. Wait for the workflow to complete
3. Check the Codecov dashboard - you should see coverage data
4. The badge in README.md should update automatically

## Troubleshooting

**Badge not updating?**
- Ensure the repository is added in Codecov
- Check that the workflow is uploading coverage successfully
- Verify the badge URL matches your repository

**Coverage not showing?**
- Check GitHub Actions logs for errors
- Ensure `coverage.xml` is being generated
- Verify the Codecov token is set (usually automatic with GitHub integration)

## Manual Upload (Alternative)

If you prefer to upload coverage manually:

```bash
# Install codecov
pip install codecov

# Upload coverage
codecov -f coverage.xml -t YOUR_CODECOV_TOKEN
```

However, the GitHub Actions workflow handles this automatically.
